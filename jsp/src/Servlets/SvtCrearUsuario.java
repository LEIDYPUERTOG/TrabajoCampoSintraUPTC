package Servlets;

import Logica.Persona;
import Logica.TipoDocumento;
import Logica.TipoUsuario;
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
@WebServlet(name = "SvtCrearUsuario")
public class SvtCrearUsuario extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");


        String nombre=request.getParameter("nombres");
        int documento=Integer.parseInt(request.getParameter("documento"));


        ConexionDB conexionDB = new ConexionDB("root","");

        PersonaDao personaDao = new PersonaDao();

        System.out.println("---------------------------------------------"+nombre);
        System.out.println("---------------------------------------------"+documento);

        Persona aux = personaDao.consultarPersona(documento); //primero  busca si la persona no esta para agregarla
        Persona persona = new Persona(documento,nombre, TipoDocumento.Cedula, TipoUsuario.Afiliado);


        boolean agregar = personaDao.crearPersona(persona);

        if(agregar){
            System.out.println("---------------------------------------------" + agregar);
            PrintWriter out=response.getWriter();
            out.println("Agregado");

        } else {
            PrintWriter out = response.getWriter();
            out.println("Si estas viendo este mensaje es por que algo salio mal, no se pudo completar tu solicitud.");

        }
}

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
