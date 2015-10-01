package Logica;

import java.util.Date;

/**
 * Clase que permite tener la informacion de un evento
 * @author LEIDY
 * @version 1.0
 * @updated 24-sep.-2015 7:55:09 a. m.
 */
public class Evento {

	/**
	 * Atributo para la informacion adicional del evento
	 */
	private String descripcionEvento;
	/**
	 * Atributo de la fecha de fin del evento
	 */
	private Date fechaFinEvento;
	/**
	 * Atributo de la fecha de inicio del evento
	 */
	private Date fechaIncioEvento;
	/**
	 * Atributo de la locacion en donde se va a hacer el evento
	 */
	private Locacion locacion;
	/**
	 * Atributo del nombre del evento a realizar
	 */
	private String nombreEvento;
	/**
	 * Atributo que contiene la persona que crea un evento
	 */
	private Persona Persona;
	
	/**
	 * Atributo que permite acceder al id del evento
	 */
	private int idEvento;

	/**
	 * Constructor de la clase en donde ingresa la persona que va 
	 * a crear el evento y la locacion donde se hace
	 * 
	 * @param locacion
	 * @param persona
	 */
	public Evento(Locacion locacion, Persona persona){

	}

	public String getDescripcionEvento() {
		return descripcionEvento;
	}

	public void setDescripcionEvento(String descripcionEvento) {
		this.descripcionEvento = descripcionEvento;
	}

	public Date getFechaFinEvento() {
		return fechaFinEvento;
	}

	public void setFechaFinEvento(Date fechaFinEvento) {
		this.fechaFinEvento = fechaFinEvento;
	}

	public Date getFechaIncioEvento() {
		return fechaIncioEvento;
	}

	public void setFechaIncioEvento(Date fechaIncioEvento) {
		this.fechaIncioEvento = fechaIncioEvento;
	}

	public Locacion getLocacion() {
		return locacion;
	}

	public void setLocacion(Locacion locacion) {
		this.locacion = locacion;
	}

	public String getNombreEvento() {
		return nombreEvento;
	}

	public void setNombreEvento(String nombreEvento) {
		this.nombreEvento = nombreEvento;
	}

	public Persona getPersona() {
		return Persona;
	}

	public void setPersona(Persona persona) {
		Persona = persona;
	}
	
}