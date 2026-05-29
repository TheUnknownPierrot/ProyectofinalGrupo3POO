<%-- 
    Document   : index
    Created on : May 21, 2026, 10:18:23 AM
    Author     : lalon
--%>


<%-- Validamos que el usuario haya iniciado sesión --%>
<%
    // Obtenemos el objeto usuario de la sesión
    modelos.usuario userSession = (modelos.usuario) session.getAttribute("usuario");
    
    if (userSession == null) {
        response.sendRedirect("login.jsp");
        return; 
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ferretería - Inicio</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    
   <style>
        body {
            background-image: url('ImagenDeInicio/FotoFerreteria.png') !important;
            background-size: cover; /* Esto ayuda a que la imagen se ajuste bien */
            background-position: center;
        }
        <%@include file="css/estiloindex.css"%>
    </style>
</head>
<body>

    <nav class="navbar navbar-expand-lg navbar-dark navbar-custom">
        <div class="container-fluid">
            <div class="dropdown me-3">

                <a class="btn btn-link nav-link dropdown-toggle text-white text-decoration-none" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    <%= userSession.getNombre_real() %>
                </a>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item text-danger" href="controlador?accion=logout">Cerrar Sesión 🚪</a></li>
                </ul>
            </div>
            
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item">
                        <a class="nav-link active fw-bold" href="index.jsp">Inicio</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="ControladorProducto?accion=listar">Productos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="clientes.jsp">Clientes</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="reportes.jsp">Reportes</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="welcome-wrapper">
        <div class="welcome-card-box">
            <h1 id="saludo" class="saludo-title"></h1>
            <div class="welcome-subtitle">
                <p>Bienvenido al Sistema de la Ferretería</p> 
            </div>
        </div>
    </div>

    <script>
        function obtenerSaludo() {
            const hora = new Date().getHours();
            let saludo = "";
            if (hora >= 6 && hora < 12) { saludo = "Buenos días"; } 
            else if (hora >= 12 && hora < 18) { saludo = "Buenas tardes"; } 
            else { saludo = "Buenas noches"; }
            return saludo;
        }
        document.getElementById("saludo").innerText = obtenerSaludo();
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>