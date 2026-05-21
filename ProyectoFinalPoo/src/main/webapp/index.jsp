<%-- 
    Document   : index
    Created on : May 21, 2026, 10:18:23 AM
    Author     : lalon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">
  <title>Ferretería - Menú Principal</title>
  <link rel="stylesheet" href="estiloindex.css">
</head>
<body>
  <div class="menu-container">
    <!-- Encabezado principal centrado -->
    <div class="main-header">
      <h1 class="main-title">Menú principal</h1>
      <div class="header-underline"></div>
    </div>

    <!-- Cuadrícula de 4 acciones principales -->
    <div class="cards-grid">
      <!-- Productos -> redirige a InterfazProducto.jsp -->
      <a href="interfazProducto.jsp" class="menu-card">
        <div class="card-icon">🔧</div>
        <h2 class="card-title">Productos</h2>
        <p class="card-description">Gestiona inventario, precios y existencias</p>
        <span class="card-action">Acceder →</span>
      </a>

      <!-- Clientes (redirección a clientes.jsp) -->
      <a href="clientes.jsp" class="menu-card">
        <div class="card-icon">👥</div>
        <h2 class="card-title">Clientes</h2>
        <p class="card-description">Administra tus clientes y contactos</p>
        <span class="card-action">Acceder →</span>
      </a>

      <!-- Reportes -> redirige a Reportes.jsp -->
      <a href="reportes.jsp" class="menu-card">
        <div class="card-icon">📊</div>
        <h2 class="card-title">Reportes</h2>
        <p class="card-description">Visualiza ventas y reportes del día</p>
        <span class="card-action">Acceder →</span>
      </a>

      <!-- Log Out (redirección a login.jsp) -->
      <a href="login.jsp" class="menu-card logout-card">
        <div class="card-icon">🚪</div>
        <h2 class="card-title">Log Out</h2>
        <p class="card-description">Cerrar sesión actual</p>
        <span class="card-action">Salir →</span>
      </a>
    </div>

    <!-- Pie opcional -->
    <div class="footer-note">
      <p>Sistema Ferretero • Selecciona una opción para continuar</p>
    </div>
  </div>
</body>
</html>
