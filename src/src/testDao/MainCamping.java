package testDao;

import Logica.Camping;
import Persistencia.CampingDao;
import Persistencia.ConexionDB;

import java.util.ArrayList;

/**
 * Created by LEIDY on 10/10/2015.
 */
public class MainCamping {

    public static void main(String[] args) {
        ConexionDB conexionDB = new ConexionDB("root","");
        CampingDao campingDao = new CampingDao();
        campingDao.setConexionDB(conexionDB);
        campingDao.crearCamping(new Camping("F:\\UNI\\TRABAJO DE CAMPO\\PROYECTO\\Fotos Cabañas\\SAM_0049.JPG", 10, 20000));
        campingDao.crearCamping(new Camping("F:\\UNI\\TRABAJO DE CAMPO\\PROYECTO\\Fotos Cabañas\\SAM_0041.JPG",10,20000));

        ArrayList <Camping> listaCamping = campingDao.obtenerListaCamping();
        System.out.println(listaCamping.size());

        conexionDB.cerrarSesion();
    }
}
