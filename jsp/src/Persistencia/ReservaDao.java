package Persistencia;

import Logica.EstadoReserva;
import Logica.Persona;
import Logica.Reserva;
import Logica.TipoServicio;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;


/**
 * Clase que permite realizar operaciones sobre la entidad Reserva en la base de
 * datos
 * @author LEIDY
 * @version 1.0
 * @created 24-sep.-2015 8:54:09 a. m.
 */
public class ReservaDao {

	private ConexionDB conexionDB;
	private Connection conn;

	/**
	 * Metodo que permite realizar la actualizacion del estado de una reserva
	 * teniendo el n�mero de documento de una persona que lo realiza
	 *
	 * @param documentoPersona
	 */
	public boolean actualizarReservaEstado(int idReserva, int documentoPersona, EstadoReserva estadoReserva){

		boolean actualizacion = false;
		PersonaDao personaDao = new PersonaDao();
		Persona persona = personaDao.consultarPersona(documentoPersona);
		if(persona != null){
			try {
				conn = conexionDB.getConexion();
				String queryUpdate = "UPDATE reserva SET  estado_reserva = ? "
						+ "WHERE documento_persona = ?";

				PreparedStatement ppStm = conn.prepareStatement(queryUpdate);

				ppStm.setString(1, conversionEstadoAString(estadoReserva));
				ppStm.setInt(2, documentoPersona);

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
	 * Metodo que permite consultar las reservas que haya realizado 
	 * un afiliado
	 *
	 * @param documento
	 */
	public ArrayList<Reserva> consultarReservaAfiliado(int documento){
		ArrayList<Reserva> listaReservaPorAfiliado = null;
		try {
			conn = conexionDB.getConexion();
			String querySearch = "SELECT * FROM reserva WHERE documento_persona = ? ORDER BY (estado_reserva)";
			PreparedStatement ppStm = conn.prepareStatement(querySearch);
			ppStm.setInt(1, documento);

			ResultSet resultSet = ppStm.executeQuery();

			while(resultSet.next()) {
				listaReservaPorAfiliado = new ArrayList<>();
				listaReservaPorAfiliado.add(new Reserva(resultSet.getInt(6), conversionStringEstado(resultSet.getString(5).toString()),
						resultSet.getDate(9),resultSet.getDouble(7),tipoServicio(resultSet.getString(10))));
			}
			////conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return  listaReservaPorAfiliado;
		}
		return listaReservaPorAfiliado;
	}

	/**
	 * Metodo que permite realizar la consulta de reservas realizadas teniendo la
	 * fecha Inicial
	 *
	 * @param fechaInicio
	 */
	public ArrayList<Reserva> consultarReservaFecha(Date fechaInicio){
		return null;
	}

	/**
	 * Metodo que permite consultar todas las reservas que se han realizado ordenada por el estado de la reserva
	 */
	public ArrayList<Reserva> consultarReservas(){
		ArrayList<Reserva> listaReservas = null;
		try {
			conn = conexionDB.getConexion();
			String querySearch = "SELECT * FROM reserva ORDER BY (estado_reserva)";
			PreparedStatement ppStm = conn.prepareStatement(querySearch);

			ResultSet resultSet = ppStm.executeQuery();

			while(resultSet.next()) {
				listaReservas = new ArrayList<>();

				//Permite realizar la consulta de la persona que realizo una reserva

				PersonaDao personaDao = new PersonaDao();
				Persona auxPersona = personaDao.consultarPersona(resultSet.getInt(2));

				listaReservas.add(new Reserva(resultSet.getInt(5), conversionStringEstado(resultSet.getString(4)),resultSet.getDate(8),
						auxPersona,	resultSet.getDouble(6)));
			}
			////conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return listaReservas;

		}
		return listaReservas;
	}

	/**
	 * Metodo que permite consulta las reservas realizadas teniendo 
	 * el id de la cabania
	 *
	 * @param idCabania
	 */
	public ArrayList<Reserva> consultarReservasCabania(int idCabania){
		ArrayList<Reserva> listaReservas = null;
		try {
			conn = conexionDB.getConexion();
			String querySearch = "SELECT * FROM reserva WHERE id_cabania = ? ORDER BY (estado_reserva)";
			PreparedStatement ppStm = conn.prepareStatement(querySearch);
			ppStm.setInt(1, idCabania);

			ResultSet resultSet = ppStm.executeQuery();

			while (resultSet.next()) {
				listaReservas = new ArrayList<>();
				//Permite realizar la consulta de la persona que realizo una reserva

				Persona auxPersona = new Persona();
				PersonaDao personaDao = new PersonaDao();
				auxPersona = personaDao.consultarPersona(resultSet.getInt(2));

				listaReservas.add(new Reserva(resultSet.getInt(5), conversionStringEstado(resultSet.getString(4)),resultSet.getDate(8),
						auxPersona,resultSet.getDouble(6)));
			}
			////conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return listaReservas;

		}
		return listaReservas;
	}


	/**
	 * Consultar reserva por id y por afiliado
	 * @param documentoPersona
	 * @param idReserva
	 * @return
	 */
	public Reserva consultarReservaId(int documentoPersona,int idReserva){
		Reserva reserva = null;
		try {
			conn = conexionDB.getConexion();
			String querySearch = "SELECT * FROM reserva WHERE documento_persona = ? and id_reserva = ?";
			PreparedStatement ppStm = conn.prepareStatement(querySearch);
			ppStm.setInt(1, documentoPersona);
			ppStm.setInt(2, idReserva);

			ResultSet resultSet = ppStm.executeQuery();

			if (resultSet.next()) {
				reserva = new Reserva();
				//Permite realizar la consulta de la persona que realizo una reserva

				PersonaDao personaDao = new PersonaDao();
				Persona auxPersona = personaDao.consultarPersona(resultSet.getInt(2));

				reserva = new Reserva(resultSet.getInt(6), conversionStringEstado(resultSet.getString(5)),resultSet.getDate(9),
						auxPersona,resultSet.getDouble(7));
				reserva.setIdReserva(resultSet.getInt(1));
			}
			////conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return reserva;

		}
		return reserva;
	}

	/**
	 * Consultar reserva por id
	 * @param idReserva
	 * @return
	 */
	public Reserva consultarReservaIdReserva(int idReserva){
		Reserva reserva = null;
		try {
			conn = conexionDB.getConexion();
			String querySearch = "SELECT * FROM reserva WHERE id_reserva = ?";
			PreparedStatement ppStm = conn.prepareStatement(querySearch);

			ppStm.setInt(1, idReserva);

			ResultSet resultSet = ppStm.executeQuery();

			if (resultSet.next()) {
				reserva = new Reserva();
				//Permite realizar la consulta de la persona que realizo una reserva

				PersonaDao personaDao = new PersonaDao();
				Persona auxPersona = personaDao.consultarPersona(resultSet.getInt(2));

				reserva = new Reserva(resultSet.getInt(6), conversionStringEstado(resultSet.getString(5)),resultSet.getDate(9),
						auxPersona,resultSet.getDouble(7));
				reserva.setIdReserva(resultSet.getInt(1));
			}
			////conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return reserva;

		}
		return reserva;
	}

	/**
	 * Metodo que permite realizar una reserva de una cabania
	 *
	 * @param reserva
	 */
	public boolean crearReservaCabania(Reserva reserva){
		try {
			conn = conexionDB.getConexion();
			String queryInsertar = "INSERT INTO reserva VALUES(null,?,null,?,?,?,?,?,?,?)";

			PreparedStatement ppStm = conn.prepareStatement(queryInsertar);

			ppStm.setInt(1,reserva.getPersona().getCedula());
			ppStm.setInt(2,reserva.getCabania().getId_servicio());
			ppStm.setString(3,conversionEstadoAString(EstadoReserva.Pendiente)); // Porque al crear la reserva queda en estado pendiente
			ppStm.setInt(4,reserva.getCantidadPersonas());
			ppStm.setDouble(5,reserva.calcularValorReserva(reserva.getCantidadPersonas(),reserva.getCabania().getValor_servicio_dia()));
			ppStm.setString(6,reserva.getReciboPago());
			ppStm.setDate(7,reserva.getFechaSolicitud());
			ppStm.setString(8,reserva.getTipoServicio().toString());


			ppStm.executeUpdate();

			//////conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;

		}
		return true;

	}

	/**
	 * Metodo que permite realizar una reserva de una zona de camping
	 *
	 * @param reserva
	 */
	public boolean crearReservaCamping(Reserva reserva){
		try {
			conn = conexionDB.getConexion();
			String queryInsertar = "INSERT INTO reserva VALUES(null,?,?,null,?,?,?,?,?,?)";

			PreparedStatement ppStm = conn.prepareStatement(queryInsertar);

			ppStm.setInt(1,reserva.getPersona().getCedula());
			ppStm.setInt(2,reserva.getCamping().getId_servicio());
			ppStm.setString(3, conversionEstadoAString(EstadoReserva.Pendiente)); // Porque al crear la reserva queda en estado pendiente
			ppStm.setInt(4,reserva.getCantidadPersonas());
			ppStm.setDouble(5,reserva.calcularValorReserva(reserva.getCantidadPersonas(), reserva.getCamping().getValor_servicio_dia()));
			ppStm.setString(6,reserva.getReciboPago());
			ppStm.setDate(7,reserva.getFechaSolicitud());
			ppStm.setString(8,reserva.getTipoServicio().toString());


			ppStm.executeUpdate();

			//////conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;

		}
		return true;

	}

	public EstadoReserva conversionStringEstado(String reserva){
		EstadoReserva estadoReserva = null;
		if(reserva.equalsIgnoreCase("R")){
			estadoReserva = EstadoReserva.Rechazada;
		}
		else{
			if(reserva.equalsIgnoreCase("A")){
				estadoReserva = EstadoReserva.Aprobada;
			}
			else{
				if(reserva.equalsIgnoreCase("P")){
					estadoReserva = EstadoReserva.Pendiente;
				}
				else{
					estadoReserva = EstadoReserva.Cancelada;
				}
			}
		}
		return estadoReserva;
	}

	public String conversionEstadoAString(EstadoReserva estadoReserva){
		String reserva;
		if(estadoReserva.toString().equalsIgnoreCase("Aprobada")){
			reserva = "A";
		}
		else{
			if(estadoReserva.toString().equalsIgnoreCase("Rechazada")){
				reserva = "R";
			}
			else{
				if(estadoReserva.toString().equalsIgnoreCase("Pendiente")) {
					reserva = "P";
				}
				else{
					reserva = "C";
				}
			}
		}
		return  reserva;
	}


	public TipoServicio tipoServicio(String tipoServ){
		TipoServicio tipo;
		if(tipoServ.equalsIgnoreCase("Cabania")){
			tipo = TipoServicio.CABANIA;
		}
		else {
			tipo = TipoServicio.CAMPING;
		}
		return tipo;
	}

	public ConexionDB getConexionDB() {
		return conexionDB;
	}

	public void setConexionDB(ConexionDB conexionDB) {
		this.conexionDB = conexionDB;
	}
}