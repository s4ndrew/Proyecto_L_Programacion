package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Usuarios;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;


import DAO.UsuariosDAO;


@WebServlet("/UsuariosControllers")
public class UsuariosControllers extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	UsuariosDAO dao = new UsuariosDAO();
	Usuarios u = new Usuarios();
	
	
	public void listarUser(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {

	    ArrayList<Usuarios> listaUsuarios = dao.listarUsuarios();
	    request.setAttribute("listaUsuarios", listaUsuarios);

	    request.getRequestDispatcher("/views/guiUsuarios.jsp")
	           .forward(request, response);
	}

	
	public void registrarUser(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
		u.setUsuario(request.getParameter("txtUsuario"));
		u.setDni(Integer.parseInt(request.getParameter("txtDNI")));
		u.setNombre(request.getParameter("txtNombre"));
		u.setApellidos(request.getParameter("txtApellidos"));
		u.setRol(request.getParameter("cboRol"));
		u.setCorreo(request.getParameter("txtCorreo"));
		u.setContraseña(request.getParameter("txtContraseña"));
		
		dao.registrarUsuarios(u);
		//request.setAttribute("msj", "create");
	    response.sendRedirect(request.getContextPath() + "/UsuariosControllers?accion=listar");
	}
	
	//PROCEES REEQUEST
	public void processRequest(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
		String accion = request.getParameter("accion");
		

		switch (accion) {
			case "listar":
				listarUser(request, response);
				break;
				
			case "guardar":
				registrarUser(request, response);
				break;
				
			case "eliminar":
				
				break;
		}
	}
	
	//GET Y POST
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			processRequest(request, response);
		} catch (SQLException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			processRequest(request, response);
		} catch (SQLException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
