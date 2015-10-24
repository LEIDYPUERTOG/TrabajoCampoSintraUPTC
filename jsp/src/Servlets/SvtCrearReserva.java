package Servlets;

import Logica.*;
import Persistencia.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.GregorianCalendar;

/**
 * Created by LEIDY on 18/10/2015.
 */
@WebServlet("/SvtCrearReserva")
public class SvtCrearReserva extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        String[] aux = request.getParameter("fechaInicio").toString().split("-");
        int auxAnio = Integer.parseInt(aux[0]);
        int auxMes = Integer.parseInt(aux[1]);
        int auxDia = Integer.parseInt(aux[2]);
        GregorianCalendar calendar = new GregorianCalendar();
        calendar.set(auxAnio, auxMes, auxDia);
        Date dateInicio = new Date(calendar.getTimeInMillis());

        aux = request.getParameter("fechaFin").toString().split("-");
        auxAnio = Integer.parseInt(aux[0]);
        auxMes = Integer.parseInt(aux[1]);
        auxDia = Integer.parseInt(aux[2]);
        calendar = new GregorianCalendar();
        calendar.set(auxAnio,auxMes,auxDia);
        Date dateFin = new Date(calendar.getTimeInMillis());
        int idCabania = Integer.parseInt(request.getParameter("idCabania"));
        int cantidad = Integer.parseInt(request.getParameter("cantidad"));


        ConexionDB conexionDB = new ConexionDB("root","");



        ReservaDao reservaDao = new ReservaDao();
        InformacionReservaDao informacionReservaDao = new InformacionReservaDao();
        CabaniaDao cabaniaDao = new CabaniaDao();

        GregorianCalendar c = new GregorianCalendar();
        Date fechaSolicitud = new Date(c.getTimeInMillis());
        System.out.println("solicitud-------------" + fechaSolicitud);


        Persona persona = (Persona) request.getSession().getAttribute("persona");
        PersonaDao personaDao = new PersonaDao();
        request.setAttribute("personaBusqueda", persona); //mandando el parametro para que sea accedido

        Reserva reserva = new Reserva(cantidad, EstadoReserva.Pendiente,fechaSolicitud,TipoServicio.CABANIA,persona);
        Cabania cabania = cabaniaDao.obtenerInfoCabania(idCabania);
        reserva.setCabania(cabania);
        boolean agregar = reservaDao.crearReservaCabania(reserva);

        boolean agregarInfo = false;


        for(int i = 1; i < cantidad+1; i++){
            int cedula = Integer.parseInt(request.getParameter("cedula" + i));
            System.out.println("cedula   "+i+" --------- "+ cedula);
            String nombre = request.getParameter("nombre" + i);
            Persona auxPersona = personaDao.consultarPersona(cedula);
            if(auxPersona!=null){
                InformacionReserva informacionReserva = new InformacionReserva
                        (dateInicio, dateFin,dateFin,auxPersona,reserva);
                agregarInfo = informacionReservaDao.crearInformacionReserva(informacionReserva);
            }
            else {
                System.out.println("cedula en else   "+i+" --------- "+ cedula);
                auxPersona= new Persona(cedula,nombre,TipoDocumento.Cedula,TipoUsuario.NoAfiliado,rol.Usuario);
                personaDao.crearPersona(auxPersona);
                InformacionReserva informacionReserva = new InformacionReserva(dateInicio, dateFin,dateFin,auxPersona,reserva);
                agregarInfo = informacionReservaDao.crearInformacionReserva(informacionReserva);
            }
        }

        RequestDispatcher dispatcher = null;


        if(agregar && agregarInfo){
            System.out.println("---------------------------------------------" + agregar);
            if(persona.getRol().toString().equalsIgnoreCase("Administrador")||
                    persona.getRol().toString().equalsIgnoreCase("Funcionario")){

                dispatcher = request.getRequestDispatcher("CrearReservaCabania.jsp");
                dispatcher.forward(request, response);
            }
            else {
                dispatcher = request.getRequestDispatcher("ReservarCabaniaUsuario.jsp");
                dispatcher.forward(request, response);
            }
            dispatcher = request.getRequestDispatcher("index.jsp");
            dispatcher.forward(request, response);
            PrintWriter out=response.getWriter();
            out.println("Agregado");
        }else{
            PrintWriter out=response.getWriter();
            out.println("Si estas viendo este mensaje es por que algo salio mal, no se pudo completar tu solicitud.");
        }

    }
}
