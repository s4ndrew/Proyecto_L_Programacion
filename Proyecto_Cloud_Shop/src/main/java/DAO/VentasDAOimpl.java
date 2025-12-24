package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connection.ConexionMySQL;
import interfaces.VentasDAO;
import model.Ventas;

public class VentasDAOimpl implements VentasDAO {

	//REGISTRAR
	@Override
	public boolean insertarVenta(Ventas v) throws SQLException {
		String sql = "INSERT INTO venta (dni, nombres, apellidos, telefono, direccion, correo, total, id_inventario) VALUES (?,?,?,?,?,?,?,?)";

	    Connection con = ConexionMySQL.obtenerConexion();
	    PreparedStatement pstmt = con.prepareStatement(
	        sql, PreparedStatement.RETURN_GENERATED_KEYS
	    );

	    pstmt.setInt(1, v.getDni());
	    pstmt.setString(2, v.getNombres());
	    pstmt.setString(3, v.getApellidos());
	    pstmt.setInt(4, v.getTelefono());
	    pstmt.setString(5, v.getDireccion());
	    pstmt.setString(6, v.getCorreo());
	    pstmt.setDouble(7, v.getTotal());
	    pstmt.setInt(8, v.getId_inventario());

	    pstmt.executeUpdate();
		return false;
	}

	//LISTAR INPUTS VENTAS
	@Override
	public ArrayList<Ventas> listarVentas() throws SQLException {
		ArrayList<Ventas> listaVentas = new ArrayList<>();
		
		String sql = "SELECT * FROM venta";
		
		Connection con = ConexionMySQL.obtenerConexion();
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			Ventas v = new Ventas();
			v.setId_venta(rs.getInt("id_venta"));
			v.setDni(rs.getInt("dni"));
			v.setNombres(rs.getString("nombres"));
			v.setApellidos(rs.getString("apellidos"));
			v.setTelefono(rs.getInt("telefono"));
			v.setDireccion(rs.getString("direccion"));
			v.setCorreo(rs.getString("correo"));
			v.setTotal(rs.getDouble("total"));
			listaVentas.add(v);
		}
		return listaVentas;
	}

	@Override
	public Ventas buscarPorId(int id) throws SQLException {
		Connection con = ConexionMySQL.obtenerConexion();
		String sql= "SELECT * FROM venta WHERE id_venta=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, id);
		
		ResultSet rs = pstmt.executeQuery();
		
		Ventas v = null;
		if(rs.next()) {
			v = new Ventas();
			v.setId_venta(rs.getInt("id_venta"));
			v.setDni(rs.getInt("dni"));
			v.setNombres(rs.getString("nombres"));
			v.setApellidos(rs.getString("apellidos"));
			v.setTelefono(rs.getInt("telefono"));
			v.setDireccion(rs.getString("direccion"));
			v.setCorreo(rs.getString("correo"));
			v.setTotal(rs.getDouble("total"));
		}
		rs.close();
		pstmt.close();
		con.close();
		return v;
	}
	
	
	
}
