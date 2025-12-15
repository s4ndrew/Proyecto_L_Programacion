package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Inventario;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/InventarioController")
public class InventarioController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int codigo = Integer.parseInt(request.getParameter("txtCodigo"));
		String categoria = request.getParameter("cboCategoria");
		String producto = request.getParameter("txtProducto");
		String marca = request.getParameter("txtMarca");
		double precio = Double.parseDouble(request.getParameter("txtPrecio"));
		int stock = Integer.parseInt(request.getParameter("txtStock"));

		Inventario objInv = new Inventario();
		objInv.setCodigo(codigo);
		objInv.setCategoria(categoria);
		objInv.setProducto(producto);
		objInv.setMarca(marca);
		objInv.setPrecio(precio);
		objInv.setStock(stock);

		try {
			objInv.insertarProducto();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		response.sendRedirect(request.getContextPath() + "/views/InventarioGUI.jsp");
	}
}
