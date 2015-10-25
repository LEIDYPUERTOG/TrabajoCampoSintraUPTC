package Servlets;

import Logica.Cabania;
import Logica.Persona;
import Logica.TipoDocumento;
import Persistencia.CabaniaDao;
import Persistencia.ConexionDB;
import Persistencia.PersonaDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by LEIDY on 18/10/2015.
 */
@WebServlet("/SvtCrearCabania")
public class SvtCrearCabania extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");


        int idCabania=Integer.parseInt(request.getParameter("idCabania"));
        int capacidad=Integer.parseInt(request.getParameter("capacidad"));
        double valor=90000.0;
        String ruta=request.getParameter("ruta");

        CabaniaDao cabaniaDao = new CabaniaDao();

        System.out.println("---------------------------------------------"+idCabania);
        System.out.println("---------------------------------------------"+capacidad);
        System.out.println("---------------------------------------------"+valor);
        System.out.println("---------------------------------------------"+ruta);
        Cabania cabania = new Cabania(capacidad,ruta,idCabania, valor);

        Cabania buscarCabania = cabaniaDao.obtenerInfoCabania(idCabania);

        RequestDispatcher dispatcher = null;

        Persona persona = (Persona)request.getAttribute("personaBusqueda");
        request.setAttribute("personaBusqueda", persona); //mandando el parametro para que sea accedido

        if(buscarCabania == null){
            boolean agregar = cabaniaDao.crearCabania(cabania);
            if(agregar){
                request.setAttribute("cabaniaAgregada", true);
                dispatcher = request.getRequestDispatcher("ConsultarCabania.jsp");
                dispatcher.forward(request, response);

            }else{
                dispatcher = request.getRequestDispatcher("CrearCabania.jsp");
                dispatcher.forward(request, response);
            }
        }
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
