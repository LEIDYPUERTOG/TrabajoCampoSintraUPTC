<%@ page import="Logica.InformacionReserva" %>
<%@ page import="Logica.Persona" %>
<%@ page import="Logica.Reserva" %>
<%@ page import="Persistencia.InformacionReservaDao" %>
<%@ page import="Persistencia.ReservaDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.GregorianCalendar" %>
<%@ page import="java.sql.Date" %>
<%@ page import="Persistencia.CabaniaDao" %>
<%@ page import="Logica.Cabania" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Autor: Diana Gonzalez, Leidy Puerto, Edgar Meneses -->
<!DOCTYPE html>
<html lang="es"> <!-- Inicio pagina html5 -->
<head> <!-- Lo que es importante para tener en la pagina -->
    <meta charset="UTF-8">
    <!-- Referencia de imagenes de diseño
    <a href="http://www.freepik.com/free-photos-vectors/background">Background vector designed by Freepik</a> -->
    <!-- Icono de la ventana-->
    <link rel="shortcut icon" type="image/x-icon" href="/Presentacion/imagenes/logo.png">
    <meta name="viewport" content="width=device-width; initial-scale=1.0">
    <title> Editar Reserva </title>

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

    <!-- Tercera cabecera con los servicios que prestan el sindicato -->
    <section id="servicios">
        <ul class="nav nav-pills"> <!-- Para la navegacion -->
            <li role="presentation" style="padding-right:40px;padding-left:120px;margin-top:0px;">
                <!-- Nombre y color de las palabras -->
                <a href="ReservarCabaniaUsuario.jsp"><h3><font color=#34495E>Realizar Reserva</font></h3></a>
            </li>
            <li role="presentation" style="padding-right:40px;padding-left:120px;margin-top:0px;">
                <!-- Nombre y color de las palabras -->
                <a class="ghost" href="/Eventos.jsp"><h3><font color=#34495E>Eventos</font></h3></a>

            </li>
        </ul>
    </section>

    <section id="contenidoReservaC">
        <h4>Editar Cabaña</h4><!-- Titulo principal -->

        <article id="lista">

            <table class="table" id="tabla_uno"
                   onclick=" document.getElementById('reservaId').value = tomarValor();
                   document.getElementById('reservaId2').value = tomarValor();">

                <thead>
                <!-- titulos de la tabla  idReserva = tomarValor()-->
                <tr>
                    <th>Número<br>Reserva</th>
                    <th>FechaSolicitud</th>
                    <th>Fecha Inicio</th>
                    <th>Fecha Fin</th>
                    <th>Estado<br>reserva</th>
                    <th>Valor</th>
                    <th>Editar</th>
                    <th>Cancelar</th>
                </tr>
                </thead>
                <tbody>
                <%
                    ReservaDao reservaDao = new ReservaDao();
                    ArrayList<Reserva> listaMisReservas = reservaDao.consultarReservaAfiliado(persona.getCedula());
                    if(listaMisReservas !=null){
                        InformacionReservaDao informacionReservaDao = new InformacionReservaDao();
                        for(int i = 0; i < listaMisReservas.size(); i++) {

                            InformacionReserva informacionReserva = informacionReservaDao.
                                    obtenerInfo(listaMisReservas.get(i).getIdReserva());
                %>

                <tr>

                    <td><%= listaMisReservas.get(i).getIdReserva()%> </td>
                    <td><%= listaMisReservas.get(i).getFechaSolicitud()%></td>
                    <td><%= informacionReserva.getFechaInicioReserva()%></td>
                    <td><%= informacionReserva.getFechaFinReserva()%></td>
                    <td><%= listaMisReservas.get(i).getEstadoReserva()%></td>

                    <%int valor = 0;

                        if(listaMisReservas.get(i).getTipoServicio().toString().equalsIgnoreCase("CABANIA")){
                            if(listaMisReservas.get(i).getPersona().getTipoUsuario().toString().equalsIgnoreCase("Afiliado")){
                                valor = listaMisReservas.get(i).getCantidadPersonas() * 90000;
                            }
                            else {
                                valor = listaMisReservas.get(i).getCantidadPersonas() * 160000;
                            }

                        }
                        else{
                            valor = listaMisReservas.get(i).getCantidadPersonas() * 20000;
                        }
                    %>
                    <td><%= valor%></td>

                    <td><img src="/Presentacion/imagenes/editar.png" id="imagEditar" title="Editar" class='inline'
                             href="#inline_content" onclick="ventana2()">

                    </td>
                    <td>
                        <img src="/Presentacion/imagenes/suspender.png" id="imagEditar" title="Editar" class='inline'
                             href="#inline_content2" onclick="ventana3()">
                    </td>
                </tr>
                <%
                        }
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
    <div id='inline_content' >
        <div id="login-content5">
            <form action="/SvtEditarReserva" method="post" name="formularioEdicion">

                <label id="IdReserva">Número de reserva</label>
                <input id="reservaId" type="numeric" name="reserva" readonly>

                <%GregorianCalendar c = new GregorianCalendar();
                    Date fechaSolicitud = new Date(c.getTimeInMillis());%>
                <label id="lblFecha1">Fecha Inicio</label>
                <input id="fecha1Ventana" type="date" name="fechaInicioNueva" placeholder="fecha Inicio"
                       min="<%=fechaSolicitud%>">
                <label id="lblFecha2">Fecha Fin</label>
                <input id="fecha2Ventana" type="date" name="FechaFinNueva" placeholder="Fecha Fin"
                       min="<%=fechaSolicitud%>"  max="2017-12-31">

                <label id="lblTSer">Tipo de Servicio</label>

                <select name="Servicio" class="form-control" id="Servicio">
                    <option value=""></option>
                    <option value="Cabania">Cabaña</option>
                    <option value="Camping">Camping</option>
                </select>


                <label id="lblIdCabania">Número cabaña</label>

                <select name="cabania" class="form-control" id="Selcabania">
                    <%
                        CabaniaDao cabaniaDao = new CabaniaDao();
                        ArrayList<Cabania> cabanias = cabaniaDao.obtenerCabaniasActivas();
                    %>
                    <option value=""></option>
                    <%
                        for(int i = 0; i < cabanias.size(); i++){
                    %>

                    <option value="<%=cabanias.get(i).getId_servicio()%>"><%=cabanias.get(i).getId_servicio()%></option>
                    <%
                        }
                    %>

                </select>


                <button type="submit" id="submitA" class="btn btn-primary"
                        style="padding-right:35px;padding-left:10px;margin-top:21px;">
                    Aceptar </button>
                <button type="button" id="submitC" class="btn btn-primary"
                        style="padding-right:35px;padding-left:10px;margin-top:21px;"
                        onclick='parent.$.colorbox.close(); return false;'>
                    Cancelar </button>

            </form>

        </div>
    </div>
</section>


<section id="ventanaEmergente">
    <div id='inline_content2' >
        <div id="login-contentCancelar">
            <form action="/SvtCancelar" method="post" name="formularioEdicion">

                <label id="IdReserva">Desea cancelar la reserva número: </label>
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
</body>
</html>
<!-- Fin pagina html5 -->