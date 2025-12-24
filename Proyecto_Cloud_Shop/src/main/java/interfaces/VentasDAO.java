package interfaces;

import java.sql.SQLException;
import java.util.ArrayList;

import model.Ventas;

public interface VentasDAO {
	
	public boolean insertarVenta(Ventas v) throws SQLException;
	
	public ArrayList<Ventas> listarVentas() throws SQLException;
	
	public Ventas buscarPorId(int id) throws SQLException;
}
