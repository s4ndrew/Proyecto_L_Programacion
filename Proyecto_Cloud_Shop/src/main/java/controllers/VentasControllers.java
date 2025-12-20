package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Ventas;

import java.io.IOException;
import java.lang.module.ModuleDescriptor.Requires;

@WebServlet("/VentasControllers")
public class VentasControllers extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Contolador ventas");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    System.out.println("Entró al método doPost del servlet"); // Verifica que el método sea invocado

	    String accion = request.getParameter("accionarVenta");
	    System.out.println("Acción recibida: " + accion);

	    if (accion == null) {
	    	response.sendRedirect("/guiVentas");
	        return; // Salir si no hay acción
	    }

	    try {
	        processRequest(request, response);
	    } catch (Exception e) {
	        e.printStackTrace(); // Para obtener detalles de errores
	    }}
	}

	
	public void processRequest(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		 String accion = request.getParameter("accionarVenta");

		    if (accion == null) {
		        System.out.println("Acción no proporcionada");
		        response.getWriter().append("Acción no proporcionada");
		        return; // Salir si no hay acción
		    }

		    System.out.println("Acción recibida: " + accion);

		    switch (accion) {
		        case "registrar":
		            agregarVenta(request, response);
		            break;

		        case "listar":
		            // Aquí agregarás la lógica para listar las ventas si lo necesitas
		            break;

		        default:
		            response.getWriter().append("Acción no válida");
		            break;;
		}
		
	}
	
	Ventas objVentas = new Ventas();
	private void agregarVenta(HttpServletRequest request, HttpServletResponse response) {
		
		int dni = Integer.parseInt(request.getParameter("txtDNI"));
		String nombre = request.getParameter("txtNombre");
		String apellido = request.getParameter("txtApellidos");
		
		//verificar
		String categoria = request.getParameter("cboCategoria");
		//verificar
		
		String producto = request.getParameter("cboProducto");
		int cantidad = Integer.parseInt(request.getParameter("txtCantidad"));
		double precio = Double.parseDouble(request.getParameter("txtPrecio"));
		
		objVentas.setDni_cliente(dni);
		objVentas.setNombre(nombre);
		objVentas.setApellidos(apellido);
		objVentas.setCantidad(cantidad);
		//falta categoria 
		// falta producto
		
		objVentas.setPrecio(precio);
		objVentas.totalVenta();
	}
}
