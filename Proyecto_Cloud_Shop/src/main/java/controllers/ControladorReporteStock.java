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

import DAO.InventarioDAOimpl;
import interfaces.InventarioDAO;

@WebServlet("/ControladorReporteStock")
public class ControladorReporteStock extends HttpServlet {

    private static final long serialVersionUID = 1L;

    InventarioDAO dao = new InventarioDAOimpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            listarReporteStock(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //doGet(request, response);}
    }

    // LISTAR REPORTE STOCK
    private void listarReporteStock(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
    	System.out.println("LISTANDO INVENTARIO");

        List<Inventario> listaProductos = dao.listarInventario();
        request.setAttribute("listaProductos", listaProductos);

        request.getRequestDispatcher("/views/guiReporteStock.jsp")
               .forward(request, response);
    }
}
