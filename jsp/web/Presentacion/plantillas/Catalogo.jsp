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
    <title> Catalogo </title>

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

    <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
    <script src="../jquery.colorbox.js"></script>

    <script>
        $(function(){
            $('#login').click(function(){
                $(this).next('#login-content').slideToggle();
                $(this).ToggleClass('active');

            });
        });
    </script>


    <script src="/Presentacion/estilos/funciones/funcion.js"></script>

</head>

<body> <!-- Lo que tiene la pagina -->
<!-- Js vinculados -->

<script src="/Presentacion/estilos/js/responsive.js"></script>
<script src="/Presentacion/estilos/js/bootstrap.min.js"></script>

<!-- Contenedor que tiene las secciones y aeticle de la pagina -->
<section id="contenedor2">
    <!-- Primera cabecera (inicio,ingresar,...)  -->
    <header>
        <!-- Boton ingresar -->
        <nav class="acceder">
            <article id="inicio1">

                <button type="button" id="login" class="btn btn-link"  style="padding-right:35px;padding-left:10px;margin-top:21px;"> <!-- Tamaño -->
                    <span class="glyphicon glyphicon-user" aria-hidden="true"></span> Ingresar <!-- Icono y palabra -->
                </button>
                <div id="login-content">
                    <form>

                        <input id="usuario" type="text" name="usuario" placeholder="Usuario" required>
                        <input id="password" type="password" name="contrasenia" placeholder="Contraseña" required>

                        <button type="button" id="submit" class="btn btn-primary"  style="padding-right:35px;padding-left:10px;margin-top:21px;">
                            Ingresar </button>
                        <button type="button" id="submitRegistrar" class="btn btn-primary"  style="padding-right:35px;padding-left:10px;margin-top:21px;"
                                onClick="location.href='registrarse.jsp'"> <!-- Tamaño -->
                            Registrarse </button>
                    </form>

                </div>
            </article>
        </nav>
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
            <button type="button" class="btn btn-link"  style="padding-right:55px;padding-left:10px;margin-top:21px;"> <!-- Tamaño -->
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


    <!-- Catalogo de las cabañas -->
    <section id="catalogo">
        <!-- Titulo principal -->
        <h2>Catalogo de cabañas</h2>
        <article id="precio">
            <article id="valores">
                <h2>Valor de las Cabañas</h2>
                <p> <strong>Valor por noche:</strong></br>
                    <strong>Afiliado:</strong>$90.000</br>
                    <strong>No Afiliado:</strong>$ 160.000
                </p>
            </article>
        </article>
        <!-- Cabaña N°1, con la imagen, descripcion y el boton -->
        <article id="cab1"> <!-- Seccion Menu -->
            <img src="/Presentacion/imagenes/cabana1.JPG" alt="cabana1.JPG"><!-- Importar la imagen -->
            <h5>Cabaña N°1</h5>
            <button> <!-- Tamaño -->
                <span class="glyphicon glyphicon-tag" aria-hidden="true"></span>
                <a  class='inline' href="#inline_content" style="text-decoration:none" onclick="ventana()">Reserva</a> <!-- Icono y palabra -->
            </button>
        </article>

        <!-- Cabaña N°2, con la imagen, descripcion y el boton -->
        <article id="cab2"> <!-- Seccion Menu -->
            <img src="/Presentacion/imagenes/cabana2.JPG" alt="cabana2.JPG"><!-- Importar la imagen -->
            <h5>Cabaña N°2</h5>
            <button> <!-- Tamaño -->
                <span class="glyphicon glyphicon-tag" aria-hidden="true"></span>
                <a  class='inline' href="#inline_content" style="text-decoration:none" onclick="ventana()" >Reserva</a><!-- Icono y palabra -->
            </button>
        </article>
        <!-- Cabaña N°3, con la imagen, descripcion y el boton -->
        <article id="cab3"> <!-- Seccion Menu -->
            <img src="/Presentacion/imagenes/cabana3.JPG" alt="cabana3.JPG"><!-- Importar la imagen -->
            <h5>Cabaña N°3</h5>
            <button> <!-- Tamaño -->
                <span class="glyphicon glyphicon-tag" aria-hidden="true"></span>
                <a  class='inline' href="#inline_content" style="text-decoration:none" onclick="ventana()" >Reserva</a><!-- Icono y palabra -->
            </button>
        </article>
        <!-- Cabaña N°4, con la imagen, descripcion y el boton -->
        <article id="cab4"> <!-- Seccion Menu -->
            <img src="/Presentacion/imagenes/cabana4.JPG" alt="cabana4.JPG"><!-- Importar la imagen -->
            <h5>Cabaña N°4</h5>
            <button> <!-- Tamaño -->
                <span class="glyphicon glyphicon-tag" aria-hidden="true"></span>
                <a  class='inline' href="#inline_content" style="text-decoration:none" onclick="ventana()" >Reserva</a><!-- Icono y palabra -->
            </button>
        </article>
        <!-- Cabaña N°5, con la imagen, descripcion y el boton -->
        <article id="cab5"> <!-- Seccion Menu -->
            <img src="/Presentacion/imagenes/cabana5.JPG" alt="cabana5.JPG"><!-- Importar la imagen -->
            <h5>Cabaña N°5</h5>
            <button> <!-- Tamaño -->
                <span class="glyphicon glyphicon-tag" aria-hidden="true"></span>
                    <a  class='inline' href="#inline_content" style="text-decoration:none" onclick="ventana()" >Reserva</a><!-- Icono y palabra -->
            </button>
        </article>
        <!-- Cabaña N°6, con la imagen, descripcion y el boton -->
        <article id="cab6"> <!-- Seccion Menu -->
            <img src="/Presentacion/imagenes/cabana6.JPG" alt="cabana6.JPG"><!-- Importar la imagen -->
            <h5>Cabaña N°6</h5>
            <button> <!-- Tamaño -->
                <span class="glyphicon glyphicon-tag" aria-hidden="true"></span>
                <a  class='inline' href="#inline_content" style="text-decoration:none" onclick="ventana()" >Reserva</a><!-- Icono y palabra -->
            </button>
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

<!-- Ventana Emergente que debe aparecer si el usuario no se ha logueado y desea realizar una reserva -->

<section  id="ventanaEmergente">

    <div id='inline_content' >
        <div id="login-content2">
            <form>

                <input id="usuarioVentana" type="text" name="usuario" placeholder="Usuario" required>
                <input id="passwordVentana" type="password" name="contrasenia" placeholder="Contraseña" required>

                <button type="button" id="submitEntrarVentana" class="btn btn-primary"  style="padding-right:35px;padding-left:10px;margin-top:21px;">
                    Ingresar </button>
                <button type="button" id="submitRegistrarVentana" class="btn btn-primary"  style="padding-right:35px;padding-left:10px;margin-top:21px;"
                        onClick="location.href='registrarse.jsp'"> <!-- Tamaño -->
                    Registrarse </button>

            </form>

        </div>
    </div>
</section>
</body>
</html> <!-- Fin pagina html5 -->