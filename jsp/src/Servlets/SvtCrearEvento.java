package Servlets;

import Logica.Cabania;
import Logica.Evento;
import Logica.Locacion;
import Logica.Persona;
import Persistencia.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
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

        ConexionDB conexionDB = new ConexionDB("root","");

        EventoDao eventoDao = new EventoDao();
        LocacionDao locacionDao = new LocacionDao();
        //Locacion locacion = locacionDao.obtenertLocacion("Camara Comercio");

        //Persona persona = (Persona) request.getAttribute("personaBusqueda");

        System.out.println("---------------------------------------------"+nombre);
        System.out.println("---------------------------------------------"+descipcion);

        //Evento evento = new Evento(descipcion,dateFin,dateInicio,locacion,nombre,persona);

//        if(persona !=null){
  //          System.out.println("la persna que lo creo fue "+persona.getNombre());
    //    }
      //  else{
        //    System.out.println("No ingreso");
        //}

        /*boolean agregar = eventoDao.agregarEvento(evento);

        if(agregar ){
            System.out.println("---------------------------------------------" + agregar);
            PrintWriter out=response.getWriter();
            out.println("Agregado");
        }else{
            PrintWriter out=response.getWriter();
            out.println("Si estas viendo este mensaje es por que algo salio mal, no se pudo completar tu solicitud.");
        }*/

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
