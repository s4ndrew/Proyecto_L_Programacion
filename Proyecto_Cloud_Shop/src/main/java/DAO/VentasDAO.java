package DAO;

import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.sun.net.httpserver.Request;

import connection.ConexionMySQL;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Ventas;

public class VentasDAO {

	// Ventas v = new Ventas();

	public static List<String> listarCategorias() {
		Connection con = ConexionMySQL.obtenerConexion();
	    List<String> categorias = new ArrayList<>();
	    
	    if (con == null) {
	        System.out.println("Error: No se pudo conectar a la base de datos.");
	    } else {
	        System.out.println("Conexión exitosa a la base de datos.");
	    }

	    String sql = "SELECT id_inventario, categoria FROM inventario";
	    
	    try {
	        PreparedStatement pstmt = con.prepareStatement(sql);
	        ResultSet rs = pstmt.executeQuery();
	        
	        while (rs.next()) {
	        	String categoria = rs.getString("categoria");
	            System.out.println("Categoría: " + categoria); // Para verificar los valores
	            categorias.add(categoria);
	        }
	        
	    } catch (SQLException e) {
	        e.printStackTrace();
	        System.out.println("Error al obtener categorías de la base de datos.");
	    }
	    
	    return categorias;

	}

	/*
	 * public static void insertarVentas(Ventas v) throws SQLException {
	 * 
	 * Connection con = ConexionMySQL.obtenerConexion();
	 * 
	 * String sql =
	 * "INSERT INTO ventas(dni_cliente,nombre,apellidos,categoria,producto,cantidad,precio,total) VALUES (?,?,?,?,?,?,?,?)"
	 * ;
	 * 
	 * PreparedStatement pstmt = con.prepareStatement(sql);
	 * 
	 * pstmt.setInt(1, v.getDni_cliente()); pstmt.setString(2, v.getNombre());
	 * pstmt.setString(3, v.getApellidos()); //pstmt.setInt(4, v.ge); //categoria
	 * pstmt.setDouble(5, v.getPrecio()); //producto pstmt.setInt(6,
	 * v.getCantidad()); //cantidad pstmt.setDouble(7, v.getPrecio()); //precio
	 * pstmt.setDouble(8, v.totalVenta()); //total
	 * 
	 * pstmt.executeUpdate();
	 * 
	 * 
	 * 
	 * }
	 */
}
