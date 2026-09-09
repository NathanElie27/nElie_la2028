<%--
    Document   : listerSports
    Created on : 25 août 2026, 12:27:51
    Author     : zakina
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="sio.la2028.model.Sport"%>
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
				<a  href ='../ServletAthlete/lister' class="navbar-brand" href=".">Système de gestion des athlètes</a>
			</div>
		</div>
	</nav>
       <div class="container special">
            <h2 class="h2">Liste des athlètes</h2>
		<div class="table-responsive">
                <%
                    ArrayList<Sport> lesSports = (ArrayList)request.getAttribute("pLesSports");
                %>
                <table class="table table-striped table-sm">
                <thead>
                    <tr>
                        <th>id</th>
                        <th>nom</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <%

                            for (Sport a : lesSports)
                            {
                                out.println("<tr><td>");
                                out.println(a.getId());
                                out.println("</td>");

                                out.println("<td>");
                                out.println(a.getNom());
                                out.println("</td></tr>");
                            }
                        %>
                    </tr>
                </tbody>
            </table>
        </body>

</html>
