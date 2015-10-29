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
	private Connection conn;

	/**
	 * Metodo que permite actualizar la informacion de una
	 * cabania
	 *
	 * @param idCabania
	 */
	public boolean actualizarCabania(int idCabania,double valor, int capacidad){

		boolean actualizacion = false;
		Cabania cabania = this.obtenerInfoCabania(idCabania);
		if(cabania != null){
			try {
				conn = conexionDB.getConexion();
				String queryUpdate = "UPDATE cabania SET  valor_servicio_dia = ?, capacidad_maxima = ?"
						+ " WHERE id_servicio_cabania = ?";

				PreparedStatement ppStm = conn.prepareStatement(queryUpdate);

				ppStm.setDouble(1,valor);
				ppStm.setInt(2,capacidad);
				ppStm.setInt(3, idCabania);

				ppStm.executeUpdate();

				//conn.close();
				actualizacion = true;

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				actualizacion = false;
			}
		}
		return actualizacion;

	}

	public boolean actualizarEstadoCabania(int idCabania, EstadoCabania estadoCabania){

		boolean actualizacion = false;
		Cabania cabania = this.obtenerInfoCabania(idCabania);
		if(cabania != null){
			try {
				conn = conexionDB.getConexion();
				String queryUpdate = "UPDATE cabania SET  ESTADO_CABANIA = ?"
						+ " WHERE id_servicio_cabania = ?";

				PreparedStatement ppStm = conn.prepareStatement(queryUpdate);

				ppStm.setString(1, conversionEstadoString(estadoCabania));
				ppStm.setInt(2, idCabania);

				ppStm.executeUpdate();

				//conn.close();
				actualizacion = true;

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				actualizacion = false;
			}
		}
		return actualizacion;
	}

	/**
	 * Metodo que permite crear una cabania nueva especificando
	 * la ruta en donde esta almacenada la foto
	 *
	 * @param cabania
	 */
	public boolean crearCabania(Cabania cabania) {
		try {
			conn = conexionDB.getConexion();

			String queryInsertar = "INSERT INTO cabania VALUES(?,?,?,?,?)";

			PreparedStatement ppStm = conn.prepareStatement(queryInsertar);
			ppStm.setInt(1, cabania.getId_servicio());
			ppStm.setInt(2, cabania.getCapacidadMaxima());
			ppStm.setDouble(3, cabania.getValor_servicio_dia());
			ppStm.setString(4, conversionEstadoString(cabania.getEstadoCabania()));
			ppStm.setString(5, cabania.getFoto_zona());

			ppStm.executeUpdate();

			//		conn.close();

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
			conn = conexionDB.getConexion();

			String queryInsertar = "INSERT INTO cabania VALUES(?,?,?,null)";

			PreparedStatement ppStm = conn.prepareStatement(queryInsertar);
			ppStm.setInt(1, cabania.getId_servicio());
			ppStm.setInt(2, cabania.getCapacidadMaxima());
			ppStm.setDouble(3, cabania.getValor_servicio_dia());
			ppStm.executeUpdate();

			//		conn.close();

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
			conn = ConexionDB.getConexion();
			String querySearch = "SELECT * FROM cabania ORDER BY (estado_cabania) ASC";

			PreparedStatement ppStm = conn.prepareStatement(querySearch);

			ResultSet resultSet = ppStm.executeQuery();
			listaCabanias = new ArrayList<>();
			while(resultSet.next()){
				listaCabanias.add(new Cabania(resultSet.getInt(2), resultSet.getString(5),
						resultSet.getInt(1), resultSet.getDouble(3), conversionStringEstado(resultSet.getString(4))));
			}

			//conn.close();

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
			conn = conexionDB.getConexion();
			String querySearch = "SELECT * FROM cabania WHERE id_servicio_cabania = ?";

			PreparedStatement ppStm = conn.prepareStatement(querySearch);
			ppStm.setInt(1,idCabania);
			ResultSet resultSet = ppStm.executeQuery();

			if(resultSet.next()){
				cabania = new Cabania();
				cabania.setId_servicio(resultSet.getInt(1));
				try{
					cabania.setFoto_zona(resultSet.getString(5));
				}catch (SQLException e){
					cabania.setFoto_zona("Sin foto");
				}
				cabania.setCapacidadMaxima(resultSet.getInt(2));
				cabania.setValor_servicio_dia(resultSet.getDouble(3));
				cabania.setEstadoCabania(conversionStringEstado(resultSet.getString(4)));
			}else{
				return cabania;
			}
//			conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		}
		return cabania;
	}

	public ConexionDB getConexionDB() {
		return conexionDB;
	}

	public void setConexionDB(ConexionDB conexionDB) {
		this.conexionDB = conexionDB;
	}

	public String conversionEstadoString(EstadoCabania estadoCabania){
		String estado="";
		if(estadoCabania.toString().equalsIgnoreCase("Activa")){
			estado = "A";
		}
		else{
			estado = "S";
		}
		return estado;
	}

	public EstadoCabania conversionStringEstado(String estado){
		EstadoCabania estadoCabania = null;
		if(estado.equalsIgnoreCase("A")){
			estadoCabania = EstadoCabania.Activa;
		}
		else{
			estadoCabania = EstadoCabania.Suspendida;
		}
		return estadoCabania;
	}
}