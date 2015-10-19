package Servlets;

import Logica.*;
import Persistencia.ConexionDB;
import Persistencia.InformacionReservaDao;
import Persistencia.PersonaDao;
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
 * Created by LEIDY on 18/10/2015.
 */
@WebServlet("/SvtCrearReserva")
public class SvtCrearReserva extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

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

        int cantidad = Integer.parseInt(request.getParameter("cantidad"));


        ConexionDB conexionDB = new ConexionDB("root","");

        ReservaDao reservaDao = new ReservaDao();
        InformacionReservaDao informacionReservaDao = new InformacionReservaDao();

        System.out.println("---------------------------------------------" + cantidad);
        System.out.println("---------fecha Inicio" + dateInicio);
        System.out.println("---------fecha fin" + dateFin);

        GregorianCalendar c = new GregorianCalendar();
        Date fechaSolicitud = new Date(c.getTimeInMillis());
        System.out.println("solicitud-------------" + fechaSolicitud);
        Persona o = new Persona(1049636125,"leidy carolina puerto",TipoDocumento.Cedula,TipoUsuario.Afiliado,rol.Administrador);

        Reserva reserva = new Reserva(cantidad, EstadoReserva.Pendiente,fechaSolicitud,TipoServicio.CABANIA,o);
        InformacionReserva informacionReserva = new InformacionReserva(dateInicio, dateFin,dateFin,reserva);

        RequestDispatcher dispatcher = null;
        boolean agregar = reservaDao.crearReservaCabania(reserva);
        boolean agregarInfo = informacionReservaDao.crearInformacionReserva(informacionReserva);

        if(agregar && agregarInfo){
            System.out.println("---------------------------------------------" + agregar);
            dispatcher = request.getRequestDispatcher("index.jsp");
            dispatcher.forward(request, response);
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
