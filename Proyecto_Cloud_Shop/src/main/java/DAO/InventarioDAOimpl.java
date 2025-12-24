package DAO;

import java.awt.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connection.ConexionMySQL;
import interfaces.InventarioDAO;
import model.Inventario;

public class InventarioDAOimpl implements InventarioDAO{

	@Override
	public boolean insertarProducto(Inventario i) throws SQLException {
		String sql = "INSERT INTO inventario (codigo, categoria, producto, marca, precio_unitario, stock) "
				+ "VALUES (?,?,?,?,?,?)";

		try (Connection con = ConexionMySQL.obtenerConexion(); PreparedStatement pstmt = con.prepareStatement(sql)) {

			pstmt.setInt(1, i.getCodigo());
			pstmt.setString(2, i.getCategoria());
			pstmt.setString(3, i.getProducto());
			pstmt.setString(4, i.getMarca());
			pstmt.setDouble(5, i.getPrecio());
			pstmt.setInt(6, i.getStock());

			pstmt.executeUpdate();
		}
		return false;
	}

	@Override
	public ArrayList<Inventario> listarInventario() throws SQLException {
		ArrayList<Inventario> lista = new ArrayList<>();
		String sql = "SELECT * FROM inventario";

		try (Connection con = ConexionMySQL.obtenerConexion();
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery()) {

			while (rs.next()) {
				Inventario i = new Inventario();
				i.setId_inventario(rs.getInt("id_inventario"));
				i.setCodigo(rs.getInt("codigo"));
				i.setCategoria(rs.getString("categoria"));
				i.setProducto(rs.getString("producto"));
				i.setMarca(rs.getString("marca"));
				i.setPrecio(rs.getDouble("precio_unitario"));
				i.setStock(rs.getInt("stock"));

				lista.add(i);
			}
		}
		return lista;
	}

	@Override
	public boolean eliminarProducto(int id) throws SQLException {
		String sql = "DELETE FROM inventario WHERE id_inventario = ?";
		Connection con = ConexionMySQL.obtenerConexion(); 
		PreparedStatement pstmt = con.prepareStatement(sql);\
		
		pstmt.setInt(1, id);
		pstmt.executeUpdate();
		
		return false;
	}

	@Override
	public Inventario obtenerProductoPorId(int id) throws SQLException {
		String sql = "SELECT * FROM inventario WHERE id_inventario = ?";

		try (Connection con = ConexionMySQL.obtenerConexion(); PreparedStatement pstmt = con.prepareStatement(sql)) {

			pstmt.setInt(1, id);

			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					Inventario i = new Inventario();
					i.setId_inventario(rs.getInt("id_inventario"));
					i.setCodigo(rs.getInt("codigo"));
					i.setCategoria(rs.getString("categoria"));
					i.setProducto(rs.getString("producto"));
					i.setMarca(rs.getString("marca"));
					i.setPrecio(rs.getDouble("precio_unitario"));
					i.setStock(rs.getInt("stock"));
					return i;
				}
			}
		}
		return null;
	}
	
	public boolean actualizarProducto(Inventario i) throws SQLException {
		String sql = "UPDATE inventario SET codigo=?, categoria=?, producto=?, marca=?, "
				+ "precio_unitario=?, stock=? WHERE id_inventario=?";

		try (Connection con = ConexionMySQL.obtenerConexion(); PreparedStatement pstmt = con.prepareStatement(sql)) {

			pstmt.setInt(1, i.getCodigo());
			pstmt.setString(2, i.getCategoria());
			pstmt.setString(3, i.getProducto());
			pstmt.setString(4, i.getMarca());
			pstmt.setDouble(5, i.getPrecio());
			pstmt.setInt(6, i.getStock());
			pstmt.setInt(7, i.getId_inventario());

			return pstmt.executeUpdate() > 0;
		}
	}
	
}
