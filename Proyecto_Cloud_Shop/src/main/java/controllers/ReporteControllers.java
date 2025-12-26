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

@WebServlet("/ReporteControllers")
public class ReporteControllers extends HttpServlet {

    private static final long serialVersionUID = 1L;

    interfaces.InventarioDAO dao = new InventarioDAOimpl();
    
    
    //PROCEES REEQUEST
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		
    	String accion = request.getParameter("accion");
		
		if (accion == null) {
			accion = "listarReporteStock";
		}
		
			switch (accion) {
				case "listarReporteStock":
					listarReporteStock(request, response);
					break;
			}
	}
    
    //METODOS DEL CRUD
    
    // LISTAR REPORTE STOCK
    private void listarReporteStock(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {

        List<Inventario> listaReporteStock = dao.listarInventario();
        request.setAttribute("listaReporteStock", listaReporteStock);

        request.getRequestDispatcher("/views/guiReporteStock.jsp").forward(request, response);
    }
    
    
    
	//GET Y POST
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	try {
			processRequest(request, response);
		} catch (ServletException | IOException | SQLException e) {
			e.printStackTrace();
		}
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	try {
			processRequest(request, response);
		} catch (ServletException | IOException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
}
