<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Persistencia.ConexionDB" language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Registrarse</title>

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
    <script src="../jquery.js"></script>

    <script>
        $(function(){
            $('#login').click(function(){
                $(this).next('#login-content').slideToggle();
                $(this).ToggleClass('active');
            });
        });
    </script>

</head>
<body>
<script src="/SvtLogin"></script>
<script src="/Presentacion/estilos/js/bootstrap.min.js"></script>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="/Presentacion/estilos/js/responsive.js"></script>
<script src="/Presentacion/estilos/js/bootstrap.min.js"></script>

<!-- Contenedor que tiene las secciones y aeticle de la pagina -->
<section id="contenedorRegistro">
    <!-- Primera cabecera (inicio,ingresar,...)  -->
    <header>
        <!-- Boton ingresar -->
        <nav class="acceder">
            <article id="inicio1">

                <button type="button" id="login" class="btn btn-default"  style="padding-right:35px;padding-left:10px;margin-top:21px;"> <!-- Tamaño -->
                    <span class="glyphicon glyphicon-user" aria-hidden="true"></span> Ingresar <!-- Icono y palabra -->
                </button>
                <div id="login-content">
                    <form>

                        <input id="usuario" type="text" name="usuario" placeholder="Usuario" required>
                        <input id="password" type="password" name="contrasenia" placeholder="Contraseña" required>

                        <button type="button" id="submit" class="btn btn-primary"  style="padding-right:35px;padding-left:10px;margin-top:21px;">
                            Ingresar </button>
                        <button type="button" id="submitRegistrar" class="btn btn-primary"  style="padding-right:35px;padding-left:10px;margin-top:21px;" disabled> <!-- Tamaño -->
                            Registrarse </button>
                    </form>

                </div>
            </article>
        </nav>
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


    <!-- Seccion de datos de registro -->
    <section id="registro">

        <label id="lblInfo">¿No está registrado aún?</label>


        <form action="/SvtRegistro" method="post">

            <li>
                <label id="lblNombres">Nombre:</label>
                <input id="nombres" type="text" name="nombres" required>
            </li>

            <li>
                <label id="lblDocumento">Documento:</label>
                <input id="documento" type="text" name="documento" required>

            </li>

            <li>
                <label id="lblContrasenia">Contraseña:</label>
                <input id="contrasenia" type="password" name="contrasenia" required>

            </li>

            <li>
                <label id="lblContrasenia2">Repita la Contraseña:</label>
                <input id="contrasenia2" type="password" name="contrasenia2" required>

            </li>

            <label id="lblPreg">Es usted: </label>
            <label id = "rbtn" class="radio-inline">
                <input type="radio" name="inlineRadioOptions" id="Afiliado" value="option1"> Afiliado
            </label>
            <label id = "rbtn2" class="radio-inline">
                <input type="radio" name="inlineRadioOptions" id="NoAfiliado" value="option2"> No Afiliado
            </label>

            <button id= "btnRegistro" type="submit" class="btn btn-warning" value="Registrar">Registrarseeeeee</button>
        </form>

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