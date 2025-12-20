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
	
	
}
