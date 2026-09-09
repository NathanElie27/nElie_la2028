<%-- 
    Document   : listerAthletes
    Created on : 25 août 2026, 12:27:51
    Author     : zakina
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="sio.la2028.model.Athlete"%>
<%@page import="sio.la2028.model.Pays"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LOS ANGELES 2028</title>
    </head>
    <body>
        <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LOS ANGELES 2028</title>
    </head>
    <body>
        <%
                Athlete a = (Athlete)request.getAttribute("pAthlete");
        %>
        <h1><%  out.println(a.getNom());%></h1>

        <% SimpleDateFormat formatFr = new SimpleDateFormat("dd/MM/yyyy");  %>
            <table>
            <tr>
                <td>Id: </td><td><%  out.println(a.getId());%></td>
            </tr>
            <tr>
                <td>Nom : </td><td><%  out.println(a.getNom());%></td>
            </tr>
            <tr>
                <td>Prenom : </td><td><%  out.println(a.getPrenom());%></td>
            </tr>
            <tr>
                <td>Date naissance : </td><td><%out.println(formatFr.format(a.getDateNaiss())); %></td>
            </tr>
            <tr>
                <td>Pays : </td><td><%  out.println(a.getPays().getNom());%></td>
            </tr>

        </table>
</html>
