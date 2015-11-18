<%@ page import="Persistencia.EventoDao" %>
<%@ page import="Logica.Evento" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Persistencia.LocacionDao" %>
<%@ page import="Logica.Locacion" %>
<%@ page import="Logica.Persona" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="shortcut icon" type="image/x-icon" href="/Presentacion/imagenes/logo.png">
    <title>Consultar Evento</title>

    <!-- Estilos de la pagina -->
    <link rel="stylesheet" href="/Presentacion/estilos/estilos.css">
    <!-- Tipo de letra de google -->
    <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Handlee' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Boogaloo' rel='stylesheet' type='text/css'>

    <!-- Estilos CSS vinculados -->
    <link rel="stylesheet" href="/Presentacion/estilos/estilos.css">
    <!-- Tipo de letra de google -->
    <link href='https://fonts.googleapis.com/css?family=Courgette' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Handlee' rel='stylesheet' type='text/css'>

    <!-- Estilos CSS vinculados -->
    <link href="/Presentacion/estilos/css/bootstrap.min.css" rel="stylesheet">
    <link href="/Presentacion/estilos/css/estilos.css" rel="stylesheet">

    <script src="Presentacion/angular.min.js"></script>

    <!-- Script necesario para hacer que la ventana de login aparezca-->
    <script src="jquery.js"></script>

    <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
    <script src="Presentacion/jquery.colorbox.js"></script>

    <!--Script para poder hacer que aparezca la ventana emergente-->
    <script src="/Presentacion/estilos/funciones/funcion.js"></script>

    <script type="text/javascript">

        var tomarValor = function elementoTabla() {
            if (!document.getElementsByTagName || !document.createTextNode) return;
            var rows = document.getElementById('tabla_uno').getElementsByTagName('tbody')[0].getElementsByTagName('tr');
            for (i = 0; i < rows.length; i++) {
                rows[i].onclick = function() {
                    var aux = document.getElementById("tabla_uno").rows[this.rowIndex].cells[0].innerHTML;
                    auxiliar = aux;
                }
            }

            return auxiliar;
        }

    </script>
</head>

<body> <!-- Lo que tiene la pagina -->
<!-- Js vinculados -->

<script src="/Presentacion/estilos/js/responsive.js"></script>
<script src="/Presentacion/estilos/js/bootstrap.min.js"></script>

<!-- Contenedor que tiene las secciones y aeticle de la pagina -->
<section id="contenedorReservaA">
    <!-- Primera cabecera (inicio,ingresar,...)  -->
    <header>
        <!-- Boton usuario -->

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
                    <li> <a href="/CambiarContrasenia.jsp">
                        <span class="glyphicon glyphicon-lock" aria-hidden="true"></span>Cambiar Contraseña</a>
                    </li>
                    <li><a href="index.jsp"> <span class="glyphicon glyphicon-log-out" aria-hidden="true"></span>Cerrar
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
    </header>

    <!-- Segunda cabecera con los logos del sindicato y la uptc -->
    <section id="logo">
        <img src="/Presentacion/imagenes/cabecera.jpg" alt="logos.png"> <!-- Importar la imagen -->
    </section>

    <!-- Divicion para el color de la informacion adicional de la pagina -->
    <section id="divi">
    </section>


    <!-- Seccion de panel de administración -->

    <section id="panelAdministracion2">
        <article id="lblTitulo">
            <label>Panel de administración</label>
        </article>

        <article id="cabania">
            <a href="CrearCabania.jsp"><img src="/Presentacion/imagenes/cabania.png" id="imag1" title="Cabaña" ></a>
        </article>

        <article id="eventos">
            <a href="CrearEvento.jsp"><img src="/Presentacion/imagenes/evento.png" id="imag2" title="Eventos"></a>
        </article>

        <article id="reserva">
            <a href="CrearReservaCabania.jsp"><img src="/Presentacion/imagenes/reservas.png" id="imag3" title="Reservas"></a>
        </article>

        <article id="usuario">
            <a href="CrearUsuario.jsp"><img src="/Presentacion/imagenes/usuario.png" id="imag4" title="Usuario" ></a>
        </article>

    </section>
    <!-- Seccion de navegacion-->
    <section id="navegacion">
        <article class="nave">
            <div>
                <ol class="breadcrumb">
                    <li><a href="#">Evento</a></li>
                    <li class="active">Consultar Evento</li>
                </ol>
            </div>
        </article>
    </section>
    <!-- Seccion de Pestañas-->
    <section id="pestanas2">
        <article>
            <nav class="navbar navbar-default navbar-static-top">
                <ul class="nav nav-tabs">
                    <li><a href="CrearEvento.jsp">Crear Evento</a></li>
                    <li class="active"><a>Consultar Evento</a></li>
                </ul>
            </nav>
        </article>
    </section>
    <!-- Seccion de contenido (tabla, link y paginacion)-->
    <section id="contenidoReservaA">
        <h4>Consulta de Eventos</h4>

        <article id="filtros">
            <form action="/SvtEventosFiltros" method="post">
                <article id="nombreEvento">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Nombre Evento" name="nombre">
                    </div><!-- /input-group -->
                </article>
                <article id="FechaInicio1">
                    <input type="date" class="form-control" placeholder="Fecha" name="fecha">
                </article>

                <article id="lugarEvento">
                    <select name="lugarCb" class="form-control" >
                        <%
                            LocacionDao locacionDao = new LocacionDao();
                            ArrayList<Locacion> locacion = (ArrayList) locacionDao.obtenerListaLocaciones();
                            session.setAttribute("locaciones", locacion);
                            if (locacion != null) {
                        %>
                        <option value=""></option>
                        <%

                            for (int i = 0; i < locacion.size(); i++) {

                        %>
                        <option value=" <%= i %> ">
                            <%= locacion.get(i).getNombreLocacion() %>
                        </option>
                        <%
                            }
                        %>
                        <%
                            }%>
                    </select>
                </article>

                <span class="input-group-btn" id="btnBusqueda">
                      <!-- Boton para la busqueda de la iamgen -->
                    <button type="submit" class="btn btn-default" aria-label="Left Align">
                        <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                    </button>
                  </span>
            </form>
        </article>


        <article id="lista3">
            <table class="table" id="tabla_uno" onclick="
            document.getElementById('nombreVentana').value = tomarValor();
            document.getElementById('eventoId').value = tomarValor();">
                <thead>
                <!-- titulos de la tabla -->
                <tr>
                    <th>Nombre</th>
                    <th>Fecha Inicio</th>
                    <th>Fecha Fin</th>
                    <th>Lugar</th>
                    <th>Dirección</th>
                    <th>Estado</th>
                    <th>Editar</th>
                    <th>Suspender</br>Activar</th>
                </tr>
                </thead>
                <tbody>

                <%
                    EventoDao eventoDao = new EventoDao();
                    ArrayList<Evento> listaEventos = (ArrayList)request.getAttribute("eventos");
                    if(listaEventos !=null){

                        for(int i = 0; i < listaEventos.size(); i++){

                %>

                <tr>
                    <td><%= listaEventos.get(i).getNombreEvento()%></td>
                    <td><%= listaEventos.get(i).getFechaIncioEvento()%></td>
                    <td><%= listaEventos.get(i).getFechaFinEvento()%></td>
                    <td><%= listaEventos.get(i).getLocacion().getNombreLocacion()%></td>
                    <td><%= listaEventos.get(i).getLocacion().getDireccionLocacion()%></td>
                    <td><%= listaEventos.get(i).getEstadoEvento().toString()%></td>

                    <%if(listaEventos.get(i).getEstadoEvento().toString().equals("Activo")){
                    %>
                    <td><img src="/Presentacion/imagenes/editar.png" id="imagEditar" title="Editar" class='inline'
                             href="#inline_content" onclick="ventana()"></td>
                    <td><img src="/Presentacion/imagenes/suspender.png" id="imagSuspender" title="Suspender"
                             class='inline'  href="#inline_content2" onclick="ventana3()"></td>
                    <%
                    }else{
                    %>
                    <td><img src="/Presentacion/imagenes/editar.png" id="imagEditar" title="Editar" class='inline'
                             href="#inline_content" onclick="ventana()"></td>
                    <td><img src="/Presentacion/imagenes/ok.png" id="imagSuspender" title="Suspender"
                             class='inline'  href="#inline_content2" onclick="ventana3()"></td>
                    <%
                        }
                    %>

                </tr>
                <%
                    }
                }else{
                    listaEventos = eventoDao.obtenerListaEventos();
                    if(listaEventos !=null) {
                        for (int i = 0; i < listaEventos.size(); i++) {
                %>

                <tr>
                    <td><%= listaEventos.get(i).getNombreEvento()%></td>
                    <td><%= listaEventos.get(i).getFechaIncioEvento()%></td>
                    <td><%= listaEventos.get(i).getFechaFinEvento()%></td>
                    <td><%= listaEventos.get(i).getLocacion().getNombreLocacion()%></td>
                    <td><%= listaEventos.get(i).getLocacion().getDireccionLocacion()%></td>
                    <td><%= listaEventos.get(i).getEstadoEvento().toString()%></td>

                    <%if(listaEventos.get(i).getEstadoEvento().toString().equals("Activo")){
                    %>
                    <td><img src="/Presentacion/imagenes/editar.png" id="imagEditar" title="Editar" class='inline'
                             href="#inline_content" onclick="ventana()"></td>
                    <td><img src="/Presentacion/imagenes/suspender.png" id="imagSuspender" title="Suspender"
                             class='inline'  href="#inline_content2" onclick="ventana3()"></td>
                    <%
                    }else{
                    %>
                    <td><img src="/Presentacion/imagenes/editar.png" id="imagEditar" title="Editar" class='inline'
                             href="#inline_content" onclick="ventana()"></td>
                    <td><img src="/Presentacion/imagenes/ok.png" id="imagSuspender" title="Suspender"
                             class='inline'  href="#inline_content2" onclick="ventana3()"></td>
                    <%
                        }
                    %>

                </tr>
                <%
                            }
                        }
                    }
                %>
                </tbody>
            </table> <!-- Fin de la tabla -->
        </article> <!-- Fin del article -->

    </section>

    <!-- Divicion para el color de la informacion adicional de la pagina -->
    <section id="divi">
    </section>

    <!-- Informacion adicional del sindicato (Menu, Registrarse,...) -->
    <section id="informacion">
        <article id="inf1"> <!-- Seccion Menu -->

        </article>
        <article id="inf2"> <!-- Seccion Registrar -->
        </article>
        <article id="inf3"> <!-- Seccion Inf Contacto -->
            <h4>Información de contacto</h4>
            <h5> Avenida Central del Norte 39 - 115 </h5>
            <h5>       Tunja - Boyaca </h5>
            <h5>       Tel. 422174 Ext. 1500</h5>
        </article>
    </section>

    <!-- El pie de pagina donde esta el copyright -->
    <footer>
        <p>
            © Todos los derechos reservados. Tunja – Ciudad Universitaria – Carretera Central del Norte Tel. 422174 Ext. 1500 </br>
            Desarrollado por Edgar Meneses, Diana Gonzalez, Leidy Puerto
        </p>
    </footer>
</section>

<!--Sección que contiene la ventana que aparece cuando se da la opcion de editar-->
<section id="ventanaEmergente">
    <div id='inline_content' >
        <div id="login-content3">
            <form action="/SvtEditarEvento" method="post" name="formularioEdicion">


                <input id="nombreVentana" type="text" name="nombre" placeholder="Nombre" readonly>
                <input id="fechaInicioVentana" type="date" name="fechaInicio" placeholder="fecha Inicio" >
                <input id="fechaFinVentana" type="date" name="FechaFin" placeholder="Fecha Fin">
                <article id="lugar">
                    <select name = "lugarCb" class="form-control">
                        <%
                            locacionDao = new LocacionDao();
                            locacion = (ArrayList)locacionDao.obtenerListaLocaciones();
                            session.setAttribute("locaciones",locacion);
                            if(locacion!=null){

                                for(int i = 0; i < locacion.size(); i++){

                        %>
                        <option value=" <%= i %> ">
                            <%= locacion.get(i).getNombreLocacion() %></option>
                        <%
                            }
                        %>
                        <%
                            }%>
                    </select>
                </article>

                <button type="submit" id="submitAceptarEvento" class="btn btn-primary"  style="padding-right:35px;padding-left:10px;margin-top:21px;">
                    Aceptar </button>
                <button type="button" id="submitCancelarEvento" class="btn btn-primary"  style="padding-right:35px;padding-left:10px;margin-top:21px;"
                        onclick='parent.$.colorbox.close(); return false;'>
                    Cancelar </button>

            </form>

        </div>
    </div>
</section>
<section id="ventanaEmergente">
    <div id='inline_content2' >
        <div id="login-contentCancelar">
            <form action="/SvtCambiarEstadoEvento" method="post" name="formularioEdicion">

                <label id="lbEvento">Desea cambiar el estado de: </label>
                <input id="eventoId" type="numeric" name="eventoId" readonly>

                <button type="submit" id="submitAceptarCanc" class="btn btn-primary"
                        style="padding-right:35px;padding-left:10px;margin-top:21px;">
                    Aceptar </button>
                <button type="button" id="submitCancelarCanc" class="btn btn-primary"
                        style="padding-right:35px;padding-left:10px;margin-top:21px;"
                        onclick='parent.$.colorbox.close(); return false;'>
                    Cancelar </button>

            </form>
        </div>
    </div>
</section>
</body>
</html>