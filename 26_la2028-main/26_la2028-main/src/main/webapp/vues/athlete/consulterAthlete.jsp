<%-- 
    Document   : consulterAthlete
    Created on : 25 août 2026, 12:27:51
    Author     : zakina
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="sio.la2028.model.Athlete"%>
<%@page import="sio.la2028.model.Pays"%>
<%@page import="sio.la2028.model.Sport"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@ page import="sio.la2028.model.Athlete_Epreuve" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>LOS ANGELES 2028</title>
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
          crossorigin="anonymous">
</head>
<body>
<%
    Athlete a = (Athlete)request.getAttribute("pAthlete");
    DateTimeFormatter formatFr = DateTimeFormatter.ofPattern("dd/MM/yyyy");
%>
<h1><% out.println(a.getNom()); %></h1>

<% out.println("<img src='" + request.getContextPath() + a.getPhoto() + "' alt='Photo de l'athlète'>"); %>



<table>
    <tr>
        <td>Id : </td><td><% out.println(a.getId()); %></td>
    </tr>
    <tr>
        <td>Nom : </td><td><% out.println(a.getNom()); %></td>
    </tr>
    <tr>
        <td>Prenom : </td><td><% out.println(a.getPrenom()); %></td>
    </tr>
    <tr>
        <td>Date naissance : </td>
        <td><% out.println(a.getDateNaiss().format(formatFr)+" - " + a.getAge()+" ans");%></td>);
    </tr>
    <tr>
        <td>Pays : </td><td><% out.println(a.getPays().getNom()); %></td>
    </tr>
    <tr>
        <td>Sport : </td><td><% out.println(a.getSport().getNom()); %></td>
    </tr>
</table>
<br><br><br><br>
<div class="container special">
    <h2 class="h2">Liste des athlètes</h2>
    <div class="table-responsive">
        <%
            ArrayList<Athlete_Epreuve> lesAthletesEpreuves = (ArrayList)request.getAttribute("pLesAthletesEpreuves");
        %>
        <table class="table table-striped table-sm">
            <tbody>
            <tr>
                <th>place</th>
                <th>epreuve</th>
                <th>sport</th>
            </tr>
            <tr>
                <%
                        for (Athlete_Epreuve ae : lesAthletesEpreuves) {
                            out.println("<tr><td>");
                            out.println(ae.getPlace());
                            out.println("</td>");

                            out.println("<td>");
                            out.println(ae.getEpreuve().getLibelle());
                            out.println("</td>");

                            out.println("<td>");
                            out.println(a.getSport().getNom());
                            out.println("</td>");

                            out.println("<td>");

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