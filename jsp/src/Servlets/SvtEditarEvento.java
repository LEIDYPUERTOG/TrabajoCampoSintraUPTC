package Servlets;

import Logica.Evento;
import Logica.Locacion;
import Logica.Persona;
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
 * Created by LEIDY on 23/10/2015.
 */
@WebServlet(name = "SvtEditarEvento")
public class SvtEditarEvento extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");


        String nombre=request.getParameter("nombre");
        String[] aux = request.getParameter("fechaInicio").toString().split("-");
        int auxAnio = 0;
        int auxMes = 0;
        int auxDia = 0;
        GregorianCalendar calendar = new GregorianCalendar();
        Date dateInicio =  null;
        Date dateFin = null;
        ConexionDB conexionDB = new ConexionDB("root","1234");

        EventoDao eventoDao = new EventoDao();
        LocacionDao locacionDao = new LocacionDao();
        Evento evento = null;


        try {
            auxAnio = Integer.parseInt(aux[0]);
            auxMes = Integer.parseInt(aux[1]);
            auxDia = Integer.parseInt(aux[2]);

            calendar.set(auxAnio, auxMes, auxDia);
            dateInicio = new Date(calendar.getTimeInMillis());

            aux = request.getParameter("fechaFin").toString().split("-");
            auxAnio = Integer.parseInt(aux[0]);
            auxMes = Integer.parseInt(aux[1]);
            auxDia = Integer.parseInt(aux[2]);
            calendar = new GregorianCalendar();
            calendar.set(auxAnio,auxMes,auxDia);
            dateFin = new Date(calendar.getTimeInMillis());
        }catch (Exception e){
            evento = eventoDao.obtenerEventoNombre(nombre);
            dateInicio = evento.getFechaIncioEvento();
            dateFin = evento.getFechaFinEvento();
        }

        String descipcion =request.getParameter("descripcion");
        String [] lug = request.getParameter("lugarCb").split(" ");
        int lugar = Integer.parseInt(lug[1]);


        Locacion locacion = locacionDao.obtenertLocacionPorId(lugar+1);

        ArrayList<Locacion> locaciones = locacionDao.obtenerListaLocaciones();
        request.setAttribute("locaciones", locaciones);

        Persona persona = (Persona) request.getSession().getAttribute("persona");
        request.setAttribute("personaBusqueda", persona); //mandando el parametro para que sea accedido
        System.out.println("creado por " + persona.getNombre());


        RequestDispatcher dispatcher = null;

        if(persona !=null){

            boolean actualizar = eventoDao.actualizarEvento(nombre,locacion.getIdLocacion(),dateInicio,dateInicio);

            if(actualizar ){
                request.setAttribute("eventoCreado", "Evento creado satisfactoriamente");
                dispatcher = request.getRequestDispatcher("ConsultarEvento.jsp");
                dispatcher.forward(request, response);
            }else{
                request.setAttribute("eventoCreado", "No se pudo completar la solicitud");
                dispatcher = request.getRequestDispatcher("CrearEvento.jsp");
                dispatcher.forward(request, response);
            }
        }
    }
}
