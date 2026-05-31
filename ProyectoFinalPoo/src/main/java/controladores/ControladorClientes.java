package controladores;

// author: jaime

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import modelos.Clientes;
import modelos.ClientesDAO;

@WebServlet(name = "ControladorClientes", urlPatterns = {"/ControladorClientes"})
public class ControladorClientes extends HttpServlet {

    ClientesDAO gestorClientes = new ClientesDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");

        // LISTAR
        if (accion == null || accion.equalsIgnoreCase("listar")) {
            List<Clientes> listaClientes = gestorClientes.listar();
            request.setAttribute("listaClientes", listaClientes);
            request.getRequestDispatcher("clientes.jsp").forward(request, response);
        }

        // INSERTAR - mostrar formulario
        else if (accion.equalsIgnoreCase("nuevo")) {
            request.getRequestDispatcher("clientes.jsp").forward(request, response);
        }

        // GUARDAR nuevo cliente
        else if (accion.equalsIgnoreCase("insertar")) {
            Clientes c = new Clientes();
            c.setNombre(request.getParameter("nombre"));
            c.setApellido(request.getParameter("apellido"));
            c.setCorreo(request.getParameter("correo"));
            c.setTelefono(request.getParameter("telefono"));
            c.setDireccion(request.getParameter("direccion"));

            gestorClientes.insertar(c);
            response.sendRedirect("ControladorClientes?accion=listar");
        }

        // EDITAR - cargar datos en formulario
        else if (accion.equalsIgnoreCase("editar")) {
            int id = Integer.parseInt(request.getParameter("id"));
            Clientes c = gestorClientes.obtenerPorId(id);
            request.setAttribute("clientesEditar", c);

            List<Clientes> listaClientes = gestorClientes.listar();
            request.setAttribute("listaClientes", listaClientes);
            request.getRequestDispatcher("clientes.jsp").forward(request, response);
        }

        // ACTUALIZAR cliente existente
        else if (accion.equalsIgnoreCase("actualizar")) {
            Clientes c = new Clientes();
            c.setId_clientes(Integer.parseInt(request.getParameter("id_clientes")));
            c.setNombre(request.getParameter("nombre"));
            c.setApellido(request.getParameter("apellido"));
            c.setCorreo(request.getParameter("correo"));
            c.setTelefono(request.getParameter("telefono"));
            c.setDireccion(request.getParameter("direccion"));

            gestorClientes.actualizar(c);
            response.sendRedirect("ControladorClientes?accion=listar");
        }

        // ELIMINAR cliente
        else if (accion.equalsIgnoreCase("eliminar")) {
            int id = Integer.parseInt(request.getParameter("id"));
            gestorClientes.eliminar(id);
            response.sendRedirect("ControladorClientes?accion=listar");
        }
    }

    // Polimorfismo: reemplazamos los métodos de la clase padre
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}