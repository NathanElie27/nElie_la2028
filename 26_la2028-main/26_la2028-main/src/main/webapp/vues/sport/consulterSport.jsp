<%@ page import="sio.la2028.model.Sport" %>
<%@ page import="sio.la2028.model.Athlete" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: sio2
  Date: 21/09/2026
  Time: 13:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
  <%
    Sport s = (Sport) request.getAttribute("pSport");
  %>
<h1><% out.println(s.getNom()); %></h1>
<table>
  <tr>
    <td>Id : </td><td><% out.println(s.getId()); %></td>
  </tr>
  <tr>
    <td>Nom : </td><td><% out.println(s.getNom()); %></td>
  </tr>
</table>
<br><br><br><br>
<div class="container special">
  <h2 class="h2">Liste des athlètes</h2>
  <div class="table-responsive">
    <%
      ArrayList<Athlete> lesAthletes = (ArrayList)request.getAttribute("pLesAthletes");
    %>
    <table class="table table-striped table-sm">
      <tbody>
      <tr>
        <th>id</th>
        <th>nom</th>
        <th>prenom</th>
      </tr>
      <tr>
        <%
          for (Athlete a : lesAthletes) {
            out.println("<tr><td>");
            out.println(a.getId());
            out.println("</td>");

            out.println("<td><a href ='../ServletSport/consulter?idAthlete="+ a.getId()+ "'>");
            out.println(a.getNom());
            out.println("</a></td>");

            out.println("<td>");
            out.println(a.getPrenom());
            out.println("</td>");
          }
        %>
      </tr>
      </tbody>
    </table>
  </div>
</div>
</html>
