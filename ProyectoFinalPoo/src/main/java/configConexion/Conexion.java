package ConfigConexion;
 
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

//Esta es la clase conexion

public class Conexion { 
    private Connection con;
    private final String url = "jdbc:sqlserver://localhost\\Ferreteria:1433;databaseName=FerreteriaNueva;encrypt=true;trustServerCertificate=true";
    private final String user = "LogProyectoPOO";
    private final String pass = "12345";
 
    public Connection conectar() {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            con = DriverManager.getConnection(url, user, pass);
            System.out.println("✅ Conexion establecida con exito.");
        } catch (ClassNotFoundException e) {
            System.out.println(" Error: Driver JDBC no encontrado.");
        } catch (SQLException e) {
            System.out.println(" Error de SQL: " + e.getMessage());
        }
        return con;
    }
 
    public static void main(String[] args) {
        Conexion c = new Conexion();
        c.conectar();
    }
}