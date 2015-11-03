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
 * Created by LEIDY on 23/10/2015.
 */
@WebServlet(name = "SvtCambiaContrasenia")
public class SvtCambiaContrasenia extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ConexionDB conexionDB = new ConexionDB("root","");

        String contraseniaAntigua = request.getParameter("ContraseniaAntigua");
        String contraseniaNueva = request.getParameter("ContraseniaNueva");
        Persona idPersona = (Persona) request.getSession().getAttribute("persona");
        PersonaDao personaDao = new PersonaDao();
        idPersona = personaDao.consultarPersona(idPersona.getCedula());

        RequestDispatcher dispatcher = null;

        if(idPersona != null && idPersona.getContrasenia().equals(contraseniaAntigua)){
            boolean actualizar = personaDao.actualizarPersona(idPersona.getCedula(), contraseniaNueva);
            request.setAttribute("actualizacion",actualizar);
            if(actualizar){
                if(idPersona.getRol().toString().equals("Administrador")||
                        idPersona.getRol().toString().equals("Funcionario")){
                    dispatcher = request.getRequestDispatcher("CrearCabania.jsp");
                    dispatcher.forward(request, response);
                }
                else{
                    dispatcher = request.getRequestDispatcher("ReservarCabaniaUsuario.jsp");
                    dispatcher.forward(request, response);
                }
            }
            else {
                dispatcher = request.getRequestDispatcher("CambiarContrasenia.jsp");
                dispatcher.forward(request, response);
            }
        }
        dispatcher = request.getRequestDispatcher("CambiarContrasenia.jsp");
        dispatcher.forward(request, response);
    }
}
