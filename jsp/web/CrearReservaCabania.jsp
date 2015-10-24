<%@ page import="Logica.Persona" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Reservar Cabaña</title>

    <!-- Estilos de la pagina -->
    <link rel="stylesheet" href="/Presentacion/estilos/estilos.css">
    <!-- Tipo de letra de google -->
    <link href='https://fonts.googleapis.com/css?family=Courgette' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Handlee' rel='stylesheet' type='text/css'>

    <!-- Estilos CSS vinculados -->

    <link href="/Presentacion/estilos/css/bootstrap.min.css" rel="stylesheet">
    <link href="/Presentacion/estilos/css/estilos.css" rel="stylesheet">

    <script src="Presentacion/angular.min.js"></script>
    <script src="Presentacion/jquery.js"></script>



</head>
<body>

<script src="/Presentacion/estilos/js/bootstrap.min.js"></script>

<script src="/Presentacion/estilos/js/responsive.js"></script>

<!-- Contenedor que tiene las secciones y aeticle de la pagina -->
<section id="contenedorReservaA">
    <!-- Primera cabecera (inicio,ingresar,...)  -->
    <header>
        <!-- Boton usuario -->
        <article id="inicio1">
            <div class="dropdown">
                <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                    <%
                        Persona persona = (Persona)session.getAttribute("persona");
                        session.setAttribute("persona",persona);
                        if(persona!=null){

                    %>
                    <%= persona.getNombre() %>
                    <%
                    }else{
                        Persona persona1 = (Persona)request.getAttribute("persona");
                        session.setAttribute("persona",persona1);
                    %>
                    <%= persona1.getNombre() %>
                    <%
                        }
                    %>
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                    <li><a href="CambiarContrasenia.jsp">Cambiar contraseña</a></li>
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
                    <li class="active">Crear Reserva</li>
                </ol>
            </div>
        </article>
    </section>
    <!-- Seccion de Pestañas-->
    <section id="pestanas2">
        <article>
            <nav class="navbar navbar-inverse" role="navigation">
                <ul class="nav nav-tabs">
                    <li><a href="CrearReservaCabania.jsp">Crear Mi Reserva</a></li>
                    <li><a href="EditarReservaAdmin.jsp">Editar Mis Reservas</a></li>
                    <li><a href="AprobarReserva.jsp">Aprobar Reserva</a></li>
                    <li><a href="ReservasAnuales.jsp">Listar reserva anualmente</a></li>
                </ul>
            </nav>
        </article>
    </section>

    <!-- Seccion de contenido-->
    <section id="contenidoReservaR">
        <h4>Reservar Cabaña</h4><!-- Titulo principal -->

        <form action="/SvtCrearReserva" method="post" name="formulario4">
            <!-- Primer caja de texto -->
            <article id="fechaI">
                <h5>Fecha inicio de la reserva </h5>
            </article>
            <article id="search1">
                <input type="date" class="form-control" placeholder="Ingrese el texto." required name="fechaInicio">
            </article>

            <!-- Segunda caja de texto -->
            <article id="fechaF">
                <h5>Fecha fin de la Reserva</h5>
            </article>
            <article id="search2">
                <input type="date" class="form-control" placeholder="Ingrese el texto." required name="fechaFin">
            </article>

            <article id="CabaniaId">
                <h5>Numero Cabaña</h5>
            </article>
            <article id="searchId">
                <input type="number" class="form-control" placeholder="Ingrese el numero de la cabaña"
                       required name="idCabania" min="1" max="6">
            </article>

            <!-- Tercera caja de texto -->
            <article id="cantidadP">
                <h5>Cantidad de personas</h5>
            </article>
            <article id="search3">
                <input type="number" class="form-control" placeholder="Ingrese el texto." required name="cantidad" min="1" max="10">
            </article>
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
                        <td><article id="searchC">
                            <input type="text" class="form-control" placeholder="Cedula" name="cedula1">
                        </article></td>
                        <td><article id="searchN">
                            <input type="text" class="form-control" placeholder="Nombre" name="nombre1">
                        </article></td>
                    </tr>
                    <!-- Segundo componente -->
                    <tr>
                        <td><article id="searchC">
                            <input type="text" class="form-control" placeholder="Cedula" name="cedula2">
                        </article></td>
                        <td><article id="searchN">
                            <input type="text" class="form-control" placeholder="Nombre" name="nombre2">
                        </article></td>
                    </tr>
                    <!-- Tercero componente -->
                    <tr>
                        <td><article id="searchC">
                            <input type="text" class="form-control" placeholder="Cedula" name="cedula3">
                        </article></td>
                        <td><article id="searchN">
                            <input type="text" class="form-control" placeholder="Nombre" name="nombre3">
                        </article></td>
                    </tr>
                    <!-- Cuarto componente -->
                    <tr>
                        <td><article id="searchC">
                            <input type="text" class="form-control" placeholder="Cedula" name="cedula4">
                        </article></td>
                        <td><article id="searchN">
                            <input type="text" class="form-control" placeholder="Nombre" name="nombre4">
                        </article></td>
                    </tr>
                    <!-- Quinto componente -->
                    <tr>
                        <td><article id="searchC">
                            <input type="text" class="form-control" placeholder="Cedula" name="cedula5">
                        </article></td>
                        <td><article id="searchN">
                            <input type="text" class="form-control" placeholder="Nombre" name="nombre5">
                        </article></td>
                    </tr>
                    <!-- Sexto componente -->
                    <tr>
                        <td><article id="searchC">
                            <input type="text" class="form-control" placeholder="Cedula" name="cedula6">
                        </article></td>
                        <td><article id="searchN">
                            <input type="text" class="form-control" placeholder="Nombre" name="nombre6">
                        </article></td>
                    </tr>
                    <!-- Septimo componente -->
                    <tr>
                        <td><article id="searchC">
                            <input type="text" class="form-control" placeholder="Cedula" name="cedula7">
                        </article></td>
                        <td><article id="searchN">
                            <input type="text" class="form-control" placeholder="Nombre" name="nombre7">
                        </article></td>
                    </tr>
                    <!-- Octavo componente -->
                    <tr>
                        <td><article id="searchC">
                            <input type="text" class="form-control" placeholder="Cedula" name="cedula8">
                        </article></td>
                        <td><article id="searchN">
                            <input type="text" class="form-control" placeholder="Nombre" name="nombre8">
                        </article></td>
                    </tr>
                    <!-- Noveno componente -->
                    <tr>
                        <td><article id="searchC">
                            <input type="text" class="form-control" placeholder="Cedula" name="cedula9">
                        </article></td>
                        <td><article id="searchN">
                            <input type="text" class="form-control" placeholder="Nombre" name="nombre9">
                        </article></td>
                    </tr>
                    <!-- Decimo componente -->
                    <tr>
                        <td><article id="searchC">
                            <input type="text" class="form-control" placeholder="Cedula" name="cedula10">
                        </article></td>
                        <td><article id="searchN">
                            <input type="text" class="form-control" placeholder="Nombre" name="nombre10">
                        </article></td>
                    </tr>
                    </tbody>
                </table> <!-- Fin de la tabla -->
            </article> <!-- Fin del article -->

            <article id="btnCrearReserva">
                <button type="submit" class="btn btn-warning">Reservar</button>
            </article>
        </form>
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
</section>

</body>
</html>