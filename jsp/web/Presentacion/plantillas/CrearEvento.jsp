<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Crear evento</title>

    <!-- Estilos de la pagina -->
    <link rel="stylesheet" href="/Presentacion/estilos/estilos.css">
    <!-- Tipo de letra de google -->
    <link href='https://fonts.googleapis.com/css?family=Courgette' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Handlee' rel='stylesheet' type='text/css'>

    <!-- Estilos CSS vinculados -->
    <link href="/Presentacion/estilos/css/bootstrap.min.css" rel="stylesheet">
    <link href="/Presentacion/estilos/css/estilos.css" rel="stylesheet">

    <script src="../angular.min.js"></script>
    <script src="jquery.js"></script>

</head>
<body>

<script src="/Presentacion/estilos/js/bootstrap.min.js"></script>

<script src="/Presentacion/estilos/js/responsive.js"></script>
<script src="/Presentacion/estilos/js/bootstrap.min.js"></script>

<!-- Contenedor que tiene las secciones y aeticle de la pagina -->
<section id="contenedorRegistro">
    <!-- Primera cabecera (inicio,ingresar,...)  -->
    <header>
        <!-- Boton usuario -->
        <article id="inicio1">
            <div class="dropdown">
                <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                    Bienvenido
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                    <li><a href="#">Cambiar contraseña</a></li>
                    <li><a href="#">Cerrar Sesión</a></li>

                </ul>
            </div>

        </article>
        <!-- Boton Contactenos -->
        <article id="inicio2">
            <button type="button" class="btn btn-default"  style="margin-top:21px;"> <!-- Tamaño -->
                <span class="glyphicon glyphicon-earphone" aria-hidden="true"></span> Contáctenos <!-- Icono y palabra -->
            </button>
        </article>
        <!-- Boton Conozcanos -->
        <article id="inicio3">
            <button type="button" class="btn btn-default"  style="margin-top:21px;"> <!-- Tamaño -->
                <span class="glyphicon glyphicon-globe" aria-hidden="true"></span> Conozcanos <!-- Icono y palabra -->
            </button>
        </article>
        <!-- Boton Inicio -->
        <article id="inicio4">
            <button type="button" class="btn btn-default"  style="padding-right:55px;padding-left:10px;margin-top:21px;"> <!-- Tamaño -->
                <span class="glyphicon glyphicon-home" aria-hidden="true"></span> Inicio <!-- Icono y palabra -->
            </button>
        </article>
    </header>

    <!-- Segunda cabecera con los logos del sindicato y la uptc -->
    <section id="logo">
        <img src="/Presentacion/imagenes/cabecera.jpg" alt="logos.png"> <!-- Importar la imagen -->
    </section>


    <!-- Seccion de panel de administración -->

    <section id="panelAdministracion">
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
                    <li class="active">Crear Evento</li>
                </ol>
            </div>
        </article>
    </section>
    <!-- Seccion de Pestañas-->
    <section id="pestanas2">
        <article>
            <nav class="navbar navbar-inverse" role="navigation">
                <ul class="nav nav-tabs">
                    <li><a href="CrearEvento.jsp">Crear Evento</a></li>
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
            <article id="descripcion" >
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
                <select class="form-control">
                    <option value="1">Camara de Comercio</option>
                    <option value="2">Uptc</option>
                    <option value="3">Moniquira</option></select>
            </article>

            <article id="btnCrear">
                <button type="submit" class="btn btn-warning">Crear Evento</button>
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
</body>
</html>