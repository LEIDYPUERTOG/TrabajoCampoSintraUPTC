package testDao;

import Logica.Elemento;
import Persistencia.ConexionDB;
import Persistencia.ElementoDao;

/**
 * Created by LEIDY on 10/10/2015.
 */
public class MainElemento {

    public static void main(String[] args) {
        ConexionDB conexionDB = new ConexionDB("root", "");
        ElementoDao elementoDao = new ElementoDao();
        elementoDao.setConexionDB(conexionDB);
        elementoDao.crearElemento(new Elemento("tenedores"));
        conexionDB.cerrarSesion();
    }
}
