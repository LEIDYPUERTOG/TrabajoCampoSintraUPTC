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

        RequestDispatcher dispatcher = null;
        if(usuario != 0 && !contrasenia.equalsIgnoreCase("")){

            Persona persona = personaDao.consultarPersona(usuario);

            if(persona != null && persona.getContrasenia().equals(contrasenia)) {
                request.setAttribute("persona", persona); //mandando el parametro para que sea accedido

                if(persona.getRol().toString().equalsIgnoreCase("Administrador")){
                    System.out.println("rol "+persona.getRol());
                    dispatcher = request.getRequestDispatcher("BienvenidoAdministrador.jsp");
                    dispatcher.forward(request, response);
                }
                else{
                    if(persona.getRol().toString().equalsIgnoreCase("Funcionario")){
                        dispatcher = request.getRequestDispatcher("BienvenidoAdministrador.jsp");
                        dispatcher.forward(request, response);
                    }
                    else{
                        System.out.println("rol "+persona.getRol());
                        dispatcher = request.getRequestDispatcher("BienvenidoUsuario.jsp");
                        dispatcher.forward(request, response);
                    }
                }
            }
            else{
                dispatcher = request.getRequestDispatcher("index.jsp");
                dispatcher.forward(request, response);
            }
        }
        else{
            dispatcher = request.getRequestDispatcher("index.jsp");
            dispatcher.forward(request, response);
        }
    }
}
