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
import java.util.ArrayList;
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
        int auxMes = Integer.parseInt(aux[1])-1;
        int auxDia = Integer.parseInt(aux[2]);
        GregorianCalendar calendar = new GregorianCalendar();
        calendar.set(auxAnio, auxMes, auxDia);
        Date dateInicio = new Date(calendar.getTimeInMillis());

        aux = request.getParameter("fechaFin").toString().split("-");
        auxAnio = Integer.parseInt(aux[0]);
        auxMes = Integer.parseInt(aux[1])-1;
        auxDia = Integer.parseInt(aux[2]);
        calendar = new GregorianCalendar();
        calendar.set(auxAnio,auxMes,auxDia);
        Date dateFin = new Date(calendar.getTimeInMillis());
        int idCabania = 1;
        try {
            idCabania = Integer.parseInt(request.getParameter("cabania"));

        }catch (Exception e){

        }

        int cantidad = Integer.parseInt(request.getParameter("cantidad"));


        ConexionDB conexionDB = new ConexionDB("root","");


        ReservaDao reservaDao = new ReservaDao();
        InformacionReservaDao informacionReservaDao = new InformacionReservaDao();
        CabaniaDao cabaniaDao = new CabaniaDao();

        GregorianCalendar c = new GregorianCalendar();
        Date fechaSolicitud = new Date(c.getTimeInMillis());


        String tipoServicio = request.getParameter("inlineRadioOptions");
        if(tipoServicio == null){
            tipoServicio = "Camping";
        }


        Persona persona = (Persona) request.getSession().getAttribute("persona");
        PersonaDao personaDao = new PersonaDao();
        request.setAttribute("personaBusqueda", persona); //mandando el parametro para que sea accedido

        boolean agregar = false;
        boolean agregarInfo = false;
        Reserva reserva = null;


        if(tipoServicio.equalsIgnoreCase("Cabania")){
            reserva = new Reserva(cantidad, EstadoReserva.Pendiente,fechaSolicitud,TipoServicio.CABANIA,persona);
            Cabania cabania = cabaniaDao.obtenerInfoCabania(idCabania);
            reserva.setCabania(cabania);
            agregar = reservaDao.crearReservaCabania(reserva);
        }
        else{
            reserva = new Reserva(cantidad, EstadoReserva.Pendiente,fechaSolicitud,TipoServicio.CAMPING,persona);

            Camping camping = new Camping(cantidad);
            reserva.setCamping(camping);
            agregar = reservaDao.crearReservaCamping(reserva);
        }

        for(int i = 1; i < cantidad+1; i++){
            int cedula = Integer.parseInt(request.getParameter("cedula" + i));

            String nombre = request.getParameter("nombre" + i);
            Persona auxPersona = personaDao.consultarPersona(cedula);
            if(auxPersona!=null){
                InformacionReserva informacionReserva = new InformacionReserva
                        (dateInicio, dateFin,dateFin,auxPersona,reserva);
                agregarInfo = informacionReservaDao.crearInformacionReserva(informacionReserva);
            }
            else {
                auxPersona= new Persona(cedula,nombre,TipoDocumento.Cedula,TipoUsuario.NoAfiliado,rol.Usuario,
                        EstadoPersona.ACTIVO);
                personaDao.crearPersona(auxPersona);
                InformacionReserva informacionReserva = new InformacionReserva(dateInicio,
                        dateFin,dateFin,auxPersona,reserva);
                agregarInfo = informacionReservaDao.crearInformacionReserva(informacionReserva);

            }
        }

        RequestDispatcher dispatcher = null;

        if(agregar && agregarInfo){
            if(persona.getRol().toString().equalsIgnoreCase("Administrador")||
                    persona.getRol().toString().equalsIgnoreCase("Funcionario")){

                dispatcher = request.getRequestDispatcher("EditarReservaAdmin.jsp");
                dispatcher.forward(request, response);
            }
            else {
                dispatcher = request.getRequestDispatcher("EditarReservaUsuario.jsp");
                dispatcher.forward(request, response);
            }
        }else{

            if(persona.getRol().toString().equalsIgnoreCase("Administrador")||
                    persona.getRol().toString().equalsIgnoreCase("Funcionario")){

                dispatcher = request.getRequestDispatcher("CrearReservaCabania.jsp");
                dispatcher.forward(request, response);
            }
            else {
                dispatcher = request.getRequestDispatcher("ReservarCabaniaUsuario.jsp");
                dispatcher.forward(request, response);
            }
        }

    }
}
