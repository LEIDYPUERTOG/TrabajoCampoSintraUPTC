<%@ page import="Logica.Evento" %>
<%@ page import="Persistencia.EventoDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Persistencia.ConexionDB" %>
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
    <link href='https://fonts.googleapis.com/css?family=Nunito' rel='stylesheet' type='text/css'>
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
                <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown"
                        aria-haspopup="true" aria-expanded="true">
                    Bienvenido
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                    <li><a> <span class="glyphicon glyphicon-lock" aria-hidden="true" href="#"></span>Cambiar contraseña</a>
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
    </header>

    <!-- Segunda cabecera con los logos del sindicato y la uptc -->
    <section id="logo">
        <img src="/Presentacion/imagenes/cabecera.jpg" alt="logos.png"> <!-- Importar la imagen -->
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
            <li role="presentation" style="padding-right:40px;padding-left:120px;margin-top:0px;">
                <a class="ghost" href="/Eventos.jsp"><h3><font color=#34495E>Eventos</font></h3></a></li>
        </ul>
    </section>

    <!-- Catalogo de las Eventos -->
    <section id="catalogoEv">
        <!-- Titulo principal -->
        <h2>Eventos</br></br> </h2>
        <!-- Evento N°1, con la imagen, descripcion y el boton -->

        <%
            ConexionDB conexionDB = new ConexionDB("root","");
            EventoDao eventoDao = new EventoDao();
            ArrayList<Evento> listaEvento = eventoDao.obtenerListaEventos();
            System.out.println("tamaño eventos     "+listaEvento.size());
            for(int i = 0; i < listaEvento.size(); i++){%>

        <article id="ev<%=i+1%>"> <!-- Seccion Menu -->
            <img src="/Presentacion/imagenes/evento<%=i+1%>.JPG" alt="evento<%=i+1%>.JPG"><!-- Importar la imagen -->
            <h5>Evento N°<%=i+1%></h5>
            <h4>Nombre: <%=listaEvento.get(i).getNombreEvento()%></h4>
            <h4>Fecha Inicio: <%=listaEvento.get(i).getFechaIncioEvento()%></h4>
            <h4>Fecha Fin: <%=listaEvento.get(i).getFechaFinEvento()%></h4>
            <h4>Lugar: <%=listaEvento.get(i).getLocacion().getNombreLocacion()%></h4>
            <h4>Dirección: <%=listaEvento.get(i).getLocacion().getDireccionLocacion()%></h4>

        </article>

        <%
            }
        %>

    </section>

    <!-- Divicion para el color de la informacion adicional de la pagina -->
    <section id="divi">
    </section>

    <!-- Informacion adicional del sindicato (Menu, Registrarse,...) -->
    <section id="informacion">
        <article id="inf1"> <!-- Seccion Menu -->
            <h4>Menu</h4>
            <h5>
                <button type="button" class="btn btn-link">Nosotros</button>
            </h5>
            <h5>
                <button type="button" class="btn btn-link">Junta Directiva</button>
            </h5>
            <h5>
                <button type="button" class="btn btn-link">Contáctenos</button>
            </h5>
        </article>
        <article id="inf2"> <!-- Seccion Registrar -->
        </article>
        <article id="inf3"> <!-- Seccion Inf Contacto -->
            <h4>Informacion de contacto</h4>
            <h5> Avenida Central del Norte 39 - 115 </h5>
            <h5> Tunja - Boyaca </h5>
            <h5> Tel. 422174 Ext. 1500</h5>
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
</body>
</html>
<!-- Fin pagina html5 -->