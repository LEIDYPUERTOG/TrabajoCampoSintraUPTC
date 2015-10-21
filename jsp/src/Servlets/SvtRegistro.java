package Servlets;

import Logica.Persona;
import Logica.TipoDocumento;
import Logica.TipoUsuario;
import Logica.rol;
import Persistencia.ConexionDB;
import Persistencia.PersonaDao;

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


    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");


        String nombre=request.getParameter("nombres");
        int documento=Integer.parseInt(request.getParameter("documento"));
        String clave=request.getParameter("contrasenia");
        String clave2=request.getParameter("contrasenia2");
        String tipoUsuario = request.getParameter("inlineRadioOptions");

        ConexionDB conexionDB = new ConexionDB("root","");

        PersonaDao personaDao = new PersonaDao();

        System.out.println("---------------------------------------------"+nombre);
        System.out.println("---------------------------------------------"+documento);
        System.out.println("---------------------------------------------"+clave);
        Persona persona = new Persona(documento,nombre, TipoDocumento.Cedula, personaDao.conversionUsuario(tipoUsuario),clave,
                rol.Usuario);


        System.out.println("---------------------------------------------" + persona.getRol());
        Persona aux = personaDao.consultarPersona(documento); //primero  busca si la persona no esta para agregarla

        RequestDispatcher dispatcher = null;
        if(aux == null){
            boolean agregar = personaDao.crearPersona(persona);

            if(agregar && clave.equals(clave2)){
                System.out.println("---------------------------------------------" + agregar);
                dispatcher = request.getRequestDispatcher("ReservarCabaniaUsuario.jsp");
                dispatcher.forward(request, response);


            }else{
                PrintWriter out=response.getWriter();
                out.println("Si estas viendo este mensaje es por que algo salio mal, no se pudo completar tu solicitud.");
            }
        }
        else{
            PrintWriter out=response.getWriter();
            out.println("El usuario ya existe");
        }

    }
}