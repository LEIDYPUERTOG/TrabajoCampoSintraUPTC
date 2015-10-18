package Servlets;

import Logica.Persona;
import Logica.TipoDocumento;
import Logica.TipoUsuario;
import Persistencia.ConexionDB;
import Persistencia.PersonaDao;
import com.mysql.jdbc.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by LEIDY on 17/10/2015.
 */
@WebServlet("/SvtRegistro")
public class SvtRegistro extends HttpServlet {

    public SvtRegistro(){

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nombre=request.getParameter("nombres");
        int documento=Integer.parseInt(request.getParameter("documento"));
        String clave=request.getParameter("contrasenia");

        ConexionDB conexionDB = new ConexionDB("root","");
        PersonaDao personaDao = new PersonaDao();


        System.out.println("---------------------------------------------"+nombre);
        System.out.println("---------------------------------------------"+documento);
        System.out.println("---------------------------------------------"+clave);
        Persona persona = new Persona(documento,nombre, TipoDocumento.Cedula, TipoUsuario.Afiliado,clave);

        boolean agregar = personaDao.crearPersona(persona);

        if(agregar){
            request.getRequestDispatcher("").forward(request, response);
        }else{
            PrintWriter out=response.getWriter();
            out.println("Si estas viendo este mensaje es por que algo salio mal, no se pudo completar tu solicitud.");
        }
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nombre=request.getParameter("nombres");
        int documento=Integer.parseInt(request.getParameter("documento"));
        String clave=request.getParameter("contrasenia");
        String clave2=request.getParameter("contrasenia2");
        String tipoUsuario =request.getParameter("inlineRadioOptions");

        ConexionDB conexionDB = new ConexionDB("root","");
        PersonaDao personaDao = new PersonaDao();


        System.out.println("---------------------------------------------"+nombre);
        System.out.println("---------------------------------------------"+documento);
        System.out.println("---------------------------------------------"+clave);
        System.out.println("---------------------------------------------"+tipoUsuario);
        if(!nombre.equalsIgnoreCase("") && !clave.equalsIgnoreCase("")){
            if(clave.equals(clave2)){
                Persona persona = new Persona(documento,nombre, TipoDocumento.Cedula, personaDao.conversionUsuario(tipoUsuario),clave);
                boolean agregar = personaDao.crearPersona(persona);

                if(agregar){
                    request.getRequestDispatcher("../web/Presentacion/plantillas/Conexion.jsp").forward(request, response);
                    request.getRequestDispatcher("../web/Presentacion/plantillas/AprobarReserva.jsp").forward(request, response);
                }else{
                    PrintWriter out=response.getWriter();
                    out.println("Si estas viendo este mensaje es por que algo salio mal, no se pudo completar tu solicitud.");
                }
            }else{
                PrintWriter out=response.getWriter();
                out.println("Las claves no concuerdan por favor verifique");
            }

        }

    }
}
