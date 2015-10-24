<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Editar Reserva</title>

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
    <script src="jquery.js"></script>

    <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
    <script src="Presentacion/jquery.colorbox.js"></script>

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
    <!-- Tercera cabecera con los servicios que prestan el sindicato -->
    <section id="servicios">
        <ul class="nav nav-pills"> <!-- Para la navegacion -->
            <li role="presentation" style="padding-right:40px;padding-left:120px;margin-top:0px;"> <!-- Tamaño de los item -->
                <a href="ReservarCabaniaUsuario.jsp"><h3><font color=#000000>Realizar Reserva
                </font></h3></a></li> <!-- Nombre y color de las palabras -->
            <li role="presentation" style="padding-right:40px;padding-left:120px;margin-top:0px;">
                <a href="EditarReservaUsuario.jsp"><h3><font color=#000000>Editar Reserva</font></h3></a></li>

        </ul>
    </section>



    <!-- Seccion de contenido (tabla, link y paginacion)-->
    <section id="contenidoReservaC">
        <h4>Editar Reserva</h4>


        <article id="lista">
            <table class="table">
                <thead>
                <!-- titulos de la tabla -->
                <tr>
                    <th>Fecha de<br> Solicitud</th>
                    <th>Fecha Inicio</th>
                    <th>Fecha Fin</th>
                    <th>Estado de <br> la reserva</th>
                    <th>Editar</th>
                    <th>Cancelar</th>
                </tr>
                </thead>
                <tbody>
                <!-- Primer componente -->
                <tr>
                    <td>texto</td>
                    <td>texto</td>
                    <td>texto</td>
                    <td>texto</td>
                    <td><img src="/Presentacion/imagenes/editar.png" id="imagEditar" title="Editar" class='inline'
                             href="#inline_content" onclick="ventana2()">
                    <td><img src="/Presentacion/imagenes/cancelar.png" id="imagCancelar" title="Cancelar"></td>
                </tr>
                <!-- Segundo componente -->
                <tr>
                    <td>texto</td>
                    <td>texto</td>
                    <td>texto</td>
                    <td>texto</td>
                    <td><img src="/Presentacion/imagenes/editar.png" id="imagEditar" title="Editar" class='inline'
                             href="#inline_content" onclick="ventana2()">
                    <td><img src="/Presentacion/imagenes/cancelar.png" id="imagCancelar" title="Cancelar"></td>
                </tr>
                <!-- Tercero componente -->
                <tr>
                    <td>texto</td>
                    <td>texto</td>
                    <td>texto</td>
                    <td>texto</td>
                    <td><img src="/Presentacion/imagenes/editar.png" id="imagEditar" title="Editar" class='inline'
                             href="#inline_content" onclick="ventana2()">
                    <td><img src="/Presentacion/imagenes/cancelar.png" id="imagCancelar" title="Cancelar"></td>
                </tr>
                <!-- Cuarto componente -->
                <tr>
                    <td>texto</td>
                    <td>texto</td>
                    <td>texto</td>
                    <td>texto</td>
                    <td><img src="/Presentacion/imagenes/editar.png" id="imagEditar" title="Editar" class='inline'
                             href="#inline_content" onclick="ventana2()">
                    <td><img src="/Presentacion/imagenes/cancelar.png" id="imagCancelar" title="Cancelar"></td>
                </tr>
                <!-- Quinto componente -->
                <tr>
                    <td>texto</td>
                    <td>texto</td>
                    <td>texto</td>
                    <td>texto</td>
                    <td><img src="/Presentacion/imagenes/editar.png" id="imagEditar" title="Editar" class='inline'
                             href="#inline_content" onclick="ventana2()">
                    <td><img src="/Presentacion/imagenes/cancelar.png" id="imagCancelar" title="Cancelar"></td>
                </tr>

                <!-- Sexto componente -->
                <tr>
                    <td>texto</td>
                    <td>texto</td>
                    <td>texto</td>
                    <td>texto</td>
                    <td><img src="/Presentacion/imagenes/editar.png" id="imagEditar" title="Editar" class='inline'
                             href="#inline_content" onclick="ventana2()">
                    <td><img src="/Presentacion/imagenes/cancelar.png" id="imagCancelar" title="Cancelar"></td>
                </tr>

                </tbody>
            </table> <!-- Fin de la tabla -->
        </article> <!-- Fin del article -->

        <!-- Paginacion -->
        <article id="pag">
            <nav>
                <ul class="pagination">
                    <li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
                    <li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
                    </li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li>
                        <a href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </article>
    </section>
    <article id="infoUsuario">
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
    </article>
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