package Logica;

import java.sql.Date;

/**
 * Esta clase contiene la informacion de la reserva que
 * se realiza contando con las fechas en las que se da
 * lugar las reservas
 * Created by LEIDY on 28/09/2015.
 */
public class InformacionReserva {

    /**
     * Atributo que tiene la fecha de inicio en la que
     * se va a inica la reserva
     */
    private Date fechaInicioReserva;
    /**
     * Atributo que tiene la fecha en la que se va a terminar
     * la reserva
     */
    private Date fechaFinReserva;
    /**
     * Atributo que tiene la fecha real en la que
     * el usuario salio de la cabania
     */
    private  Date fechaRealSalida;
    /**
     * Atributo que permite conocer los invitados
     * que se enuentran en una reserva
     */
    private Persona invitado;
    /**
     * Atributo que permite obtener la informacion de
     * la reserva
     */
    private Reserva reserva;

    public InformacionReserva(Date fechaInicioReserva, Date fechaFinReserva,
                              Date fechaRealSalida, Persona invitado, Reserva reserva) {
        this.fechaInicioReserva = fechaInicioReserva;
        this.fechaFinReserva = fechaFinReserva;
        this.fechaRealSalida = fechaRealSalida;
        this.invitado = invitado;
        this.reserva = reserva;
    }

    public Date getFechaInicioReserva() {
        return fechaInicioReserva;
    }

    public void setFechaInicioReserva(Date fechaInicioReserva) {
        this.fechaInicioReserva = fechaInicioReserva;
    }

    public Date getFechaFinReserva() {
        return fechaFinReserva;
    }

    public void setFechaFinReserva(Date fechaFinReserva) {
        this.fechaFinReserva = fechaFinReserva;
    }

    public Date getFechaRealSalida() {
        return fechaRealSalida;
    }

    public void setFechaRealSalida(Date fechaRealSalida) {
        this.fechaRealSalida = fechaRealSalida;
    }

    public Persona getInvitado() {
        return invitado;
    }

    public void setInvitado(Persona invitado) {
        this.invitado = invitado;
    }

    public Reserva getReserva() {
        return reserva;
    }

    public void setReserva(Reserva reserva) {
        this.reserva = reserva;
    }
}
