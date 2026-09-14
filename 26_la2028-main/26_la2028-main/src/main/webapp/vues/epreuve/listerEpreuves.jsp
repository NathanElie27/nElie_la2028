<%--
    Document   : listerEpreuves
    Created on : 25 août 2026, 12:27:51
    Author     : zakina
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="sio.la2028.model.Epreuve"%>
<%@page import="sio.la2028.model.Pays"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>LOS ANGELES 2028</title>
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
          crossorigin="anonymous">

    <title>LOS ANGELES 2028</title>
</head>
<body>

<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <a  href ='../ServletSport/lister' class="navbar-brand" href=".">Système de gestion des sports</a>
        </div>
    </div>
</nav>
<div class="container special">
    <br><br> <br>
    <h2 class="h2">Liste des épreuves</h2>
    <div class="table-responsive">
            <%
                    ArrayList<Epreuve> lesEpreuves = (ArrayList)request.getAttribute("pLesEpreuves");
                %>

        <table class="table table-striped table-sm">
            <thead>
            <tr>
                <th>Code</th>
                <th>Libelle épreuve</th>
                <th>Nom sport</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <%

                    for (Epreuve e : lesEpreuves)
                    {
                        out.println("<tr><td>");
                        out.println(e.getCode());
                        out.println("</td>");

                        out.println("<td>");
                        out.println(e.getLibelle(resultatRequete.getString("e_libelle")));
                        out.println("</td>");

                        out.println("<td>");
                        out.println(e.getSport().getNom());
                        out.println("</td>");

                    }
                %>
            </tr>
            </tbody>
        </table>
</body>

</html>
