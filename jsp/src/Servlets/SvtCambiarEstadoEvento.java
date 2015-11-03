package Servlets;

import Logica.EstadoEvento;
import Logica.Evento;
import Persistencia.ConexionDB;
import Persistencia.EventoDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by LEIDY on 30/10/2015.
 */
@WebServlet(name = "SvtCambiarEstadoEvento")
public class SvtCambiarEstadoEvento extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ConexionDB conexionDB = new ConexionDB("root","");
        EventoDao eventoDao = new EventoDao();
        String nombre = request.getParameter("eventoId");
        Evento evento = eventoDao.obtenerEventoNombre(nombre);


        RequestDispatcher dispatcher = null;
        if(evento != null){

            if(evento.getEstadoEvento().toString().equalsIgnoreCase("Activo")){
                eventoDao.actualizarEstadoEvento(nombre, EstadoEvento.Suspendido);

                dispatcher = request.getRequestDispatcher("ConsultarEvento.jsp");
                dispatcher.forward(request, response);
            }
            else{
                eventoDao.actualizarEstadoEvento(nombre, EstadoEvento.Activo);

                dispatcher = request.getRequestDispatcher("ConsultarEvento.jsp");
                dispatcher.forward(request, response);
            }
        }
        else {
            dispatcher = request.getRequestDispatcher("ConsultarCabania.jsp");
            dispatcher.forward(request, response);
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
