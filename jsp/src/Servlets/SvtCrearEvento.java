package Servlets;

import Logica.Cabania;
import Logica.Evento;
import Logica.Locacion;
import Logica.Persona;
import Persistencia.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.GregorianCalendar;

/**
 * Created by LEIDY on 17/10/2015.
 * javax.servlet.http.HttpServlet
 */
public class SvtCrearEvento extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");


        String nombre=request.getParameter("nombre");
        String[] aux = request.getParameter("fechaInicio").toString().split("-");
        int auxAnio = Integer.parseInt(aux[0]);
        int auxMes = Integer.parseInt(aux[1]);
        int auxDia = Integer.parseInt(aux[2]);
        GregorianCalendar calendar = new GregorianCalendar();
        calendar.set(auxAnio, auxMes, auxDia);
        Date dateInicio = new Date(calendar.getTimeInMillis());

        aux = request.getParameter("fechaFin").toString().split("-");
        auxAnio = Integer.parseInt(aux[0]);
        auxMes = Integer.parseInt(aux[1]);
        auxDia = Integer.parseInt(aux[2]);
        calendar = new GregorianCalendar();
        calendar.set(auxAnio,auxMes,auxDia);
        Date dateFin = new Date(calendar.getTimeInMillis());

        String descipcion =request.getParameter("descripcion");
        String [] lug = request.getParameter("lugarCb").split(" ");
        int lugar = Integer.parseInt(lug[1]);

        ConexionDB conexionDB = new ConexionDB("root","1234");

        EventoDao eventoDao = new EventoDao();
        LocacionDao locacionDao = new LocacionDao();



        System.out.println("---------------------------------------------"+nombre);
        System.out.println("Lugar2222222 - "+lugar);
        System.out.println("---------------------------------------------"+descipcion);
        Evento evento = null;
        Locacion locacion = locacionDao.obtenertLocacionPorId(lugar+1);

        ArrayList<Locacion> locaciones = locacionDao.obtenerListaLocaciones();
        request.setAttribute("locaciones", locaciones);

        Persona persona = (Persona) request.getSession().getAttribute("persona");
        request.setAttribute("personaBusqueda", persona); //mandando el parametro para que sea accedido
        System.out.println("creado por " + persona.getNombre());


        RequestDispatcher dispatcher = null;

        if(persona !=null){
            evento = new Evento(descipcion,dateFin,dateInicio,locacion,nombre,persona);
            boolean agregar = eventoDao.agregarEvento(evento);

            if(agregar ){
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
