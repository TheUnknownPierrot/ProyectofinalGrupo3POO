/*
* Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
* Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
*/
package modelos;
 
import ConfigConexion.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
/**
*
* @author lalon
*/
public class usuarioDAO {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    public usuario validar(String user,String pass){
        usuario use = new usuario();
        String sql="select * from Usuario where nombre_usuario=? and contrasena=?;";
        try {
            con=cn.conectar();
            ps=con.prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, pass);
            rs=ps.executeQuery();
            while(rs.next()){
                use.setId_usuario(rs.getInt("id_usuario"));
                use.setNombre_real(rs.getString("nombre_real"));
                use.setContrasena(rs.getString("contrasena"));
                use.setNombre_usuario(rs.getString("nombre_usuario"));
            }
        } catch (Exception e) {
        }
        return use;
    }
}