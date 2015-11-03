package Servlets;

import Logica.Cabania;
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
        int idCabania = Integer.parseInt(request.getParameter("cabaniaId"));

        ConexionDB conexionDB = new ConexionDB("root","");

        CabaniaDao cabaniaDao = new CabaniaDao();
        Cabania cabania =  cabaniaDao.obtenerInfoCabania(idCabania);

        try {
            valor = Double.parseDouble(request.getParameter("valor"));
        }catch (Exception e){
            if(valor == 0){
                valor = cabania.getValor_servicio_dia();
            }

        }
        try{
            cantidadPersonas = Integer.parseInt(request.getParameter("cantidad"));
        }catch (Exception e){
            if (cantidadPersonas == 0) {
                cantidadPersonas = cabania.getCapacidadMaxima();
            }
        }


            RequestDispatcher dispatcher = null;

            if(valor!=0 || cantidadPersonas!=0){
                boolean actualizar = cabaniaDao.actualizarCabania(idCabania,valor,cantidadPersonas);
                request.setAttribute("actualizacion", actualizar);
                if(actualizar){
                    dispatcher = request.getRequestDispatcher("ConsultarCabania.jsp");
                    dispatcher.forward(request, response);
                }
                else{
                    dispatcher = request.getRequestDispatcher("ConsultarCabania.jsp");
                    dispatcher.forward(request, response);
                }
            }else {
                dispatcher = request.getRequestDispatcher("ConsultarCabania.jsp");
                dispatcher.forward(request, response);
            }

        }
    }
