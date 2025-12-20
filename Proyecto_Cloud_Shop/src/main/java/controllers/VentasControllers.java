package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import DAO.InventarioDAO;
import model.Inventario;
import model.Ventas;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/VentasControllers")
public class VentasControllers extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private InventarioDAO inventarioDAO = new InventarioDAO();
    
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

            default:
                listarInventario(request, response);
                break;
        }
    }
    
    private void listarInventario(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {

        List<Inventario> listaProductos = inventarioDAO.listarInventario();
        request.setAttribute("listaProductos", listaProductos);

        request.getRequestDispatcher("views/guiVentas.jsp")
               .forward(request, response);
    }

    private void registrarVenta(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {

        Ventas venta = new Ventas();

        venta.setNombre(request.getParameter("txtNombre"));
        venta.setApellidos(request.getParameter("txtApellidos"));
        venta.setCantidad(Integer.parseInt(request.getParameter("txtCantidad")));
        venta.setPrecio(Double.parseDouble(request.getParameter("txtPrecio")));
        response.sendRedirect("VentasControllers?accion=listar");
    }
}
