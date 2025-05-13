CREATE DATABASE nfeature;
USE nfeature;

CREATE TABLE Usuario (
    idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    nomeUsuario VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(100) NOT NULL,
    nivel INT NOT NULL CHECK (nivel IN (1, 2)) -- 1: Estoquista, 2: Gerência/Financeiro
);

CREATE TABLE Loja (
    idLoja INT PRIMARY KEY AUTO_INCREMENT,
    nomeFantasia VARCHAR(100) NOT NULL,
    razaoSocial VARCHAR(100) NOT NULL,
    cnpj VARCHAR(20) UNIQUE NOT NULL,
    estoque BOOLEAN NOT NULL
);

CREATE TABLE Produto (
    idProduto INT PRIMARY KEY AUTO_INCREMENT,
    precoCompra FLOAT NOT NULL,
    descricao VARCHAR(255) NOT NULL,
    ncm VARCHAR(20)
);

CREATE TABLE ProdutoEstoque (
    idProdutoEstoque INT PRIMARY KEY AUTO_INCREMENT,
    idLoja INT NOT NULL,
    idProduto INT NOT NULL,
    qtdProduto FLOAT NOT NULL,
    markup FLOAT NOT NULL,
    precoUnitario FLOAT NOT NULL,
    FOREIGN KEY (idLoja) REFERENCES Loja(idLoja),
    FOREIGN KEY (idProduto) REFERENCES Produto(idProduto)
);

CREATE TABLE Nfe (
    idNfe INT PRIMARY KEY AUTO_INCREMENT,
    idLoja INT NOT NULL,
    chaveAcesso VARCHAR(60) UNIQUE NOT NULL,
    numero INT NOT NULL,
    serie INT NOT NULL,
    dataEmissao DATE NOT NULL,
    cnpjEmitente VARCHAR(20) NOT NULL,
    nomeEmitente VARCHAR(100) NOT NULL,
    valorTotal FLOAT NOT NULL,
    FOREIGN KEY (idLoja) REFERENCES Loja(idLoja)
);

CREATE TABLE ItemNfe (
    idItemNfe INT PRIMARY KEY AUTO_INCREMENT,
    idProduto INT NOT NULL,
    idNfe INT NOT NULL,
    quantidade FLOAT NOT NULL,
    valorUnitario FLOAT NOT NULL,
    valorTotal FLOAT NOT NULL,
    unidade VARCHAR(20),
    ncm VARCHAR(20),
    cfop VARCHAR(10),
    FOREIGN KEY (idProduto) REFERENCES Produto(idProduto),
    FOREIGN KEY (idNfe) REFERENCES Nfe(idNfe)
);

INSERT INTO Usuario (nomeUsuario, email, senha, nivel) VALUES
('Daniel Souza', 'danielsouzalimabsb@gmail.com', 'masterkey', 2);
