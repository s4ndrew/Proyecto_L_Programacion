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
	private UsuariosDAO dao = new UsuariosDAO();
	
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
	
	public void processRequest(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
		String accion = request.getParameter("accion");
		
        if (accion == null) {
            accion = "listar";
        }
        
		switch (accion) {
			case "listar":
				ArrayList<Usuarios> listaUsuarios = dao.listarUsuarios();
				request.setAttribute("listaUsuarios", listaUsuarios);
				request.getRequestDispatcher("guiUsuarios.jsp").forward(request, response);
				break;
				
			case "guardar":
				Usuarios u = new Usuarios();
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
				break;
				
			case "eliminar":
				
				break;
		}
	}
}
