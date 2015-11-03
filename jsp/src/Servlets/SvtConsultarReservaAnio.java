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
import java.util.ArrayList;

/**
 * Created by LEIDY on 24/10/2015.
 */
@WebServlet(name = "SvtConsultarReservaAnio")
public class SvtConsultarReservaAnio extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int anio = Integer.parseInt(request.getParameter("anioIn"));
        System.out.println("anio              "+anio);
        ConexionDB conexionDB = new ConexionDB("root","");

        ReservaDao reservaDao = new ReservaDao();

        RequestDispatcher dispatcher = null;

        ArrayList<Reserva> listaMisReservas = reservaDao.consultarAnioFecha(anio);

        if(listaMisReservas !=null){
            request.setAttribute("reservas",listaMisReservas);
            InformacionReservaDao informacionReservaDao = new InformacionReservaDao();

            for(int i = 0; i < listaMisReservas.size(); i++) {

                InformacionReserva informacionReserva = informacionReservaDao.
                        obtenerInfo(listaMisReservas.get(i).getIdReserva());

                long cantidadDias = informacionReserva.getFechaFinReserva().getTime() -
                        informacionReserva.getFechaInicioReserva().getTime();
                request.setAttribute("dias",cantidadDias);
                dispatcher = request.getRequestDispatcher("ReservasAnuales.jsp");
                dispatcher.forward(request, response);
            }
        }
        else{
            dispatcher = request.getRequestDispatcher("ReservasAnuales.jsp");
            dispatcher.forward(request, response);
        }
    }

}
