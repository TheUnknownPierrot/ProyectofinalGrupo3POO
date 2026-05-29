<%-- Importamos las herramientas de Java (El manual de instrucciones) --%>
<%@page import="java.util.List"%>
<%@page import="modelos.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ferretería - Catálogo</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="css/StyleInterfazProducto.css" rel="stylesheet" type="text/css"/>
</head>
<body>

    <%@include file="barraDeInicio.jsp"%>

    <%
        List<Producto> miCarrito = (List<Producto>) session.getAttribute("carritoCompras");
        int cantidadItems = 0;
        double totalPagar = 0.0;
        
        if (miCarrito != null) {
            cantidadItems = miCarrito.size();
            for (Producto item : miCarrito) {
                totalPagar += item.getPrecio();
            }
        }
        
        // Verificamos si se acaba de registrar una compra para lanzar la confirmación
        String compraExitosa = (String) session.getAttribute("compraExitosa");
        if (compraExitosa != null && compraExitosa.equals("true")) {
            session.removeAttribute("compraExitosa"); // Limpiamos la bandera de inmediato
    %>
            <script>
                alert("¡Compra realizada con éxito!\nLos registros han sido procesados en la base de datos.");
            </script>
    <%
        }
    %>

    <div id="overlay"></div>

    <div class="buscador-contenedor" id="contenedor-buscador">
        <div class="btn-lupa" id="btn-abrir-busqueda">
            <svg class="lupa-icon" viewBox="0 0 24 24">
                <path d="M15.5 14h-.79l-.28-.27A6.471 6.471 0 0 0 16 9.5 6.5 6.5 0 1 0 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"/>
            </svg>
        </div>
        <input type="text" id="input-busqueda" placeholder="Buscar herramienta...">
    </div>

    <%-- El botón del carrito muestra los totales calculados directamente por Java --%>
    <div id="btn-carrito" style="position: fixed; top: 80px; right: 20px; background-color: #ffc107; color: #000; padding: 10px 20px; border-radius: 30px; font-weight: bold; cursor: pointer; z-index: 9999; box-shadow: 0px 4px 6px rgba(0,0,0,0.3);">
        🛒 Artículos: <span id="contador"><%= cantidadItems %></span> Ver total
    </div>

    <div id="ventana-carrito">
        <h2 class="titulo-modal">Lista de Materiales</h2>
        
        <div id="lista-carrito">
            <%-- Estructura de repetición Java para listar los artículos agregados --%>
            <% 
                if (miCarrito != null && !miCarrito.isEmpty()) { 
                    for (Producto item : miCarrito) { 
            %>
                        <p style="margin: 5px 0; border-bottom: 1px solid #ccc; text-align: left; padding-left: 10px;">
                            🛠️ <%= item.getNombre() %> - $<%= String.format("%.2f", item.getPrecio()) %>
                        </p>
            <%      
                    }
                } else { 
            %>
                    <p style="text-align: center; color: #777;">El carrito está vacío.</p>
            <% 
                } 
            %>
        </div>
        
        <h3 class="total-texto">Total a pagar: $<span id="total-precio"><%= String.format("%.2f", totalPagar) %></span></h3>
        
        <% if (cantidadItems > 0) { %>
            <form action="ControladorProducto" method="POST" style="margin: 0; padding: 0;">
                <input type="hidden" name="accion" value="comprar">
                <button type="submit" id="btn-pagar" class="btn-pago" style="display: block; width: 100%;">💳 COMPRAR AHORA</button>
            </form>
            
            <form action="ControladorProducto" method="POST" style="margin: 0; padding: 0; margin-top: 5px;">
                <input type="hidden" name="accion" value="vaciarCarrito">
                <button type="submit" id="btn-vaciar" class="btn-secundario" style="display: block; width: 100%;">🗑️ Vaciar Carrito</button>
            </form>
        <% } %>
        
        <button id="btn-cerrar-modal" class="btn-secundario" style="margin-top: 5px; width: 100%;">Cerrar Ventana</button>
    </div>

    <h1> Productos </h1>

    <div class="caja-de-productos" id="catalogo">
        
        <%
            List<Producto> lista = (List<Producto>) request.getAttribute("listaProductos");
            if (lista != null && !lista.isEmpty()) {
                for (Producto p : lista) {
        %>
        
        <div class="producto">
            <img src="ImagenesProducto/<%= p.getImagen() %>" alt="<%= p.getNombre() %>" onerror="this.onerror=null; this.src='https://via.placeholder.com/150?text=Sin+Imagen';">
            <h3><%= p.getNombre() %></h3>
            <p>$<%= String.format("%.2f", p.getPrecio()) %></p>
            
            <form action="ControladorProducto" method="POST" style="margin: 0; padding: 0;">
                <input type="hidden" name="accion" value="agregarCarrito">
                <input type="hidden" name="id" value="<%= p.getId() %>">
                <input type="hidden" name="nombre" value="<%= p.getNombre() %>">
                <input type="hidden" name="precio" value="<%= p.getPrecio() %>">
                <button type="submit" class="btn-agregar" style="width: 100%;">Agregar al Carrito</button>
            </form>
        </div>
        
        <%
                } 
            } else {
        %>
            <div class="alert alert-warning" style="width: 100%; text-align: center;">
                No se encontraron productos en la base de datos. Asegúrate de ejecutar el Controlador primero.
            </div>
        <%
            } 
        %>
        
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script>
        // abrir/cerrar carrito
        document.getElementById("btn-carrito").onclick = function() {
            document.getElementById("ventana-carrito").style.display = "block";
            document.getElementById("overlay").style.display = "block";
        };

        document.getElementById("btn-cerrar-modal").onclick = function() {
            document.getElementById("ventana-carrito").style.display = "none";
            document.getElementById("overlay").style.display = "none";
        };
    </script>
</body>
</html>