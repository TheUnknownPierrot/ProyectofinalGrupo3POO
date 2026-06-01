<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
    .navbar-custom {
        background-color: #273C56 !important; 
        padding: 12px 20px !important;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
        position: fixed !important; /* Forza a que se quede arriba */
        top: 0;
        left: 0;
        width: 100% !important;
        z-index: 2000 !important; /* Queda sobre todo lo demás */
        border-bottom: 4px solid #FBC02D; 
    }

    .navbar-custom .nav-link {
        color: rgba(255, 255, 255, 0.9) !important;
        font-size: 1rem;
        padding: 8px 16px !important;
        transition: all 0.2s ease;
    }

    .navbar-custom .nav-link:hover {
        color: #FBC02D !important;
    }

    .navbar-custom .nav-link.active {
        color: #ffffff !important;
        background-color: rgba(0, 0, 0, 0.2) !important;
        border-radius: 6px;
    }
    
    body {
        padding-top: 70px !important; /* Evita que la barra fija tape tus tablas o formularios */
    }
</style>

<nav class="navbar navbar-expand-lg navbar-dark navbar-custom">
    <div class="container-fluid">
        <div class="dropdown me-3">
            <%-- Recuperamos el objeto usuario de la sesión --%>
            <%
                modelos.usuario userSession = (modelos.usuario) session.getAttribute("usuario");
            %>
            
            <a class="btn btn-link nav-link dropdown-toggle text-white text-decoration-none" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                <%-- Mostramos el nombre real, si no existe ponemos 'Usuario' --%>
                <%= (userSession != null) ? userSession.getNombre_real() : "Usuario" %>
            </a>
            
            <ul class="dropdown-menu">
                <%-- Mantienes tu lógica de cierre de sesión apuntando a tu controlador principal --%>
                <li><a class="dropdown-item text-danger" href="controlador?accion=logout">Cerrar Sesión 🚪</a></li>
            </ul>
        </div>
        
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp" id="nav-inicio">Inicio</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="ControladorProducto?accion=listar" id="nav-productos">Productos</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="ControladorClientes?accion=listar" id="nav-clientes">Clientes</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="controladorReportes?accion=listar" id="nav-reportes">Reportes</a>
                </li>
            </ul>
        </div>
    </div>
</nav>