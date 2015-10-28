package Servlets;

import Logica.EstadoPersona;
import Logica.Persona;
import Persistencia.ConexionDB;
import Persistencia.PersonaDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by LEIDY on 28/10/2015.
 */
@WebServlet(name = "SvtActivarUsuario")
public class SvtActivarUsuario extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ConexionDB conexionDB = new ConexionDB("root","");

        int cedula = Integer.parseInt(request.getParameter("cedula"));
        PersonaDao personaDao = new PersonaDao();
        Persona persona = personaDao.consultarPersona(cedula);

        if(persona != null){
            if(persona.getEstadoPersona().toString().equalsIgnoreCase("Inactivo")){
                boolean actualizar = personaDao.actualizarEstadoPersona(cedula, EstadoPersona.ACTIVO);
                RequestDispatcher dispatcher = null;

                if(actualizar==true){

                    request.setAttribute("persona",persona);
                    dispatcher = request.getRequestDispatcher("ConsultarUsuario.jsp");
                    dispatcher.forward(request, response);
                }
                else {
                    dispatcher = request.getRequestDispatcher("ConsultarUsuario.jsp");
                    dispatcher.forward(request, response);
                }
            }
            else{
                boolean actualizar = personaDao.actualizarEstadoPersona(cedula, EstadoPersona.INACTIVO);
                RequestDispatcher dispatcher = null;

                if(actualizar==true){

                    request.setAttribute("persona",persona);
                    dispatcher = request.getRequestDispatcher("ConsultarUsuario.jsp");
                    dispatcher.forward(request, response);
                }
                else {
                    dispatcher = request.getRequestDispatcher("ConsultarUsuario.jsp");
                    dispatcher.forward(request, response);
                }
            }

        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
