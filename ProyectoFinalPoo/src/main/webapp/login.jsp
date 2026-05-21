<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Ferretería - Inicio de Sesión</title>
    <style>
        body { 
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; 
            margin: 0; 
            padding: 40px 20px; 
            background-color: #f4f7f6; 
        }

        h1.titulo-principal {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 30px;
            text-transform: uppercase;
            letter-spacing: 2px;
        }

        .panel-inicio {
            background: #ffffff;
            padding: 40px;
            border-radius: 8px;
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 15px;
            margin: 0 auto 20px auto;
            max-width: 500px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            border-top: 5px solid #ffc107;
        }

        .estilo-letras {
            color: #34495e;
            text-align: center;
            font-size: 1.2rem;
            margin: 5px 0;
        }

        .estilo-input {
            padding: 12px 15px;
            font-size: 16px;
            width: 100%;
            max-width: 350px;
            border-radius: 4px;
            border: 1px solid #ced4da;
            outline: none;
            background-color: #fff;
            transition: border-color 0.3s;
        }

        .estilo-input:focus {
            border-color: #2c3e50;
            background-color: #ffffff;
        }

        .panel-botones {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 10px;
        }

        .btn { 
            padding: 12px 30px; 
            border: none; 
            border-radius: 4px; 
            color: white; 
            cursor: pointer; 
            font-weight: bold;
            font-size: 16px;
            transition: background 0.3s ease;
            text-decoration: none;
            display: inline-block;
        }

        .btn-agregar { 
            background-color: #2c3e50; 
        }

        .btn-agregar:hover {
            background-color: #1a252f;
        }

        .btn-volver {
            background-color: #ffc107;
            color: #333;
        }

        .btn-volver:hover {
            background-color: #e0a800;
        }
        
        .mensaje-error {
            background-color: #f8d7da;
            color: #721c24;
            padding: 10px;
            border-radius: 4px;
            margin: 10px auto;
            max-width: 500px;
            text-align: center;
            border: 1px solid #f5c6cb;
        }
    </style>
</head>
<body>

    <h1 class="titulo-principal">Inicio de Sesión</h1>
    
    <% 
        String error = (String) request.getAttribute("error");
        if (error != null) {
    %>
        <div class="mensaje-error">
            <%= error %>
        </div>
    <% 
        }
    %>

    <form action="${pageContext.request.contextPath}/validarUsuario" method="POST">
        <div class="panel-inicio">
            <label class="estilo-letras">Nombre de Usuario</label> 
            <input type="text" name="txtUser" class="estilo-input" placeholder="nombre de usuario" required>
            
            <label class="estilo-letras">Contraseña</label> 
            <input type="password" name="txtPass" class="estilo-input" placeholder="••••••••" required>
        </div>

        <div class="panel-botones">
            <input type="hidden" name="accion" value="Ingresar">
            <button type="submit" class="btn btn-agregar">Iniciar sesión</button>
            <a href="controlador?accion=logout" class="btn btn-volver">Salir</a>
        </div>
    </form>

</body>
</html>