package Servlets;

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
 * Created by LEIDY on 24/10/2015.
 */
@WebServlet(name = "SvtBuscarPersona")
public class SvtBuscarPersona extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ConexionDB conexionDB = new ConexionDB("root","");


        int cedula = Integer.parseInt(request.getParameter("documento"));
        PersonaDao personaDao = new PersonaDao();
        Persona persona = personaDao.consultarPersona(cedula);

        RequestDispatcher dispatcher = null;

        if(persona != null){

            request.setAttribute("persona",persona);
            dispatcher = request.getRequestDispatcher("ConsultarUsuario.jsp");
            dispatcher.forward(request, response);
        }
        else {
            request.setAttribute("persona",persona);
            dispatcher = request.getRequestDispatcher("ConsultarUsuario.jsp");
            dispatcher.forward(request, response);
        }
    }
}

