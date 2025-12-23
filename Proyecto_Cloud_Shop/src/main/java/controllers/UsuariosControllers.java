package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Usuarios;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import DAO.UsuariosDAO;


@WebServlet("/UsuariosControllers")
public class UsuariosControllers extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	UsuariosDAO dao = new UsuariosDAO();
	
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
	
	
	//METODOS DEL CRUD
	private void listarUser(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
		
	    List<Usuarios> listaUsuarios = dao.listarUsuarios();
	    request.setAttribute("listaUsuarios", listaUsuarios);
	    
	    request.getRequestDispatcher("views/guiUsuarios.jsp").forward(request, response);
	}

	private void registrarUser(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
		Usuarios u = new Usuarios();
		u.setUsuario(request.getParameter("txtUsuario"));
		u.setDni(Integer.parseInt(request.getParameter("txtDNI")));
		u.setNombre(request.getParameter("txtNombre"));
		u.setApellidos(request.getParameter("txtApellidos"));
		u.setRol(request.getParameter("cboRol"));
		u.setCorreo(request.getParameter("txtCorreo"));
		u.setContraseña(request.getParameter("txtContraseña"));
		
		dao.registrarUsuarios(u);
		
		HttpSession session = request.getSession();
		session.setAttribute("msj", "create");
	    response.sendRedirect(request.getContextPath() + "/UsuariosControllers?accion=listar");
	}
	
	private void eliminarUser(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
	    int id = Integer.parseInt(request.getParameter("id"));
	    dao.eliminarUsuarios(id);
	    
		HttpSession session = request.getSession();
		session.setAttribute("msj", "delete");
	    response.sendRedirect(request.getContextPath() + "/UsuariosControllers?accion=listar");
	}
	
	private void mostrarFomrularioUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
		int id = Integer.parseInt(request.getParameter("id"));
		
	    Usuarios user = dao.buscarPorId(id);

	    request.setAttribute("user", user);
	    request.setAttribute("esEdicion", true);
	    request.getRequestDispatcher("views/guiUsuarios.jsp").forward(request, response);
	}
	
	private void editarUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		Usuarios u = new Usuarios();
		u.setId_usuarios(Integer.parseInt(request.getParameter("id")));
		u.setUsuario(request.getParameter("txtUsuario"));
		u.setDni(Integer.parseInt(request.getParameter("txtDNI")));
		u.setNombre(request.getParameter("txtNombre"));
		u.setApellidos(request.getParameter("txtApellidos"));
		u.setRol(request.getParameter("cboRol"));
		u.setCorreo(request.getParameter("txtCorreo"));
		
		dao.editarUsuarios(u);;
		
		HttpSession session = request.getSession();
		session.setAttribute("msj", "edit");
	    response.sendRedirect(request.getContextPath() + "/UsuariosControllers?accion=listar");
	}
	
	//PROCEES REEQUEST
	public void processRequest(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
		String accion = request.getParameter("accion");
		
	    if (accion == null || accion.isEmpty()) {
	        accion = "listar";
	    }
	    
		switch (accion) {
			case "listar":
				listarUser(request, response);
				break;
				
			case "guardar":
				registrarUser(request, response);
				break;
				
			case "eliminar":
				eliminarUser(request, response);
				break;
			case "mostrar":
				mostrarFomrularioUser(request, response);
				break;
			case "editar" :
				editarUser(request, response);
				break;
		}
	}
}