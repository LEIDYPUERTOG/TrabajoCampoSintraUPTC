package Servlets;

import Persistencia.CabaniaDao;
import Persistencia.ConexionDB;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by LEIDY on 23/10/2015.
 */
@WebServlet(name = "SvtEditarCabania")
public class SvtEditarCabania extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        double valor = 0;
        int cantidadPersonas = 0;
        int idCabania = 0;

        ConexionDB conexionDB = new ConexionDB("root","");

        CabaniaDao cabaniaDao = new CabaniaDao();

        try {
            valor = Double.parseDouble(request.getParameter("valor"));
            cantidadPersonas = Integer.parseInt(request.getParameter("cantidad"));
            idCabania = Integer.parseInt(request.getParameter("cabaniaId"));
        }catch (Exception e){

        }

        RequestDispatcher dispatcher = null;

        if(valor!=0 || cantidadPersonas!=0){
            boolean actualizar = cabaniaDao.actualizarCabania(idCabania,valor,cantidadPersonas);
            request.setAttribute("actualizacion",actualizar);
            if(actualizar){
                dispatcher = request.getRequestDispatcher("ConsultarCabania.jsp");
                dispatcher.forward(request, response);
            }
        }
    }
}
