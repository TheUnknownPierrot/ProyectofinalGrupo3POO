<%-- 
    Document   : clientes
    Created on : May 21, 2026, 10:28:35 AM
    Author     : lalon
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List, modelos.Clientes"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Módulo Clientes</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="css/estiloCliente.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <%@include file="barraDeInicio.jsp"%>

    <%-- Detectar si viene un cliente a editar --%>
    <% Clientes ce = (Clientes) request.getAttribute("clientesEditar"); %>

    <div class="container mt-5">

        <%-- FORMULARIO REGISTRAR / EDITAR --%>
        <div class="card shadow p-4">
            <h3 class="mb-4 text-center">
                <%= ce != null ? "✏️ Editar Cliente" : "Registro de Clientes" %>
            </h3>
            <form action="ControladorClientes" method="post">
                <input type="hidden" name="accion" value="<%= ce != null ? "actualizar" : "insertar" %>">
                <% if (ce != null) { %>
                    <input type="hidden" name="id_clientes" value="<%= ce.getId_clientes() %>">
                <% } %>
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Nombre</label>
                        <input type="text" name="nombre" class="form-control" required
                               value="<%= ce != null ? ce.getNombre() : "" %>"
                               placeholder="Ingrese nombre">
                    </div>
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Apellido</label>
                        <input type="text" name="apellido" class="form-control" required
                               value="<%= ce != null ? ce.getApellido() : "" %>"
                               placeholder="Ingrese apellido">
                    </div>
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Correo</label>
                        <input type="email" name="correo" class="form-control"
                               value="<%= ce != null ? ce.getCorreo() : "" %>"
                               placeholder="Ingrese correo">
                    </div>
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Teléfono</label>
                        <input type="text" name="telefono" class="form-control"
                               value="<%= ce != null ? ce.getTelefono() : "" %>"
                               placeholder="Ingrese teléfono">
                    </div>
                    <div class="col-md-12 mb-3">
                        <label class="form-label">Dirección</label>
                        <textarea name="direccion" class="form-control" rows="3"
                                  placeholder="Ingrese dirección"><%= ce != null ? ce.getDireccion() : "" %></textarea>
                    </div>
                </div>
                <div class="text-center mt-4">
                    <button type="submit" class="btn btn-guardar">
                        <%= ce != null ? "💾 Actualizar" : "💾 Guardar" %>
                    </button>
                    <a href="ControladorClientes?accion=listar" class="btn btn-limpiar">🔄 Cancelar</a>
                </div>
            </form>
        </div>

        <%-- TABLA DE CLIENTES --%>
        <div class="mt-5 mb-5">
            <h3 class="text-center mb-4">Lista de Clientes</h3>
            <table class="table table-bordered table-hover text-center">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Apellido</th>
                        <th>Correo</th>
                        <th>Teléfono</th>
                        <th>Dirección</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    List<Clientes> lista = (List<Clientes>) request.getAttribute("listaClientes");
                    if (lista != null && !lista.isEmpty()) {
                        for (Clientes c : lista) {
                    %>
                    <tr>
                        <td><%= c.getId_clientes() %></td>
                        <td><%= c.getNombre() %></td>
                        <td><%= c.getApellido() %></td>
                        <td><%= c.getCorreo() %></td>
                        <td><%= c.getTelefono() %></td>
                        <td><%= c.getDireccion() %></td>
                        <td>
                            <a href="ControladorClientes?accion=editar&id=<%= c.getId_clientes() %>"
                               class="btn btn-warning btn-sm">✏️ Modificar</a>
                            <a href="ControladorClientes?accion=eliminar&id=<%= c.getId_clientes() %>"
                               class="btn btn-danger btn-sm"
                               onclick="return confirm('¿Seguro que deseas eliminar a <%= c.getNombre() %>?')">
                               🗑️ Eliminar
                            </a>
                        </td>
                    </tr>
                    <% } } else { %>
                    <tr>
                        <td colspan="7" class="text-muted">No hay clientes registrados aún.</td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>

    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>