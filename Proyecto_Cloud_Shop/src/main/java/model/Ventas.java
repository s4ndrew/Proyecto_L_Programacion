package model;

public class Ventas {
	private int dni_cliente;
	private String nombre, apellidos;
	private int cantidad;
	private double total;
	
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

	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}
}
