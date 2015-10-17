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
    <title> Eventos </title>

    <!-- Estilos de la pagina -->
    <link rel="stylesheet" href="/Presentacion/estilos/estilos.css">
    <!-- Tipo de letra de google -->
    <link href='https://fonts.googleapis.com/css?family=Courgette' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Handlee' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet' type='text/css'>
    <!-- Estilos CSS vinculados -->
    <link href="/Presentacion/estilos/css/bootstrap.min.css" rel="stylesheet">
    <link href="/Presentacion/estilos/css/estilos.css" rel="stylesheet">

    <script src="angular.min.js"></script>

    <!-- Script necesario para hacer que la ventana de login aparezca-->
    <script src="jquery.js"></script>


</head>

<body> <!-- Lo que tiene la pagina -->
<!-- Js vinculados -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="/Presentacion/estilos/js/responsive.js"></script>
<script src="/Presentacion/estilos/js/bootstrap.min.js"></script>

<!-- Contenedor que tiene las secciones y aeticle de la pagina -->
<section id="contenedor2">
    <!-- Primera cabecera (inicio,ingresar,...)  -->
    <header>
        <!-- Boton ingresar -->
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
                <a href="Catalogo.jsp"><h3><font color=#000000>Cabañas</font></h3></a></li> <!-- Nombre y color de las palabras -->
            <li role="presentation" style="padding-right:40px;padding-left:120px;margin-top:0px;">
                <a href="#"><h3><font color=#000000>Zonas de Camping</font></h3></a></li>
            <li role="presentation" style="padding-right:40px;padding-left:120px;margin-top:0px;">
                <a href="Eventos.jsp"><h3><font color=#000000>Eventos</font></h3></a></li>
        </ul>
    </section>

    <!-- Catalogo de las Eventos -->
    <section id="catalogo">
        <!-- Titulo principal -->
        <h4>Eventos</h4>
        <!-- Evento N°1, con la imagen, descripcion y el boton -->
        <article id="cab1"> <!-- Seccion Menu -->
            <img id="ev1" src="/Presentacion/imagenes/futbol.png" alt="GFoto1.JPG"><!-- Importar la imagen -->
            <h5>Evento N°1</h5>
            <h5>Nombre: </br>
                Fecha Inicio: </br>
                Fecha Fin: </br>
                Lugar: </br>
                Dirección: </br>
            </h5>
            
        </article>


        <!-- Evento N°2, con la imagen, descripcion y el boton -->
        <article id="cab2"> <!-- Seccion Menu -->
            <img id="ev2" src="/Presentacion/imagenes/futbol.png" alt="GFoto1.JPG"><!-- Importar la imagen -->
            <h5>Evento N°2</h5>
            <h5>Nombre: </br>
                Fecha Inicio: </br>
                Fecha Fin: </br>
                Lugar: </br>
                Dirección: </br>
            </h5>
            
        </article>
        <!-- Evento N°3, con la imagen, descripcion y el boton -->
        <article id="cab3"> <!-- Seccion Menu -->
            <img id="ev3" src="/Presentacion/imagenes/futbol.png" alt="GFoto1.JPG"><!-- Importar la imagen -->
            <h5>Evento N°3</h5>
            <h5>Nombre: </br>
                Fecha Inicio: </br>
                Fecha Fin: </br>
                Lugar: </br>
                Dirección: </br>
            </h5>
            
        </article>
        <!-- Evento N°4, con la imagen, descripcion y el boton -->
        <article id="cab4"> <!-- Seccion Menu -->
            <img id="ev4" src="/Presentacion/imagenes/futbol.png" alt="GFoto1.JPG"><!-- Importar la imagen -->
            <h5>Evento N°4</h5>
            <h5>Nombre: </br>
                Fecha Inicio: </br>
                Fecha Fin: </br>
                Lugar: </br>
                Dirección: </br>
            </h5>
            
        </article>
        <!-- Evento N°5, con la imagen, descripcion y el boton -->
        <article id="cab5"> <!-- Seccion Menu -->
            <img id="ev5" src="/Presentacion/imagenes/futbol.png" alt="GFoto1.JPG"><!-- Importar la imagen -->
            <h5>Evento N°5</h5>
            <h5>Nombre: </br>
                Fecha Inicio: </br>
                Fecha Fin: </br>
                Lugar: </br>
                Dirección: </br>
            </h5>
            
        </article>
        <!-- Evento N°6, con la imagen, descripcion y el boton -->
        <article id="cab6"> <!-- Seccion Menu -->
            <img id="ev6" src="/Presentacion/imagenes/futbol.png" alt="GFoto1.JPG"><!-- Importar la imagen -->
            <h5>Evento N°6</h5>
            <h5>Nombre: </br>
                Fecha Inicio: </br>
                Fecha Fin: </br>
                Lugar: </br>
                Dirección: </br>
            </h5>
            
        </article>
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

</section>
</body>
</html> <!-- Fin pagina html5 -->