package Logica;

/**
 * Clase que permite tener la informacion de la locacion en
 * la que se va a realizar un evento
 * @author LEIDY
 * @version 1.0
 * @updated 24-sep.-2015 7:55:08 a. m.
 */
public class Locacion {

	/**
	 * Atributo que permite tener el nombre de la locacion del
	 * evento que se va a realizar
	 */
	private String nombreLocacion;
	/**
	 * Atributo que permite tener el id de la locacion
	 */
	private int idLocacion;
	/**
	 * Atributo que permite tener la direccion de la locacion
	 */
	private String direccionLocacion;

	public Locacion(String nombreLocacion, int idLocacion, String direccionLocacion) {
		this.nombreLocacion = nombreLocacion;
		this.idLocacion = idLocacion;
		this.direccionLocacion = direccionLocacion;
	}

	public String getNombreLocacion() {
		return nombreLocacion;
	}

	public void setNombreLocacion(String nombreLocacion) {
		this.nombreLocacion = nombreLocacion;
	}

	public int getIdLocacion() {
		return idLocacion;
	}

	public void setIdLocacion(int idLocacion) {
		this.idLocacion = idLocacion;
	}

	public String getDireccionLocacion() {
		return direccionLocacion;
	}

	public void setDireccionLocacion(String direccionLocacion) {
		this.direccionLocacion = direccionLocacion;
	}
}