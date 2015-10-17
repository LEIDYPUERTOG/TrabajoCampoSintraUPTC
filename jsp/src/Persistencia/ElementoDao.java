package Persistencia;

import Logica.Elemento;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


/**
 * Clase que permite administrar la informacion de los
 * elementos de una cabania en la base de datos
 * @author LEIDY
 * @version 1.0
 * @created 24-sep.-2015 8:54:08 a. m.
 */
public class ElementoDao {

	private ConexionDB conexionDB;
	private Connection conn;


	/**
	 * Metodo que permite actualizar informacion de un elemento
	 * 
	 * 
	 * @param nombreElemento
	 */
	public boolean actualizarElemento(String nombreElemento){
		return false;
	}

	/**
	 * Metodo que permite crear elementos para asignarlos
	 * posteriormente a una cabania
	 * 
	 * @param elemento
	 */
	public boolean crearElemento(Elemento elemento) {
		try {
			conn = conexionDB.getConexion();

			String queryInsertar = "INSERT INTO elemento VALUES(null,?)";

			PreparedStatement ppStm = conn.prepareStatement(queryInsertar);
			ppStm.setString(1, elemento.getNombreElemento());

			ppStm.executeUpdate();

			//conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;

		}
		return true;
	}

	/**
	 * Metodo que permite obtener la lista de elementos
	 * que se encuentran en todas las cabanias
	 *
	 */
	public ArrayList<Elemento> obtenerListaElementos(){
		ArrayList<Elemento> listaElementos = null;
		try {
			conn = conexionDB.getConexion();

			String queryBuscar = "SELECT * FROM elemento";

			PreparedStatement ppStm = conn.prepareStatement(queryBuscar);

			ResultSet resultSet = ppStm.executeQuery();

			while(resultSet.next()) {
				listaElementos = new ArrayList<>();
				listaElementos.add(new Elemento(resultSet.getString(2)));
			}

			//conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return listaElementos;

		}
		return listaElementos;
	}

	public Elemento obtenerElemento(String nombre){
		Elemento elemento = null;
		try {
			conn = conexionDB.getConexion();

			String queryBuscar = "SELECT * FROM elemento WHERE nombre_elemento = ?";

			PreparedStatement ppStm = conn.prepareStatement(queryBuscar);
			ppStm.setString(1, nombre);
			ResultSet resultSet = ppStm.executeQuery();

			if(resultSet.next()) {
				elemento = new Elemento();
				elemento.setIdElemento(resultSet.getInt(1));
				elemento.setNombreElemento(resultSet.getString(2));
			}

			//conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return elemento;

		}
		return elemento;
	}

	public Elemento obtenerElementoPorId(int idElemento){
		Elemento elemento = null;
		try {
			conn = conexionDB.getConexion();

			String queryBuscar = "SELECT * FROM elemento WHERE id_elemento = ?";

			PreparedStatement ppStm = conn.prepareStatement(queryBuscar);
			ppStm.setInt(1, idElemento);
			ResultSet resultSet = ppStm.executeQuery();

			if(resultSet.next()) {
				elemento = new Elemento();
				elemento.setIdElemento(resultSet.getInt(1));
				elemento.setNombreElemento(resultSet.getString(2));
			}

			//conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return elemento;

		}
		return elemento;
	}

	public ConexionDB getConexionDB() {
		return conexionDB;
	}

	public void setConexionDB(ConexionDB conexionDB) {
		this.conexionDB = conexionDB;
	}
}