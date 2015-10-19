package Test;

import Logica.Persona;
import Logica.TipoDocumento;
import Logica.TipoUsuario;
import Persistencia.ConexionDB;
import Persistencia.PersonaDao;

/**
 * Created by LEIDY on 17/10/2015.
 */
public class testConexion {

    public static void main(String[] args) {

        ConexionDB conexionDB = new ConexionDB("","");
        PersonaDao a = new PersonaDao();

        System.out.println("---------------------------------------------" + conexionDB.isHayConexion());
    }

}
