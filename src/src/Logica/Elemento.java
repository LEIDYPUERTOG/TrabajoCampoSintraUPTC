package Logica;

/**
 * Clase que contiene la informacion de los elementos que
 * pueden haber en una cabania
 * @author LEIDY
 * @version 1.0
 * @updated 24-sep.-2015 7:55:08 a. m.
 */
public class Elemento {

	/**
	 * Atributo que tiene el id del elemento de las cabanias
	 */
	private int idElemento;
	/**
	 * Atributo que permite tener el nombre del elemento de una
	 * cabania
	 */
	private String nombreElemento;

	public Elemento(){

	}

	public Elemento(int idElemento, String nombreElemento) {
		this.idElemento = idElemento;
		this.nombreElemento = nombreElemento;
	}

	public Elemento(String nombreElemento) {
		this.nombreElemento = nombreElemento;
	}

	public int getIdElemento() {
		return idElemento;
	}

	public void setIdElemento(int idElemento) {
		this.idElemento = idElemento;
	}

	public String getNombreElemento() {
		return nombreElemento;
	}

	public void setNombreElemento(String nombreElemento) {
		this.nombreElemento = nombreElemento;
	}
	
	
}