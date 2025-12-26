package model;

public class VentaDetalle {

    private int id_inventario;
    private int id_venta;
    private String producto;
    private double precio;
    private int cantidad;
    private double subtotal;

    public int getId_inventario() {
		return id_inventario;
	}
	public void setId_inventario(int id_inventario) {
		this.id_inventario = id_inventario;
	}
	public int getId_venta() {
		return id_venta;
	}
	public void setId_venta(int id_venta) {
		this.id_venta = id_venta;
	}
	public String getProducto() {
		return producto;
	}
	public void setProducto(String producto) {
		this.producto = producto;
	}
	public double getPrecio() {
		return precio;
	}
	public void setPrecio(double precio) {
		this.precio = precio;
	}
	public int getCantidad() {
		return cantidad;
	}
	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}
	public double getSubtotal() {
		return subtotal;
	}
	public void setSubtotal(double subtotal) {
		this.subtotal = subtotal;
	}
}
