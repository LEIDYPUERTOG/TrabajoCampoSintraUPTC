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

        ConexionDB conexionDB = new ConexionDB("","");
        ReservaDao reservaDao = new ReservaDao();
        GregorianCalendar c = new GregorianCalendar();
        c.set(2012, 12, 12);
        Date d = new Date(c.getTimeInMillis());
        Cabania cabania = new Cabania(12,2,20000);
        Persona p = new Persona(1049636125,"aaa",TipoDocumento.Cedula,TipoUsuario.Afiliado,rol.Administrador);
        reservaDao.crearReservaCabania(new Reserva(cabania,12,d,p,""));


    }

}
