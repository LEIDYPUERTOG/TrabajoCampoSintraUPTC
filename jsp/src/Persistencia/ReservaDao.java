package Persistencia;

import Logica.*;

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
	 * teniendo el número de documento de una persona que lo realiza
	 *
	 */
	public boolean actualizarReservaEstado(int idReserva, EstadoReserva estadoReserva){

		boolean actualizacion = false;
		PersonaDao personaDao = new PersonaDao();

			try {
				conn = conexionDB.getConexion();
				String queryUpdate = "UPDATE reserva SET  estado_reserva = ?  WHERE id_reserva = ?";

				PreparedStatement ppStm = conn.prepareStatement(queryUpdate);

				ppStm.setString(1, conversionEstadoAString(estadoReserva));
				ppStm.setInt(2,idReserva);

				ppStm.executeUpdate();

				//conn.close();
				actualizacion = true;

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				actualizacion = false;
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
			listaReservaPorAfiliado = new ArrayList<>();
			PersonaDao personaDao = new PersonaDao();
			Persona persona = personaDao.consultarPersona(documento);
			while(resultSet.next()) {

				Reserva reserva = new Reserva(resultSet.getInt(6),
						conversionStringEstado(resultSet.getString(5).toString()),
						resultSet.getDate(9),tipoServicio(resultSet.getString(10)),persona);
				reserva.setIdReserva(resultSet.getInt(1));
				listaReservaPorAfiliado.add(reserva);
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
	 * @param anio
	 */
	public ArrayList<Reserva> consultarAnioFecha(int anio){
		ArrayList<Reserva> listaReservas = null;
		try {
			conn = conexionDB.getConexion();
			String querySearch = "SELECT * FROM reserva WHERE date_format(fecha_solicitud, '%Y')=?";

			PreparedStatement ppStm = conn.prepareStatement(querySearch);

			ppStm.setInt(1, anio);

			ResultSet resultSet = ppStm.executeQuery();

			listaReservas = new ArrayList<>();
			while(resultSet.next()) {

				//Permite realizar la consulta de la persona que realizo una reserva

				PersonaDao personaDao = new PersonaDao();
				Persona auxPersona = personaDao.consultarPersona(resultSet.getInt(2));

				Reserva reserva = new Reserva(resultSet.getInt(6),
						conversionStringEstado(resultSet.getString(5)),resultSet.getDate(9),
						auxPersona);
				reserva.setIdReserva(resultSet.getInt(1));
				reserva.setTipoServicio(tipoServicio(resultSet.getString(10)));
				listaReservas.add(reserva);

			}
			////conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return listaReservas;

		}
		return listaReservas;
	}

	public ArrayList<Reserva> consultarEstado(String inicial){
		ArrayList<Reserva> listaReservas = null;
		try {
			conn = conexionDB.getConexion();
			String querySearch = "SELECT * FROM reserva WHERE ESTADO_RESERVA=?";

			PreparedStatement ppStm = conn.prepareStatement(querySearch);

			ppStm.setString(1, inicial);

			ResultSet resultSet = ppStm.executeQuery();

			listaReservas = new ArrayList<>();
			while(resultSet.next()) {

				//Permite realizar la consulta de la persona que realizo una reserva

				PersonaDao personaDao = new PersonaDao();
				Persona auxPersona = personaDao.consultarPersona(resultSet.getInt(2));

				Reserva reserva = new Reserva(resultSet.getInt(6),
						conversionStringEstado(resultSet.getString(5)),resultSet.getDate(9),
						auxPersona);
				reserva.setIdReserva(resultSet.getInt(1));
				reserva.setTipoServicio(tipoServicio(resultSet.getString(10)));
				listaReservas.add(reserva);

			}
			////conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return listaReservas;

		}
		return listaReservas;
	}


	public ArrayList<Reserva> consultarFecha(java.sql.Date fecha){
		ArrayList<Reserva> listaReservas = null;
		try {
			conn = conexionDB.getConexion();
			String querySearch = "SELECT * FROM reserva WHERE CAST(fecha_solicitud AS DATE)=?";

			PreparedStatement ppStm = conn.prepareStatement(querySearch);

			ppStm.setDate(1, fecha);

			ResultSet resultSet = ppStm.executeQuery();

			listaReservas = new ArrayList<>();
			while(resultSet.next()) {

				//Permite realizar la consulta de la persona que realizo una reserva

				PersonaDao personaDao = new PersonaDao();
				Persona auxPersona = personaDao.consultarPersona(resultSet.getInt(2));

				Reserva reserva = new Reserva(resultSet.getInt(6),
						conversionStringEstado(resultSet.getString(5)),resultSet.getDate(9),
						auxPersona);
				reserva.setIdReserva(resultSet.getInt(1));
				reserva.setTipoServicio(tipoServicio(resultSet.getString(10)));
				listaReservas.add(reserva);

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
	 * Metodo que permite consultar todas las reservas que se han realizado ordenada por el estado de la reserva
	 */
	public ArrayList<Reserva> consultarReservas(){
		ArrayList<Reserva> listaReservas = null;
		try {
			conn = conexionDB.getConexion();
			String querySearch = "SELECT * FROM reserva ORDER BY (fecha_solicitud)";
			PreparedStatement ppStm = conn.prepareStatement(querySearch);

			ResultSet resultSet = ppStm.executeQuery();
			listaReservas = new ArrayList<>();
			while(resultSet.next()) {


				//Permite realizar la consulta de la persona que realizo una reserva

				PersonaDao personaDao = new PersonaDao();
				Persona auxPersona = personaDao.consultarPersona(resultSet.getInt(2));

				Reserva reserva = new Reserva(resultSet.getInt(6),
						conversionStringEstado(resultSet.getString(5)),resultSet.getDate(9),
						auxPersona);
				reserva.setIdReserva(resultSet.getInt(1));
				reserva.setTipoServicio(tipoServicio(resultSet.getString(10)));
				listaReservas.add(reserva);

			}
			////conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return listaReservas;

		}
		return listaReservas;
	}


	public boolean actualizarTipoServicioCabania(int idReserva, TipoServicio tipoServicio,int idCabania){
		boolean actualizacion = false;

		Reserva reserva = this.consultarReservaIdReserva(idReserva);
		if(reserva != null){
			try {
				conn = conexionDB.getConexion();
				String queryUpdate = "UPDATE reserva SET id_servicio_cabania = ?, tipo_servicio = ?"
						+ " WHERE id_reserva = ?";

				PreparedStatement ppStm = conn.prepareStatement(queryUpdate);

				ppStm.setInt(1, idCabania);
				ppStm.setString(2, tipoServicio.toString().toUpperCase());
				ppStm.setInt(3, idReserva);

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

	public boolean actualizarTipoServicioCamping(int idReserva, TipoServicio tipoServicio){
		boolean actualizacion = false;

		Reserva reserva = this.consultarReservaIdReserva(idReserva);
		if(reserva != null){
			try {
				conn = conexionDB.getConexion();
				String queryUpdate = "UPDATE reserva SET  tipo_servicio = ?"
						+ " WHERE id_reserva = ?";

				PreparedStatement ppStm = conn.prepareStatement(queryUpdate);

				ppStm.setString(1, tipoServicio.toString().toUpperCase());
				ppStm.setInt(2, idReserva);

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

	public ArrayList<Reserva> consultarReservasPendientes(){
		ArrayList<Reserva> listaReservas = null;
		try {
			conn = conexionDB.getConexion();
			String querySearch = "SELECT * FROM reserva WHERE estado_reserva='P'";
			PreparedStatement ppStm = conn.prepareStatement(querySearch);

			ResultSet resultSet = ppStm.executeQuery();
			listaReservas = new ArrayList<>();
			while(resultSet.next()) {


				//Permite realizar la consulta de la persona que realizo una reserva

				PersonaDao personaDao = new PersonaDao();
				Persona auxPersona = personaDao.consultarPersona(resultSet.getInt(2));

				Reserva reserva = new Reserva(resultSet.getInt(6),
						conversionStringEstado(resultSet.getString(5)),resultSet.getDate(9),
						auxPersona);
				reserva.setIdReserva(resultSet.getInt(1));
				reserva.setTipoServicio(tipoServicio(resultSet.getString(10)));
				listaReservas.add(reserva);

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
			String querySearch = "SELECT * FROM reserva WHERE id_servicio_cabania = ? ORDER BY (estado_reserva)";
			PreparedStatement ppStm = conn.prepareStatement(querySearch);
			ppStm.setInt(1, idCabania);

			ResultSet resultSet = ppStm.executeQuery();

			listaReservas = new ArrayList<>();
			while (resultSet.next()) {

				//Permite realizar la consulta de la persona que realizo una reserva

				Persona auxPersona = new Persona();
				PersonaDao personaDao = new PersonaDao();
				auxPersona = personaDao.consultarPersona(resultSet.getInt(2));

				listaReservas.add(new Reserva(resultSet.getInt(5), conversionStringEstado(resultSet.getString(4)),resultSet.getDate(8),
						auxPersona));
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
						auxPersona);
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
				//Permite realizar la consulta de la persona que realizo una reserva

				PersonaDao personaDao = new PersonaDao();
				Persona auxPersona = personaDao.consultarPersona(resultSet.getInt(2));

				reserva = new Reserva(resultSet.getInt(6),
						conversionStringEstado(resultSet.getString(5)),resultSet.getDate(9),
						auxPersona);
				reserva.setIdReserva(resultSet.getInt(1));
				if(resultSet.getString(10).equalsIgnoreCase("CABANIA")){
					CabaniaDao cabaniaDao = new CabaniaDao();
					Cabania cabania = cabaniaDao.obtenerInfoCabania(resultSet.getInt(4));
					reserva.setCabania(cabania);
				}
			}
			////conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return reserva;

		}
		return reserva;
	}

	public boolean hayDisponibilidad(java.sql.Date fechaInicio, java.sql.Date fechaFin,int numeroCabania){
		boolean disponibilidad = false;
		try {
			conn = conexionDB.getConexion();
			String querySearch = "SELECT * FROM reserva r, informacion_reserva i " +
					"WHERE r.id_reserva = i.id_reserva " +
					"AND tipo_servicio='CABANIA'" +
					" AND id_servicio_cabania=?" +
					" AND date_format(fecha_inicio_reserva, '%D-%M-%Y')>= ?" +
					"AND date_format(fecha_fin_reserva, '%D-%M-%Y') <= ?";

			PreparedStatement ppStm = conn.prepareStatement(querySearch);
			ppStm.setInt(1, numeroCabania);
			ppStm.setDate(2, fechaInicio);
			ppStm.setDate(3,fechaFin);

			ResultSet resultSet = ppStm.executeQuery();

			if (resultSet.next()) {

				disponibilidad = false;
			}
			else{
				disponibilidad = true;
			}
			////conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return disponibilidad=false;
		}
		return  disponibilidad;
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
			ppStm.setInt(2, reserva.getCabania().getId_servicio());
			ppStm.setString(3, conversionEstadoAString(EstadoReserva.Pendiente)); // Porque al crear la reserva queda en estado pendiente
			ppStm.setInt(4, reserva.getCantidadPersonas());
			ppStm.setDouble(5, reserva.calcularValorReserva(reserva.getCantidadPersonas(),
					reserva.getCabania().getValor_servicio_dia()));
			ppStm.setString(6, reserva.getReciboPago());
			ppStm.setDate(7, reserva.getFechaSolicitud());
			ppStm.setString(8, reserva.getTipoServicio().toString());


			ppStm.executeUpdate();

			ResultSet rs=ppStm.getGeneratedKeys(); //obtengo las ultimas llaves generadas
			while(rs.next()){
				int clave=rs.getInt(1);
				reserva.setIdReserva(clave);
			}
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
			String queryInsertar = "INSERT INTO reserva VALUES(null,?,null,null,?,?,?,?,?,?)";

			PreparedStatement ppStm = conn.prepareStatement(queryInsertar);

			ppStm.setInt(1,reserva.getPersona().getCedula());
			ppStm.setInt(2, reserva.getCamping().getId_servicio());
			ppStm.setString(2, conversionEstadoAString(EstadoReserva.Pendiente)); // Porque al crear la reserva queda en estado pendiente
			ppStm.setInt(3,reserva.getCantidadPersonas());
			ppStm.setDouble(4,reserva.calcularValorReserva
					(reserva.getCantidadPersonas(), 20000));
			ppStm.setString(5,reserva.getReciboPago());
			ppStm.setDate(6,reserva.getFechaSolicitud());
			ppStm.setString(7,reserva.getTipoServicio().toString());


			ppStm.executeUpdate();

			ResultSet rs=ppStm.getGeneratedKeys(); //obtengo las ultimas llaves generadas
			while(rs.next()){
				int clave=rs.getInt(1);
				reserva.setIdReserva(clave);
			}
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
		System.out.println("estado "+estadoReserva.toString());
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