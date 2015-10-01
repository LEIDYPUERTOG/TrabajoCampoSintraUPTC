package Logica;

/**
 * Clase que contiene los parametros para una acta
 * @author LEIDY
 * @version 1.0
 * @updated 24-sep.-2015 7:55:09 a. m.
 */
public class Acta {

	/**
	 * a Atributo de la descripcion del acta
	 */
	private String descripcionActa;
	/**
	 * atributo del nombre del acta
	 */
	private String nombreActa;
	/**
	 * Atributo que contiene la ruta del acta
	 */
	private String rutaActa;
	/**
	 * Atributo que tiene la persona que crea el acta
	 */
	private Persona persona;
	
	/**
	 * Atributo que permite tener el id de una acta
	 */
	private int idActa;

	/**
	 * Constructor de la clase 
	 */
	public Acta(){

	}

	public String getDescripcionActa() {
		return descripcionActa;
	}

	public void setDescripcionActa(String descripcionActa) {
		this.descripcionActa = descripcionActa;
	}

	public String getNombreActa() {
		return nombreActa;
	}

	public void setNombreActa(String nombreActa) {
		this.nombreActa = nombreActa;
	}

	public String getRutaActa() {
		return rutaActa;
	}

	public void setRutaActa(String rutaActa) {
		this.rutaActa = rutaActa;
	}

	public Persona getPersona() {
		return persona;
	}

	public void setPersona(Persona persona) {
		this.persona = persona;
	}

	public int getIdActa() {
		return idActa;
	}

	public void setIdActa(int idActa) {
		this.idActa = idActa;
	}

	
}