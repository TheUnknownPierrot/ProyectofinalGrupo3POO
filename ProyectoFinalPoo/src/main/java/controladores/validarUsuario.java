/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controladores;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelos.usuario;
import modelos.usuarioDAO;

/**
 *
 * @author lalon
 */
@WebServlet(name = "validarUsuario", urlPatterns = {"/validarUsuario"})
public class validarUsuario extends HttpServlet {

    usuarioDAO udao = new usuarioDAO();   
    usuario use = new usuario();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet validarUsuario</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet validarUsuario at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        if(accion.equalsIgnoreCase("Ingresar")){
            String user = request.getParameter("txtUser");
            String pass = request.getParameter("txtPass");
            use = udao.validar(user, pass);
            
            System.out.println("Usuario ingresado: " + user);
            System.out.println("Contraseña ingresada: " + pass);
            System.out.println("Usuario encontrado: " + use.getNombre_usuario());
            System.out.println("Contraseña encontrada: " + use.getContrasena());
            
            if(use.getNombre_usuario() != null && !use.getNombre_usuario().isEmpty()){
                // Crear sesión
                HttpSession session = request.getSession();
                session.setAttribute("usuario", use);
                session.setAttribute("logueado", true);
                
                // Redirigir al controlador
                response.sendRedirect(request.getContextPath() + "/controlador?accion=inicioadmin");
            } else {
                // Usuario no válido, regresar al login con error
                request.setAttribute("error", "Usuario o contraseña incorrectos");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}