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
        c.set(2015,9,24);
        Date d = new Date(c.getTimeInMillis());
        System.out.println(d+ " fecha");
        ArrayList<Reserva> l = reservaDao.consultarFecha(d);
        System.out.println(l.size()+ " tamanio");
        for(int i = 0; i < l.size(); i++){

        }

    }

}
