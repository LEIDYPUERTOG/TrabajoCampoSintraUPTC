<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Autor: Diana Gonzalez, Leidy Puerto, Edgar Meneses -->
<!DOCTYPE html>
<html lang="es"> <!-- Inicio pagina html5 -->
<head> <!-- Lo que es importante para tener en la pagina -->
    <meta charset="UTF-8">
    <!-- Palabras clave -->
    <meta name="keywords" content="sindicato ">
    <!-- Descripcion -->
    <meta name="description" content="sadefrgth ">

    <meta name="viewport" content="width=device-width; initial-scale=1.0">
    <title> Bienvenido </title>

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

    <!-- Tercera cabecera con los servicios que prestan el sindicato -->
    <section id="servicios">
        <ul class="nav nav-pills"> <!-- Para la navegacion -->
            <li role="presentation" style="padding-right:40px;padding-left:120px;margin-top:0px;"> <!-- Tamaño de los item -->
                <a href="ReservarCabaniaUsuario.jsp"><h3><font color=#000000>Realizar Reserva
                </font></h3></a>

            </li> <!-- Nombre y color de las palabras -->
            <li role="presentation" style="padding-right:40px;padding-left:120px;margin-top:0px;">
                <a href="EditarReservaUsuario.jsp"><h3><font color=#000000>Editar Reserva</font></h3></a></li>

        </ul>
    </section>

    <section id="contenidoReservaC">
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

            <!-- Tercera caja de texto -->
            <article id="cantidadP">
                <h5>Cantidad de personas</h5>
            </article>
            <article id="search3">
                <input type="text" class="form-control" placeholder="Ingrese el texto." required name="cantidad">
            </article>
            <!-- Cuadro de Acompañantes -->
            <article id="acompa">
                <h4>Acompañantes</h4> <!-- Titulo Principal -->
                <!-- Tabla con la cedula y nombre-->
                <table class="table">
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


    <!-- Informacion adicional del sindicato (Menu, Registrarse,...) -->
    <article id="infoUsuario">
        <!-- Division para el color de la informacion adicional de la pagina -->
        <section id="divi">
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
                <h4>Informacion de contacto</h4>
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
    </article>
</section>
</body>
</html> <!-- Fin pagina html5 -->