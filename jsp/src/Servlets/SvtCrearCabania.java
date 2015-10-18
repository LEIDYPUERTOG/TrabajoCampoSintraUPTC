package Servlets;

import Logica.Cabania;
import Logica.Persona;
import Logica.TipoDocumento;
import Persistencia.CabaniaDao;
import Persistencia.ConexionDB;
import Persistencia.PersonaDao;

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
        double valor=Double.parseDouble(request.getParameter("valor"));
        String ruta=request.getParameter("ruta");

        ConexionDB conexionDB = new ConexionDB("root","");

        CabaniaDao cabaniaDao = new CabaniaDao();

        System.out.println("---------------------------------------------"+idCabania);
        System.out.println("---------------------------------------------"+capacidad);
        System.out.println("---------------------------------------------"+valor);
        System.out.println("---------------------------------------------"+ruta);
        Cabania cabania = new Cabania(capacidad,ruta,idCabania, valor);

        boolean agregar = cabaniaDao.crearCabania(cabania);

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