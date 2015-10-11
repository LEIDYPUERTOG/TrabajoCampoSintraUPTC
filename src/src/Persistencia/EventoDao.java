package Persistencia;

import Logica.Evento;
import Logica.Locacion;
import Logica.Persona;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.Date;

/**
 * Clase que permite realizar operaciones sobre la entidad
 * Evento de la base de datos
 * @author LEIDY
 * @version 1.0
 * @created 24-sep.-2015 8:54:08 a. m.
 */
public class EventoDao {

	private ConexionDB conexionDB;
	private Connection conn;


	/**
	 * Metodo que permite actualizar la informacion de un
	 * evento
	 * 
	 * @param idEvento
	 */
	public boolean actualizarEvento(int idEvento){
		return false;
	}

	/**
	 * Metodo que permite crear un nuevo evento sin la
	 * descripcion y almacenarlo en la base de datos
	 * 
	 * @param evento
	 */
	public boolean agregarEvento(Evento evento){

		try {
			conn = conexionDB.getConexion();


			String queryInsertar = "INSERT INTO evento VALUES(null,?,?,?,?,?,?)";

			PreparedStatement ppStm = conn.prepareStatement(queryInsertar);
			ppStm.setInt(1, evento.getPersona().getCedula());
			ppStm.setInt(2, evento.getLocacion().getIdLocacion());
			ppStm.setString(3, evento.getNombreEvento());
			ppStm.setDate(4, evento.getFechaIncioEvento());
			ppStm.setDate(5, evento.getFechaFinEvento());
			ppStm.setString(5, evento.getDescripcionEvento());

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
	 * Permite realizar la busqueda de un evento con la fecha de inicio 
	 * del evento
	 * 
	 * @param fechaInicioEvento
	 */
	public ArrayList<Evento> obtenerEventoFechaInicio(Date fechaInicioEvento){
		ArrayList<Evento> listaEventos = null;

		try {
			conn = conexionDB.getConexion();
			String querySearch = "SELECT * FROM evento WHERE fecha_inicio_evento = ?";

			PreparedStatement ppStm = conn.prepareStatement(querySearch);
			ppStm.setDate(1, fechaInicioEvento);

			ResultSet resultSet = ppStm.executeQuery();
			listaEventos = new ArrayList<>();
			while(resultSet.next()){
				PersonaDao personaDao = new PersonaDao();
				Persona persona = personaDao.consultarPersona(resultSet.getInt(2));
				LocacionDao locacionDao = new LocacionDao();
				Locacion locacion = locacionDao.obtenertLocacionPorId(resultSet.getInt(3));
				listaEventos.add(new Evento(resultSet.getString(7),resultSet.getDate(6),
						resultSet.getDate(5),locacion,resultSet.getString(4),persona));

			}
			//conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		}
		return listaEventos;
	}

	/**
	 * Metodo que permite obtener el evento o eventos que coincidan con 
	 * el nombre que
	 * se ingreso por parametro
	 * 
	 * @param nombreEvento
	 */
	public ArrayList<Evento> obtenerEventoPorNombre(String nombreEvento){
		ArrayList<Evento> listaEventos = null;

		try {
			conn = conexionDB.getConexion();
			String querySearch = "SELECT * FROM evento WHERE nombre_evento = ?";

			PreparedStatement ppStm = conn.prepareStatement(querySearch);
			ppStm.setString(1, nombreEvento);

			ResultSet resultSet = ppStm.executeQuery();
			listaEventos = new ArrayList<>();
			while(resultSet.next()){
				PersonaDao personaDao = new PersonaDao();
				Persona persona = personaDao.consultarPersona(resultSet.getInt(2));
				LocacionDao locacionDao = new LocacionDao();
				Locacion locacion = locacionDao.obtenertLocacionPorId(resultSet.getInt(3));
				listaEventos.add(new Evento(resultSet.getString(7),resultSet.getDate(6),
						resultSet.getDate(5),locacion,resultSet.getString(4),persona));

			}
			//conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		}
		return listaEventos;
	}

	/**
	 * Metodo que permite obtener la lista de todos lo eventos realizados 
	 */
	public ArrayList<Evento> obtenerListaEventos(){

		ArrayList<Evento> listaEventos = null;

		try {
			conn = conexionDB.getConexion();
			String querySearch = "SELECT * FROM evento ORDER BY fecha_inicio_evento";

			PreparedStatement ppStm = conn.prepareStatement(querySearch);

			ResultSet resultSet = ppStm.executeQuery();
			listaEventos = new ArrayList<>();
			while(resultSet.next()){
				PersonaDao personaDao = new PersonaDao();
				Persona persona = personaDao.consultarPersona(resultSet.getInt(2));
				LocacionDao locacionDao = new LocacionDao();
				Locacion locacion = locacionDao.obtenertLocacionPorId(resultSet.getInt(3));
				listaEventos.add(new Evento(resultSet.getString(7),resultSet.getDate(6),
						resultSet.getDate(5),locacion,resultSet.getString(4),persona));

			}
			//conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		}
		return listaEventos;
	}

	/**
	 * Metodo que permite obtener los eventos que se realizaron en una 
	 * locacion
	 * determinada
	 * 
	 * @param nombreLocacion
	 */
	public ArrayList<Evento> obtenerListaEventosPorLocacion(
			String nombreLocacion){
		ArrayList<Evento> listaEventos = null;

		LocacionDao locacionDao = new LocacionDao();
		Locacion locacion = locacionDao.obtenertLocacion(nombreLocacion);

		try {
			conn = conexionDB.getConexion();
			String querySearch = "SELECT * FROM evento WHERE id_locacion=?";

			PreparedStatement ppStm = conn.prepareStatement(querySearch);

			ppStm.setInt(1,locacion.getIdLocacion());
			ResultSet resultSet = ppStm.executeQuery();
			listaEventos = new ArrayList<>();
			while(resultSet.next()){
				PersonaDao personaDao = new PersonaDao();
				Persona persona = personaDao.consultarPersona(resultSet.getInt(2));

				listaEventos.add(new Evento(resultSet.getString(7),resultSet.getDate(6),
						resultSet.getDate(5),locacion,resultSet.getString(4),persona));
			}
			//conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		}
		return listaEventos;
	}

}