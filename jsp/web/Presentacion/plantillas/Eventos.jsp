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

    <meta name="viewport" content="width=device-width; initial-scale=1.0">
    <title> Eventos </title>

    <!-- Estilos de la pagina -->
    <link rel="stylesheet" href="/Presentacion/estilos/estilos.css">
    <!-- Tipo de letra de google -->
    <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Handlee' rel='stylesheet' type='text/css'>
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
        <article id="inicio1">
            <div class="dropdown">
                <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                    Bienvenido
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                    <li><a> <span class="glyphicon glyphicon-lock" aria-hidden="true" href="#"></span>Cambiar contraseña</a></li>
                    <li><a> <span class="glyphicon glyphicon-log-out" aria-hidden="true" href="#"></span>Cerrar Sesión</a> </li>

                </ul>
            </div>

        </article>
        <!-- Boton Contactenos -->
        <article id="inicio2">
            <button type="button" class="btn btn-link"  style="margin-top:21px;"> <!-- Tamaño -->
                <span class="glyphicon glyphicon-earphone" aria-hidden="true"></span> Contáctenos <!-- Icono y palabra -->
            </button>
        </article>
        <!-- Boton Conozcanos -->
        <article id="inicio3">
            <button type="button" class="btn btn-link"  style="margin-top:21px;"> <!-- Tamaño -->
                <span class="glyphicon glyphicon-globe" aria-hidden="true"></span> Conozcanos <!-- Icono y palabra -->
            </button>
        </article>
        <!-- Boton Inicio -->
        <article id="inicio4">
            <button type="button" class="btn btn-link" style="padding-right:55px;padding-left:10px;margin-top:21px;"> <!-- Tamaño -->
                <span class="glyphicon glyphicon-home" aria-hidden="true"></span> Inicio <!-- Icono y palabra -->
            </button>
        </article>
    </header>

    <!-- Segunda cabecera con los logos del sindicato y la uptc -->
    <section id="logo">
        <h1> <img src="/Presentacion/imagenes/cabecera.jpg" alt="logos.png"></h1> <!-- Importar la imagen -->
    </section>

    <!-- Tercera cabecera con los servicios que prestan el sindicato -->
    <section id="servicios">
        <ul class="nav nav-pills"> <!-- Para la navegacion -->
            <li role="presentation" style="padding-right:40px;padding-left:120px;margin-top:0px;">
                <!-- Tamaño de los item -->
                <a class="ghost" href="/Presentacion/plantillas/Catalogo.jsp"><h3><font color=#34495E>Cabañas</font></h3></a></li>
            <!-- Nombre y color de las palabras -->
            <li role="presentation" style="padding-right:40px;padding-left:120px;margin-top:0px;">
                <a class="ghost" href="#"><h3><font color=#34495E>Zonas de Camping</font></h3></a></li>
            <li role="presentation" style="padding-right:40px;padding-left:120px;margin-top:0px;">
                <a class="ghost" href="/Presentacion//plantillas/Eventos.jsp"><h3><font color=#34495E>Eventos</font></h3></a></li>
        </ul>
    </section>

    <!-- Catalogo de las Eventos -->
    <section id="catalogoEv">
        <!-- Titulo principal -->
        <h2>Eventos</br></br> </h2>
        <!-- Evento N°1, con la imagen, descripcion y el boton -->
        <article id="ev1"> <!-- Seccion Menu -->
            <img src="/Presentacion/imagenes/evento1.JPG" alt="evento1.JPG"><!-- Importar la imagen -->
            <h5>Evento N°1</h5>
            <h4>Nombre: </br>
                Fecha Inicio: </br>
                Fecha Fin: </br>
                Lugar: </br>
                Dirección: </br>
            </h4>
        </article>
        <!-- Evento N°2, con la imagen, descripcion y el boton -->
        <article id="ev2"> <!-- Seccion Menu -->
            <img src="/Presentacion/imagenes/evento2.JPG" alt="evento2.JPG"><!-- Importar la imagen -->
            <h5>Evento N°2</h5>
            <h4>Nombre: </br>
                Fecha Inicio: </br>
                Fecha Fin: </br>
                Lugar: </br>
                Dirección: </br>
            </h4>
            
        </article>
        <!-- Evento N°3, con la imagen, descripcion y el boton -->
        <article id="ev3"> <!-- Seccion Menu -->
            <img src="/Presentacion/imagenes/evento3.JPG" alt="eveto3.JPG"><!-- Importar la imagen -->
            <h5>Evento N°3</h5>
            <h4>Nombre: </br>
                Fecha Inicio: </br>
                Fecha Fin: </br>
                Lugar: </br>
                Dirección: </br>
            </h4>
            
        </article>
        <!-- Evento N°4, con la imagen, descripcion y el boton -->
        <article id="ev4"> <!-- Seccion Menu -->
            <img src="/Presentacion/imagenes/evento4.JPG" alt="evento4.JPG"><!-- Importar la imagen -->
            <h5>Evento N°4</h5>
            <h4>Nombre: </br>
                Fecha Inicio: </br>
                Fecha Fin: </br>
                Lugar: </br>
                Dirección: </br>
            </h4>
            
        </article>
        <!-- Evento N°5, con la imagen, descripcion y el boton -->
        <article id="ev5"> <!-- Seccion Menu -->
            <img src="/Presentacion/imagenes/evento5.JPG" alt="evento5.JPG"><!-- Importar la imagen -->
            <h5>Evento N°5</h5>
            <h4>Nombre: </br>
                Fecha Inicio: </br>
                Fecha Fin: </br>
                Lugar: </br>
                Dirección: </br>
            </h4>
            
        </article>
        <!-- Evento N°6, con la imagen, descripcion y el boton -->
        <article id="ev6"> <!-- Seccion Menu -->
            <img src="/Presentacion/imagenes/evento6.jpg" alt="evento6.JPG"><!-- Importar la imagen -->
            <h5>Evento N°6</h5>
            <h4>Nombre: </br>
                Fecha Inicio: </br>
                Fecha Fin: </br>
                Lugar: </br>
                Dirección: </br>
            </h4>
            
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