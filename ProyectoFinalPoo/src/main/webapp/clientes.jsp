<%-- 
    Document   : clientes
    Created on : May 21, 2026, 10:28:35 AM
    Author     : lalon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Módulo Clientes</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- CSS -->
    <link rel="stylesheet" href="estiloCliente.css">
</head>
<body>

    <!-- ENCABEZADO -->
    <header class="header text-center">
        <h1>Sistema de Clientes</h1>
        <p>Gestión de clientes</p>
    </header>

    <!-- CONTENIDO -->
    <div class="container mt-5">

        <!-- FORMULARIO -->
        <div class="card shadow p-4">
            <h3 class="mb-4 text-center">Registro de Clientes</h3>

            <form>
                <div class="row">

                    <div class="col-md-6 mb-3">
                        <label class="form-label">Nombre</label>
                        <input type="text" class="form-control" placeholder="Ingrese nombre">
                    </div>

                    <div class="col-md-6 mb-3">
                        <label class="form-label">Apellido</label>
                        <input type="text" class="form-control" placeholder="Ingrese apellido">
                    </div>

                    <div class="col-md-6 mb-3">
                        <label class="form-label">Correo</label>
                        <input type="email" class="form-control" placeholder="Ingrese correo">
                    </div>

                    <div class="col-md-6 mb-3">
                        <label class="form-label">Teléfono</label>
                        <input type="text" class="form-control" placeholder="Ingrese teléfono">
                    </div>

                    <div class="col-md-12 mb-3">
                        <label class="form-label">Dirección</label>
                        <textarea class="form-control" rows="3" placeholder="Ingrese dirección"></textarea>
                    </div>

                </div>

                <!-- BOTONES -->
                <div class="text-center mt-4">
                    <button type="submit" class="btn btn-guardar">Guardar</button>
                    <button type="reset" class="btn btn-limpiar">Limpiar</button>
                </div>
            </form>
        </div>

        <!-- TABLA -->
        <div class="tabla-clientes mt-5">
            <h3 class="text-center mb-4">Lista de Clientes</h3>

            <table class="table table-bordered table-hover text-center">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Correo</th>
                        <th>Teléfono</th>
                    </tr>
                </thead>

                <tbody>
                    <tr>
                        <td>1</td>
                        <td>Juan Pérez</td>
                        <td>juan@gmail.com</td>
                        <td>7777-7777</td>
                    </tr>

                    <tr>
                        <td>2</td>
                        <td>María López</td>
                        <td>maria@gmail.com</td>
                        <td>8888-8888</td>
                    </tr>
                </tbody>
            </table>
        </div>

    </div>

</body>
</html>
