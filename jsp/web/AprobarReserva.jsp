<%@ page contentType="text/html;charset=UTF-8" language="java"
         import="java.sql.Connection" import="java.sql.DriverManager" import="java.sql.ResultSet"
         import="java.sql.Statement" import="java.sql.SQLException"%>
<%@ page import="Logica.Persona" %>
<%@ page import="Persistencia.ReservaDao" %>
<%@ page import="Logica.Reserva" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Persistencia.InformacionReservaDao" %>
<%@ page import="Logica.InformacionReserva" %>
<%@ page import="Logica.EstadoReserva" %>

<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <title>Aprobar Reserva</title>

    <!-- Estilos de la pagina -->
    <link rel="stylesheet" href="/Presentacion/estilos/estilos.css">
    <!-- Tipo de letra de google -->
    <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Handlee' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Boogaloo' rel='stylesheet' type='text/css'>

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
                rows[i].onclick = function () {
                    var aux = document.getElementById("tabla_uno").rows[this.rowIndex].cells[0].innerHTML;
                    auxiliar = aux;
                }
            }
            return auxiliar;
        }

    </script>

</head>
<body>

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
                    <li><a href="#">Reservas</a></li>
                    <li class="active">Aprobar Reserva</li>
                </ol>
            </div>
        </article>
    </section>
    <!-- Seccion de Pestañas-->
    <section id="pestanas2">
        <article>
            <nav class="navbar navbar-default navbar-static-top">
                <ul class="nav nav-tabs">
                    <li><a href="CrearReservaCabania.jsp">Crear Mi Reserva</a></li>
                    <li><a href="EditarReservaAdmin.jsp">Editar Mis Reservas</a></li>
                    <li class="active"><a>Aprobar Reserva</a></li>
                    <li><a href="ReservasAnuales.jsp">Listar reserva anualmente</a></li>
                </ul>
            </nav>
        </article>
    </section>
    <!-- Seccion de contenido (tabla, link y paginacion)-->
    <section id="contenidoReservaA">
        <h4>Aprobar Reservas</h4>

        <article id="filtros">

            <form action="/SvtReservasFiltros" method="post">
                <article id="CedulaBusqueda">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Ingrese la cedula" name="cedula">
                    </div><!-- /input-group -->
                </article>
        
                <article id="fechaSolicitud1">
                    <input type="date" class="form-control" placeholder="Ingrese el texto." name="fechaFin">
                </article>

            <span class="input-group-btn" id="btnBusqueda">
                  <!-- Boton para la busqueda de la iamgen -->
                <button type="submit" class="btn btn-default" aria-label="Left Align">
                    <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                </button>
              </span>
            </form>
        </article>

        <article id="lista">
            <table class="table" id="tabla_uno"
                   onclick="document.getElementById('reservaId2').value = tomarValor();
                   document.getElementById('reservaId3').value = tomarValor();">
                <thead>
                <!-- titulos de la tabla -->
                <tr>
                    <th>Número de<br> Reserva</th>
                    <th>Cedula</th>
                    <th>Tipo Servicio</th>
                    <th>Fecha de Inicio</th>
                    <th>Fecha de Fin</th>
                    <th>Cantidad <br> personas</th>
                    <th>Estado Reserva</th>
                    <th>Aprobar</th>
                    <th>Rechazar</th>
                </tr>
                </thead>
                <tbody>

                <%
                    ReservaDao reservaDao = new ReservaDao();
                    ArrayList<Reserva> listaMisReservas = (ArrayList)request.getAttribute("reservas");
                    if(listaMisReservas !=null){
                        InformacionReservaDao informacionReservaDao = new InformacionReservaDao();
                        for(int i = 0; i < listaMisReservas.size(); i++) {

                            InformacionReserva informacionReserva = informacionReservaDao.
                                    obtenerInfo(listaMisReservas.get(i).getIdReserva());

                %>
                <tr>

                    <td><%= listaMisReservas.get(i).getIdReserva()%> </td>
                    <td><%= listaMisReservas.get(i).getPersona().getCedula()%> </td>
                    <td><%= listaMisReservas.get(i).getTipoServicio().toString()%></td>
                    <td><%= informacionReserva.getFechaInicioReserva()%></td>
                    <td><%= informacionReserva.getFechaFinReserva()%></td>
                    <td><%= listaMisReservas.get(i).getCantidadPersonas()%></td>
                    <td><%= listaMisReservas.get(i).getEstadoReserva()%></td>

                    <td><img src="/Presentacion/imagenes/ok.png" id="imagAprobar" title="Aprobar">

                    </td>
                    <td><img src="/Presentacion/imagenes/mal.png" id="imagRechazar" title="Rechazar">
                    </td>
                </tr>
                <%
                    }
                }
                else{
                    listaMisReservas = reservaDao.consultarReservas();
                    if(listaMisReservas !=null){
                        InformacionReservaDao informacionReservaDao = new InformacionReservaDao();

                        for(int i = 0; i < listaMisReservas.size(); i++) {

                            InformacionReserva informacionReserva = informacionReservaDao.
                                    obtenerInfo(listaMisReservas.get(i).getIdReserva());

                %>

                <tr>

                    <td><%= listaMisReservas.get(i).getIdReserva()%> </td>
                    <td><%= listaMisReservas.get(i).getPersona().getCedula()%> </td>
                    <td><%= listaMisReservas.get(i).getTipoServicio().toString()%></td>
                    <td><%= informacionReserva.getFechaInicioReserva()%></td>
                    <td><%= informacionReserva.getFechaFinReserva()%></td>
                    <td><%= listaMisReservas.get(i).getCantidadPersonas()%></td>
                    <td><%= listaMisReservas.get(i).getEstadoReserva()%></td>

                    <td><img src="/Presentacion/imagenes/ok.png" id="imagAprobar" title="Aprobar" class='inline'
                             href="#inline_content2" onclick="ventana3()">

                    </td>
                    <td><img src="/Presentacion/imagenes/mal.png" id="imagRechazar" title="Rechazar" class='inline'
                             href="#inline_content3" onclick="ventana4()">

                    </td>
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

    <!-- Division para el color de la informacion adicional de la pagina -->
    <section id="divi">
    </section>

    <!-- Informacion adicional del sindicato (Menu, Registrarse,...) -->
    <section id="informacion">
        <article id="inf1"> <!-- Seccion Menu -->
            <h4>Menu</h4>
            <h5> <button type="button" class="btn btn-link">Nosotros</button> </h5>
            <h5> <button type="button" class="btn btn-link">Junta Directiva</button> </h5>
            <h5> <button type="button" class="btn btn-link">Contáctenos</button> </h5>
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
<section id="ventanaEmergente">
    <div id='inline_content2' >
        <div id="login-contentCancelar">
            <form action="/SvtAprobar" method="post" name="formularioEdicion">


                <label id="IdReserva" >Desea aprobar la reserva número: </label>
                <input id="reservaId2" type="numeric" name="reserva" readonly>

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

<section id="ventanaEmergente">
    <div id='inline_content3' >
        <div id="login-contentRechazar">
            <form action="/SvtRechazar" method="post" name="formularioEdicion">


                <label id="IdReserva" >Desea rechazar la reserva número: </label>
                <input id="reservaId3" type="numeric" name="reserva" readonly>

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