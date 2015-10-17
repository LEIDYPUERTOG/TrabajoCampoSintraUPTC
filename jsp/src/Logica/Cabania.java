package Logica;

/**
 * Clase que contiene informacion propia de las
 * cabanias
 * @author LEIDY
 * @version 1.0
 * @updated 24-sep.-2015 7:55:07 a. m.
 */
public class Cabania extends Servicio{

	/**
	 * Atributo que permite tener la capacidad maxima de una
	 * cabania
	 */
	private int capacidadMaxima;


	public Cabania(){

	}

	public Cabania(int capacidadMaxima, String fotoCabania, int idCabania, double valorCabaniaNoche) {
		this.capacidadMaxima = capacidadMaxima;
		this.setFoto_zona(fotoCabania);
		this.setId_servicio(idCabania);
		this.setValor_servicio_dia(valorCabaniaNoche);
	}

	public Cabania(int capacidadMaxima, int idCabania, double valorCabaniaNoche) {
		this.capacidadMaxima = capacidadMaxima;
		this.setId_servicio(idCabania);
		this.setValor_servicio_dia(valorCabaniaNoche);
	}

	public int getCapacidadMaxima() {
		return capacidadMaxima;
	}

	public void setCapacidadMaxima(int capacidadMaxima) {
		this.capacidadMaxima = capacidadMaxima;
	}

}