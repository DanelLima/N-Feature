import { useState } from "react";
import { useNavigate } from "react-router-dom";

export default function Login() {
  const [email, setEmail] = useState("");
  const [senha, setSenha] = useState("");
  const navigate = useNavigate(); // Para navegação após login

  const handleSubmit = async (e) => {
    e.preventDefault();
    
    // Enviar dados para o backend
    const response = await fetch("http://localhost:3001/login", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({ email, senha }),
    });
    
    // Se o login for bem-sucedido, redireciona para o menu
    if (response.ok) {
      // Exemplo de redirecionamento:
      navigate("/menu");
    } else {
      alert("Login falhou. Verifique CPF e senha.");
    }
  };

  return (
    <div className="d-flex min-vh-100 align-items-center justify-content-center bg-light">
      <form onSubmit={handleSubmit} className="bg-white p-4 rounded shadow-sm w-25">
        <h2 className="text-center mb-4">NFeature</h2>
        <h3 className="text-center mb-5">login</h3>
        <div className="mb-3">
          <label className="form-label">E-mail</label>
          <input
            type="email"
            value={email}
            onChange={(e) => setEmail(e.target.value)}
            className="form-control"
            placeholder="Digite seu E-mail"
            required
          />
        </div>
        <div className="mb-4">
          <label className="form-label">Senha</label>
          <input
            type="password"
            value={senha}
            onChange={(e) => setSenha(e.target.value)}
            className="form-control"
            placeholder="Digite sua senha"
            required
          />
        </div>
        <button
          type="submit"
          className="btn btn-primary w-100"
        >
          Entrar
        </button>
      </form>
    </div>
  );
}
