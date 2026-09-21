<%@ page import="sio.la2028.model.Pays" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="sio.la2028.model.Athlete" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="sio.la2028.model.Epreuve" %><%--
  Created by IntelliJ IDEA.
  User: sio2
  Date: 21/09/2026
  Time: 10:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>LOS ANGELES 2028</title>
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
          crossorigin="anonymous">
</head>
<%
    Epreuve ep = (Epreuve) request.getAttribute("pEpreuve");
%>
<h1><% out.println(ep.getLibelle()); %></h1>
<table>
    <tr>
        <td>Id : </td><td><% out.println(ep.getCode()); %></td>
    </tr>
    <tr>
        <td>Nom : </td><td><% out.println(ep.getLibelle()); %></td>
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

                        out.println("<td><a href ='../ServletAthlete/consulter?idAthlete="+ a.getId()+ "'>");
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
</body>
</html>
