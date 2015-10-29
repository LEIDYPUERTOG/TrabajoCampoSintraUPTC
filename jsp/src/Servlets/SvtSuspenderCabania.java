package Servlets;

import Logica.Cabania;
import Persistencia.CabaniaDao;
import Persistencia.ConexionDB;
import Persistencia.EstadoCabania;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by LEIDY on 28/10/2015.
 */
@WebServlet(name = "SvtSuspenderCabania")
public class SvtSuspenderCabania extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ConexionDB conexionDB = new ConexionDB("root","");
        CabaniaDao cabaniaDao = new CabaniaDao();
        int idCabania = Integer.parseInt(request.getParameter("idCabania2"));
        Cabania cabania =  cabaniaDao.obtenerInfoCabania(idCabania);

        RequestDispatcher dispatcher = null;
        if(cabania != null){
            System.out.println("aaaa " + cabania.getEstadoCabania().toString());
            if(cabania.getEstadoCabania().toString().equalsIgnoreCase("Activa")){
                cabaniaDao.actualizarEstadoCabania(idCabania,EstadoCabania.Suspendida);
                System.out.println(cabania.getEstadoCabania().toString());
                dispatcher = request.getRequestDispatcher("ConsultarCabania.jsp");
                dispatcher.forward(request, response);
            }
            else{
                cabaniaDao.actualizarEstadoCabania(idCabania,EstadoCabania.Activa);
                dispatcher = request.getRequestDispatcher("ConsultarCabania.jsp");
                dispatcher.forward(request, response);
            }


        }
        else {
            dispatcher = request.getRequestDispatcher("ConsultarCabania.jsp");
            dispatcher.forward(request, response);
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
