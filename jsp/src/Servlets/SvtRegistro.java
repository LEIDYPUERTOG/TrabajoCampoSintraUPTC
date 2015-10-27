package Servlets;

import Logica.Persona;
import Logica.TipoDocumento;
import Logica.TipoUsuario;
import Logica.rol;
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
 * Created by LEIDY on 17/10/2015.
 */
@WebServlet("/SvtRegistro")
public class SvtRegistro extends HttpServlet {


    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");


        String nombre=request.getParameter("nombres");
        int documento=Integer.parseInt(request.getParameter("documento"));
        String clave=request.getParameter("contrasenia");
        String clave2=request.getParameter("contrasenia2");
        String tipoUsuario = request.getParameter("inlineRadioOptions");

        ConexionDB conexionDB = new ConexionDB("root","1234");

        PersonaDao personaDao = new PersonaDao();

        System.out.println("---------------------------------------------"+nombre);
        System.out.println("---------------------------------------------"+documento);
        System.out.println("---------------------------------------------"+clave);
        Persona persona = new Persona(documento,nombre, TipoDocumento.Cedula, personaDao.conversionUsuario(tipoUsuario),
                clave,rol.Usuario);


        System.out.println("---------------------------------------------" + persona.getRol());
        Persona aux = personaDao.consultarPersona(documento); //primero  busca si la persona no esta para agregarla

        RequestDispatcher dispatcher = null;
        if(aux == null){
            boolean agregar = personaDao.crearPersona(persona);
            if(agregar && clave.equals(clave2)){
                request.setAttribute("persona", persona); //mandando el parametro para que sea accedido
                System.out.println("---------------------------------------------" + agregar);
                request.setAttribute("personaCreada", "Usuario creado satisfactoriamente");
                dispatcher = request.getRequestDispatcher("ReservarCabaniaUsuario.jsp");
                dispatcher.forward(request, response);
            }else{
                request.setAttribute("personaCreada", "No se pudo completar la solicitud");
                dispatcher = request.getRequestDispatcher("registrarse.jsp");
                dispatcher.forward(request, response);
            }
        }
        else{
            if(aux.getContrasenia() == null && clave.equals(clave2)){
                boolean actualizar = personaDao.actualizarPersona(aux.getCedula(),clave);
                if(actualizar){
                    request.setAttribute("personaCreada", "Usuario creado satisfactoriamente");
                    request.setAttribute("persona", persona); //mandando el parametro para que sea accedido
                    dispatcher = request.getRequestDispatcher("ReservarCabaniaUsuario.jsp");
                    dispatcher.forward(request, response);
                }
            }
            PrintWriter out=response.getWriter();
            out.println("El usuario ya existe");
        }

    }
}