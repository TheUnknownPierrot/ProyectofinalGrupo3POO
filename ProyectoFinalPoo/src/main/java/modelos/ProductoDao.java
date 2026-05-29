/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelos;
import ConfigConexion.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author alan
 */
//clase abstraccta
public class ProductoDao {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    
    //abstraccion
    public List<Producto> listarProductos() {
        
        List<Producto> carrito = new ArrayList<>();
        String sql = "SELECT * FROM Producto";
        
        try {
            con = cn.conectar();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            

            while (rs.next()) {
                Producto p = new Producto(); 
                

                p.setId(rs.getInt("id_producto"));               
                p.setNombre(rs.getString("nombre"));   
                p.setPrecio(rs.getDouble("precio"));   
                p.setStock(rs.getInt("stock"));        
                
                
                p.setImagen(rs.getString("nombre") + ".png");   
                
                carrito.add(p);
            }
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        }
        
        return carrito;
    }
}
