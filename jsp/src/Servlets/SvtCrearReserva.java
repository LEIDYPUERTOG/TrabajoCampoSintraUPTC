package Servlets;

import Logica.*;
import Persistencia.ConexionDB;
import Persistencia.PersonaDao;
import Persistencia.ReservaDao;

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
 * Created by LEIDY on 18/10/2015.
 */
@WebServlet("/SvtCrearReserva")
public class SvtCrearReserva extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        Date fechaInicio = request.getParameter("fechaInicio");
        Date fechaFin = request.getParameter("fechaFin");
        int cantidad = Integer.parseInt(request.getParameter("cantidad"));


        ConexionDB conexionDB = new ConexionDB("root","");

        ReservaDao reservaDao = new ReservaDao();

        System.out.println("---------------------------------------------"+fechaInicio);
        System.out.println("---------------------------------------------"+fechaFin);
        System.out.println("---------------------------------------------" + cantidad);


        GregorianCalendar c = new GregorianCalendar();
        Date fechaSolicitud = new Date(c.getTimeInMillis());
        Reserva reserva = new Reserva(cantidad, EstadoReserva.Pendiente,fechaSolicitud,TipoServicio.CABANIA);
        boolean agregar = reservaDao.crearReservaCabania(reserva);


        if(agregar){
            System.out.println("---------------------------------------------" + agregar);
            PrintWriter out=response.getWriter();
            out.println("Agregado");
        }else{
            PrintWriter out=response.getWriter();
            out.println("Si estas viendo este mensaje es por que algo salio mal, no se pudo completar tu solicitud.");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
