package Test;

import Logica.*;
import Persistencia.*;

import java.sql.Date;
import java.util.ArrayList;
import java.util.GregorianCalendar;

/**
 * Created by LEIDY on 17/10/2015.
 */
public class testConexion {

    public static void main(String[] args) {

        ConexionDB conexionDB = new ConexionDB("root","");
        ReservaDao reservaDao = new ReservaDao();
        GregorianCalendar c = new GregorianCalendar();
        c.set(2015, 9, 24);
        Date d = new Date(c.getTimeInMillis());
        System.out.println(d + " fecha");
        Camping camping = new Camping(1);
        Persona p = new Persona(7777,"aaaaaaaa",TipoDocumento.Cedula,TipoUsuario.Afiliado,rol.Administrador);
        Reserva reserva =  new Reserva(1, EstadoReserva.Pendiente,d,TipoServicio.CAMPING,p);
        reservaDao.crearReservaCamping(reserva);

        System.out.println("id "+reserva.getIdReserva());
        InformacionReservaDao informacionReservaDao = new InformacionReservaDao();
        InformacionReserva informacionReserva = informacionReservaDao.obtenerInfo(44);
        System.out.println("id 2 "+informacionReserva.getReserva().getIdReserva());
    }

}
