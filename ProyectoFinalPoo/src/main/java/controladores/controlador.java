/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
/*
 * Nombre de clase: controlador
 * Fecha de creacion: 05/14/26
 * Version: 1.0
 * Copyright: Luis ALonso Hernandez Mundo
 */
package controladores;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import controladores.*;
import ConfigConexion.Conexion;
import java.time.LocalDateTime;
import java.util.List;
import java.util.ArrayList;
import java.sql.*;

/**
 *
 * @author lalon
 */
@WebServlet(name = "controlador", urlPatterns = {"/controlador"})
public class controlador extends HttpServlet {

    Conexion con = new Conexion();
    private static final long serialVersionUID = 1L;
    Statement stm;
    ResultSet rs;
    int ide;
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
       switch(accion){
           case "principalAdmin":
               request.getRequestDispatcher("index.html").forward(request, response);
               break;
            default:
               throw new AssertionError();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        if (null == accion) {
            // Redirigir a una página por defecto
            response.sendRedirect("index.html");
        } else switch (accion) {
            case "inicioadmin":
                request.getRequestDispatcher("index.html").forward(request, response);
                break;
            case "clientes":
                request.getRequestDispatcher("clientes.html").forward(request, response);
                break;
            case "reportes":
                request.getRequestDispatcher("reportes.html").forward(request, response);
                break;    
            case "productos":
                request.getRequestDispatcher("productos.html").forward(request, response);
                break;
            default:
                response.sendRedirect("index.html");
                break;
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
