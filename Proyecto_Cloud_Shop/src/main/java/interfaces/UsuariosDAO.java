package interfaces;

import java.sql.SQLException;
import java.util.ArrayList;


import model.Usuarios;

public interface UsuariosDAO {

	public boolean registrarUsuarios(Usuarios u);
	
	public ArrayList<Usuarios> listarUsuarios();
	
	public boolean eliminarUsuarios(int id);
	
	public Usuarios buscarPorId(int id) throws ClassNotFoundException, SQLException; 
	
	public boolean editarUsuarios(Usuarios u)throws ClassNotFoundException, SQLException;
}
