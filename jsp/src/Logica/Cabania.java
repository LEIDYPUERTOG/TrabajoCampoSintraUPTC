package Logica;

import Persistencia.EstadoCabania;

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
	private EstadoCabania estadoCabania;


	public Cabania(){

	}

	public Cabania(int capacidadMaxima, String fotoCabania, int idCabania, double valorCabaniaNoche,
				   EstadoCabania estadoCabania) {
		this.capacidadMaxima = capacidadMaxima;
		this.setFoto_zona(fotoCabania);
		this.setId_servicio(idCabania);
		this.setValor_servicio_dia(valorCabaniaNoche);
		this.estadoCabania = estadoCabania;
	}

	public Cabania(int capacidadMaxima, int idCabania, double valorCabaniaNoche, EstadoCabania estadoCabania) {
		this.capacidadMaxima = capacidadMaxima;
		this.setId_servicio(idCabania);
		this.setValor_servicio_dia(valorCabaniaNoche);
		this.estadoCabania = estadoCabania;
	}

	public int getCapacidadMaxima() {
		return capacidadMaxima;
	}

	public void setCapacidadMaxima(int capacidadMaxima) {
		this.capacidadMaxima = capacidadMaxima;
	}

	public EstadoCabania getEstadoCabania() {
		return estadoCabania;
	}

	public void setEstadoCabania(EstadoCabania estadoCabania) {
		this.estadoCabania = estadoCabania;
	}
}