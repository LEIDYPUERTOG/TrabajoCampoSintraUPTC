package Servlets;

import Logica.InformacionReserva;
import Logica.Reserva;
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
import java.sql.Date;
import java.util.ArrayList;
import java.util.GregorianCalendar;

/**
 * Created by LEIDY on 25/10/2015.
 */
@WebServlet(name = "SvtReservasFiltros")
public class SvtReservasFiltros extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ArrayList<Reserva> listaMisReservas = null;
        ConexionDB conexionDB = new ConexionDB("root","");

        ReservaDao reservaDao = new ReservaDao();



        String ced = request.getParameter("cedula");

        if(ced != ""){
            int cedula = Integer.parseInt(ced);
            listaMisReservas = reservaDao.consultarReservaAfiliado(cedula);
            if(listaMisReservas !=null){
                RequestDispatcher dispatcher = null;
                request.setAttribute("reservas", listaMisReservas);

                dispatcher = request.getRequestDispatcher("AprobarReserva.jsp");
                dispatcher.forward(request, response);
            }
            else{
                RequestDispatcher dispatcher = null;
                listaMisReservas = reservaDao.consultarReservas();
                request.setAttribute("reservas", listaMisReservas);
                dispatcher = request.getRequestDispatcher("AprobarReserva.jsp");
                dispatcher.forward(request, response);
            }
        }
        else {
            String[] fec = request.getParameter("fechaFin").toString().split("-");

            if (!fec [0].equalsIgnoreCase("")) {
                RequestDispatcher dispatcher = null;
                int auxAnio = Integer.parseInt(fec[0]);
                int auxMes = Integer.parseInt(fec[1]) - 1;
                int auxDia = Integer.parseInt(fec[2]);
                GregorianCalendar calendar = new GregorianCalendar();
                calendar.set(auxAnio, auxMes, auxDia);
                Date dateInicio = new Date(calendar.getTimeInMillis());

                listaMisReservas = reservaDao.consultarFecha(dateInicio);
                request.setAttribute("reservas", listaMisReservas);


                dispatcher = request.getRequestDispatcher("AprobarReserva.jsp");
                dispatcher.forward(request, response);
            }
            else{
                String estado = request.getParameter("Estado");
                RequestDispatcher dispatcher = null;
                if(!estado.equalsIgnoreCase("")){
                    listaMisReservas = reservaDao.consultarEstado(estado);
                    request.setAttribute("reservas", listaMisReservas);
                    dispatcher = request.getRequestDispatcher("AprobarReserva.jsp");
                    dispatcher.forward(request, response);
                }
                else{

                    listaMisReservas = reservaDao.consultarReservas();
                    request.setAttribute("reservas", listaMisReservas);
                    dispatcher = request.getRequestDispatcher("AprobarReserva.jsp");
                    dispatcher.forward(request, response);
                }
            }
        }
    }
}

