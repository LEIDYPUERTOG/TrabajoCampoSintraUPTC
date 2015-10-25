<%@ page import="Persistencia.ReservaDao" %>
<%@ page import="Logica.Reserva" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Logica.Persona" %>
<%@ page import="Logica.InformacionReserva" %>
<%@ page import="Persistencia.InformacionReservaDao" %>
<%@ page import="Logica.EstadoReserva" %>
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

    <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
    <script src="Presentacion/jquery.colorbox.js"></script>

    <!--Script para poder hacer que aparezca la ventana emergente-->
    <script src="/Presentacion/estilos/funciones/funcion.js"></script>

    <script type="text/javascript">

        var tomarValor = function elementoTabla() {
            if (!document.getElementsByTagName || !document.createTextNode) return;
            var rows = document.getElementById('tabla_uno').getElementsByTagName('tbody')[0].getElementsByTagName('tr');
            for (i = 0; i < rows.length; i++) {
                rows[i].onclick = function() {
                    var aux = document.getElementById("tabla_uno").rows[this.rowIndex].cells[0].innerHTML;
                    auxiliar = aux;
                }
            }

            return auxiliar;
        }

    </script>

    <script>var idReserva = 0</script>
</head>



<body> <!-- Lo que tiene la pagina -->
<!-- Js vinculados -->

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
                    <li class="active">Editar Mis Reservas</li>
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

    <!-- Seccion de contenido (tabla, link y paginacion)-->
    <section id="contenidoReservaA">
        <h4>Reservas</h4>


        <article id="lista">

            <table class="table" id="tabla_uno" onclick=" document.getElementById('reservaId').value = tomarValor();">

                <thead>
                <!-- titulos de la tabla  idReserva = tomarValor()-->
                <tr>
                    <th>Número de<br> Reserva</th>
                    <th>Fecha de<br> Solicitud</th>
                    <th>Fecha Inicio</th>
                    <th>Fecha Fin</th>
                    <th>Estado de <br> la reserva</th>
                    <th>Editar</th>
                    <th>Cancelar</th>
                </tr>
                </thead>
                <tbody>
                <%
                    ReservaDao reservaDao = new ReservaDao();
                    ArrayList<Reserva> listaMisReservas = reservaDao.consultarReservaAfiliado(persona.getCedula());
                    if(listaMisReservas !=null){
                        InformacionReservaDao informacionReservaDao = new InformacionReservaDao();
                        for(int i = 0; i < listaMisReservas.size(); i++) {

                            InformacionReserva informacionReserva = informacionReservaDao.
                                    obtenerInfo(listaMisReservas.get(i).getIdReserva());
                %>

                <tr>

                    <td><%= listaMisReservas.get(i).getIdReserva()%> </td>
                    <td><%= listaMisReservas.get(i).getFechaSolicitud()%></td>
                    <td><%= informacionReserva.getFechaInicioReserva()%></td>
                    <td><%= informacionReserva.getFechaFinReserva()%></td>
                    <td><%= listaMisReservas.get(i).getEstadoReserva()%></td>

                    <td><img src="/Presentacion/imagenes/editar.png" id="imagEditar" title="Editar" class='inline'
                             href="#inline_content" onclick="ventana()">

                    </td>
                    <td><img src="/Presentacion/imagenes/suspender.png" id="imagSuspender" title="Suspender" onclick="cancelar()">

                        <% boolean cancelar = reservaDao.actualizarReservaEstado(listaMisReservas.get(i).getIdReserva(),
                                EstadoReserva.Cancelada);
                            session.setAttribute("cancelada",cancelar);

                        %>

                        <%--<script>
                            function cancelar(){
                                if(<%=session.getAttribute("cancelada")%>){
                                    alert("Cancelada")
                                }
                                else{
                                    alert("Error revisar esta saliendo mál esta alerta" )
                                }
                            }

                        </script>--%>
                    </td>
                </tr>
                <%
                        }
                    }
                    else{

                    }
                %>
                </tbody>
            </table> <!-- Fin de la tabla -->
        </article> <!-- Fin del article -->
        <!-- Paginacion -->
        <article id="pag2">
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
            <form action="/SvtEditarReserva" method="post" name="formularioEdicion">

                <label id="IdReserva">Número de reserva</label>
                <input id="reservaId" type="numeric" name="reserva" >

                <label id="lblFecha1">Fecha Inicio</label>
                <input id="fecha1Ventana" type="date" name="fechaInicioNueva" placeholder="fecha Inicio" >
                <label id="lblFecha2">Fecha Fin</label>
                <input id="fecha2Ventana" type="date" name="FechaFinNueva" placeholder="Fecha Fin">

                <button type="submit" id="submitAceptarVentana" class="btn btn-primary"
                        style="padding-right:35px;padding-left:10px;margin-top:21px;">
                    Aceptar </button>
                <button type="button" id="submitCancelarVentana" class="btn btn-primary"
                        style="padding-right:35px;padding-left:10px;margin-top:21px;"
                        onclick='parent.$.colorbox.close(); return false;'>
                    Cancelar </button>

            </form>

        </div>
    </div>
</section>
</body>
</html>