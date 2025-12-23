package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connection.ConexionMySQL;
import interfaces.UsuariosDAO;
import model.Usuarios;

public class UsuariosDAOimpl implements UsuariosDAO {

	@Override
	public boolean registrarUsuarios(Usuarios u) {
		String sql= "INSERT INTO usuarios (usuario, dni, nombre, apellidos, rol, correo, contraseña) VALUES(?,?,?,?,?,?,?)";
		try {
			
			Connection con = ConexionMySQL.obtenerConexion();
			PreparedStatement pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, u.getUsuario());
			pstmt.setInt(2, u.getDni());
			pstmt.setString(3, u.getNombre());
			pstmt.setString(4, u.getApellidos());
			pstmt.setString(5, u.getRol());
			pstmt.setString(6, u.getCorreo());
			pstmt.setString(7, u.getContraseña());
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
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
	
	@Override
	public boolean eliminarUsuarios(int id) {
		String sql= "DELETE FROM usuarios WHERE id_usuarios=?";
		try {
			Connection con = ConexionMySQL.obtenerConexion();
			PreparedStatement pstmt = con.prepareStatement(sql);
			
	        pstmt.setInt(1, id);
	        pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public Usuarios buscarPorId(int id) throws ClassNotFoundException, SQLException {
		Connection con = ConexionMySQL.obtenerConexion();
		String sql= "SELECT * FROM usuarios WHERE id_usuarios=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, id);
		
		ResultSet rs = pstmt.executeQuery();
		Usuarios u = null;
		
		if (rs.next()) {
			u = new Usuarios();
			u.setId_usuarios(rs.getInt("id_usuarios"));
			u.setUsuario(rs.getString("usuario"));
			u.setDni(rs.getInt("dni"));
			u.setNombre(rs.getString("nombre"));
			u.setApellidos(rs.getString("apellidos"));
			u.setRol(rs.getString("rol"));
			u.setCorreo(rs.getString("correo"));
			u.setContraseña(rs.getString("contraseña"));
		}
		rs.close();
		return u;
	}

	@Override
	public boolean editarUsuarios(Usuarios u) throws ClassNotFoundException, SQLException {
		Connection con = ConexionMySQL.obtenerConexion();
		String sql= "UPDATE usuarios SET usuario=?, dni=?, nombre=?, apellidos=?, rol=?, correo=? WHERE id_usuarios=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		pstmt.setString(1, u.getUsuario());
		pstmt.setInt(2, u.getDni());
		pstmt.setString(3, u.getNombre());
		pstmt.setString(4, u.getApellidos());
		pstmt.setString(5, u.getRol());
		pstmt.setString(6, u.getCorreo());
		pstmt.setInt(7, u.getId_usuarios());
		
		pstmt.executeUpdate();
		pstmt.close();
		con.close();
		return false;
	}
	
	
	
	
	
}
