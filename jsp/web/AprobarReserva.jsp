<%@ page contentType="text/html;charset=UTF-8" language="java"
         import="java.sql.Connection" import="java.sql.DriverManager" import="java.sql.ResultSet"
         import="java.sql.Statement" import="java.sql.SQLException"%>
<%@ page import="Logica.Persona" %>
<%@ page import="Persistencia.ReservaDao" %>
<%@ page import="Logica.Reserva" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Persistencia.InformacionReservaDao" %>
<%@ page import="Logica.InformacionReserva" %>
<%@ page import="Logica.EstadoReserva" %>

<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <title>Aprobar Reserva</title>

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

    <script type="text/javascript">

        var tomarValor = function elementoTabla() {
            if (!document.getElementsByTagName || !document.createTextNode) return;
            var rows = document.getElementById('tabla_uno').getElementsByTagName('tbody')[0].getElementsByTagName('tr');
            for (i = 0; i < rows.length; i++) {
                rows[i].onclick = function() {
                    auxiliar = this.rowIndex + 1

                }
            }

            return auxiliar;
        }

    </script>

    <script>var idReserva = 0</script>

</head>
<body>

<script src="/Presentacion/estilos/js/bootstrap.min.js"></script>

<script src="/Presentacion/estilos/js/responsive.js"></script>


<!-- Contenedor que tiene las secciones y aeticle de la pagina -->
<section id="contenedorReservaA">
    <!-- Primera cabecera (inicio,ingresar,...)  -->
    <header>
        <!-- Boton usuario -->

        <%--<%
            Persona persona = (Persona)request.getAttribute("persona1111");
        %>
        <%persona.getNombre();%>--%>
        <article id="inicio1">
            <div class="dropdown">
                <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1"
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
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
                    <li class="active">Aprobar Reserva</li>
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
        <h4>Aprobar Reservas</h4>

        <article id="filtros">

            <article id="CedulaBusqueda">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="Ingrese la cedula">
                </div><!-- /input-group -->
            </article>
            <article id="Estado">
                <select class="form-control">
                    <option value="1">Pendiente</option>
                    <option value="1">Aprobada</option>
                    <option value="2">Rechazada</option>
                    <option value="3">Cancelada</option></select>
            </article>

            <article id="fechaSolicitud1">
                <input type="date" class="form-control" placeholder="Ingrese el texto." required name="fechaFin">
            </article>

            <span class="input-group-btn" id="btnBusqueda">
                  <!-- Boton para la busqueda de la iamgen -->
                <button type="submit" class="btn btn-default" aria-label="Left Align">
                    <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                </button>
              </span>
        </article>

        <article id="lista">
            <table class="table" id="tabla_uno" onclick=" document.getElementById('reservaId').value = tomarValor();">
                <thead>
                <!-- titulos de la tabla -->
                <tr>
                    <th>Cedula</th>
                    <th>Tipo Servicio</th>
                    <th>Fecha de Solicitud</th>
                    <th>Cantidad días</th>
                    <th>Cantidad <br> personas</th>
                    <th>Estado Reserva</th>
                    <th>Aprobar</th>
                    <th>Rechazar</th>
                </tr>
                </thead>
                <tbody>

                <%
                    ReservaDao reservaDao = new ReservaDao();
                    ArrayList<Reserva> listaMisReservas = reservaDao.consultarReservas();
                    if(listaMisReservas !=null){
                        InformacionReservaDao informacionReservaDao = new InformacionReservaDao();

                        for(int i = 0; i < listaMisReservas.size(); i++) {

                            InformacionReserva informacionReserva = informacionReservaDao.
                                    obtenerInfo(listaMisReservas.get(i).getIdReserva());

                            System.out.println("fec1 "+ informacionReserva);
                            long cantidadDias = informacionReserva.getFechaFinReserva().getTime()-
                                    informacionReserva.getFechaInicioReserva().getTime();
                            System.out.println("cedula del que hizo la reserva "+ cantidadDias);


                %>

                <tr>

                    <td><%= listaMisReservas.get(i).getPersona().getCedula()%> </td>
                    <td><%= listaMisReservas.get(i).getTipoServicio().toString()%></td>
                    <td><%= listaMisReservas.get(i).getFechaSolicitud()%></td>
                    <td><%= cantidadDias/86400000%></td>
                    <td><%= listaMisReservas.get(i).getCantidadPersonas()%></td>
                    <td><%= listaMisReservas.get(i).getEstadoReserva()%></td>

                    <td><img src="/Presentacion/imagenes/ok.png" id="imagAprobar" title="Aprobar">
                        <% boolean aprobada = reservaDao.actualizarReservaEstado(listaMisReservas.get(i).getIdReserva(),
                                EstadoReserva.Aprobada);
                            session.setAttribute("aprobada",aprobada);
                            System.out.println("aprobacion           "+aprobada);
                        %>
                    </td>
                    <td><img src="/Presentacion/imagenes/mal.png" id="imagRechazar" title="Rechazar">
                        <% boolean rechazada = reservaDao.actualizarReservaEstado(listaMisReservas.get(i).getIdReserva(),
                                EstadoReserva.Rechazada);
                            session.setAttribute("rechazada",rechazada);
                        %>
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

    <!-- Division para el color de la informacion adicional de la pagina -->
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