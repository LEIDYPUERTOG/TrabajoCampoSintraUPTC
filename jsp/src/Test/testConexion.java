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
        ArrayList<Reserva> l = reservaDao.consultarReservaAfiliado(7777);
        System.out.println(l.size()+ " tamanio");
        for(int i = 0; i < l.size(); i++){

        }

    }

}
