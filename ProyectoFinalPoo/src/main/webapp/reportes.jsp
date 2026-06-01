<%-- 
    Document   : reportes
    Created on : May 21, 2026, 10:31:38 AM
    Author     : lalon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reportes - Panel de Ventas</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="css/estiloReportes.css" rel="stylesheet" type="text/css"/>
</head>
<body>

    <%@include file="barraDeInicio.jsp"%>

<div class="app-container">
    <div class="dashboard">

        <!-- ===== PANEL IZQUIERDO: buscador por fecha ===== -->
        <aside class="calendar-section">
            <div class="card">
                <h2 class="section-title">Buscar reportes por fecha</h2>
                <form action="controladorReportes" method="get">
                    <div class="date-picker-wrapper">
                        <label for="fechaReporte">Selecciona una fecha:</label>
                        <input type="date" id="fechaReporte" name="fechaReporte"
                               class="date-input" value="${fechaBusqueda}">
                    </div>
                    <button type="submit" class="btn-search">Buscar reporte</button>
                </form>
                <div class="cal-note">
                    * Selecciona una fecha y presiona "Buscar reporte"<br>
                    * Los resultados se mostrarán en esta misma página<br>
                    * Si no hay ventas, se mostrará un mensaje
                </div>
            </div>
        </aside>

        <!-- ===== PANEL DERECHO: lista de ventas del día ===== -->
        <main class="sales-section">
            <div class="card sales-card">
                <h2 class="section-title">Reportes del día</h2>

                <div class="fecha-actual">${fechaBusqueda}</div>

                <div class="ventas-lista">
                    <c:choose>

                        <%-- Sin resultados --%>
                        <c:when test="${empty reporte}">
                            <p style="text-align:center; color:#888; padding:20px;">
                                No hay ventas registradas para esta fecha.
                            </p>
                        </c:when>

                        <%-- Con resultados --%>
                        <c:otherwise>
                            <c:forEach var="item" items="${reporte}">
                                <div class="producto-item">
                                    <div class="producto-info">
                                        <span class="prod-nombre">${item.nombre}</span>
                                        <span class="prod-precio">
                                            $<fmt:formatNumber value="${item.precioUnitario}" pattern="#,##0.00"/> c/u
                                        </span>
                                    </div>
                                    <div class="prod-stats">
                                        <span class="prod-cantidad">×${item.cantidad} uds</span>
                                        <span class="prod-subtotal">
                                            $<fmt:formatNumber value="${item.subtotal}" pattern="#,##0.00"/>
                                        </span>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:otherwise>

                    </c:choose>
                </div>

                <div class="total-ventas">
                    Total del día: $<fmt:formatNumber value="${totalDia}" pattern="#,##0.00"/>
                </div>

            </div>
        </main>

    </div>
</div>

<!-- ===== MODAL: mismo reporte en ventana emergente ===== -->
<div id="reporteModal" class="modal">
    <div class="modal-content">
        <div class="modal-header">
            <h2>Reporte de Ventas</h2>
            <a href="#" class="modal-close">×</a>
        </div>
        <div class="modal-body">

            <div class="modal-fecha">${fechaBusqueda}</div>

            <div class="modal-lista-productos">
                <c:choose>
                    <c:when test="${empty reporte}">
                        <p style="text-align:center; color:#888;">
                            No hay ventas para esta fecha.
                        </p>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="item" items="${reporte}">
                            <div class="modal-producto-item">
                                <div class="producto-info">
                                    <span class="modal-prod-nombre">${item.nombre}</span>
                                    <span class="modal-prod-precio">
                                        $<fmt:formatNumber value="${item.precioUnitario}" pattern="#,##0.00"/> c/u
                                    </span>
                                </div>
                                <div class="modal-prod-stats">
                                    <span class="modal-prod-cantidad">×${item.cantidad} uds</span>
                                    <span class="modal-prod-subtotal">
                                        $<fmt:formatNumber value="${item.subtotal}" pattern="#,##0.00"/>
                                    </span>
                                </div>
                            </div>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </div>

            <div class="modal-total">
                Total del día: $<fmt:formatNumber value="${totalDia}" pattern="#,##0.00"/>
            </div>

        </div>
    </div>
</div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>