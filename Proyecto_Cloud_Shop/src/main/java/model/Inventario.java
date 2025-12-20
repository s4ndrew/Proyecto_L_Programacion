package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import connection.ConexionMySQL;

public class Inventario {

	private int id_inventario;
	private int codigo;
	private String categoria;
	private String producto;
	private String marca;
	private double precio;
	private int stock;

	public void insertarProducto() throws ClassNotFoundException, SQLException {

		String sql = "INSERT INTO inventario " + "(codigo, categoria, producto, marca, precio_unitario, stock) "
				+ "VALUES (?,?,?,?,?,?)";

		try (Connection con = ConexionMySQL.obtenerConexion(); PreparedStatement pstmt = con.prepareStatement(sql)) {

			pstmt.setInt(1, codigo);
			pstmt.setString(2, categoria);
			pstmt.setString(3, producto);
			pstmt.setString(4, marca);
			pstmt.setDouble(5, precio);
			pstmt.setInt(6, stock);

			pstmt.executeUpdate();
		}
	}

	public List<Inventario> obtenerTodosLosProductos() throws ClassNotFoundException, SQLException {

		List<Inventario> lista = new ArrayList<>();

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

	public void eliminarProducto(int id) throws ClassNotFoundException, SQLException {

		String sql = "DELETE FROM inventario WHERE id_inventario = ?";

		try (Connection con = ConexionMySQL.obtenerConexion(); PreparedStatement pstmt = con.prepareStatement(sql)) {

			pstmt.setInt(1, id);
			pstmt.executeUpdate();
		}
	}

	public Inventario obtenerProductoPorId(int id) throws ClassNotFoundException, SQLException {

		String sql = "SELECT id_inventario, codigo, categoria, producto, marca, precio_unitario, stock "
				+ "FROM inventario WHERE id_inventario = ?";

		try (Connection con = ConexionMySQL.obtenerConexion(); PreparedStatement pstmt = con.prepareStatement(sql)) {

			pstmt.setInt(1, id);

			try (ResultSet rs = pstmt.executeQuery()) {

				if (rs.next()) {
					Inventario I = new Inventario();
					I.setId_inventario(rs.getInt("id_inventario"));
					I.setCodigo(rs.getInt("codigo"));
					I.setCategoria(rs.getString("categoria"));
					I.setProducto(rs.getString("producto"));
					I.setMarca(rs.getString("marca"));
					I.setPrecio(rs.getDouble("precio_unitario"));
					I.setStock(rs.getInt("stock"));
					return I;
				}
			}
		}
		return null;
	}

	public boolean actualizarProducto() throws ClassNotFoundException, SQLException {

		String sql = "UPDATE inventario SET " + "codigo = ?, categoria = ?, producto = ?, marca = ?, "
				+ "precio_unitario = ?, stock = ? " + "WHERE id_inventario = ?";

		try (Connection con = ConexionMySQL.obtenerConexion(); PreparedStatement pstmt = con.prepareStatement(sql)) {

			pstmt.setInt(1, codigo);
			pstmt.setString(2, categoria);
			pstmt.setString(3, producto);
			pstmt.setString(4, marca);
			pstmt.setDouble(5, precio);
			pstmt.setInt(6, stock);
			pstmt.setInt(7, id_inventario);

			return pstmt.executeUpdate() > 0;
		}
	}

	public int getId_inventario() {
		return id_inventario;
	}

	public void setId_inventario(int id_inventario) {
		this.id_inventario = id_inventario;
	}

	public int getCodigo() {
		return codigo;
	}

	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}

	public String getCategoria() {
		return categoria;
	}

	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}

	public String getProducto() {
		return producto;
	}

	public void setProducto(String producto) {
		this.producto = producto;
	}

	public String getMarca() {
		return marca;
	}

	public void setMarca(String marca) {
		this.marca = marca;
	}

	public double getPrecio() {
		return precio;
	}

	public void setPrecio(double precio) {
		this.precio = precio;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}
}
