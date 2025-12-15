package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import connection.ConexionMySQL;

public class Inventario {
	private int codigo;
	private String categoria, producto, marca;
	private double precio;
	private int stock;

	public void insertarProducto() throws SQLException {
		Connection con = ConexionMySQL.obtenerConexion();
		String sql = "INSERT INTO inventario (codigo, categoria, producto, marca, precio_unitario, stock) VALUES (?,?,?,?,?,?)";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, codigo);
		pstmt.setString(2, categoria);
		pstmt.setString(3, producto);
		pstmt.setString(4, marca);
		pstmt.setDouble(5, precio);
		pstmt.setInt(6, stock);
		pstmt.executeUpdate();
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
