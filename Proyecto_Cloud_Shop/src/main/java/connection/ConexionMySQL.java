package connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexionMySQL {
	private static final String HOST ="localhost";
	private static final String PUERTO = "3306";
	private static final String BASE_DE_DATOS = "bd_cloud_shop";
	private static final String USUARIO = "root";
	private static final String PASSWORD = "";
	private static final String URL = "jdbc:mysql://"+HOST+":"+PUERTO+"/"+BASE_DE_DATOS+"?serverTimezone=America/Santiago";
	
	public static Connection obtenerConexion() {
	    Connection con = null;
	    try {
	        Class.forName("com.mysql.cj.jdbc.Driver");
	        con = DriverManager.getConnection(URL, USUARIO, PASSWORD);
	    } catch (ClassNotFoundException | SQLException e) {
	        System.out.println("Error al conectar MySQL: " + e.getMessage());
	        con = null;
	    }
	    return con;
	}

}
