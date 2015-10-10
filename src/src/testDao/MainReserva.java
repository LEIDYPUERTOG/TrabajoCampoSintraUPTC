package testDao;

import Logica.*;
import Persistencia.*;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;

/**
 * Created by LEIDY on 10/10/2015.
 */
public class MainReserva {

    public static void main(String[] args) {
        ConexionDB conexionDB = new ConexionDB("root", "");
        ReservaDao reservaDao = new ReservaDao();
        reservaDao.setConexionDB(conexionDB);
        CabaniaDao cabaniaDao = new CabaniaDao();
        Cabania cabania = cabaniaDao.obtenerInfoCabania(1);
        GregorianCalendar c = new GregorianCalendar();
        Date fecha = new Date(c.getTime().getTime());


        PersonaDao personaDao = new PersonaDao();
        Persona persona = personaDao.consultarPersona(1049636125);
        //reservaDao.crearReservaCabania(new Reserva(cabania,3,fecha,persona,""));
        reservaDao.actualizarReservaEstado(2, 1049636125, EstadoReserva.Aprobada);

        ArrayList <Reserva> listaReserva = reservaDao.consultarReservaAfiliado(1049636125);
        System.out.println(listaReserva.get(0).getEstadoReserva());

        //---------------------------------------------- Editar informacion de una reserva --------------------------------------------
        Reserva reserva = reservaDao.consultarReservaId(1049636125,2);
        InformacionReservaDao informacionReservaDao = new InformacionReservaDao();
        c.set(2015,10,30);
        Date fechaInicio = new Date(c.getTimeInMillis());
        c.set(2015, 11, 30);
        Date fechaFin = new Date(c.getTimeInMillis());
        Persona invitado1 = new Persona(11111,"aaaaaaaaa",TipoDocumento.RegistroNacimiento,TipoUsuario.NoAfiliado);
        personaDao.crearPersona(invitado1);
        Persona invitado2 = new Persona(222221,"ccccccccccc",TipoDocumento.RegistroNacimiento,TipoUsuario.NoAfiliado);
        personaDao.crearPersona(invitado2);
        informacionReservaDao.crearInformacionReserva(new InformacionReserva(fechaInicio,fechaFin,fechaFin,invitado1,reserva));
        informacionReservaDao.crearInformacionReserva(new InformacionReserva(fechaInicio,fechaFin,fechaFin,invitado2,reserva));

        c.set(2016, 1, 12);
        Date fechaInicioActualizada = new Date(c.getTimeInMillis());

        c.set(2016, 1, 30);
        Date fechaFinActualizada = new Date(c.getTimeInMillis());

        informacionReservaDao.actualizarInformacionReserva(2,fechaInicioActualizada,fechaFinActualizada,fechaFin);
        conexionDB.cerrarSesion();

    }
}
