<%-- 
    Document   : interfazProducto
    Created on : May 21, 2026, 10:32:47 AM
    Author     : lalon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ferretería El Tornillo Dorado - Catálogo</title>
    <!-- CSS -->
    <link rel="stylesheet" href="StyleInterfazProducto.css">
</head>
<body>

    <!-- Capa de fondo para el modal -->
    <div id="overlay"></div>

    <!-- Buscador -->
    <div class="buscador-contenedor" id="contenedor-buscador">
        <div class="btn-lupa" id="btn-abrir-busqueda">
            <svg class="lupa-icon" viewBox="0 0 24 24">
                <path d="M15.5 14h-.79l-.28-.27A6.471 6.471 0 0 0 16 9.5 6.5 6.5 0 1 0 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"/>
            </svg>
        </div>
        <input type="text" id="input-busqueda" placeholder="Buscar herramienta...">
    </div>


    <div class="carrito-flotante" id="btn-carrito">
        🛒 Artículos: <span id="contador">0</span> (Ver total)
    </div>


    <div id="ventana-carrito">
        <h2 class="titulo-modal">Lista de Materiales</h2>
        <div id="lista-carrito">
            <!-- Los productos agregados se inyectarán aquí con Java -->
        </div>
        <h3 class="total-texto">Total a pagar: $<span id="total-precio">0.00</span></h3>
        <button id="btn-pagar" class="btn-pago" style="display:none;">💳 COMPRAR AHORA</button>
        <button id="btn-vaciar" class="btn-secundario">🗑️ Vaciar Carrito</button>
        <button id="btn-cerrar-modal" class="btn-secundario">Cerrar Ventana</button>
    </div>

    <h1> Productos </h1>

    <div class="caja-de-productos" id="catalogo">
        <!-- 1-10: Herramientas Manuales -->
        <div class="producto">
            <img src="ImagenesProducto/Alicate.png" alt=""/>
            <h3>Alicate</h3>
            <p>$8.00</p>
            <button class="btn-agregar">Agregar al Carrito</button>
        </div>
        <div class="producto">
            <img src="ImagenesProducto/Martillo.png" alt=""/>
            <h3>Martillo de Carpintero</h3>
            <p>$10.50</p>
            <button class="btn-agregar">Agregar al Carrito</button>
        </div>
        <div class="producto">
            <img src="ImagenesProducto/Destornillador plano.png" alt="Destornillador plano" onerror="this.src='https://via.placeholder.com/150?text=Plano'">
            <h3>Destornillador plano</h3>
            <p>$5.00</p>
            <button class="btn-agregar">Agregar al Carrito</button>
        </div>
        <div class="producto">
            <img src="ImagenesProducto/Destornillador estrella.png" alt="Destornillador estrella" onerror="this.src='https://via.placeholder.com/150?text=Estrella'">
            <h3>Destornillador estrella</h3>
            <p>$5.50</p>
            <button class="btn-agregar">Agregar al Carrito</button>
        </div>
        <div class="producto">
            <img src="ImagenesProducto/Taladro.png" alt="Taladro" onerror="this.src='https://via.placeholder.com/150?text=Taladro'">
            <h3>Taladro</h3>
            <p>$75.00</p>
            <button class="btn-agregar">Agregar al Carrito</button>
        </div>
        <div class="producto">
            <img src="ImagenesProducto/Sierra manual.png" alt="Sierra manual" onerror="this.src='https://via.placeholder.com/150?text=Sierra'">
            <h3>Sierra manual</h3>
            <p>$15.00</p>
            <button class="btn-agregar">Agregar al Carrito</button>
        </div>
        <div class="producto">
            <img src="ImagenesProducto/Llave inglesa.png" alt="Llave inglesa" onerror="this.src='https://via.placeholder.com/150?text=Llave'">
            <h3>Llave inglesa</h3>
            <p>$12.00</p>
            <button class="btn-agregar">Agregar al Carrito</button>
        </div>
        <div class="producto">
            <img src="ImagenesProducto/Cinta metrica.png" alt="Cinta metrica" onerror="this.src='https://via.placeholder.com/150?text=Cinta'">
            <h3>Cinta metrica</h3>
            <p>$4.00</p>
            <button class="btn-agregar">Agregar al Carrito</button>
        </div>
        <div class="producto">
            <img src="ImagenesProducto/Nivel.png" alt="Nivel" onerror="this.src='https://via.placeholder.com/150?text=Nivel'">
            <h3>Nivel</h3>
            <p>$9.50</p>
            <button class="btn-agregar">Agregar al Carrito</button>
        </div>
        <div class="producto">
            <img src="ImagenesProducto/Caja de herramientas.png" alt="Caja de herramientas" onerror="this.src='https://via.placeholder.com/150?text=Caja'">
            <h3>Caja de herramientas</h3>
            <p>$25.00</p>
            <button class="btn-agregar">Agregar al Carrito</button>
        </div>

        <!-- 11-20: Pinturas y Acabados -->
        <div class="producto">
            <img src="ImagenesProducto/Pintura blanca.png" alt="Pintura blanca" onerror="this.src='https://via.placeholder.com/150?text=Blanco'">
            <h3>Pintura blanca</h3>
            <p>$22.00</p>
            <button class="btn-agregar">Agregar al Carrito</button>
        </div>
        <div class="producto">
            <img src="ImagenesProducto/Pintura azul.png" alt="Pintura azul" onerror="this.src='https://via.placeholder.com/150?text=Azul'">
            <h3>Pintura azul</h3>
            <p>$22.00</p>
            <button class="btn-agregar">Agregar al Carrito</button>
        </div>
        <div class="producto">
            <img src="ImagenesProducto/Pintura roja.png" alt="Pintura roja" onerror="this.src='https://via.placeholder.com/150?text=Rojo'">
            <h3>Pintura Roja</h3>
            <p>$21.00</p>
            <button class="btn-agregar">Agregar al Carrito</button>
        </div>
        <div class="producto">
            <img src="ImagenesProducto/Pintura verde.png" alt="Pintura verde" onerror="this.src='https://via.placeholder.com/150?text=Verde'">
            <h3>Pintura verde</h3>
            <p>$23.00</p>
            <button class="btn-agregar">Agregar al Carrito</button>
        </div>
        <div class="producto">
            <img src="ImagenesProducto/Rodillo.png" alt="Rodillo" onerror="this.src='https://via.placeholder.com/150?text=Rodillo'">
            <h3>Rodillo</h3>
            <p>$6.50</p>
            <button class="btn-agregar">Agregar al Carrito</button>
        </div>
        <div class="producto">
            <img src="ImagenesProducto/Brocha.png" alt="Brocha" onerror="this.src='https://via.placeholder.com/150?text=Brocha'">
            <h3>Brocha</h3>
            <p>$3.50</p>
            <button class="btn-agregar">Agregar al Carrito</button>
        </div>
        <div class="producto">
            <img src="ImagenesProducto/Diluyente.png" alt="Diluyente" onerror="this.src='https://via.placeholder.com/150?text=Diluyente'">
            <h3>Diluyente</h3>
            <p>$7.00</p>
            <button class="btn-agregar">Agregar al Carrito</button>
        </div>
        <div class="producto">
            <img src="ImagenesProducto/Sellador.png" alt="Sellador" onerror="this.src='https://via.placeholder.com/150?text=Sellador'">
            <h3>Sellador</h3>
            <p>$15.00</p>
            <button class="btn-agregar">Agregar al Carrito</button>
        </div>
        <div class="producto">
            <img src="ImagenesProducto/Barniz.png" alt="Barniz" onerror="this.src='https://via.placeholder.com/150?text=Barniz'">
            <h3>Barniz</h3>
            <p>$18.00</p>
            <button class="btn-agregar">Agregar al Carrito</button>
        </div>
        <div class="producto">
            <img src="ImagenesProducto/Esmalte.png" alt="Esmalte" onerror="this.src='https://via.placeholder.com/150?text=Esmalte'">
            <h3>Esmalte</h3>
            <p>$19.00</p>
            <button class="btn-agregar">Agregar al Carrito</button>
        </div>

        <!-- 21-30: Electricidad -->
        <div class="producto">
            <img src="ImagenesProducto/Cable1.png" alt="Cable #12" onerror="this.src='https://via.placeholder.com/150?text=Cable12'">
            <h3>Cable #12</h3>
            <p>$5.00</p>
            <button class="btn-agregar">Agregar al Carrito</button>
        </div>
        <div class="producto">
            <img src="ImagenesProducto/Cable2.png" alt="Cable #14" onerror="this.src='https://via.placeholder.com/150?text=Cable14'">
            <h3>Cable #14</h3>
            <p>$4.50</p>
            <button class="btn-agregar">Agregar al Carrito</button>
        </div>
        <div class="producto">
            <img src="ImagenesProducto/Interruptor.png" alt="Interruptor" onerror="this.src='https://via.placeholder.com/150?text=Interruptor'">
            <h3>Interruptor</h3>
            <p>$4.50</p>
            <button class="btn-agregar">Agregar al Carrito</button>
        </div>
        <div class="producto">
            <img src="ImagenesProducto/Tomacorriente.png" alt="Tomacorriente" onerror="this.src='https://via.placeholder.com/150?text=Toma'">
            <h3>Tomacorriente</h3>
            <p>$3.75</p>
            <button class="btn-agregar">Agregar al Carrito</button>
        </div>
        <div class="producto">
            <img src="ImagenesProducto/Bonbillo LED.png" alt="Bombillo LED" onerror="this.src='https://via.placeholder.com/150?text=LED'">
            <h3>Bombillo LED</h3>
            <p>$2.50</p>
            <button class="btn-agregar">Agregar al Carrito</button>
        </div>
        <div class="producto">
            <img src="ImagenesProducto/Extension.png" alt="Extension" onerror="this.src='https://via.placeholder.com/150?text=Extens'">
            <h3>Extension</h3>
            <p>$10.00</p>
            <button class="btn-agregar">Agregar al Carrito</button>
        </div>
        <div class="producto">
            <img src="ImagenesProducto/Breaker.png" alt="Breaker" onerror="this.src='https://via.placeholder.com/150?text=Breaker'">
            <h3>Breaker</h3>
            <p>$12.00</p>
            <button class="btn-agregar">Agregar al Carrito</button>
        </div>
        <div class="producto">
            <img src="ImagenesProducto/Porta lampara.png" alt="Porta lampara" onerror="this.src='https://via.placeholder.com/150?text=Porta'">
            <h3>Porta lampara</h3>
            <p>$2.00</p>
            <button class="btn-agregar">Agregar al Carrito</button>
        </div>
        <div class="producto">
            <img src="ImagenesProducto/Cinta aislante.png" alt="Cinta aislante" onerror="this.src='https://via.placeholder.com/150?text=CintaAislante'">
            <h3>Cinta aislante</h3>
            <p>$1.50</p>
            <button class="btn-agregar">Agregar al Carrito</button>
        </div>
        <div class="producto">
            <img src="ImagenesProducto/Panel electrico.png" alt="Panel electrico" onerror="this.src='https://via.placeholder.com/150?text=Panel'">
            <h3>Panel electrico</h3>
            <p>$50.00</p>
            <button class="btn-agregar">Agregar al Carrito</button>
        </div>

        <!-- 31-40: Plomería -->
        <div class="producto">
            <img src="ImagenesProducto/Tubo PVC.png" alt="Tubo PVC" onerror="this.src='https://via.placeholder.com/150?text=PVC'">
            <h3>Tubo PVC</h3>
            <p>$8.00</p>
            <button class="btn-agregar">Agregar al Carrito</button>
        </div>
        <div class="producto">
            <img src="ImagenesProducto/llave de paso.png" alt="llave de paso" onerror="this.src='https://via.placeholder.com/150?text=LlavePaso'">
            <h3>llave de paso</h3>
            <p>$6.00</p>
            <button class="btn-agregar">Agregar al Carrito</button>
        </div>
        <div class="producto">
            <img src="ImagenesProducto/Codo PVC.png" alt="Codo PVC" onerror="this.src='https://via.placeholder.com/150?text=Codo'">
            <h3>Codo PVC</h3>
            <p>$2.00</p>
            <button class="btn-agregar">Agregar al Carrito</button>
        </div>
        <div class="producto">
            <img src="ImagenesProducto/Pegamente PVC.png" alt="Pegamento PVC" onerror="this.src='https://via.placeholder.com/150?text=Pegamento'">
            <h3>Pegamento PVC</h3>
            <p>$4.00</p>
            <button class="btn-agregar">Agregar al Carrito</button>
        </div>
        <div class="producto">
            <img src="ImagenesProducto/Tee PVC.png" alt="Tee PVC" onerror="this.src='https://via.placeholder.com/150?text=Tee'">
            <h3>Tee PVC</h3>
            <p>$2.50</p>
            <button class="btn-agregar">Agregar al Carrito</button>
        </div>
        <div class="producto">
            <img src="ImagenesProducto/Reduccion PVC.png" alt="Reduccion PVC" onerror="this.src='https://via.placeholder.com/150?text=Reduccion'">
            <h3>Reduccion PVC</h3>
            <p>$2.20</p>
            <button class="btn-agregar">Agregar al Carrito</button>
        </div>
        <div class="producto">
            <img src="ImagenesProducto/Mangera.png" alt="Mangera" onerror="this.src='https://via.placeholder.com/150?text=Manguera'">
            <h3>Manguera</h3>
            <p>$12.00</p>
            <button class="btn-agregar">Agregar al Carrito</button>
        </div>
        <div class="producto">
            <img src="ImagenesProducto/Llave de chorro.png" alt="Llave de chorro" onerror="this.src='https://via.placeholder.com/150?text=Chorro'">
            <h3>Llave de chorro</h3>
            <p>$9.00</p>
            <button class="btn-agregar">Agregar al Carrito</button>
        </div>
        <div class="producto">
            <img src="ImagenesProducto/Sifon.png" alt="Sifon" onerror="this.src='https://via.placeholder.com/150?text=Sifon'">
            <h3>Sifon</h3>
            <p>$7.00</p>
            <button class="btn-agregar">Agregar al Carrito</button>
        </div>
        <div class="producto">
            <img src="ImagenesProducto/Filtro de agua.png" alt="filtro de agua" onerror="this.src='https://via.placeholder.com/150?text=Filtro'">
            <h3>Filtro de agua</h3>
            <p>$25.00</p>
            <button class="btn-agregar">Agregar al Carrito</button>
        </div>

        <!-- 41-50: Construcción -->
        <div class="producto">
            <img src="ImagenesProducto/Cemento.png" alt="Cemento" onerror="this.src='https://via.placeholder.com/150?text=Cemento'">
            <h3>Cemento</h3>
            <p>$9.00</p>
            <button class="btn-agregar">Agregar al Carrito</button>
        </div>
        <div class="producto">
            <img src="ImagenesProducto/Arena.png" alt="Arena" onerror="this.src='https://via.placeholder.com/150?text=Arena'">
            <h3>Arena</h3>
            <p>$7.00</p>
            <button class="btn-agregar">Agregar al Carrito</button>
        </div>
        <div class="producto">
            <img src="ImagenesProducto/Grava.png" alt="grava" onerror="this.src='https://via.placeholder.com/150?text=Grava'">
            <h3>Grava</h3>
            <p>$6.50</p>
            <button class="btn-agregar">Agregar al Carrito</button>
        </div>
        <div class="producto">
            <img src="ImagenesProducto/Bloque.png" alt="Bloque" onerror="this.src='https://via.placeholder.com/150?text=Bloque'">
            <h3>Bloque</h3>
            <p>$1.50</p>
            <button class="btn-agregar">Agregar al Carrito</button>
        </div>
        <div class="producto">
            <img src="ImagenesProducto/Varilla.png" alt="varilla" onerror="this.src='https://via.placeholder.com/150?text=Varilla'">
            <h3>Varilla</h3>
            <p>$12.00</p>
            <button class="btn-agregar">Agregar al Carrito</button>
        </div>
        <div class="producto">
            <img src="ImagenesProducto/Ladrillo.png" alt="ladrillo" onerror="this.src='https://via.placeholder.com/150?text=Ladrillo'">
            <h3>Ladrillo</h3>
            <p>$0.80</p>
            <button class="btn-agregar">Agregar al Carrito</button>
        </div>
        <div class="producto">
            <img src="ImagenesProducto/Yeso.png" alt="Yeso" onerror="this.src='https://via.placeholder.com/150?text=Yeso'">
            <h3>Yeso</h3>
            <p>$5.00</p>
            <button class="btn-agregar">Agregar al Carrito</button>
        </div>
        <div class="producto">
            <img src="ImagenesProducto/Cal.png" alt="cal" onerror="this.src='https://via.placeholder.com/150?text=Cal'">
            <h3>Cal</h3>
            <p>$4.00</p>
            <button class="btn-agregar">Agregar al Carrito</button>
        </div>
        <div class="producto">
            <img src="ImagenesProducto/Teja.png" alt="Teja" onerror="this.src='https://via.placeholder.com/150?text=Teja'">
            <h3>Teja</h3>
            <p>$3.50</p>
            <button class="btn-agregar">Agregar al Carrito</button>
        </div>
        <div class="producto">
            <img src="ImagenesProducto/Piedra.png" alt="Piedra" onerror="this.src='https://via.placeholder.com/150?text=Piedra'">
            <h3>Piedra</h3>
            <p>$6.00</p>
            <button class="btn-agregar">Agregar al Carrito</button>
        </div>
    </div>

</body>
</html>