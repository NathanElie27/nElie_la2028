<%--
    Document   : listerSports
    Created on : 25 août 2026, 12:27:51
    Author     : zakina
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="sio.la2028.model.Pays"%>
<%@page import="java.util.ArrayList"%>
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
            <a href='../index.html' class="navbar-brand">Accueil</a>
            <a  href ='../ServletAthlete/lister' class="navbar-brand" href=".">Athletes</a>
            <a  href ='../ServletSport/lister' class="navbar-brand" href=".">Sport</a>
            <a  href ='../ServletEpreuve/lister' class="navbar-brand" href=".">Epreuves</a>
            <a  href ='../ServletPays/lister' class="navbar-brand" href=".">Pays</a>
            <a  href ='../ServletSite/lister' class="navbar-brand" href=".">Sites</a>
        </div>
    </div>
</nav>
<br><br><br><br>
<div class="container special">
    <h2 class="h2">Liste des pays</h2>
    <div class="table-responsive">
            <%
                    ArrayList<Pays> lesPays = (ArrayList)request.getAttribute("pLesPays");
                %>
        <table class="table table-striped table-sm">
            <thead>
            <tr>
                <th>id</th>
                <th>code</th>
                <th>nom</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <% for (Pays p : lesPays ) { %>
                <tr>
                <!--   <a href ='../ServletAthlete/consulter?idAthlete="+ a.getId()+ "'>               -->

                <td><%= p.getId() %></td>
                <td><%= p.getCode() %></td>
                <td><a href="../ServletPays/consulter?idPays=<%= p.getId() %>"><%= p.getNom() %></a></td>
                <tr>
                <% } %>
            </tr>
            </tbody>
        </table>
</body>
</html>
