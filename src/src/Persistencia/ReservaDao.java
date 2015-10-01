package Persistencia;

import Logica.EstadoReserva;
import Logica.Persona;
import Logica.Reserva;

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


	/**
	 * Metodo que permite realizar la actualizacion de una reserva 
	 * teniendo el número de documento de una persona que lo realiza
	 * 
	 * @param documentoPersona
	 */
	public boolean actualizarReserva(int documentoPersona){
		return false;
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
			Connection conn = ConexionDB.getConexion();
			String querySearch = "SELECT * FROM reserva WHERE documento_persona = ? ORDER BY (estado_reserva)";
			PreparedStatement ppStm = conn.prepareStatement(querySearch);
			ppStm.setInt(1, documento);

			ResultSet resultSet = ppStm.executeQuery();

			if (resultSet.next()) {
				listaReservaPorAfiliado = new ArrayList<>();
				listaReservaPorAfiliado.add(new Reserva(resultSet.getInt(5), conversionStringEstado(resultSet.getString(4)),
						resultSet.getDate(8),resultSet.getDouble(6)));
			}
			conn.close();

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
			Connection conn = ConexionDB.getConexion();
			String querySearch = "SELECT * FROM reserva ORDER BY (estado_reserva)";
			PreparedStatement ppStm = conn.prepareStatement(querySearch);

			ResultSet resultSet = ppStm.executeQuery();

			if (resultSet.next()) {
				listaReservas = new ArrayList<>();

				//Permite realizar la consulta de la persona que realizo una reserva

				Persona auxPersona = new Persona();
				PersonaDao personaDao = new PersonaDao();
				auxPersona = personaDao.consultarPersona(resultSet.getInt(2));

				listaReservas.add(new Reserva(resultSet.getInt(5), conversionStringEstado(resultSet.getString(4)),resultSet.getDate(8),
						auxPersona,	resultSet.getDouble(6)));
			}
			conn.close();

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
			Connection conn = ConexionDB.getConexion();
			String querySearch = "SELECT * FROM reserva WHERE id_cabania = ? ORDER BY (estado_reserva)";
			PreparedStatement ppStm = conn.prepareStatement(querySearch);
			ppStm.setInt(1, idCabania);

			ResultSet resultSet = ppStm.executeQuery();

			if (resultSet.next()) {
				listaReservas = new ArrayList<>();
				//Permite realizar la consulta de la persona que realizo una reserva

				Persona auxPersona = new Persona();
				PersonaDao personaDao = new PersonaDao();
				auxPersona = personaDao.consultarPersona(resultSet.getInt(2));

				listaReservas.add(new Reserva(resultSet.getInt(5), conversionStringEstado(resultSet.getString(4)),resultSet.getDate(8),
						auxPersona,resultSet.getDouble(6)));
			}
			conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return listaReservas;

		}
		return listaReservas;
	}

	//--------------------------------------------------------revisar
	/**
	 * Metodo que permite realizar una reserva
	 * 
	 * @param reserva
	 */
	public boolean crearReserva(Reserva reserva){
		try {
			Connection conn = ConexionDB.getConexion();

			String queryInsertar = "INSERT INTO reserva VALUES(null,?,?,?,?,?,?,?,?,?)";

			PreparedStatement ppStm = conn.prepareStatement(queryInsertar);


			ppStm.executeUpdate();

			conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;

		}
		return true;

	}
	//-------------------------------------------------------------------------------------------------

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
		String reserva ="";
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
}