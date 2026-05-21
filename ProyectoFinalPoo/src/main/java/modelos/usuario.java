/*
* Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
* Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
*/
package modelos;
 
/**
*
* @author lalon
*/
public class usuario {
    int id_usuario;
    String nombre_usuario;
    String contrasena;
    String nombre_real;
 
    public usuario() {
    }
 
    public usuario(int id_usuario, String nombre_usuario, String contrasena, String nombre_real) {
        this.id_usuario = id_usuario;
        this.nombre_usuario = nombre_usuario;
        this.contrasena = contrasena;
        this.nombre_real = nombre_real;
    }
 
    public int getId_usuario() {
        return id_usuario;
    }
 
    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }
 
    public String getNombre_usuario() {
        return nombre_usuario;
    }
 
    public void setNombre_usuario(String nombre_usuario) {
        this.nombre_usuario = nombre_usuario;
    }
 
    public String getContrasena() {
        return contrasena;
    }
 
    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }
 
    public String getNombre_real() {
        return nombre_real;
    }
 
    public void setNombre_real(String nombre_real) {
        this.nombre_real = nombre_real;
    }
}