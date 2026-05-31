/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelos;

import ConfigConexion.Conexion;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ClientesDAO {

    private Connection getConexion() {
        return new Conexion().conectar();
    }

    // Insertar
    public boolean insertar(Clientes c) {
        String sql = "INSERT INTO clientes (nombre, apellido, correo, telefono, direccion) VALUES (?, ?, ?, ?, ?)";
        try (Connection con = getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, c.getNombre());
            ps.setString(2, c.getApellido());
            ps.setString(3, c.getCorreo());
            ps.setString(4, c.getTelefono());
            ps.setString(5, c.getDireccion());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error al insertar clientes: " + e.getMessage());
            return false;
        }
    }

    // Listar todos
    public List<Clientes> listar() {
        List<Clientes> lista = new ArrayList<>();
        String sql = "SELECT * FROM clientes";
        try (Connection con = getConexion();
             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery(sql)) {
            while (rs.next()) {
                lista.add(new Clientes(
                    rs.getInt("id_clientes"),
                    rs.getString("nombre"),
                    rs.getString("apellido"),
                    rs.getString("correo"),
                    rs.getString("telefono"),
                    rs.getString("direccion")
                ));
            }
        } catch (SQLException e) {
            System.out.println("Error al listar clientes: " + e.getMessage());
        }
        return lista;
    }

    // Obtener por ID
    public Clientes obtenerPorId(int id) {
        String sql = "SELECT * FROM clientes WHERE id_clientes = ?";
        try (Connection con = getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Clientes(
                    rs.getInt("id_clientes"),
                    rs.getString("nombre"),
                    rs.getString("apellido"),
                    rs.getString("correo"),
                    rs.getString("telefono"),
                    rs.getString("direccion")
                );
            }
        } catch (SQLException e) {
            System.out.println("Error al obtener clientes: " + e.getMessage());
        }
        return null;
    }

    // Actualizar
    public boolean actualizar(Clientes c) {
        String sql = "UPDATE clientes SET nombre=?, apellido=?, correo=?, telefono=?, direccion=? WHERE id_clientes=?"; // ✅ corregido id_clientes
        try (Connection con = getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, c.getNombre());
            ps.setString(2, c.getApellido());
            ps.setString(3, c.getCorreo());
            ps.setString(4, c.getTelefono());
            ps.setString(5, c.getDireccion());
            ps.setInt(6, c.getId_clientes());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error al actualizar clientes: " + e.getMessage());
            return false;
        }
    }

    // Eliminar
    public boolean eliminar(int id) {
        String sql = "DELETE FROM clientes WHERE id_clientes = ?";
        try (Connection con = getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error al eliminar clientes: " + e.getMessage());
            return false;
        }
    }
}