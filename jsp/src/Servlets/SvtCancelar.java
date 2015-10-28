package Servlets;

import Logica.EstadoReserva;
import Logica.Reserva;
import Persistencia.ConexionDB;
import Persistencia.ReservaDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by LEIDY on 25/10/2015.
 */
@WebServlet(name = "SvtCancelar")
public class SvtCancelar extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ConexionDB conexionDB = new ConexionDB("root","");
        ReservaDao reservaDao = new ReservaDao();

        String[] aux = request.getParameter("reserva").split(" ");
        int idReserva = Integer.parseInt(aux[0]);
        Reserva reserva = reservaDao.consultarReservaIdReserva(idReserva);
        boolean actualizar = reservaDao.actualizarReservaEstado(idReserva, EstadoReserva.Cancelada);
        RequestDispatcher dispatcher = null;

        if(actualizar==true){

            if(reserva.getPersona().getRol().toString().equals("Administrador")
                    ||reserva.getPersona().getRol().toString().equals("Funcionario")){
                dispatcher = request.getRequestDispatcher("EditarReservaAdmin.jsp");
                dispatcher.forward(request, response);
            }
            else{
                dispatcher = request.getRequestDispatcher("EditarReservaUsuario.jsp");
                dispatcher.forward(request, response);
            }
        }
        else {
            if(reserva.getPersona().getRol().toString().equals("Administrador")
                    ||reserva.getPersona().getRol().toString().equals("Funcionario")){
                dispatcher = request.getRequestDispatcher("EditarReservaAdmin.jsp");
                dispatcher.forward(request, response);
            }
            else{
                dispatcher = request.getRequestDispatcher("EditarReservaUsuario.jsp");
                dispatcher.forward(request, response);
            }
        }
    }

}
