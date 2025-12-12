package controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import connection.ConexionMySQL;

@WebServlet("/InventarioContollers")
public class InventarioContollers extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 1. Recibir datos del formulario
		String codigo = request.getParameter("txtCodigo");
		String categoria = request.getParameter("cboCategoria");
		String producto = request.getParameter("txtProducto");
		String marca = request.getParameter("txtMarca");
		String stock = request.getParameter("txtStock");
		String precio = request.getParameter("txtPrecio");

		try {
			// 2. Obtener conexión
			Connection con = ConexionMySQL.obtenerConexion();
			Statement stmt = con.createStatement();

			// 3. Crear la consulta estilo JSP que diste de ejemplo
			String sql = "INSERT INTO inventario (codigo, categoria, producto, marca, precio_unitario, stock) "
					+ "VALUES ('" + codigo + "', '" + categoria + "', '" + producto + "', '" + marca + "', " + precio
					+ ", " + stock + ")";

			int filas = stmt.executeUpdate(sql);

			// 4. Validación simple
			if (filas > 0) {
				response.sendRedirect("inventario.jsp?msg=success");
			} else {
				response.sendRedirect("inventario.jsp?msg=fail");
			}

			stmt.close();
			con.close();

		} catch (Exception e) {
			response.sendRedirect("inventario.jsp?msg=error");
		}
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect("inventario.jsp");
	}
}
