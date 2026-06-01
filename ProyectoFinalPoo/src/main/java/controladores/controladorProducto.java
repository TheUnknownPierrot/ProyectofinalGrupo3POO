package controladores;

//author : alan

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import modelos.Producto;
import modelos.ProductoDao;

//polimorfismo
@WebServlet(name = "ControladorProducto", urlPatterns = {"/ControladorProducto"})
public class controladorProducto extends HttpServlet {

    ProductoDao empleadoBodega = new ProductoDao();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String accion = request.getParameter("accion");

        if (accion == null || accion.equalsIgnoreCase("listar")) {
            List<Producto> carritoDeProductos = empleadoBodega.listarProductos();
            request.setAttribute("listaProductos", carritoDeProductos);
            request.getRequestDispatcher("interfazProducto.jsp").forward(request, response);
        } 
        
        else if (accion.equalsIgnoreCase("agregarCarrito")) {
            // Capturamos los parámetros 
            int id = Integer.parseInt(request.getParameter("id"));
            String nombre = request.getParameter("nombre");
            double precio = Double.parseDouble(request.getParameter("precio"));

            // Instanciamos la clase aplicando POO
            Producto p = new Producto();
            p.setId(id);
            p.setNombre(nombre);
            p.setPrecio(precio);

            // Solicitamos el espacio en memoria del servidor
            HttpSession sesion = request.getSession();
            List<Producto> canastaCliente = (List<Producto>) sesion.getAttribute("carritoCompras");
            
            if (canastaCliente == null) {
                canastaCliente = new ArrayList<>();
            }
            
            // Agregamos el nuevo registro y redireccionamos de vuelta
            canastaCliente.add(p);
            sesion.setAttribute("carritoCompras", canastaCliente);

            response.sendRedirect("ControladorProducto?accion=listar");
        } 
        
        else if (accion.equalsIgnoreCase("vaciarCarrito")) {
            HttpSession sesion = request.getSession();
            sesion.removeAttribute("carritoCompras");
            response.sendRedirect("ControladorProducto?accion=listar");
        } 
        
        // SQL
        else if (accion.equalsIgnoreCase("comprar")) {
            HttpSession sesion = request.getSession();
            List<Producto> miCarrito = (List<Producto>) sesion.getAttribute("carritoCompras");
            
            // vemos que el carrito no este vacio
            if (miCarrito != null && !miCarrito.isEmpty()) {
                
                // suma el total
                double totalVenta = 0.0;
                for (Producto p : miCarrito) {
                    totalVenta += p.getPrecio();
                }
                
                // mandamos a llamrar a ventasDAO para que guarde en la Base
                modelos.VentaDao cajero = new modelos.VentaDao();
                boolean exito = cajero.registrarVentaCompleta(miCarrito, totalVenta);
                
                // si sql guardo todo correctamente, limpiamos la pantalla
                if (exito) {
                    sesion.removeAttribute("carritoCompras");
                    sesion.setAttribute("compraExitosa", "true"); 
                }
            }
            
            response.sendRedirect("ControladorProducto?accion=listar");
        }
    }
    //polimorfismo: reemplazamos los metodos de la clase padre 
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