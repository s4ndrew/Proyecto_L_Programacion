package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Inventario;

import java.io.IOException;
import java.util.List;

@WebServlet("/InventarioController")
public class InventarioController extends HttpServlet {

	private static final long serialVersionUID = 1L;

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

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		String accion = request.getParameter("accion");

		if (accion == null) {
			accion = "listar";
		}

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
		case "editar":
			mostrarFormularioEditar(request, response);
			break;
		case "actualizar":
			actualizarProducto(request, response);
			break;
		default:
			listarProductos(request, response);
		}
	}

	private void listarProductos(HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		Inventario inv = new Inventario();
		List<Inventario> listaProductos = inv.obtenerTodosLosProductos();

		request.setAttribute("listaProductos", listaProductos);
		request.getRequestDispatcher("/views/InventarioGUI.jsp").forward(request, response);
	}

	private void guardarProducto(HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		Inventario inv = new Inventario();

		inv.setCodigo(Integer.parseInt(request.getParameter("txtCodigo")));
		inv.setCategoria(request.getParameter("cboCategoria"));
		inv.setProducto(request.getParameter("txtProducto"));
		inv.setMarca(request.getParameter("txtMarca"));
		inv.setPrecio(Double.parseDouble(request.getParameter("txtPrecio")));
		inv.setStock(Integer.parseInt(request.getParameter("txtStock")));

		inv.insertarProducto();

		response.sendRedirect("InventarioController?accion=listar");
	}

	private void eliminarProducto(HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		int id = Integer.parseInt(request.getParameter("id"));
		Inventario inv = new Inventario();
		inv.eliminarProducto(id);

		response.sendRedirect("InventarioController?accion=listar");
	}

	private void mostrarFormularioEditar(HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		int id = Integer.parseInt(request.getParameter("id"));

		Inventario inv = new Inventario();
		Inventario productoEditar = inv.obtenerProductoPorId(id);

		request.setAttribute("producto", productoEditar);
		request.getRequestDispatcher("/views/InventarioGUI.jsp").forward(request, response);
	}

	private void actualizarProducto(HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		Inventario inv = new Inventario();

		inv.setId_inventario(Integer.parseInt(request.getParameter("idProducto")));
		inv.setCodigo(Integer.parseInt(request.getParameter("txtCodigo")));
		inv.setCategoria(request.getParameter("cboCategoria"));
		inv.setProducto(request.getParameter("txtProducto"));
		inv.setMarca(request.getParameter("txtMarca"));
		inv.setPrecio(Double.parseDouble(request.getParameter("txtPrecio")));
		inv.setStock(Integer.parseInt(request.getParameter("txtStock")));

		inv.actualizarProducto();

		response.sendRedirect("InventarioController?accion=listar");
	}
}
