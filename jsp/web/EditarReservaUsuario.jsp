<%@ page import="Logica.InformacionReserva" %>
<%@ page import="Logica.Persona" %>
<%@ page import="Logica.Reserva" %>
<%@ page import="Persistencia.InformacionReservaDao" %>
<%@ page import="Persistencia.ReservaDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Autor: Diana Gonzalez, Leidy Puerto, Edgar Meneses -->
<!DOCTYPE html>
<html lang="es"> <!-- Inicio pagina html5 -->
<head> <!-- Lo que es importante para tener en la pagina -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width; initial-scale=1.0">
    <title> Bienvenido </title>

    <!-- Estilos de la pagina -->
    <link rel="stylesheet" href="/Presentacion/estilos/estilos.css">
    <!-- Tipo de letra de google -->
    <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Nunito' rel='stylesheet' type='text/css'>

    <!-- Estilos CSS vinculados -->
    <link href="/Presentacion/estilos/css/bootstrap.min.css" rel="stylesheet">
    <link href="/Presentacion/estilos/css/estilos.css" rel="stylesheet">

    <script src="Presentacion/angular.min.js"></script>

    <!-- Script necesario para hacer que la ventana de login aparezca-->
    <script src="jquery.js"></script>


</head>

<body> <!-- Lo que tiene la pagina -->
<!-- Js vinculados -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="/Presentacion/estilos/js/responsive.js"></script>
<script src="/Presentacion/estilos/js/bootstrap.min.js"></script>

<!-- Contenedor que tiene las secciones y aeticle de la pagina -->
<section id="contenedorUsuario">
    <!-- Primera cabecera (inicio,ingresar,...)  -->
    <header>
        <!-- Boton ingresar -->
        <article id="inicio1">
            <div class="dropdown">
                <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenu1"
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                    <%
                        Persona persona = (Persona) session.getAttribute("persona");
                        session.setAttribute("persona", persona);
                        if (persona != null) {

                    %>
                    <%= persona.getNombre() %>
                    <%
                    } else {
                        Persona persona1 = (Persona) request.getAttribute("persona");
                        session.setAttribute("persona", persona1);
                    %>
                    <%= persona1.getNombre() %>
                    <%
                        }
                    %>
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                    <li> <a href="/CambiarContraseniaUsuario.jsp">
                        <span class="glyphicon glyphicon-lock" aria-hidden="true"></span>Cambiar Contraseña</a>
                    </li>
                    <li><a> <span class="glyphicon glyphicon-log-out" aria-hidden="true" href="#"></span>Cerrar
                        Sesión</a></li>

                </ul>
            </div>

        </article>
        <!-- Boton Contactenos -->
        <article id="inicio2">
            <button type="button" class="btn btn-link" style="margin-top:21px;" onclick="location.href='#informacion'">
                <!-- Tamaño -->
                <span class="glyphicon glyphicon-earphone" aria-hidden="true"></span> Contáctenos
                <!-- Icono y palabra -->
            </button>
        </article>
        <!-- Boton Inicio -->
        <article id="inicio4">
            <button type="button" class="btn btn-link" style="padding-right:55px;padding-left:10px;margin-top:21px;"
                    onclick="location.href='index.jsp'"> <!-- Tamaño -->
                <span class="glyphicon glyphicon-home" aria-hidden="true"></span> Inicio <!-- Icono y palabra -->
            </button>
        </article>
    </header>

    <!-- Segunda cabecera con los logos del sindicato y la uptc -->
    <section id="logo">
        <img src="/Presentacion/imagenes/cabecera.jpg" alt="logos.png"> <!-- Importar la imagen -->
    </section>

    <!-- Tercera cabecera con los servicios que prestan el sindicato -->
    <section id="servicios">
        <ul class="nav nav-pills"> <!-- Para la navegacion -->
            <li role="presentation" style="padding-right:40px;padding-left:120px;margin-top:0px;">
                <!-- Nombre y color de las palabras -->
                <a href="ReservarCabaniaUsuario.jsp"><h3><font color=#34495E>Realizar Reserva</font></h3></a>
            </li>
        </ul>
    </section>

    <section id="contenidoReservaC">
        <h4>Editar Cabaña</h4><!-- Titulo principal -->

        <article id="lista">

            <table class="table" id="tabla_uno" onclick=" document.getElementById('reservaId').value = tomarValor();">

                <thead>
                <!-- titulos de la tabla  idReserva = tomarValor()-->
                <tr>
                    <th>Número de<br> Reserva</th>
                    <th>Fecha de<br> Solicitud</th>
                    <th>Fecha Inicio</th>
                    <th>Fecha Fin</th>
                    <th>Estado de <br> la reserva</th>
                    <th>Editar</th>
                    <th>Cancelar</th>
                </tr>
                </thead>
                <tbody>
                <%
                    ReservaDao reservaDao = new ReservaDao();
                    ArrayList<Reserva> listaMisReservas = reservaDao.consultarReservaAfiliado(persona.getCedula());
                    if (listaMisReservas != null) {
                        System.out.println("tamaño lista " + listaMisReservas.size());
                        InformacionReservaDao informacionReservaDao = new InformacionReservaDao();
                        for (int i = 0; i < listaMisReservas.size(); i++) {

                            InformacionReserva informacionReserva = informacionReservaDao.
                                    obtenerInfo(listaMisReservas.get(i).getIdReserva());
                %>

                <tr>

                    <td><%= listaMisReservas.get(i).getIdReserva()%>
                    </td>
                    <td><%= listaMisReservas.get(i).getFechaSolicitud()%>
                    </td>
                    <td><%= informacionReserva.getFechaInicioReserva()%>
                    </td>
                    <td><%= informacionReserva.getFechaFinReserva()%>
                    </td>
                    <td><%= listaMisReservas.get(i).getEstadoReserva()%>
                    </td>

                    <td><img src="/Presentacion/imagenes/editar.png" id="imagEditar" title="Editar" class='inline'
                             href="#inline_content" onclick="ventana()">
                    </td>
                    <td><img src="/Presentacion/imagenes/suspender.png" id="imagSuspender" title="Suspender">

                    </td>
                </tr>
                <%
                        }
                    } else {

                    }
                %>
                </tbody>
            </table>
            <!-- Fin de la tabla -->
        </article>
        <!-- Fin del article -->
    </section>


    <!-- Informacion adicional del sindicato (Menu, Registrarse,...) -->
    <article id="infoUsuario">
        <!-- Division para el color de la informacion adicional de la pagina -->
        <section id="divi">
        </section>
        <section id="informacion">
            <article id="inf1"> <!-- Seccion Menu -->
                <h4>Menu</h4>
                <h5>
                    <button type="button" class="btn btn-link">Nosotros</button>
                </h5>
                <h5>
                    <button type="button" class="btn btn-link">Junta Directiva</button>
                </h5>
                <h5>
                    <button type="button" class="btn btn-link">Contáctenos</button>
                </h5>
            </article>
            <article id="inf2"> <!-- Seccion Registrar -->
            </article>
            <article id="inf3"> <!-- Seccion Inf Contacto -->
                <h4>Informacion de contacto</h4>
                <h5> Avenida Central del Norte 39 - 115 </h5>
                <h5> Tunja - Boyaca </h5>
                <h5> Tel. 422174 Ext. 1500</h5>
            </article>
        </section>

        <!-- El pie de pagina donde esta el copyright -->
        <footer>
            <p>
                © Todos los derechos reservados. Tunja – Ciudad Universitaria – Carretera Central del Norte Tel. 422174
                Ext. 1500 </br>
                Desarrollado por Edgar Meneses, Diana Gonzalez, Leidy Puerto
            </p>
        </footer>
    </article>
</section>
<section id="ventanaEmergente">
    <div id='inline_content'>
        <div id="login-content4">
            <form action="/SvtEditarReserva" method="post" name="formularioEdicion">

                <label id="IdReserva">Número de reserva</label>
                <input id="reservaId" type="numeric" name="reserva">

                <label id="lblFecha1">Fecha Inicio</label>
                <input id="fecha1Ventana" type="date" name="fechaInicioNueva" placeholder="fecha Inicio">
                <label id="lblFecha2">Fecha Fin</label>
                <input id="fecha2Ventana" type="date" name="FechaFinNueva" placeholder="Fecha Fin">

                <button type="submit" id="submitAceptarVentana" class="btn btn-primary"
                        style="padding-right:35px;padding-left:10px;margin-top:21px;">
                    Aceptar
                </button>
                <button type="button" id="submitCancelarVentana" class="btn btn-primary"
                        style="padding-right:35px;padding-left:10px;margin-top:21px;"
                        onclick='parent.$.colorbox.close(); return false;'>
                    Cancelar
                </button>

            </form>

        </div>
    </div>
</section>
</body>
</html>
<!-- Fin pagina html5 -->