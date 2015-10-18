package Servlets;

import Logica.Evento;
import Persistencia.ConexionDB;
import Persistencia.EventoDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by LEIDY on 17/10/2015.
 * javax.servlet.http.HttpServlet
 */
public class SvtCrearEvento extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ConexionDB conexionDB = new ConexionDB("root","");
        EventoDao eventoDao = new EventoDao();

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
