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
		case "guardar":
			guardarProducto(request, response);
			break;
		case "eliminar":
			eliminarProducto(request, response);
			break;
		}

	}

	private void listarProductos(HttpServletRequest request, HttpServletResponse response)
			throws ClassNotFoundException, SQLException, ServletException, IOException {

		List<Inventario> listaProductos = I.obtenerTodosLosProductos();

		request.setAttribute("listaProductos", listaProductos);

		request.getRequestDispatcher("/views/InventarioGUI.jsp").forward(request, response);
	}

	private void guardarProducto(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ClassNotFoundException {

		int codigo = Integer.parseInt(request.getParameter("txtCodigo"));
		String categoria = request.getParameter("cboCategoria");
		String producto = request.getParameter("txtProducto");
		String marca = request.getParameter("txtMarca");
		double precio = Double.parseDouble(request.getParameter("txtPrecio"));
		int stock = Integer.parseInt(request.getParameter("txtStock"));
		I.setCodigo(codigo);
		I.setCategoria(categoria);
		I.setProducto(producto);
		I.setMarca(marca);
		I.setPrecio(precio);
		I.setStock(stock);

		try {
			I.insertarProducto();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		request.getRequestDispatcher("InventarioController?accion=listar").forward(request, response);
	}

	private void eliminarProducto(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ClassNotFoundException, ServletException {

		int id = Integer.parseInt(request.getParameter("id"));
		I.eliminarProducto(id);
		request.getRequestDispatcher("InventarioController?accion=listar").forward(request, response);
	}
}