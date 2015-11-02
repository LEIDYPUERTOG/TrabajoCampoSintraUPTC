package Servlets;

import Logica.Evento;
import Logica.Locacion;
import Persistencia.ConexionDB;
import Persistencia.EventoDao;
import Persistencia.LocacionDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.GregorianCalendar;

/**
 * Created by LEIDY on 02/11/2015.
 */
@WebServlet(name = "SvtEventosFiltros")
public class SvtEventosFiltros extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        ArrayList<Evento> listaEventos = null;
        ConexionDB conexionDB = new ConexionDB("root","");

        EventoDao eventoDao= new EventoDao();

        String nombre = request.getParameter("nombre");

        if(nombre != ""){
            listaEventos = eventoDao.obtenerEventoPorNombre(nombre);
            if(listaEventos !=null){
                RequestDispatcher dispatcher = null;
                request.setAttribute("eventos", listaEventos);

                dispatcher = request.getRequestDispatcher("ConsultarEvento.jsp");
                dispatcher.forward(request, response);
            }
        }
        else {
            String[] fec = request.getParameter("fecha").toString().split("-");

            if (!fec [0].equalsIgnoreCase("")) {
                RequestDispatcher dispatcher = null;
                int auxAnio = Integer.parseInt(fec[0]);
                int auxMes = Integer.parseInt(fec[1]) - 1;
                int auxDia = Integer.parseInt(fec[2]);
                GregorianCalendar calendar = new GregorianCalendar();
                calendar.set(auxAnio, auxMes, auxDia);
                Date dateInicio = new Date(calendar.getTimeInMillis());

                listaEventos = eventoDao.obtenerEventoFechaInicio(dateInicio);
                request.setAttribute("eventos", listaEventos);

                dispatcher = request.getRequestDispatcher("ConsultarEvento.jsp");
                dispatcher.forward(request, response);
            }
            else{
                String [] lug = request.getParameter("lugarCb").split(" ");
                if(!lug [0].equalsIgnoreCase("")){
                    int lugar = Integer.parseInt(lug[1]);
                    LocacionDao locacionDao = new LocacionDao();
                    Locacion locacion = locacionDao.obtenertLocacionPorId(lugar + 1);


                    RequestDispatcher dispatcher = null;
                    listaEventos = eventoDao.obtenerListaEventosPorLocacion(locacion.getNombreLocacion());
                    request.setAttribute("eventos", listaEventos);
                    dispatcher = request.getRequestDispatcher("ConsultarEvento.jsp");
                    dispatcher.forward(request, response);

                }
                else{
                    RequestDispatcher dispatcher = null;
                    listaEventos = eventoDao.obtenerListaEventos();
                    request.setAttribute("eventos", listaEventos);
                    dispatcher = request.getRequestDispatcher("ConsultarEvento.jsp");
                    dispatcher.forward(request, response);
                }
            }
        }
    }
}
