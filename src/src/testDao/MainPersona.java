package testDao;

import Logica.Persona;
import Logica.TipoDocumento;
import Logica.TipoUsuario;
import Persistencia.ConexionDB;
import Persistencia.PersonaDao;

import java.util.ArrayList;

/**
 * Created by LEIDY on 10/10/2015.
 */
public class MainPersona {

    public static void main(String[] args) {
        ConexionDB conexionDB = new ConexionDB("root","");

        PersonaDao personaDao = new PersonaDao();
        personaDao.setConexionDB(conexionDB);


        //personaDao.crearPersona(new Persona(1049636125, "Leidy Carolina Puerto", TipoDocumento.Cedula, TipoUsuario.NoAfiliado, "a1234"));
        //personaDao.crearPersona(new Persona(1049636126,"aaaaaaaaaaaaaaaa", TipoDocumento.Cedula, TipoUsuario.Afiliado,"1233456"));

        /*Persona persona = personaDao.consultarPersona(1049636125);
        System.out.println(persona.getCedula()+" "+ persona.getNombre()+" "+persona.getTipoUsuario()+" "+persona.getContrasenia());*/

       // personaDao.actualizarPersona(1049636125, "hola");

        //Persona persona2 = personaDao.consultarPersona(1049636125);
        //System.out.println(persona2.getCedula() + " " + persona2.getNombre() + " " + persona2.getTipoUsuario()+" "+persona2.getContrasenia());
        ArrayList <Persona> lista = personaDao.consultarPersonas();
        for(int i = 0; i < lista.size(); i++){
            System.err.println(lista.get(i).getNombre());
        }
        conexionDB.cerrarSesion();
    }
}
