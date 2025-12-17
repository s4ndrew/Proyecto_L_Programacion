package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Usuarios;

import java.io.IOException;

import DAO.UsuariosDAO;


@WebServlet("/UsuariosControllers")
public class UsuariosControllers extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UsuariosDAO dao = new UsuariosDAO();
		
		String accion = request.getParameter("accion");
		
		try {
			if("registrar".equals(accion)) {
				Usuarios u = new Usuarios();
				u.setUsuario(request.getParameter("txtUsuario"));
				u.setDni(Integer.parseInt(request.getParameter("txtDNI")));
				u.setNombre(request.getParameter("txtNombre"));
				u.setApellidos(request.getParameter("txtApellidos"));
				u.setRol(request.getParameter("cboRol"));
				u.setCorreo(request.getParameter("txtCorreo"));
				u.setContraseña(request.getParameter("txtContraseña"));
				
				dao.registrarUsuarios(u);
				System.out.println("Usuario registrado: " + u.getUsuario()); // Para debug
			    response.sendRedirect(request.getContextPath() + "/views/guiUsuarios.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
