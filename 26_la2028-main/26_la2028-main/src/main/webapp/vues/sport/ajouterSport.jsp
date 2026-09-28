<%--
    Document   : ajouterSport
    Created on : 25/08/2026, 13:30:47
    Author     : zakina
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="sio.la2028.model.Pays"%>
<%@page import="sio.la2028.model.Sport"%>
<%@page import="sio.la2028.form.FormSport"%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>LOS ANGELES 2028</title>
</head>
<body>
<h1>Nouveau Sport</h1>

<%
  FormSport form = (FormSport)request.getAttribute("form");
%>

  <form class="form-inline" action="ajouter" method="POST">
    <label for="nom">NOM : </label>
    <input id="nom" type="text" name="nom"  size="50" maxlength="50">
    </br>

    <%-- Champ Liste des pays --%>
    </br>

    <input type="submit" name="valider" id="valider" value="Valider"/>
  </form>

</body>
</html>