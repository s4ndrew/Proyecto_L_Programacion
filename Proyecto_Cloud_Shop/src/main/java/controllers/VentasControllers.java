package controllers;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Ventas;
import DAO.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/VentasControllers")
public class VentasControllers extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Contolador ventas");
		listarCategorias(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    System.out.println("Entró al método doPost del servlet"); // Verifica que el método sea invocado

	    String accion = request.getParameter("accionarVenta");
	    System.out.println("Acción recibida: " + accion);

	    if (accion == null) {
	    	response.sendRedirect("/guiVentas");
	        return; // 
	    }
	}

	
	public void processRequest(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
		
		 String accion = request.getParameter("accionarVenta");

		    if (accion == null) {
		        System.out.println("Acción no proporcionada");
		        response.getWriter().append("Acción no proporcionada");
		        return; 
		    }

		    System.out.println("Acción recibida: " + accion);

		    switch (accion) {
		        case "registrar":
		            agregarVenta(request, response);
		            break;

		        case "listar":
		            
		            break;

		        default:
		            response.getWriter().append("Acción no válida");
		            break;
		}
		
	}
	
	Ventas objVentas = new Ventas();
	private void agregarVenta(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		
		int dni = Integer.parseInt(request.getParameter("txtDNI"));
		String nombre = request.getParameter("txtNombre");
		String apellido = request.getParameter("txtApellidos");
		
		//verificar
		String categoria = request.getParameter("cboCategoria");
		//verificar
		
		String producto = request.getParameter("cboProducto");
		int cantidad = Integer.parseInt(request.getParameter("txtCantidad"));
		double precio = Double.parseDouble(request.getParameter("txtPrecio"));
		
		//VentasDAO.insertarVentas(objVentas);
	}
	
	public void listarCategorias(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    List<String> categorias = VentasDAO.listarCategorias();
	    
	    
	    System.out.println("Categorías recuperadas: " + categorias);
	    
	    if (categorias == null || categorias.isEmpty()) {
	         System.out.println("No hay categorías disponibles.");
	    }
	    
	    request.setAttribute("categorias", categorias);
	    request.getRequestDispatcher("views/guiVentas.jsp").forward(request, response);
	}
}
