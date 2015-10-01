package Persistencia;

import Logica.Evento;

import java.util.ArrayList;
import java.util.Date;

/**
 * Clase que permite realizar operaciones sobre la entidad
 * Evento de la base de datos
 * @author LEIDY
 * @version 1.0
 * @created 24-sep.-2015 8:54:08 a. m.
 */
public class EventoDao {

	private ConexionDB conexionDB;


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
	 * @param nombreEvento
	 * @param fechaFinEvento
	 * @param fechaIncioEvento
	 */
	public boolean agregarEvento(String nombreEvento, Date fechaFinEvento, 
			Date fechaIncioEvento){
		return false;
	}

	/**
	 * Metodo que permite almacenar la informacion de un evento
	 * con la descripcion del mismo
	 * 
	 * @param descripcionEvento
	 * @param fechaFinEvento
	 * @param fechaInicioEvento
	 * @param nombreEvento
	 */
	public void agregarEvento(String descripcionEvento, Date fechaFinEvento, 
			Date fechaInicioEvento, String nombreEvento){

	}

	/**
	 * Permite realizar la busqueda de un evento con la fecha de inicio 
	 * del evento
	 * 
	 * @param fechaInicioEvento
	 */
	public ArrayList<Evento> obtenerEventoFechaInicio(Date fechaInicioEvento){
		return null;
	}

	/**
	 * Metodo que permite obtener el evento o eventos que coincidan con 
	 * el nombre que
	 * se ingreso por parametro
	 * 
	 * @param nombreEvento
	 */
	public ArrayList<Evento> obtenerEventoPorNombre(String nombreEvento){
		return null;
	}

	/**
	 * Metodo que permite obtener la lista de todos lo eventos realizados 
	 */
	public ArrayList<Evento> obtenerListaEventos(){
		return null;
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
		return null;
	}

}