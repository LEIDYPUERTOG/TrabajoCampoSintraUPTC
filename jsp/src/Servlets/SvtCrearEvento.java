package Servlets;

import Logica.Cabania;
import Logica.Evento;
import Persistencia.CabaniaDao;
import Persistencia.ConexionDB;
import Persistencia.EventoDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

/**
 * Created by LEIDY on 17/10/2015.
 * javax.servlet.http.HttpServlet
 */
public class SvtCrearEvento extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");


        String nombre=request.getParameter("nombre");

/*
        Date fechaInicio = Date(request.getParameter("fechaInicio"));
        Date fechaFin = Date(request.getParameter("fechaFin"));
*/
        String descipcion =request.getParameter("descripcion");

        ConexionDB conexionDB = new ConexionDB("root","");

        EventoDao eventoDao = new EventoDao();


/*
        System.out.println("---------------------------------------------"+nombre);
        System.out.println("---------------------------------------------"+fechaInicio);
        System.out.println("---------------------------------------------"+fechaFin);
        System.out.println("---------------------------------------------"+descipcion);
*/
        //Evento evento = new Evento(descipcion,fechaFin,fechaInicio,"Tunja",nombre,"aaaaaa");

/*        boolean agregar = eventoDao.agregarEvento(evento);

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
