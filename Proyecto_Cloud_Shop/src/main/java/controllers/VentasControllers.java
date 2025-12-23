package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import DAO.InventarioDAO;
import DAO.VentasDAO;
import model.Inventario;
import model.Ventas;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/VentasControllers")
public class VentasControllers extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	//DAO GLOBALES
	private InventarioDAO inventarioDAO = new InventarioDAO();
	private VentasDAO ventasDAO = new VentasDAO();
	
	
	//GET Y POST
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			processRequest(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			processRequest(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	//PROCEES REQUEST
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {

		String accion = request.getParameter("accion");

		if (accion == null) {
			accion = "listar";
		}

		switch (accion) {
		case "listar":
			listarInventario(request, response);
			break;

		case "registrar":
			registrarVenta(request, response);
			break;
		case "listarVentasDetalle":
			listVent(request, response);
			break;
		}
	}

	
	//METODOS DEL CRUD
	private void listarInventario(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {

		List<Inventario> listaProductos = inventarioDAO.listarInventario();
		request.setAttribute("listaProductos", listaProductos);

		request.getRequestDispatcher("views/guiVentas.jsp").forward(request, response);
	}


	private void registrarVenta(HttpServletRequest request, HttpServletResponse response)throws SQLException, IOException, ServletException {

		Ventas ven = new Ventas();
		ven.setDni(Integer.parseInt(request.getParameter("txtDNI")));
		ven.setNombres(request.getParameter("txtNombres"));
		ven.setApellidos(request.getParameter("txtApellidos"));
		ven.setTelefono(Integer.parseInt(request.getParameter("txtTelefono")));
		ven.setDireccion(request.getParameter("txtDireccion"));
		ven.setCorreo(request.getParameter("txtCorreo"));
		ven.setTotal(Double.parseDouble(request.getParameter("txtTotal")));
		ven.setId_inventario(Integer.parseInt(request.getParameter("txtIdInventario")));

		ventasDAO.insertarVenta(ven);

		response.sendRedirect(request.getContextPath() + "/VentasControllers?accion=listarVentasDetalle");
	}
	
	private void listVent(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
		ArrayList<Ventas> lista= ventasDAO.listarVentas();
		request.setAttribute("listaVentas", lista);
		
		request.getRequestDispatcher("views/guiVentaDetalle.jsp").forward(request, response);
	}
}
