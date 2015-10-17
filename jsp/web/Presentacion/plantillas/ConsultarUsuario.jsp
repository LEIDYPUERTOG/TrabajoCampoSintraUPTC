<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Consultar Usuario</title>

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

    <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
    <script src="../jquery.colorbox.js"></script>

    <!--Script para poder hacer que aparezca la ventana emergente-->
    <script src="/Presentacion/estilos/funciones/funcion.js"></script>

</head>
<body>

<script src="/Presentacion/estilos/js/bootstrap.min.js"></script>

<script src="/Presentacion/estilos/js/responsive.js"></script>
<script src="/Presentacion/estilos/js/bootstrap.min.js"></script>

<!-- Contenedor que tiene las secciones y aeticle de la pagina -->
<section id="contenedorReservaA">
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
        <h1> <img src="/Presentacion/imagenes/cabecera.png" alt="logos.png"></h1> <!-- Importar la imagen -->
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
                    <li><a href="#">Usuario</a></li>
                    <li class="active">Consultar Usuario</li>
                </ol>
            </div>
        </article>
    </section>
    <!-- Seccion de Pestañas-->
    <section id="pestanas2">
        <article>
            <nav class="navbar navbar-inverse" role="navigation">
                <ul class="nav nav-tabs">
                    <li><a href="CrearUsuario.jsp">Crear Usuario</a></li>
                    <li><a href="#">Consultar Usuario</a></li>
                    <li><a href="AprobarReserva.jsp">Editar Usuario</a></li>
                </ul>
            </nav>
        </article>
    </section>

    <!-- Seccion de contenido (tabla, link y paginacion)-->
    <section id="contenidoReservaA">
        <h4>Consultar Usuario</h4>

        <article id="lblBusqueda">
            <h5>Documento Usuario</h5>
        </article>

        <article id="search8">
            <div class="col-lg-6">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="Ingrese el documento">
              <span class="input-group-btn">
                  <!-- Boton para la busqueda de la iamgen -->
                <button type="button" class="btn btn-default" aria-label="Left Align">
                    <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                </button>
              </span>
                </div><!-- /input-group -->
            </div><!-- /.col-lg-6 -->
            </div><!-- /.row -->
        </article>

        <article id="informacionEncontrada">
            <form>

                <article id="et1">
                    <div class="form-group">
                        <label for="lblCedula">Cédula</label>
                        <input type="text" class="form-control" id="cedula" disabled>
                    </div>
                </article>

                <article id="et2">
                    <div class="form-group">
                        <label for="lblNombre">Nombre y Apellidos</label>
                        <input type="text" class="form-control" id="nombre" disabled>
                    </div>
                </article>

                <article id="et3">
                    <div class="form-group">
                        <label for="TipoUsuario">Tipo de Usuario</label>
                        <input type="text" class="form-control" id="Tipo Usuario" disabled>
                    </div>
                </article>

            </form>
        </article>

    </section>
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
<!--Sección que contiene la ventana que aparece cuando se da la opcion de editar-->
<section id="ventanaEmergente">
    <div id='inline_content' >
        <div id="login-content4">
            <form>

                <label id="lblFecha1">Fecha Inicio</label>
                <input id="fecha1Ventana" type="date" name="fecha Inicio" placeholder="fecha Inicio" >
                <label id="lblFecha2">Fecha Fin</label>
                <input id="fecha2Ventana" type="date" name="Fecha Fin" placeholder="Fecha Fin">

                <button type="button" id="submitAceptarVentana" class="btn btn-primary"  style="padding-right:35px;padding-left:10px;margin-top:21px;">
                    Aceptar </button>
                <button type="button" id="submitCancelarVentana" class="btn btn-primary"  style="padding-right:35px;padding-left:10px;margin-top:21px;"
                        onclick='parent.$.colorbox.close(); return false;'>
                    Cancelar </button>

            </form>

        </div>
    </div>
</section>
</body>
</html>