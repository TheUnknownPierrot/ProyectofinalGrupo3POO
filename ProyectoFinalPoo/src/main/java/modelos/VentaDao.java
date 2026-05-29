package modelos;

import ConfigConexion.Conexion; //la Herencia funciona gracias a la importaciion
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

//herencia
public class VentaDao extends Conexion {

    // abstraccion. el controlador no necesita saber nada solo manda a llamar el metodo
    public boolean registrarVentaCompleta(List<Producto> carrito, double totalPagar) {
        Connection con = null;
        PreparedStatement psVenta = null;
        PreparedStatement psDetalle = null;
        ResultSet rs = null;
        boolean exito = false;

        try {
            // la conexion se hace automaticamente gracias a que la heredamos de el objeto conexion
            con = this.conectar(); 
            
            con.setAutoCommit(false); // 

            String sqlVenta = "INSERT INTO Ventas (fecha_venta, id_usuario, total) VALUES (GETDATE(), 1, ?)";
            psVenta = con.prepareStatement(sqlVenta, PreparedStatement.RETURN_GENERATED_KEYS);
            psVenta.setDouble(1, totalPagar);
            
            int filasVenta = psVenta.executeUpdate();

            if (filasVenta > 0) {
                rs = psVenta.getGeneratedKeys();
                int idVentaGenerado = 0;
                if (rs.next()) {
                    idVentaGenerado = rs.getInt(1); 
                }

               // agrupa productos repetidos por si compraron mas de 1 del mismo
                Map<Integer, Integer> cantidades = new HashMap<>();
                Map<Integer, Double> precios = new HashMap<>();
                
                for (Producto p : carrito) {
                    cantidades.put(p.getId(), cantidades.getOrDefault(p.getId(), 0) + 1);
                    precios.put(p.getId(), p.getPrecio());
                }

                // guardamos los productos en detalle producto
                String sqlDetalle = "INSERT INTO Detalle_Ventas (id_venta, id_producto, cantidad, precio_unitario) VALUES (?, ?, ?, ?)";
                psDetalle = con.prepareStatement(sqlDetalle);

                for (Integer idProducto : cantidades.keySet()) {
                    psDetalle.setInt(1, idVentaGenerado);
                    psDetalle.setInt(2, idProducto);
                    psDetalle.setInt(3, cantidades.get(idProducto));
                    psDetalle.setDouble(4, precios.get(idProducto));
                    psDetalle.addBatch(); 
                }

                psDetalle.executeBatch(); 
                con.commit(); 
                exito = true;
            }
        } catch (Exception e) {
            if (con != null) {
                try { con.rollback(); } catch (Exception ex) { ex.printStackTrace(); } 
            }
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (psVenta != null) psVenta.close();
                if (psDetalle != null) psDetalle.close();
                if (con != null) con.close();
            } catch (Exception e) { e.printStackTrace(); }
        }
        return exito;
    }
}