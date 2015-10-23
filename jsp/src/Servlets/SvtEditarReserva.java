package Servlets;

import Logica.*;
import Persistencia.ConexionDB;
import Persistencia.InformacionReservaDao;
import Persistencia.ReservaDao;

import javax.servlet.RequestDispatcher;
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
 * Created by LEIDY on 22/10/2015.
 */
@WebServlet(name = "SvtEditarReserva")
public class SvtEditarReserva extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int auxAnio = 0;
        int auxMes = 0;
        int auxDia = 0;

        Date dateInicio = null;
        Date dateFin = null;
        GregorianCalendar calendar= null;

        ConexionDB conexionDB = new ConexionDB("root","");


        int idReserva = Integer.parseInt(request.getParameter("reserva"));

        ReservaDao reservaDao = new ReservaDao();
        InformacionReservaDao informacionReservaDao = new InformacionReservaDao();
        InformacionReserva informacionReserva = informacionReservaDao.obtenerInfo(idReserva);

        String[] aux = request.getParameter("fechaInicioNueva").toString().split("-");

        try {
            auxAnio = Integer.parseInt(aux[0]);
            auxMes = Integer.parseInt(aux[1]);
            auxDia = Integer.parseInt(aux[2]);
            calendar = new GregorianCalendar();
            calendar.set(auxAnio, auxMes, auxDia);

            dateInicio = new Date(calendar.getTimeInMillis());
        }catch (Exception e){
            dateInicio = informacionReserva.getFechaInicioReserva();
        }
        aux = request.getParameter("FechaFinNueva").toString().split("-");
        try {
            auxAnio = Integer.parseInt(aux[0]);
            auxMes = Integer.parseInt(aux[1]);
            auxDia = Integer.parseInt(aux[2]);
            calendar.set(auxAnio, auxMes, auxDia);

            dateFin = new Date(calendar.getTimeInMillis());
        }catch (Exception e){
            dateFin = informacionReserva.getFechaFinReserva();
        }


        Persona persona = (Persona) request.getSession().getAttribute("persona");
        request.setAttribute("personaBusqueda", persona); //mandando el parametro para que sea accedido

        RequestDispatcher dispatcher = null;

        boolean editarInformacion = informacionReservaDao.actualizarInformacionReserva(idReserva,dateInicio,dateFin);

        request.setAttribute("agregado",editarInformacion);
        if (editarInformacion) {
            System.out.println("---------------------------------------------" + editarInformacion);

            dispatcher = request.getRequestDispatcher("EditarReservaAdmin.jsp");
            dispatcher.forward(request, response);

        }else{
            PrintWriter out=response.getWriter();
            out.println("Si estas viendo este mensaje es por que algo salio mal, no se pudo completar tu solicitud.");
        }
    }

}
