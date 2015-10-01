package Persistencia;

import Logica.Cabania;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


/**
 * Esta clase permite realizar operaciones sobre la base de
 * datos con respecto a la entidad Cabania
 * @author LEIDY
 * @version 1.0
 * @created 24-sep.-2015 8:54:07 a. m.
 */
public class CabaniaDao {

	private ConexionDB conexionDB;


	/**
	 * Metodo que permite actualizar la informacion de una
	 * cabania
	 * 
	 * @param idCabania
	 */
	public boolean actualizarCabania(int idCabania){
		return false;
	}

	/**
	 * Metodo que permite crear una cabania nueva especificando
	 * la ruta en donde esta almacenada la foto
	 * 
	 * @param cabania
	 */
	public boolean crearCabania(Cabania cabania) {
		try {
			Connection conn = ConexionDB.getConexion();

			String queryInsertar = "INSERT INTO cabania VALUES(?,?,?,?)";

			PreparedStatement ppStm = conn.prepareStatement(queryInsertar);
			ppStm.setInt(1, cabania.getId_servicio());
			ppStm.setString(2, cabania.getFoto_zona());
			ppStm.setInt(3, cabania.getCapacidadMaxima());
			ppStm.setDouble(4, cabania.getValor_servicio_dia());

			ppStm.executeUpdate();

			conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;

		}
		return true;
	}

	/**
	 * Metodo que permite crear una cabania sin especificar la
	 * ruta en donde esta almacenda la foto de la cabania
	 * 
	 * @param cabania
	 */
	public boolean crearCabaniaSinFoto(Cabania cabania){
		try {
			Connection conn = ConexionDB.getConexion();

			String queryInsertar = "INSERT INTO cabania VALUES(?,null,?,?)";

			PreparedStatement ppStm = conn.prepareStatement(queryInsertar);
			ppStm.setInt(1, cabania.getId_servicio());
			ppStm.setInt(2, cabania.getCapacidadMaxima());
			ppStm.setDouble(3, cabania.getValor_servicio_dia());
			ppStm.executeUpdate();

			conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;

		}
		return true;
	}

	/**
	 * Metodo que permite obener el listado de las cabanias 
	 */
	public ArrayList<Cabania> obtenerCabanias(){
		ArrayList<Cabania> listaCabanias = null;
		try {
			Connection conn = ConexionDB.getConexion();
			String querySearch = "SELECT * FROM cabania";

			PreparedStatement ppStm = conn.prepareStatement(querySearch);

			ResultSet resultSet = ppStm.executeQuery();

			if(resultSet.next()){
				listaCabanias = new ArrayList<>();
				listaCabanias.add(new Cabania(resultSet.getInt(3), resultSet.getString(2), resultSet.getInt(1), resultSet.getDouble(4)));
			}else{
				return listaCabanias;
			}
			conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		}
		return listaCabanias;
	}

	/**
	 * Metodo que permite obtener la informacion de una cabania
	 * 
	 * @param idCabania
	 */
	public Cabania obtenerInfoCabania(int idCabania){
		Cabania cabania = null;
		try {
			Connection conn = ConexionDB.getConexion();
			String querySearch = "SELECT * FROM cabania WHERE id_servicio = ?";

			PreparedStatement ppStm = conn.prepareStatement(querySearch);
			ppStm.setInt(1,idCabania);
			ResultSet resultSet = ppStm.executeQuery();

			if(resultSet.next()){
				cabania = new Cabania();
				cabania.setId_servicio(resultSet.getInt(1));
				try{
					cabania.setFoto_zona(resultSet.getString(2));
				}catch (SQLException e){
					cabania.setFoto_zona("Sin foto");
				}
				cabania.setCapacidadMaxima(resultSet.getInt(3));
				cabania.setValor_servicio_dia(resultSet.getDouble(4));
			}else{
				return cabania;
			}
			conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		}
		return cabania;
	}

}