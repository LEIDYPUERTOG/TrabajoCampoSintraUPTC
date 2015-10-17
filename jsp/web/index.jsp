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
  <title> Inicio </title>

  <!-- Estilos de la pagina -->

  <link rel="stylesheet" href="Presentacion/estilos/estilos.css">
  <!-- Tipo de letra de google -->
  <link href='https://fonts.googleapis.com/css?family=Courgette' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Handlee' rel='stylesheet' type='text/css'>

  <!-- Estilos CSS vinculados -->
  <link href="Presentacion/estilos/css/bootstrap.min.css" rel="stylesheet">


  <script src="Presentacion/angular.min.js"></script>

  <!-- Script necesario para hacer que la ventana de login aparezca-->
  <script src="Presentacion/jquery.js"></script>
  <script src="Presentacion/estilos/funciones/funcion.js"></script>
  <script>
    $(function(){
      $('#login').click(function(){
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
                    onClick="location.href='/plantillas/registrarse.jsp'"> <!-- Tamaño -->
              Registrarse </button>
          </form>

        </div>
      </article>
    </nav>
    <!-- Boton Contactenos -->
    <article id="inicio2">
      <button type="button" class="btn btn-link"  style="margin-top:21px;"  onclick="location.href=
            '#informacion'"> <!-- Tamaño -->
        <span class="glyphicon glyphicon-earphone" aria-hidden="true"></span> Contáctenos <!-- Icono y palabra -->
      </button>
    </article>
    <!-- Boton Conozcanos -->
    <article id="inicio3">
      <button type="button" class="btn btn-link"  style="margin-top:21px;" onclick="location.href='#texto'"> <!-- Tamaño -->
        <span class="glyphicon glyphicon-globe" aria-hidden="true"></span> Conozcanos <!-- Icono y palabra -->
      </button>
    </article>
    <!-- Boton Inicio -->
    <article id="inicio4">
      <button type="button" class="btn btn-link"  style="padding-right:55px;padding-left:10px;margin-top:21px;" onclick="location.href=
            'Index.html'"> <!-- Tamaño -->
        <span class="glyphicon glyphicon-home" aria-hidden="true"></span> Inicio <!-- Icono y palabra -->
      </button>
    </article>
  </header>

  <!-- Segunda cabecera con los logos del sindicato y la uptc -->
  <section id="logo">
    <!--  <h1> <img src="imagenes/cabecera.png" alt="logos.png"></h1> <!-- Importar la imagen -->
  </section>

  <!-- Tercera cabecera con los servicios que prestan el sindicato -->
  <section id="servicios">
    <ul class="nav nav-pills"> <!-- Para la navegacion -->
      <li role="presentation" style="padding-right:40px;padding-left:120px;margin-top:0px;"> <!-- Tamaño de los item -->
        <a href="/Presentacion/plantillas/Catalogo.jsp"><h3><font color=#000000>Cabañas</font></h3></a></li> <!-- Nombre y color de las palabras -->
      <li role="presentation" style="padding-right:40px;padding-left:120px;margin-top:0px;">
        <a href="#"><h3><font color=#000000>Zonas de Camping</font></h3></a></li>
      <li role="presentation" style="padding-right:40px;padding-left:120px;margin-top:0px;">
        <a href="/Presentacion//plantillas/Eventos.jsp"><h3><font color=#000000>Eventos</font></h3></a></li>
    </ul>
  </section>

  <!-- Galeria de imagenes -->
  <section id="imagenes">
    <h1> <img src="Presentacion/imagenes/GFoto1.JPG" alt="GFoto1.JPG"></h1> <!-- Importar la imagen -->
  </section>

  <!-- Descripcion del sindicato -->
  <section id="texto">
    <h1>¿Quienes Somos?</h1>
    <h4>Somos un sindicato que su objetivo es brindarle a sus usuarios accesoria laboral y entretenimiento a sus familias </br>
      Somos un sindicato que su objetivo es brindarle a sus usuarios accesoria laboral y entretenimiento a sus familias </br>
      Somos un sindicato que su objetivo es brindarle a sus usuarios accesoria laboral y entretenimiento a sus familias </br>
      Somos un sindicato que su objetivo es brindarle a sus usuarios accesoria laboral y entretenimiento a sus familias </br>
      Somos un sindicato que su objetivo es brindarle a sus usuarios accesoria laboral y entretenimiento a sus familias </br>
      Somos un sindicato que su objetivo es brindarle a sus usuarios accesoria laboral y entretenimiento a sus familias </br>
    </h4>
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