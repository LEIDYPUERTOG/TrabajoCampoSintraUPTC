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


        ArrayList<Reserva> listaMisReservas = reservaDao.consultarAnioFecha(2015);
        InformacionReservaDao informacionReservaDao = new InformacionReservaDao();

        for(int i = 0; i < listaMisReservas.size(); i++){
            InformacionReserva informacionReserva = informacionReservaDao.obtenerInfo
                    (listaMisReservas.get(i).getIdReserva());
            System.out.println("id "+listaMisReservas.get(i).getIdReserva());
            System.out.println("ingo "+informacionReserva);
        }
    }

}
