package testDao;

import Persistencia.ConexionDB;
import Persistencia.InventarioCabaniaDao;

/**
 * Created by LEIDY on 10/10/2015.
 */
public class MainInventario {

    public static void main(String[] args) {
        ConexionDB conexionDB = new ConexionDB("root", "");
        InventarioCabaniaDao inventarioCabaniaDao = new InventarioCabaniaDao();
        inventarioCabaniaDao.setConexionDB(conexionDB);
        inventarioCabaniaDao.agregarElemento("tenedores",1,12);
        conexionDB.cerrarSesion();
    }
}
