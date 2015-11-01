package Servlets;

import Logica.Locacion;
import Persistencia.ConexionDB;
import Persistencia.LocacionDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by LEIDY on 31/10/2015.
 */
@WebServlet(name = "SvtCrearLocacion")
public class SvtCrearLocacion extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ConexionDB conexionDB = new ConexionDB("root","");
        String nombre = request.getParameter("nombreLugar").toUpperCase();
        String direccion = request.getParameter("direccion");

        LocacionDao locacionDao = new LocacionDao();
        RequestDispatcher dispatcher = null;

        if(!nombre.equalsIgnoreCase("") && !direccion.equalsIgnoreCase("")){
            Locacion locacion = new Locacion(nombre,direccion);
            boolean agregar = locacionDao.agregarLocacion(locacion);
            if(agregar){
                dispatcher = request.getRequestDispatcher("CrearEvento.jsp");
                dispatcher.forward(request, response);
            }
            dispatcher = request.getRequestDispatcher("CrearEvento.jsp");
            dispatcher.forward(request, response);
        }
        dispatcher = request.getRequestDispatcher("CrearEvento.jsp");
        dispatcher.forward(request, response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
