<%@ page import="Logica.Persona" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <!-- Referencia de imagenes de diseño
    <a href="http://www.freepik.com/free-photos-vectors/background">Background vector designed by Freepik</a> -->
    <!-- Icono de la ventana-->
    <link rel="shortcut icon" type="image/x-icon" href="/Presentacion/imagenes/logo.png">
    <title>Crear cabaña</title>

    <!-- Estilos de la pagina -->
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

</head>

<body> <!-- Lo que tiene la pagina -->
<!-- Js vinculados -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="/Presentacion/estilos/js/responsive.js"></script>
<script src="/Presentacion/estilos/js/bootstrap.min.js"></script>


<!-- Contenedor que tiene las secciones y aeticle de la pagina -->
<section id="contenedorRegistroCC">
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
            <a href="CrearCabania.jsp"><img src="/Presentacion/imagenes/cabania.png" id="imag1" title="Cabaña"></a>
        </article>

        <article id="eventos">
            <a href="CrearEvento.jsp"><img src="/Presentacion/imagenes/evento.png" id="imag2" title="Eventos">
            </a>
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
                    <li><a href="#">Cabañas</a></li>
                    <li class="active">Crear Cabaña</li>
                </ol>
            </div>
        </article>
    </section>
    <!-- Seccion de Pestañas-->
    <section id="pestanas2">
        <article>
            <nav class="navbar navbar-default navbar-static-top">
                <ul class="nav nav-tabs">
                    <li class="active"><a>Crear Cabaña</a></li>
                    <li><a href="ConsultarCabania.jsp">Consultar Cabaña</a></li>
                </ul>
            </nav>
        </article>
    </section>

    <!-- Seccion de contenido-->
    <section id="contenido">
        <h4>Crear Cabaña</h4><!-- Titulo principal -->

        <form action="/SvtCrearCabania" method="post" name="formulario2">
            <!-- Primer caja de texto -->
            <article id="identificador">
                <h5>Identificador</h5>
            </article>
            <article id="search1">
                <input type="number" class="form-control" placeholder="Ingrese el texto." name="idCabania">
            </article>

            <!-- Segunda caja de texto -->
            <article id="capacidad">
                <h5>Capacidad Maxima</h5>
            </article>
            <article id="search2">
                <input type="number" class="form-control" placeholder="Ingrese el texto." name="capacidad" min="1"
                       max="10">
            </article>

            <!-- Tercera caja de texto -->
            <article id="valor">
                <h5>Valor dia</h5>
            </article>
            <article id="search3">
                <input type="text" class="form-control" placeholder="90000" name="valor" disabled>
            </article>
            <!-- Cuarta caja de texto -->
            <article id="ruta">
                <h5>Ruta de la foto</h5>
            </article>
            <article id="search4">
                <div class="col-lg-6">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Ingrese la ubicacion" name="ruta">
      <span class="input-group-btn">
          <!-- Boton para la busqueda de la iamgen -->
        <button type="submit" class="btn btn-default" aria-label="Left Align" disabled>
            <span class="glyphicon glyphicon-search" aria-hidden="true" aria-disabled="true"></span>
        </button>
      </span>
                    </div>
                    <!-- /input-group -->
                </div>
                <!-- /.col-lg-6 -->
                </div><!-- /.row -->
            </article>
            <article id="btnAgregar">
                <button type="submit" class="btn btn-success"> <!-- Tamaño -->
                    <span class="glyphicon glyphicon-plus" aria-hidden="true"></span> AGREGAR <!-- Icono y palabra -->

                </button>
            </article>
        </form>
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

</body>
</html>