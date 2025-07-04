import { BrowserRouter, Routes, Route } from "react-router-dom";
import Login from "./pages/login";
import Menu from "./pages/menu"; 

function App() {
  return (
    <BrowserRouter basename ="/N-Feature">
      <Routes>
        <Route path="/" element={<Login />} />
        <Route path="/menu" element={<Menu />} />
      </Routes>
    </BrowserRouter>
  );
}

export default App;
