package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import connection.ConexionMySQL;

public class Ventas {
	private int dni_cliente;
	private String nombre, apellidos;
	private double precio;
	private int cantidad;
	//private double total;
	
	public Ventas() {
		//super();
	}

	public int getDni_cliente() {
		return dni_cliente;
	}

	public void setDni_cliente(int dni_cliente) {
		this.dni_cliente = dni_cliente;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellidos() {
		return apellidos;
	}

	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}

	public int getCantidad() {
		return cantidad;
	}

	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}

	
	public double getPrecio() {
		return precio;
	}

	public void setPrecio(double precio) {
		this.precio = precio;
	}

	public double totalVenta() {
		return cantidad * precio;
	}
	
	
	public void insertarVentas() throws SQLException {
		
		Connection con = ConexionMySQL.obtenerConexion();
		
		String sql = "INSERT INTO ventas(dni_cliente,nombre,apellidos,categoria,producto,cantidad,precio,total) VALUES (?,?,?,?,?,?,?,?)";
		
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		pstmt.setInt(1, dni_cliente);
		pstmt.setString(2, nombre);
		pstmt.setString(3, apellidos);
		pstmt.setInt(4, cantidad); //categoria
		pstmt.setDouble(5, precio); //producto
		pstmt.setInt(6, cantidad); //cantidad
		pstmt.setDouble(7, precio); //precio
		pstmt.setDouble(8, totalVenta()); //total
		
		pstmt.executeUpdate();
		
		
		/*
		private int dni_cliente;
		private String nombre, apellidos;
		private int cantidad;
		private double total;*/
		
		
	}
	
	
	
}
