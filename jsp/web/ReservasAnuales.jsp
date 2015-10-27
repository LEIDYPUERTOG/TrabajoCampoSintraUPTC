<%@ page import="Logica.Persona" %>
<%@ page import="Persistencia.ReservaDao" %>
<%@ page import="Logica.Reserva" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Persistencia.InformacionReservaDao" %>
<%@ page import="Logica.InformacionReserva" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Reservas anuales</title>

    <!-- Estilos de la pagina -->
    <link rel="stylesheet" href="/Presentacion/estilos/estilos.css">
    <!-- Tipo de letra de google -->
    <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Handlee' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Boogaloo' rel='stylesheet' type='text/css'>

    <!-- Estilos CSS vinculados -->
    <link rel="stylesheet" href="/Presentacion/estilos/estilos.css">
    <!-- Tipo de letra de google -->
    <link href='https://fonts.googleapis.com/css?family=Courgette' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Handlee' rel='stylesheet' type='text/css'>

    <!-- Estilos CSS vinculados -->
    <link href="/Presentacion/estilos/css/bootstrap.min.css" rel="stylesheet">
    <link href="/Presentacion/estilos/css/estilos.css" rel="stylesheet">

    <script src="Presentacion/angular.min.js"></script>

    <!-- Script necesario para hacer que la ventana de login aparezca-->
    <script src="jquery.js"></script>

    <script>
        var anioFunc = function tomarAnio(clicked){
            var  el = clicked.id;
            return el;
            alert(el+ " el seleccionado con get12")
        }
    </script>

</head>
<body>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="/Presentacion/estilos/js/responsive.js"></script>
<script src="/Presentacion/estilos/js/bootstrap.min.js"></script>

<!-- Contenedor que tiene las secciones y aeticle de la pagina -->
<section id="contenedorReservaA">
    <!-- Primera cabecera (inicio,ingresar,...)  -->
    <header>
        <!-- Boton usuario -->

        <article id="inicio1">
            <div class="dropdown">
                <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenu1"
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">

                    <%
                        Persona persona = (Persona) session.getAttribute("persona");
                        session.setAttribute("persona", persona);
                        if (persona != null) {

                    %>
                    <%= persona.getNombre() %>
                    <%
                    } else {
                        Persona persona1 = (Persona) request.getAttribute("persona");
                        session.setAttribute("persona", persona1);
                    %>
                    <%= persona1.getNombre() %>
                    <%
                        }
                    %>
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                    <li> <a href="/CambiarContrasenia.jsp">
                        <span class="glyphicon glyphicon-lock" aria-hidden="true"></span>Cambiar Contraseña</a>
                    </li>
                    <li><a> <span class="glyphicon glyphicon-log-out" aria-hidden="true" href="#"></span>Cerrar
                        Sesión</a></li>

                </ul>
            </div>

        </article>
        <!-- Boton Contactenos -->
        <article id="inicio2">
            <button type="button" class="btn btn-link" style="margin-top:21px;" onclick="location.href='#informacion'">
                <!-- Tamaño -->
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
        <img src="/Presentacion/imagenes/cabecera.jpg" alt="logos.png"> <!-- Importar la imagen -->
    </section>

    <!-- Divicion para el color de la informacion adicional de la pagina -->
    <section id="divi">
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
                    <li class="active">Listar reservas anualmente</li>
                </ol>
            </div>
        </article>
    </section>
    <!-- Seccion de Pestañas-->
    <section id="pestanas2">
        <article>
            <nav class="navbar navbar-default navbar-static-top">
                <ul class="nav nav-tabs">
                    <li><a href="CrearReservaCabania.jsp">Crear Mi Reserva</a></li>
                    <li><a href="EditarReservaAdmin.jsp">Editar Mis Reservas</a></li>
                    <li><a href="AprobarReserva.jsp">Aprobar Reserva</a></li>
                    <li class="active"><a>Listar reserva anualmente</a></li>
                </ul>
            </nav>
        </article>
    </section>
    <!-- Seccion de contenido (tabla, link y paginacion)-->
    <section id="contenidoReservaA">
        <h4>Listado de Reservas</h4>
        <form action="/SvtConsultarReservaAnio" method="post" name="formularioBusqueda">
            <article id="link1">
                <button id ="2015" type="submit" class="btn btn-link" onclick="
                document.getElementById('anio').value = anioFunc(this)" >
                    2015
                </button>
            </article>
            <article id="link1">
                <button id ="2014" type="submit" class="btn btn-link" onclick="
            document.getElementById('anio').value = anioFunc(this)" >
                    2014</button>
            </article>
            <article id="link1">
                <button id="2013" type="submit" class="btn btn-link" onclick="
            document.getElementById('anio').value = anioFunc(this)" >
                    2013</button>
            </article>
            <article id="link1">
                <button id="2012" type="submit" class="btn btn-link" onclick="
            document.getElementById('anio').value = anioFunc(this)" >
                    2012</button>
            </article>
            <article id="link1">
                <button id="2011" type="submit" class="btn btn-link" onclick="
            document.getElementById('anio').value = anioFunc(this)" >
                    2011</button>
            </article>


            <input type="hidden" name="anioIn" id="anio">
        </form>

        <article id="lista">
            <table class="table">
                <thead>
                <!-- titulos de la tabla -->
                <tr>
                    <th>Cedula</th>
                    <th>Tipo de Servicio</th>
                    <th>Fecha y hora de Solicitud</th>
                    <th>Cantidad días</th>
                    <th>Cantidad personas</th>
                    <th>Estado de reserva</th>
                </tr>
                </thead>
                <tbody>
                <%
                    ArrayList<Reserva> listaMisReservas = (ArrayList)request.getAttribute("reservas");
                    int cantidadDias =0;
                    if(listaMisReservas !=null){

                        for(int i = 0; i < listaMisReservas.size(); i++) {
                %>

                <tr>

                    <td><%= listaMisReservas.get(i).getPersona().getCedula()%> </td>
                    <td><%= listaMisReservas.get(i).getTipoServicio().toString()%></td>
                    <td><%= listaMisReservas.get(i).getFechaSolicitud()%></td>
                    <td><%= cantidadDias/86400000%></td>
                    <td><%= listaMisReservas.get(i).getCantidadPersonas()%></td>
                    <td><%= listaMisReservas.get(i).getEstadoReserva()%></td>

                </tr>
                <%
                    }
                }
                else{

                %>

                <tr>

                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>

                </tr>
                <%
                    }

                %>

                </tbody>
            </table> <!-- Fin de la tabla -->
        </article> <!-- Fin del article -->

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