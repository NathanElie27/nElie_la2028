<%--
    Document   : ajouterAthlete
    Created on : 25/08/2026, 13:30:47
    Author     : zakina
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="sio.la2028.model.Pays"%>
<%@page import="sio.la2028.model.Athlete"%>
<%@page import="sio.la2028.form.FormAthlete"%>
<%@ page import="sio.la2028.form.FormEpreuve" %>
<%@ page import="sio.la2028.model.Sport" %>
<%@ page import="sio.la2028.form.FormSite" %>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>LOS ANGELES 2028</title>
</head>
<body>
<h1>NOUVEAU Site</h1>

<%
  FormSite form = (FormSite)request.getAttribute("form");
%>

<form class="form-inline" action="ajouter" method="POST">
  <label for="nom">Nom : </label>
  <input id="nom" type="text" name="nom"  size="30" maxlength="30">
  </br>

  <%-- Champ Liste des pays --%>
  <label for="sport">Sport : </label>
  <select name="idSport">
    <%
      ArrayList<Sport> lesSports= (ArrayList)request.getAttribute("pLesSports");
      for (int i=0; i<lesSports.size();i++){
        Sport sp = lesSports.get(i);
        out.println("<option value='" + sp.getId()+"'>" + sp.getNom()+"</option>" );
      }
    %>
  </select>
  </br>

  <input type="submit" name="valider" id="valider" value="Valider"/>
</form>




</body>
</html>