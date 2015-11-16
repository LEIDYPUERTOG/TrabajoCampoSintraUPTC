<%@ page import="Logica.Persona" %>
<%@ page import="java.util.GregorianCalendar" %>
<%@ page import="java.sql.Date" %>
<%@ page import="Persistencia.CabaniaDao" %>
<%@ page import="Logica.Cabania" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <!-- Referencia de imagenes de diseño
    <a href="http://www.freepik.com/free-photos-vectors/background">Background vector designed by Freepik</a> -->
    <!-- Icono de la ventana-->
    <link rel="shortcut icon" type="image/x-icon" href="/Presentacion/imagenes/logo.png">
    <title>Reservar Cabaña</title>

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

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
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

    <section id="panelAdministracion3">
        <article id="lblTitulo">
            <label>Panel de administración</label>
        </article>

        <article id="cabania">
            <a href="CrearCabania.jsp"><img src="/Presentacion/imagenes/cabania.png" id="imag1" title="Cabaña"></a>
        </article>

        <article id="eventos">
            <a href="CrearEvento.jsp"><img src="/Presentacion/imagenes/evento.png" id="imag2" title="Eventos"></a>
        </article>

        <article id="reserva">
            <a href="CrearReservaCabania.jsp"><img src="/Presentacion/imagenes/reservas.png" id="imag3"
                                                   title="Reservas"></a>
        </article>

        <article id="usuario">
            <a href="CrearUsuario.jsp"><img src="/Presentacion/imagenes/usuario.png" id="imag4" title="Usuario"></a>
        </article>

    </section>
    <!-- Seccion de navegacion-->
    <section id="navegacion">
        <article class="nave">
            <div>
                <ol class="breadcrumb">
                    <li><a href="#">Reservas</a></li>
                    <li class="active">Crear Reserva</li>
                </ol>
            </div>
        </article>
    </section>
    <!-- Seccion de Pestañas-->
    <section id="pestanas2">
        <article>
            <nav class="navbar navbar-default navbar-static-top">
                <ul class="nav nav-tabs">
                    <li class="active"><a>Crear Mi Reserva</a></li>
                    <li><a href="EditarReservaAdmin.jsp">Editar Mis Reservas</a></li>
                    <li><a href="AprobarReserva.jsp">Aprobar Reserva</a></li>
                    <li><a href="ReservasAnuales.jsp">Listar reserva anualmente</a></li>
                </ul>
            </nav>
        </article>
    </section>

    <!-- Seccion de contenido-->
    <section id="contenidoReservaR">
        <h4>Realizar Reservar</h4><!-- Titulo principal -->

        <form action="/SvtCrearReserva" method="post" name="formulario4">
            <!-- Primer caja de texto -->
            <article id="fechaI">
                <h5>Fecha inicio de la reserva </h5>
            </article>
            <article id="search1">
                <%GregorianCalendar c = new GregorianCalendar();
                    Date fechaSolicitud = new Date(c.getTimeInMillis());%>
                <input type="date" class="form-control" placeholder="Ingrese el texto." required name="fechaInicio"
                       min="<%=fechaSolicitud%>">
            </article>

            <!-- Segunda caja de texto -->
            <article id="fechaF">
                <h5>Fecha fin de la Reserva</h5>
            </article>
            <article id="search2">
                <input type="date" class="form-control" placeholder="Ingrese el texto." required name="fechaFin"
                       min="<%=fechaSolicitud%>"  max="2017-12-31">
            </article>

            <article id="CabaniaId">
                <h5>Numero Cabaña</h5>
            </article>
            <article id="searchId">
                <select name="cabania" class="form-control" id="cabania">
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
            </article>

            <!-- Tercera caja de texto -->
            <article id="cantidadP">
                <h5>Cantidad de personas</h5>
            </article>
            <article id="search3">
                <input type="number" class="form-control" placeholder="Ingrese el texto."
                       required name="cantidad" min="1" max="10">
            </article>

            <label id="lblPreg"><h5>Tipo Servicio: </h5></label>
            <label id = "rbtn" class="radio-inline">
                <input type="radio" name="inlineRadioOptions" id="Cabania" value="Cabania"
                       onclick="getRadioButtonSelectedValue(document.formulario.inlineRadioOptions)"> Cabaña
            </label>
            <label id = "rbtn2" class="radio-inline">
                <input type="radio" name="inlineRadioOptions" id="Camping" value="Camping"> Zona de Camping
            </label>

            <%
                System.out.println("En crear reserva cabania.jsp el valor de disponibilidad es "+
                    request.getAttribute("disponibilidad"));
            %>

            <!-- Cuadro de Acompañantes -->
            <article id="acompa">
                <h4>Acompañantes</h4> <!-- Titulo Principal -->
                <!-- Tabla con la cedula y nombre-->
                <table class="table" id="tabla">
                    <thead>
                    <!-- titulos de la tabla -->
                    <tr>
                        <th>Cedula</th>
                        <th>Nombre completo</th>
                    </tr>
                    </thead>
                    <tbody>


                    <!-- Primer componente -->
                    <tr>
                        <td>
                            <article id="searchC">
                                <input type="number" class="form-control" placeholder="Cedula" name="cedula1">
                            </article>
                        </td>
                        <td>
                            <article id="searchN">
                                <input type="text" class="form-control" placeholder="Nombre" name="nombre1">
                            </article>
                        </td>
                    </tr>
                    <!-- Segundo componente -->
                    <tr>
                        <td>
                            <article id="searchC">
                                <input type="number" class="form-control" placeholder="Cedula" name="cedula2">
                            </article>
                        </td>
                        <td>
                            <article id="searchN">
                                <input type="text" class="form-control" placeholder="Nombre" name="nombre2">
                            </article>
                        </td>
                    </tr>
                    <!-- Tercero componente -->
                    <tr>
                        <td>
                            <article id="searchC">
                                <input type="number" class="form-control" placeholder="Cedula" name="cedula3">
                            </article>
                        </td>
                        <td>
                            <article id="searchN">
                                <input type="text" class="form-control" placeholder="Nombre" name="nombre3">
                            </article>
                        </td>
                    </tr>
                    <!-- Cuarto componente -->
                    <tr>
                        <td>
                            <article id="searchC">
                                <input type="number" class="form-control" placeholder="Cedula" name="cedula4">
                            </article>
                        </td>
                        <td>
                            <article id="searchN">
                                <input type="text" class="form-control" placeholder="Nombre" name="nombre4">
                            </article>
                        </td>
                    </tr>
                    <!-- Quinto componente -->
                    <tr>
                        <td>
                            <article id="searchC">
                                <input type="number" class="form-control" placeholder="Cedula" name="cedula5">
                            </article>
                        </td>
                        <td>
                            <article id="searchN">
                                <input type="text" class="form-control" placeholder="Nombre" name="nombre5">
                            </article>
                        </td>
                    </tr>
                    <!-- Sexto componente -->
                    <tr>
                        <td>
                            <article id="searchC">
                                <input type="number" class="form-control" placeholder="Cedula" name="cedula6">
                            </article>
                        </td>
                        <td>
                            <article id="searchN">
                                <input type="text" class="form-control" placeholder="Nombre" name="nombre6">
                            </article>
                        </td>
                    </tr>
                    <!-- Septimo componente -->
                    <tr>
                        <td>
                            <article id="searchC">
                                <input type="number" class="form-control" placeholder="Cedula" name="cedula7">
                            </article>
                        </td>
                        <td>
                            <article id="searchN">
                                <input type="text" class="form-control" placeholder="Nombre" name="nombre7">
                            </article>
                        </td>
                    </tr>
                    <!-- Octavo componente -->
                    <tr>
                        <td>
                            <article id="searchC">
                                <input type="number" class="form-control" placeholder="Cedula" name="cedula8">
                            </article>
                        </td>
                        <td>
                            <article id="searchN">
                                <input type="text" class="form-control" placeholder="Nombre" name="nombre8">
                            </article>
                        </td>
                    </tr>
                    <!-- Noveno componente -->
                    <tr>
                        <td>
                            <article id="searchC">
                                <input type="number" class="form-control" placeholder="Cedula" name="cedula9">
                            </article>
                        </td>
                        <td>
                            <article id="searchN">
                                <input type="text" class="form-control" placeholder="Nombre" name="nombre9">
                            </article>
                        </td>
                    </tr>
                    <!-- Decimo componente -->
                    <tr>
                        <td>
                            <article id="searchC">
                                <input type="number" class="form-control" placeholder="Cedula" name="cedula10">
                            </article>
                        </td>
                        <td>
                            <article id="searchN">
                                <input type="text" class="form-control" placeholder="Nombre" name="nombre10">
                            </article>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <!-- Fin de la tabla -->
            </article>
            <!-- Fin del article -->

            <article id="btnCrearReserva">
                <button type="submit" class="btn btn-success btn-lg">
                    <span class="glyphicon glyphicon-bookmark" aria-hidden="true"></span> Reserva
                </button>
            </article>
        </form>
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
</body>
</html>
<!-- Fin pagina html5 -->