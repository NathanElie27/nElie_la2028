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
            <a  href ='../ServletAthlete/lister' class="navbar-brand" href=".">Système de gestion des athlètes</a>
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
                <th>nom</th>
                <th>code</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <% for (Pays p : lesPays ) { %>
                <tr>
                    <td><%= p.getId() %></td>
                    <td><%= p.getCode() %></td>
                    <td><%= p.getNom() %></td>
                <tr>
                <% } %>
            </tr>
            </tbody>
        </table>
</body>
</html>
