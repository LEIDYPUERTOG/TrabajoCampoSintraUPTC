package Persistencia;

import Logica.Locacion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * Clase que permite administrar las locaciones de los eventos
 * @author LEIDY
 * @version 1.0
 * @created 24-sep.-2015 8:54:09 a. m.
 */
public class LocacionDao {

	private ConexionDB conexionDB;
	private Connection conn;


	/**
	 * Metodo que permite actualizar el nombre de una locacion
	 * 
	 * @param nombreLocacion
	 */
	public boolean actualizarLocacion(String nombreLocacion){
		return false;
	}

	/**
	 * Metodo que permite agregar una nueva locacion para los eventos
	 * 
	 * @param locacion
	 */
	public boolean agregarLocacion(Locacion locacion){

		try {
			conn = conexionDB.getConexion();
			String queryInsertar = "INSERT INTO locacion VALUES(null,?,?)";

			PreparedStatement ppStm = conn.prepareStatement(queryInsertar);
			ppStm.setString(1, locacion.getNombreLocacion());
			ppStm.setString(2, locacion.getDireccionLocacion());

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
	 * Metodo que permite obtener la lista de todas las locaciones
	 *  que han sido ingresadas el sistema
	 */
	public ArrayList<Locacion> obtenerListaLocaciones(){
		ArrayList<Locacion> locaciones = null;

		try {
			conn = conexionDB.getConexion();
			String querySearch = "SELECT * FROM locacion";

			PreparedStatement ppStm = conn.prepareStatement(querySearch);

			ResultSet resultSet = ppStm.executeQuery();
			ElementoDao elementoDao = new ElementoDao();
			CabaniaDao cabaniaDao = new CabaniaDao();
			locaciones = new ArrayList<>();
			while(resultSet.next()){

				locaciones.add(new Locacion(resultSet.getString(2),
						resultSet.getInt(1),resultSet.getString(3)));

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		}

		return locaciones;
	}

	/**
	 * Metodo que permite obtener una locacion por el nombre de locaciones
	 *  que hay
	 * 
	 * @param nombreLocacion
	 */
	public Locacion obtenertLocacion(String nombreLocacion){
		Locacion locacion = null;

		try {
			conn = conexionDB.getConexion();
			String querySearch = "SELECT * FROM locacion WHERE nombre_locacion=?";

			PreparedStatement ppStm = conn.prepareStatement(querySearch);
			ppStm.setString(1,nombreLocacion);
			ResultSet resultSet = ppStm.executeQuery();

			if(resultSet.next()){
				locacion = new Locacion(resultSet.getString(2),
						resultSet.getInt(1),resultSet.getString(3));

			}else{
				return locacion;
			}
			//conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		}
		return locacion;
	}


	public Locacion obtenertLocacionPorId(int idLocacion){
		Locacion locacion = null;

		try {
			conn = conexionDB.getConexion();
			String querySearch = "SELECT * FROM locacion WHERE id_locacion=?";

			PreparedStatement ppStm = conn.prepareStatement(querySearch);
			ppStm.setInt(1,idLocacion);
			ResultSet resultSet = ppStm.executeQuery();

			if(resultSet.next()){
				locacion = new Locacion(resultSet.getString(2),
						resultSet.getInt(1),resultSet.getString(3));

			}else{
				return locacion;
			}
			//conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		}
		return locacion;
	}

	public ConexionDB getConexionDB() {
		return conexionDB;
	}

	public void setConexionDB(ConexionDB conexionDB) {
		this.conexionDB = conexionDB;
	}

	public Connection getConn() {
		return conn;
	}

	public void setConn(Connection conn) {
		this.conn = conn;
	}
}