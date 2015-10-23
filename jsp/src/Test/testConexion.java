package Test;

import Logica.Locacion;
import Logica.Persona;
import Logica.TipoDocumento;
import Logica.TipoUsuario;
import Persistencia.ConexionDB;
import Persistencia.InformacionReservaDao;
import Persistencia.LocacionDao;
import Persistencia.PersonaDao;

import java.util.ArrayList;

/**
 * Created by LEIDY on 17/10/2015.
 */
public class testConexion {

    public static void main(String[] args) {

        ConexionDB conexionDB = new ConexionDB("","");
        LocacionDao locacionDao = new LocacionDao();
        ArrayList<Locacion> l = locacionDao.obtenerListaLocaciones();

        System.out.println("---------------------------------------------" + l.size());
    }

}
