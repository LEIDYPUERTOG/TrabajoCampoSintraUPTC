package Servlets;

import Logica.Persona;
import Persistencia.ConexionDB;
import Persistencia.PersonaDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by LEIDY on 18/10/2015.
 */
@WebServlet(name = "SvtLogin")
public class SvtLogin extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int usuario= Integer.parseInt(request.getParameter("usuario"));
        String contrasenia=request.getParameter("contrasenia");

        ConexionDB conexionDB = new ConexionDB("root","");
        PersonaDao personaDao = new PersonaDao();

        System.out.println("---------------------------------------------"+usuario);
        System.out.println("---------------------------------------------"+contrasenia);
        if(usuario != 0 && !contrasenia.equalsIgnoreCase("")){
            Persona persona = personaDao.consultarPersona(usuario);
            if(persona != null && persona.getContrasenia().equals(contrasenia)){
                request.setAttribute("persona1111", persona);
                System.out.println("--------------------------------------------- indew");
                //request.getRequestDispatcher("../web/Presentacion/plantillas/AprobarReserva.jsp").forward(request, response);

            }
            else{
                System.out.println("El usuario no existe");
            }
        }
        else{
            PrintWriter out=response.getWriter();
            out.println("Si estas viendo este mensaje es por que algo salio mal, no se pudo completar tu solicitud.");
        }
    }
    

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
