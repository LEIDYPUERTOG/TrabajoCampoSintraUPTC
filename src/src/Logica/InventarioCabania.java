package Logica;

/**
 * Clase que permite manejar el inventario de una cabania en
 * especifico
 * @author LEIDY
 * @version 1.0
 * @updated 24-sep.-2015 7:55:07 a. m.
 */
public class InventarioCabania {

	/**
	 * Atributo que permite tener la cantidad de elementos que
	 * hay en una cabania en especifica
	 */
	private int cantidad;
	/**
	 * Atributo que permite acceder a la informacion de una cabania
	 */
	private Cabania cabania;
	/**
	 * Atributo que permite acceder a la informacion de un elemento
	 */
	private Elemento elemento;

	public InventarioCabania(){

	}

	public InventarioCabania(int cantidad, Cabania cabania, Elemento elemento) {
		this.cantidad = cantidad;
		this.cabania = cabania;
		this.elemento = elemento;
	}

	public InventarioCabania(int cantidad, Elemento elemento) {
		this.cantidad = cantidad;
		this.elemento = elemento;
	}

	public int getCantidad() {
		return cantidad;
	}

	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}

	public Cabania getCabania() {
		return cabania;
	}

	public void setCabania(Cabania cabania) {
		this.cabania = cabania;
	}

	public Elemento getElemento() {
		return elemento;
	}

	public void setElemento(Elemento elemento) {
		this.elemento = elemento;
	}
	
	
}