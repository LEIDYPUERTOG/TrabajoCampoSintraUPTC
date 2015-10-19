package Logica;

import java.sql.Date;
import java.util.ArrayList;

/**
 * Clase que contiene información propia de una
 * reserva
 * @author LEIDY
 * @version 1.0
 * @updated 24-sep.-2015 7:55:06 a. m.
 */
public class Reserva {

	/**
	 * Atributo de la servicio de cabania que se va a reservar
	 */
	private Cabania cabania;
	/**
	 * Atributo de la servicio de camping que se va a reservar
	 */
	private Camping camping;
	/**
	 * Atributo de  la canitdad de personas que se encontraran en la cabania
	 */
	private int cantidadPersonas;
	/**
	 * Atributo del estado en el que se encuentra actualmente la
	 * reserva
	 */
	private EstadoReserva estadoReserva;

	private Date fechaSolicitud;
	/**
	 * Persona que realiza la reserva
	 */
	private Persona persona;
	/**
	 * Atributo que permitira tener la URL o dirección de ruta
	 * especificada en donde se encuentre almacenado un escaner del 
	 * recibo de pago realizado
	 */
	private String reciboPago;
	/**
	 * Atributo  del valor total de la reserva de acuerdo a la cantidad
	 *  de personas y tipo de usuario
	 */
	private double valorReserva;
	private TipoServicio tipoServicio;
	private int idReserva;



	public Reserva(Cabania cabania, int cantidadPersonas,
				   Date fechaSolicitud, Persona persona, String reciboPago) {

		this.cabania = cabania;
		this.cantidadPersonas = cantidadPersonas;

		this.fechaSolicitud = fechaSolicitud;
		this.persona = persona;
		this.reciboPago = reciboPago;

		this.tipoServicio = TipoServicio.CABANIA;

	}

	public Reserva(Camping camping, int cantidadPersonas, EstadoReserva estadoReserva,
				   Date fechaSolicitud, Persona persona, String reciboPago) {

		this.camping = camping;
		this.cantidadPersonas = cantidadPersonas;
		this.estadoReserva = estadoReserva;
		this.fechaSolicitud = fechaSolicitud;
		this.persona = persona;
		this.reciboPago = reciboPago;
		this.valorReserva = calcularValorReserva(this.cantidadPersonas,(double)90000);
		this.tipoServicio = TipoServicio.CAMPING;

	}


	public Reserva(int cantidadPersonas, EstadoReserva estadoReserva, Date fechaSolicitud, Persona persona) {
		this.cantidadPersonas = cantidadPersonas;
		this.estadoReserva = estadoReserva;
		this.fechaSolicitud = fechaSolicitud;
		this.persona = persona;
		this.valorReserva = calcularValorReserva(this.cantidadPersonas,90000);

	}
	public Reserva(int cantidadPersonas, EstadoReserva estadoReserva, Date fechaSolicitud,
				   TipoServicio tipoServicio,Persona persona) {
		this.cantidadPersonas = cantidadPersonas;
		this.estadoReserva = estadoReserva;
		this.fechaSolicitud = fechaSolicitud;
		this.persona = persona;
		this.valorReserva = calcularValorReserva(this.cantidadPersonas,90000);

	}

	public Reserva(int cantidadPersonas, EstadoReserva estadoReserva, Date fechaSolicitud, TipoServicio tipoServicio) {
		this.cantidadPersonas = cantidadPersonas;
		this.estadoReserva = estadoReserva;
		this.fechaSolicitud = fechaSolicitud;
		this.valorReserva = calcularValorReserva(this.cantidadPersonas,(double)90000);
		this.tipoServicio = tipoServicio;
	}

	public Reserva() {

	}

	public double calcularValorReserva(int cantidadPersonas, double valorReserva){
		return (double) valorReserva*cantidadPersonas;
	}

	public int getCantidadPersonas() {
		return cantidadPersonas;
	}


	public void setCantidadPersonas(int cantidadPersonas) {
		this.cantidadPersonas = cantidadPersonas;
	}


	public EstadoReserva getEstadoReserva() {
		return estadoReserva;
	}


	public void setEstadoReserva(EstadoReserva estadoReserva) {
		this.estadoReserva = estadoReserva;
	}

	public Date getFechaSolicitud() {
		return fechaSolicitud;
	}


	public void setFechaSolicitud(Date fechaSolicitud) {
		this.fechaSolicitud = fechaSolicitud;
	}


	public Persona getPersona() {
		return persona;
	}


	public void setPersona(Persona persona) {
		this.persona = persona;
	}


	public String getReciboPago() {
		return reciboPago;
	}


	public void setReciboPago(String reciboPago) {
		this.reciboPago = reciboPago;
	}


	public double getValorReserva() {
		return valorReserva;
	}


	public void setValorReserva(double valorReserva) {
		this.valorReserva = valorReserva;
	}

	public Cabania getCabania() {
		return cabania;
	}

	public void setCabania(Cabania cabania) {
		this.cabania = cabania;
	}

	public Camping getCamping() {
		return camping;
	}

	public void setCamping(Camping camping) {
		this.camping = camping;
	}

	public TipoServicio getTipoServicio() {
		return tipoServicio;
	}

	public void setTipoServicio(TipoServicio tipoServicio) {
		this.tipoServicio = tipoServicio;
	}

	public int getIdReserva() {
		return idReserva;
	}

	public void setIdReserva(int idReserva) {
		this.idReserva = idReserva;
	}

}