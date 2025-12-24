package interfaces;

import java.sql.SQLException;
import java.util.ArrayList;

import model.Inventario;

public interface InventarioDAO {
	
	public boolean insertarProducto(Inventario i) throws SQLException;
	
	public ArrayList<Inventario> listarInventario() throws SQLException;
	
	public boolean eliminarProducto(int id) throws SQLException;
	
	public Inventario obtenerProductoPorId(int id) throws SQLException;
	
	public boolean actualizarProducto(Inventario i) throws SQLException;
}
