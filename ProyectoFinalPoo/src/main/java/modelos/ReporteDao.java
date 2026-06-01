/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelos;

/**
 *
 * @author dnisr
 */
import ConfigConexion.Conexion;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ReporteDao extends Conexion {

    public List<Map<String, Object>> getReportePorFecha(Date fecha) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Map<String, Object>> reporte = new ArrayList<>();

        try {
            con = this.conectar();

            String sql = "SELECT p.nombre, dv.cantidad, dv.precio_unitario, " +
                         "       (dv.cantidad * dv.precio_unitario) AS subtotal " +
                         "FROM Ventas v " +
                         "JOIN Detalle_Ventas dv ON v.id_venta     = dv.id_venta " +
                         "JOIN Producto p        ON dv.id_producto = p.id_producto " +
                         "WHERE CAST(v.fecha_venta AS DATE) = ?";

            ps = con.prepareStatement(sql);
            ps.setDate(1, fecha);
            rs = ps.executeQuery();

            while (rs.next()) {
                Map<String, Object> fila = new HashMap<>();
                fila.put("nombre",         rs.getString("nombre"));
                fila.put("cantidad",       rs.getInt("cantidad"));
                fila.put("precioUnitario", rs.getDouble("precio_unitario"));
                fila.put("subtotal",       rs.getDouble("subtotal"));
                reporte.add(fila);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs  != null) rs.close();
                if (ps  != null) ps.close();
                if (con != null) con.close();
            } catch (Exception e) { e.printStackTrace(); }
        }

        return reporte;
    }

    public double getTotalDia(Date fecha) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        double total = 0;

        try {
            con = this.conectar();

            String sql = "SELECT SUM(total) AS total_dia " +
                         "FROM Ventas " +
                         "WHERE CAST(fecha_venta AS DATE) = ?";

            ps = con.prepareStatement(sql);
            ps.setDate(1, fecha);
            rs = ps.executeQuery();

            if (rs.next()) {
                total = rs.getDouble("total_dia");
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs  != null) rs.close();
                if (ps  != null) ps.close();
                if (con != null) con.close();
            } catch (Exception e) { e.printStackTrace(); }
        }

        return total;
    }
}
