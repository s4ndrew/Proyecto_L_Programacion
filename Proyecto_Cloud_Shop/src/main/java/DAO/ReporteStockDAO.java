package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import connection.ConexionMySQL;
import model.Inventario;

public class ReporteStockDAO {
	Inventario in = new Inventario();
	public  List<Inventario> listarReporteStock() throws SQLException{
		
		List<Inventario> lista = new ArrayList<>();
		
		String sql = "SELECT * FROM inventario;";
		
		
		try (
				Connection con = ConexionMySQL.obtenerConexion();
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery()
				){
			
			while (rs.next()) {
				Inventario in = new Inventario();
				in.setId_inventario(rs.getInt("id_inventario"));
				in.setCategoria(rs.getString("categoria"));
				in.setProducto(rs.getString("producto"));
				in.setMarca(rs.getString("marca"));
				in.setPrecio(rs.getDouble("precio_unitario"));
				in.setStock(rs.getInt("stock"));
				
				lista.add(in);
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
			
		}
		return lista;
	}
	

}
