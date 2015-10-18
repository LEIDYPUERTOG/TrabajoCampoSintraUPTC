<%--
  Created by IntelliJ IDEA.
  User: LEIDY
  Date: 18/10/2015
  Time: 6:04 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
        import="java.sql.Connection" import="java.sql.DriverManager" import="java.sql.ResultSet"
         import="java.sql.Statement" import="java.sql.SQLException"
        %>

<%
  Connection conexion = null;
  Statement sql = null;
  try {

    Class.forName("com.mysql.jdbc.Driver");
    conexion = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/sintrauptc", "root","");
    if (conexion != null) {
      sql = conexion.createStatement();
      out.println("Conexión a base de datos  OK\n");
    }
  }catch (Exception e){
    out.println("Error de la conexion" + e.getMessage());
  }
%>

