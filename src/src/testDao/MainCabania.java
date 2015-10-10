package testDao;

import Logica.Cabania;
import Persistencia.CabaniaDao;
import Persistencia.ConexionDB;

import java.util.ArrayList;

/**
* Created by LEIDY on 09/10/2015.
 */
public class MainCabania {
    public static void main(String[] args) {
        ConexionDB conexionDB = new ConexionDB("root","");
        CabaniaDao cabaniaDao = new CabaniaDao();
        cabaniaDao.setConexionDB(conexionDB);
        cabaniaDao.crearCabania(new Cabania(10, "F:\\UNI\\TRABAJO DE CAMPO\\PROYECTO\\Fotos Cabañas\\SAM_0012", 1, 90000)); //crear cabaña con foto
       /* cabaniaDao.crearCabania(new Cabania(10, "", 2, 90000)); //crear cabaña con foto
        cabaniaDao.crearCabaniaSinFoto(new Cabania(10, 3, 90000));
        ArrayList <Cabania> listaCabanias = cabaniaDao.obtenerCabanias();

        for (int i = 0; i < listaCabanias.size(); i++){
            System.out.println(listaCabanias.get(i).getId_servicio()+" "+ listaCabanias.get(i).getCapacidadMaxima()+" "+
                    listaCabanias.get(i).getFoto_zona());
        }
        Cabania cabania = cabaniaDao.obtenerInfoCabania(2);
        System.out.println(cabania.getId_servicio()+" "+ cabania.getCapacidadMaxima()+" "+cabania.getFoto_zona()+" "+
                cabania.getValor_servicio_dia());*/
        conexionDB.cerrarSesion();
    }
}
