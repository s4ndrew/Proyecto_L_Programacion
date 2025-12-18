package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connection.ConexionMySQL;
import model.Usuarios;

public class UsuariosDAO {
	
	//LISTAR
	public ArrayList<Usuarios> listarUsuarios() {
		
		ArrayList<Usuarios> lista = new ArrayList<>();
		
		String sql= "SELECT * FROM usuarios";
		
		try {
			Connection con = ConexionMySQL.obtenerConexion();
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Usuarios u = new Usuarios();
				u.setId_usuarios(rs.getInt("id_usuarios"));
				u.setUsuario(rs.getString("usuario"));
				u.setDni(rs.getInt("dni"));
				u.setNombre(rs.getString("nombre"));
				u.setApellidos(rs.getString("apellidos"));
				u.setRol(rs.getString("rol"));
				u.setCorreo(rs.getString("correo"));
				u.setContraseña(rs.getString("contraseña"));
				lista.add(u);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return lista;
	}
	
	//REGISTRAR
	public void registrarUsuarios(Usuarios u) throws SQLException {
		Connection con = ConexionMySQL.obtenerConexion();
		String sql= "INSERT INTO usuarios (usuario, dni, nombre, apellidos, rol, correo, contraseña) VALUES(?,?,?,?,?,?,?)";
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		pstmt.setString(1, u.getUsuario());
		pstmt.setInt(2, u.getDni());
		pstmt.setString(3, u.getNombre());
		pstmt.setString(4, u.getApellidos());
		pstmt.setString(5, u.getRol());
		pstmt.setString(6, u.getCorreo());
		pstmt.setString(7, u.getContraseña());
		
		pstmt.executeUpdate();
		//pstmt.close();
		//con.close();	
	}
	
	//ELIMINAR
	public void eliminarProducto(int id) throws SQLException {
		Connection con = ConexionMySQL.obtenerConexion();
		String sql= "DELETE FROM usuarios WHERE id_usuarios=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		
        pstmt.setInt(1, id);
        pstmt.executeUpdate();
		//pstmt.close();
		//con.close();	
	}
}
