package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import connection.ConexionMySQL;
import model.Ventas;

public class VentasDAO {
	public void insertarVenta(Ventas v) throws SQLException {

		String sql = "INSERT INTO venta (dni, nombres, apellidos, telefono, direccion, correo, total, id_inventario) "
				+ "VALUES (?,?,?,?,?,?,?,?)";

		try (Connection con = ConexionMySQL.obtenerConexion(); PreparedStatement pstmt = con.prepareStatement(sql)) {

			pstmt.setInt(1, v.getDni());
			pstmt.setString(2, v.getNombres());
			pstmt.setString(3, v.getApellidos());
			pstmt.setInt(4, v.getTelefono());
			pstmt.setString(5, v.getDireccion());
			pstmt.setString(6, v.getCorreo());
			pstmt.setDouble(7, v.getTotal());
			pstmt.setInt(8, v.getId_inventario());

			pstmt.executeUpdate();
		}
	}

}
