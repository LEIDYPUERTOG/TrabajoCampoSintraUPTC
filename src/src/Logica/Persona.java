package Logica;

import java.util.ArrayList;

/**
 * Contiene la información de una persona
 * @author LEIDY
 * @version 1.0
 * @updated 24-sep.-2015 7:55:06 a. m.
 */
public class Persona {

	/**
	 * Contiene las actas creadas por un usuario, solo se podrán realizar 
	 * con los permisos necesarios
	 */
	private ArrayList<Acta> actas;
	/**
	 * Atributo de la cedula de la persona
	 */
	private int cedula;
	/**
	 * Atributo del listado de eventos creados por un usuario
	 */
	private ArrayList<Evento> eventos;
	/**
	 * Atributo de nombre y apellidos de la persona
	 */
	private String nombre;
	/**
	 * Atributo de la lista de reservas realizadas por un usuario
	 */
	private ArrayList<Reserva> reservas;
	/**
	 * Atributo para especificar el tipo de documento de la persona; 
	 * ya sea Cedula(CC), Tarjeta de Identidad (TI), Registro Civil (RC)
	 */
	private TipoDocumento tipoDocumento;
	/**
	 * Atributo para especificar si es un usuario afiliado o no afiliado
	 */
	private TipoUsuario tipoUsuario;


	public Persona(int cedula, String nombre, TipoDocumento tipoDocumento,
				   TipoUsuario tipoUsuario) {
		super();
		this.cedula = cedula;
		this.nombre = nombre;
		this.tipoDocumento = tipoDocumento;
		this.tipoUsuario = tipoUsuario;
	}

	public Persona(){

	}

	public ArrayList<Acta> getActas() {
		return actas;
	}
	public void setActas(ArrayList<Acta> actas) {
		this.actas = actas;
	}
	public int getCedula() {
		return cedula;
	}
	public void setCedula(int cedula) {
		this.cedula = cedula;
	}
	public ArrayList<Evento> getEventos() {
		return eventos;
	}
	public void setEventos(ArrayList<Evento> eventos) {
		this.eventos = eventos;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public ArrayList<Reserva> getReservas() {
		return reservas;
	}
	public void setReservas(ArrayList<Reserva> reservas) {
		this.reservas = reservas;
	}
	public TipoDocumento getTipoDocumento() {
		return tipoDocumento;
	}
	public void setTipoDocumento(TipoDocumento tipoDocumento) {
		this.tipoDocumento = tipoDocumento;
	}
	public TipoUsuario getTipoUsuario() {
		return tipoUsuario;
	}
	public void setTipoUsuario(TipoUsuario tipoUsuario) {
		this.tipoUsuario = tipoUsuario;
	}


}