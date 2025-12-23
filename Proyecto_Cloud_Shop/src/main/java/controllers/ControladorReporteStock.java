package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Inventario;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import DAO.ReporteStockDAO;

/**
 * Servlet implementation class ContoladorReporteStock
 */
@WebServlet("/ControladorReporteStock")
public class ControladorReporteStock extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ControladorReporteStock() {
		super();
		// TODO Auto-generated constructor stub
	}
	ReporteStockDAO reporte = new ReporteStockDAO();
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("SERVER");
		try {
			processRequest(request, response);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			processRequest(request, response);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {

		String accionar = request.getParameter("accionar");

		if (accionar == null) {
			System.out.println("El accionar es nulo");
			return;
		}

		switch (accionar) {
		case "mostrarReporteStock":
			listaReporteStock(request, response);
			System.out.println("se esta solicitado la " + accionar);
			break;

		case "mostrarReporteVentas":
			listarReporteVentas(request, response);
			System.out.println("se esta solicitado la " + accionar);
			break;
			
		default:
			System.out.println("Acción no reconocida");
			break;
		}

	}

	public void listaReporteStock(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		try {
		    List<Inventario> listadeReporteStock = reporte.listarReporteStock();
		    System.out.println("Lista de Reporte Stock: " + listadeReporteStock.size());
		    request.setAttribute("listarProductos", listadeReporteStock);
		    request.getRequestDispatcher("/views/guiReporteStock.jsp").forward(request, response);
		} catch (SQLException e) {
		    System.err.println("Error al obtener el reporte: " + e.getMessage());
		    e.printStackTrace(); // Para ver detalles en el servidor
		}
	}

	public void listarReporteVentas(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.getRequestDispatcher("/views/guiReporteVentas.jsp").forward(request, response);
	}
}
