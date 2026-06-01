/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controladores;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.util.List;
import java.util.Map;
import modelos.ReporteDao;

@WebServlet(name = "controladorReportes", urlPatterns = {"/controladorReportes"})
public class controladorReporte extends HttpServlet {

    ReporteDao reporteDao = new ReporteDao();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String fechaStr = request.getParameter("fechaReporte");

        Date fecha = (fechaStr != null && !fechaStr.isEmpty())
                ? Date.valueOf(fechaStr)
                : new Date(System.currentTimeMillis());

        List<Map<String, Object>> reporte = reporteDao.getReportePorFecha(fecha);
         double totalDia                   = reporteDao.getTotalDia(fecha);
        request.setAttribute("reporte",       reporte);
        request.setAttribute("totalDia",      totalDia);
        request.setAttribute("fechaBusqueda", fecha.toString());

        request.getRequestDispatcher("reportes.jsp").forward(request, response);
    }

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