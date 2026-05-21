<%-- 
    Document   : reportes
    Created on : May 21, 2026, 10:31:38 AM
    Author     : lalon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <!--
    Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
    Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
    -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reportes - Panel de Ventas</title>
    <link rel="stylesheet" href="estiloReportes.css">
</head>
<body>

<div class="app-container">
    <!-- FRANJA AMARILLA: Título principal "Reportes" -->
    <header class="report-header">
        <h1>Reportes</h1>
    </header>

    <!-- Contenido principal: dos columnas -->
    <div class="dashboard">
        <!-- COLUMNA IZQUIERDA: Calendario + buscador por fecha -->
        <aside class="calendar-section">
            <div class="card">
                <h2 class="section-title">Buscar reportes por fecha</h2>
                <div class="date-picker-wrapper">
                    <label for="fechaReporte">Selecciona una fecha:</label>
                    <input type="date" id="fechaReporte" class="date-input" value="2026-05-08">
                </div>
                <!-- Enlace que abre el popup (sin JavaScript) -->
                <a href="#reporteModal" class="btn-search">Buscar reporte</a>
                <div class="cal-note">
                    * Selecciona una fecha y presiona "Buscar reporte"<br>
                    * Se abrirá una ventana con las ventas de ese día<br>
                    * Para cerrar, haz clic en la X o fuera de la ventana
                </div>
            </div>
        </aside>

        <!-- COLUMNA DERECHA: Reportes del día -->
        <main class="sales-section">
            <div class="card sales-card">
                <h2 class="section-title">Reportes del día</h2>
                
                <div class="fecha-actual">
                    Viernes, 08/05/2026
                </div>
                
                <div class="ventas-lista">
                    <!-- Producto 1 -->
                    <div class="producto-item">
                        <div class="producto-info">
                            <span class="prod-nombre">Alicate</span>
                            <span class="prod-precio">$8.00 c/u</span>
                        </div>
                        <div class="prod-stats">
                            <span class="prod-cantidad">×3 uds</span>
                            <span class="prod-subtotal">$24.00</span>
                        </div>
                    </div>

                    <!-- Producto 2 -->
                    <div class="producto-item">
                        <div class="producto-info">
                            <span class="prod-nombre">Martillo de Carpintero</span>
                            <span class="prod-precio">$10.50 c/u</span>
                        </div>
                        <div class="prod-stats">
                            <span class="prod-cantidad">×2 uds</span>
                            <span class="prod-subtotal">$21.00</span>
                        </div>
                    </div>

                    <!-- Producto 3 -->
                    <div class="producto-item">
                        <div class="producto-info">
                            <span class="prod-nombre">Destornillador plano</span>
                            <span class="prod-precio">$5.00 c/u</span>
                        </div>
                        <div class="prod-stats">
                            <span class="prod-cantidad">×5 uds</span>
                            <span class="prod-subtotal">$25.00</span>
                        </div>
                    </div>

                    <!-- Producto 4 -->
                    <div class="producto-item">
                        <div class="producto-info">
                            <span class="prod-nombre">Destornillador estrella</span>
                            <span class="prod-precio">$5.50 c/u</span>
                        </div>
                        <div class="prod-stats">
                            <span class="prod-cantidad">×1 ud</span>
                            <span class="prod-subtotal">$5.50</span>
                        </div>
                    </div>

                    <!-- Producto 5 -->
                    <div class="producto-item">
                        <div class="producto-info">
                            <span class="prod-nombre">Taladro</span>
                            <span class="prod-precio">$75.00 c/u</span>
                        </div>
                        <div class="prod-stats">
                            <span class="prod-cantidad">×1 ud</span>
                            <span class="prod-subtotal">$75.00</span>
                        </div>
                    </div>

                    <!-- Producto 6 -->
                    <div class="producto-item">
                        <div class="producto-info">
                            <span class="prod-nombre">Sierra manual</span>
                            <span class="prod-precio">$15.00 c/u</span>
                        </div>
                        <div class="prod-stats">
                            <span class="prod-cantidad">×0 uds</span>
                            <span class="prod-subtotal">$0.00</span>
                        </div>
                    </div>

                    <!-- Producto 7 -->
                    <div class="producto-item">
                        <div class="producto-info">
                            <span class="prod-nombre">Llave inglesa</span>
                            <span class="prod-precio">$12.00 c/u</span>
                        </div>
                        <div class="prod-stats">
                            <span class="prod-cantidad">×4 uds</span>
                            <span class="prod-subtotal">$48.00</span>
                        </div>
                    </div>

                    <!-- Producto 8 -->
                    <div class="producto-item">
                        <div class="producto-info">
                            <span class="prod-nombre">Cinta métrica</span>
                            <span class="prod-precio">$4.00 c/u</span>
                        </div>
                        <div class="prod-stats">
                            <span class="prod-cantidad">×3 uds</span>
                            <span class="prod-subtotal">$12.00</span>
                        </div>
                    </div>

                    <!-- Producto 9 -->
                    <div class="producto-item">
                        <div class="producto-info">
                            <span class="prod-nombre">Nivel</span>
                            <span class="prod-precio">$9.50 c/u</span>
                        </div>
                        <div class="prod-stats">
                            <span class="prod-cantidad">×2 uds</span>
                            <span class="prod-subtotal">$19.00</span>
                        </div>
                    </div>

                    <!-- Producto 10 -->
                    <div class="producto-item">
                        <div class="producto-info">
                            <span class="prod-nombre">Caja de herramientas</span>
                            <span class="prod-precio">$25.00 c/u</span>
                        </div>
                        <div class="prod-stats">
                            <span class="prod-cantidad">×1 ud</span>
                            <span class="prod-subtotal">$25.00</span>
                        </div>
                    </div>

                    <!-- Producto 11 -->
                    <div class="producto-item">
                        <div class="producto-info">
                            <span class="prod-nombre">Pintura blanca</span>
                            <span class="prod-precio">$22.00 c/u</span>
                        </div>
                        <div class="prod-stats">
                            <span class="prod-cantidad">×2 uds</span>
                            <span class="prod-subtotal">$44.00</span>
                        </div>
                    </div>

                    <!-- Producto 12 -->
                    <div class="producto-item">
                        <div class="producto-info">
                            <span class="prod-nombre">Pintura azul</span>
                            <span class="prod-precio">$22.00 c/u</span>
                        </div>
                        <div class="prod-stats">
                            <span class="prod-cantidad">×2 uds</span>
                            <span class="prod-subtotal">$44.00</span>
                        </div>
                    </div>
                </div>
                
                <div class="total-ventas">
                    Total del día: $342.50
                </div>
                
                <div class="note-simulacion">
                    Ejemplo estático de reporte de ventas<br>
                    Los datos mostrados son una simulación
                </div>
            </div>
        </main>
    </div>
</div>

<!-- VENTANA MODAL (POPUP) - se abre al hacer clic en "Buscar reporte" -->
<div id="reporteModal" class="modal">
    <div class="modal-content">
        <div class="modal-header">
            <h2>Reporte de Ventas</h2>
            <a href="#" class="modal-close">×</a>
        </div>
        <div class="modal-body">
            <div class="modal-fecha">Viernes, 08/05/2026</div>
            
            <div class="modal-lista-productos">
                <div class="modal-producto-item">
                    <div class="producto-info">
                        <span class="modal-prod-nombre">Alicate</span>
                        <span class="modal-prod-precio">$8.00 c/u</span>
                    </div>
                    <div class="modal-prod-stats">
                        <span class="modal-prod-cantidad">×3 uds</span>
                        <span class="modal-prod-subtotal">$24.00</span>
                    </div>
                </div>
                
                <div class="modal-producto-item">
                    <div class="producto-info">
                        <span class="modal-prod-nombre">Martillo de Carpintero</span>
                        <span class="modal-prod-precio">$10.50 c/u</span>
                    </div>
                    <div class="modal-prod-stats">
                        <span class="modal-prod-cantidad">×2 uds</span>
                        <span class="modal-prod-subtotal">$21.00</span>
                    </div>
                </div>
                
                <div class="modal-producto-item">
                    <div class="producto-info">
                        <span class="modal-prod-nombre">Destornillador plano</span>
                        <span class="modal-prod-precio">$5.00 c/u</span>
                    </div>
                    <div class="modal-prod-stats">
                        <span class="modal-prod-cantidad">×5 uds</span>
                        <span class="modal-prod-subtotal">$25.00</span>
                    </div>
                </div>
                
                <div class="modal-producto-item">
                    <div class="producto-info">
                        <span class="modal-prod-nombre">Destornillador estrella</span>
                        <span class="modal-prod-precio">$5.50 c/u</span>
                    </div>
                    <div class="modal-prod-stats">
                        <span class="modal-prod-cantidad">×1 ud</span>
                        <span class="modal-prod-subtotal">$5.50</span>
                    </div>
                </div>
                
                <div class="modal-producto-item">
                    <div class="producto-info">
                        <span class="modal-prod-nombre">Taladro</span>
                        <span class="modal-prod-precio">$75.00 c/u</span>
                    </div>
                    <div class="modal-prod-stats">
                        <span class="modal-prod-cantidad">×1 ud</span>
                        <span class="modal-prod-subtotal">$75.00</span>
                    </div>
                </div>
                
                <div class="modal-producto-item">
                    <div class="producto-info">
                        <span class="modal-prod-nombre">Llave inglesa</span>
                        <span class="modal-prod-precio">$12.00 c/u</span>
                    </div>
                    <div class="modal-prod-stats">
                        <span class="modal-prod-cantidad">×4 uds</span>
                        <span class="modal-prod-subtotal">$48.00</span>
                    </div>
                </div>
                
                <div class="modal-producto-item">
                    <div class="producto-info">
                        <span class="modal-prod-nombre">Cinta métrica</span>
                        <span class="modal-prod-precio">$4.00 c/u</span>
                    </div>
                    <div class="modal-prod-stats">
                        <span class="modal-prod-cantidad">×3 uds</span>
                        <span class="modal-prod-subtotal">$12.00</span>
                    </div>
                </div>
                
                <div class="modal-producto-item">
                    <div class="producto-info">
                        <span class="modal-prod-nombre">Nivel</span>
                        <span class="modal-prod-precio">$9.50 c/u</span>
                    </div>
                    <div class="modal-prod-stats">
                        <span class="modal-prod-cantidad">×2 uds</span>
                        <span class="modal-prod-subtotal">$19.00</span>
                    </div>
                </div>
                
                <div class="modal-producto-item">
                    <div class="producto-info">
                        <span class="modal-prod-nombre">Caja de herramientas</span>
                        <span class="modal-prod-precio">$25.00 c/u</span>
                    </div>
                    <div class="modal-prod-stats">
                        <span class="modal-prod-cantidad">×1 ud</span>
                        <span class="modal-prod-subtotal">$25.00</span>
                    </div>
                </div>
                
                <div class="modal-producto-item">
                    <div class="producto-info">
                        <span class="modal-prod-nombre">Pintura blanca</span>
                        <span class="modal-prod-precio">$22.00 c/u</span>
                    </div>
                    <div class="modal-prod-stats">
                        <span class="modal-prod-cantidad">×2 uds</span>
                        <span class="modal-prod-subtotal">$44.00</span>
                    </div>
                </div>
                
                <div class="modal-producto-item">
                    <div class="producto-info">
                        <span class="modal-prod-nombre">Pintura azul</span>
                        <span class="modal-prod-precio">$22.00 c/u</span>
                    </div>
                    <div class="modal-prod-stats">
                        <span class="modal-prod-cantidad">×2 uds</span>
                        <span class="modal-prod-subtotal">$44.00</span>
                    </div>
                </div>
            </div>
            
            <div class="modal-total">Total del día: $342.50</div>
        </div>
    </div>
</div>

</body>
</html>
