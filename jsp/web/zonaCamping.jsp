<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Autor: Diana Gonzalez, Leidy Puerto, Edgar Meneses -->
<!DOCTYPE html>
<html lang="es"> <!-- Inicio pagina html5 -->
<head> <!-- Lo que es importante para tener en la pagina -->

    <meta charset="UTF-8">
    <!-- Palabras clave -->
    <meta name="keywords" content="sindraoficiales ">
    <!-- Descripcion -->
    <meta name="description" content="cabañas,reservas, moniquira,psicinas">
    <!-- Referencia de imagenes de diseño
    <a href="http://www.freepik.com/free-photos-vectors/background">Background vector designed by Freepik</a> -->
    <!-- Icono de la ventana-->
    <link rel="shortcut icon" type="image/x-icon" href="/Presentacion/imagenes/logo.png">

    <meta name="viewport" content="width=device-width; initial-scale=1.0">
    <title> zonaCamping </title>

    <!-- Estilos de la pagina -->

    <link rel="stylesheet" href="Presentacion/estilos/estilos.css">
    <!-- Tipo de letra de google -->
    <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Nunito' rel='stylesheet' type='text/css'>

    <!-- Estilos CSS vinculados -->
    <link href="Presentacion/estilos/css/bootstrap.min.css" rel="stylesheet">


    <script src="Presentacion/angular.min.js"></script>

    <!-- Script necesario para hacer que la ventana de login aparezca-->
    <script src="jquery.js"></script>
    <script src="Presentacion/estilos/funciones/funcion.js"></script>
    <script>
        $(function () {
            $('#login').click(function () {
                $(this).next('#login-content').slideToggle();
                $(this).ToggleClass('active');


            });
        });
    </script>

</head>

<body> <!-- Lo que tiene la pagina -->
<!-- Js vinculados -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script src="Presentacion/estilos/js/bootstrap.min.js"></script>


<!-- Contenedor que tiene las secciones y aeticle de la pagina -->
<section id="contenedor">
    <!-- Primera cabecera (inicio,ingresar,...)  -->
    <header>
        <!-- Boton ingresar -->
        <nav class="acceder">
            <article id="inicio1">

                <button type="button" id="login" class="btn btn-link"
                        style="padding-right:35px;padding-left:10px;margin-top:21px;"> <!-- Tamaño -->
                    <span class="glyphicon glyphicon-user" aria-hidden="true"></span> Ingresar<!-- Icono y palabra -->
                </button>
                <div id="login-content">
                    <form action="/SvtLogin" method="post">


                        <input id="usuario" type="number" name="usuario" placeholder="Usuario" required>
                        <input id="password" type="password" name="contrasenia" placeholder="Contraseña" required>

                        <button type="submit" id="submit" class="btn btn-primary"
                                style="padding-right:35px;padding-left:10px;margin-top:35px;">
                            Ingresar
                        </button>
                        <button type="button" id="submitRegistrar" class="btn btn-primary"
                                style="padding-right:35px;padding-left:5px;margin-top:35px;"
                                onClick="location.href='/registrarse.jsp'"> <!-- Tamaño -->
                            Registrarse
                        </button>
                    </form>

                </div>
            </article>
        </nav>
        <!-- Boton Contactenos -->
        <article id="inicio2">
            <button type="button" class="btn btn-link" style="margin-top:21px;" onclick="location.href=
            '#informacion'"> <!-- Tamaño -->
                <span class="glyphicon glyphicon-earphone" aria-hidden="true"></span> Contáctenos
                <!-- Icono y palabra -->
            </button>
        </article>
        <!-- Boton Inicio -->
        <article id="inicio4">
            <button type="button" class="btn btn-link" style="padding-right:55px;padding-left:10px;margin-top:21px;"
                    onclick="location.href='index.jsp'"> <!-- Tamaño -->
                <span class="glyphicon glyphicon-home" aria-hidden="true"></span> Inicio <!-- Icono y palabra -->
            </button>
        </article>
    </header>

    <!-- Segunda cabecera con los logos del sindicato y la uptc -->
    <section id="logo">
        <img src="Presentacion/imagenes/cabecera.jpg" alt="logos.png"> <!-- Importar la imagen -->

    </section>

    <!-- Tercera cabecera con los servicios que prestan el sindicato -->
    <section id="servicios">
        <ul class="nav nav-pills"> <!-- Para la navegacion -->
            <li role="presentation" style="padding-right:40px;padding-left:120px;margin-top:0px;">
                <!-- Tamaño de los item -->
                <a class="ghost" href="/Catalogo.jsp"><h3><font color=#34495E>Cabañas</font></h3></a></li>
            <!-- Nombre y color de las palabras -->
            <li role="presentation" style="padding-right:40px;padding-left:120px;margin-top:0px;">
                <a class="ghost" href="/zonaCamping.jsp"><h3><font color=#34495E>Zonas de Camping</font></h3></a></li>
        </ul>
    </section>

    <!-- Catalogo del camping -->
    <section id="catalogoZC">
        <!-- Titulo principal -->
        <h2>Catalogo zona de camping</h2>
        <article id="precioZC">
            <article id="valoresZC">
                <h3>Valor del camping</h3>

                <p><strong>Valor por noche:</strong></br>
                    <strong>Costo: </strong>$20.000
                </p>
            </article>
        </article>
        <!-- Galerria de imagenes de camping -->
        <article id="GaleriaZ">
            <div id="imgenesGZ" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#imgenesGZ" data-slide-to="0" class="active"></li>
                    <li data-target="#imgenesGZ" data-slide-to="1"></li>
                    <li data-target="#imgenesGZ" data-slide-to="2"></li>
                    <li data-target="#imgenesGZ" data-slide-to="3"></li>
                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner" role="listbox">
                    <div class="item active">
                        <img src="Presentacion/imagenes/GFotoZC1.JPG" alt="GFotoZC1.JPG">

                        <div class="carousel-caption">
                        </div>
                    </div>
                    <div class="item">
                        <img src="Presentacion/imagenes/GFotoZC2.JPG" alt="GFotoZC2.JPG">

                        <div class="carousel-caption">
                        </div>
                    </div>
                    <div class="item">
                        <img src="Presentacion/imagenes/GFotoZC3.JPG" alt="GFotoZC3.JPG">

                        <div class="carousel-caption">
                        </div>
                </div>

                <!-- Controls -->
                <a class="left carousel-control" href="#imgenesGZ" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#imgenesGZ" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
            </div>
        </article>

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
            <h4></br>Informacion de contacto</h4>
            <h5> Avenida Central del Norte 39 - 115 </br>
                Tunja - Boyaca </br>
                Tel. 422174 Ext. 1500</h5>
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
<!-- Ventana Emergente que debe aparecer si el usuario no se ha logueado y desea realizar una reserva

<section id="ventanaEmergenteZC">

    <div id='inline_content'>
        <div id="login-content5">
            <form>

                <input id="usuarioVentana" type="text" name="usuario" placeholder="Usuario" required>
                <input id="passwordVentana" type="password" name="contrasenia" placeholder="Contraseña" required>

                <button type="button" id="submitEntrarVentana" class="btn btn-primary"
                        style="padding-right:35px;padding-left:10px;margin-top:21px;">
                    Ingresar
                </button>
                <button type="button" id="submitRegistrarVentana" class="btn btn-primary"
                        style="padding-right:35px;padding-left:10px;margin-top:21px;"
                        onClick="location.href='registrarse.jsp'"> <!-- Tamaño
                    Registrarse
                </button>

            </form>

        </div>
    </div> -->
</section>
</body>
</html>
<!-- Fin pagina html5 -->