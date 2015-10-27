<%@ page import="Logica.Locacion" %>
<%@ page import="Logica.Persona" %>
<%@ page import="Persistencia.LocacionDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Crear evento</title>

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
                    <li><a href="#">Evento</a></li>
                    <li class="active">Crear Evento</li>
                </ol>
            </div>
        </article>
    </section>
    <!-- Seccion de Pestañas-->
    <section id="pestanas2">
        <article>
            <nav class="navbar navbar-default navbar-static-top">
                <ul class="nav nav-tabs">
                    <li class="active"><a>Crear Evento</a></li>
                    <li><a href="ConsultarEvento.jsp">Consultar Evento</a></li>
                </ul>
            </nav>
        </article>
    </section>

    <!-- Seccion de contenido-->
    <section id="contenido2">
        <h4>Crear Evento</h4><!-- Titulo principal -->

        <!-- Primer caja de texto -->
        <form action="/SvtCrearEvento" method="post" name="formulario3">
            <article id="nombre">
                <h5>Nombre</h5>
            </article>
            <article id="search1">
                <input type="text" class="form-control" placeholder="Nombre Evento" required name="nombre">
            </article>

            <!-- Segunda caja de texto -->
            <article id="FechaInicio">
                <h5>Fecha Inicio</h5>
            </article>
            <article id="search2">
                <input type="date" class="form-control" required name="fechaInicio">
            </article>

            <!-- Tercera caja de texto -->
            <article id="FechaFin">
                <h5>Fecha Fin</h5>
            </article>
            <article id="search3">
                <input type="date" class="form-control" placeholder="Ingrese el texto." required name="fechaFin">
            </article>
            <!-- Cuarta caja de texto -->
            <article id="descripcion">
                <h5>Descripción</h5>
            </article>
            <article id="search5">
                <input type="text" class="form-control" name="descripcion">
            </article>

            <!-- Quinta caja de texto -->
            <article id="lugar">
                <h5>Lugar</h5>
            </article>
            <article id="search6">

                <select name="lugarCb" class="form-control">
                    <%
                        LocacionDao locacionDao = new LocacionDao();
                        ArrayList<Locacion> locacion = (ArrayList) locacionDao.obtenerListaLocaciones();
                        session.setAttribute("locaciones", locacion);
                        System.out.println(locacion.size() + "dfghjfghasa232");
                        if (locacion != null) {

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

            <article id="btnCrear">
                <button type="submit" class="btn btn-success"> <!-- Tamaño -->
                    <span class="glyphicon glyphicon-pushpin" aria-hidden="true"></span> Crear Evento <!-- Icono y palabra -->

            </article>
        </form>
    </section>

    <!-- Divicion para el color de la informacion adicional de la pagina -->
    <section id="divi">
    </section>

    <!-- Informacion adicional del sindicato (Menu, Registrarse,...) -->
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
            <h4>Información de contacto</h4>
            <h5> Avenida Central del Norte 39 - 115 </h5>
            <h5> Tunja - Boyaca </h5>
            <h5> Tel. 422174 Ext. 1500</h5>
        </article>
    </section>

    <!-- El pie de pagina donde esta el copyright -->
    <footer>
        <p>
            © Todos los derechos reservados. Tunja – Ciudad Universitaria – Carretera Central del Norte Tel. 422174 Ext.
            1500 </br>
            Desarrollado por Edgar Meneses, Diana Gonzalez, Leidy Puerto
        </p>
    </footer>
</section>
<!--Sección que contiene la ventana que aparece cuando se da la opcion de editar-->
<section id="ventanaEmergente">
    <div id='inline_content'>
        <div id="login-content2">
            <form action="/SvtEditarCabania" method="post" name="formularioEdicion">


                <label id="idCabania">Número Cabaña: </label>
                <input id="cabaniaId" type="numeric" name="cabaniaId">

                <input id="valorNocheVentana" type="text" name="valor" placeholder="Valor">
                <input id="cantidadVentana" type="number" name="cantidad" placeholder="cantidad">

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