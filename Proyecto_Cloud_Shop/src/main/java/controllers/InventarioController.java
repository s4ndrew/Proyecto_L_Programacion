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

@WebServlet("/InventarioController")
public class InventarioController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	Inventario I = new Inventario();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			processRequest(request, response);
		} catch (ClassNotFoundException | ServletException | IOException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			processRequest(request, response);
		} catch (ClassNotFoundException | ServletException | IOException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ClassNotFoundException, SQLException {
		String accion = request.getParameter("accion");

		switch (accion) {
		case "listar":
			listarProductos(request, response);
			break;
		}
	}

	private void listarProductos(HttpServletRequest request, HttpServletResponse response)
			throws ClassNotFoundException, SQLException, ServletException, IOException {

		// 1. Llamar al MODELO para obtener los datos
		List<Inventario> listaProductos = I.obtenerTodosLosProductos();

		// 2. Guardar los datos en el request para vista
		request.setAttribute("listaProductos", listaProductos);

		// 3. Redireccionar a la VISTA
		request.getRequestDispatcher("/views/InventarioGUI.jsp").forward(request, response);
	}
}
