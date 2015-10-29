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
        /*ReservaDao reservaDao = new ReservaDao();


        ArrayList<Reserva> listaMisReservas = reservaDao.consultarAnioFecha(2015);
        InformacionReservaDao informacionReservaDao = new InformacionReservaDao();

        for(int i = 0; i < listaMisReservas.size(); i++){
            InformacionReserva informacionReserva = informacionReservaDao.obtenerInfo
                    (listaMisReservas.get(i).getIdReserva());
            System.out.println("id "+listaMisReservas.get(i).getIdReserva());
            System.out.println("ingo "+informacionReserva);
        }*/

        CabaniaDao cabaniaDao = new CabaniaDao();
        ArrayList<Cabania> cabanias = cabaniaDao.obtenerCabanias();
        for(int i = 0; i < cabanias.size(); i++){
            System.out.println("cabania "+cabanias.get(i).getId_servicio()+ " "+cabanias.get(i).getCapacidadMaxima()+
                    " "+cabanias.get(i).getValor_servicio_dia()+" "+cabanias.get(i).getEstadoCabania()+ " ee"
                    +cabanias.get(i).getFoto_zona());
        }
    }

}
