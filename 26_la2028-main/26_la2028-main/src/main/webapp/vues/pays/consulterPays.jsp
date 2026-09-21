<%@ page import="sio.la2028.model.Pays" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="sio.la2028.model.Athlete" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: sio2
  Date: 21/09/2026
  Time: 10:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Consulter Pays</title>
</head>
<%
    Pays p = (Pays)request.getAttribute("pPays");
%>
<h1><% out.println(p.getNom()); %></h1>
<table>
        <tr>
            <td>Id : </td><td><% out.println(p.getId()); %></td>
        </tr>
        <tr>
            <td> Code : </td><td><% out.println(p.getCode());%></td>
        </tr>
        <tr>
            <td>Nom : </td><td><% out.println(p.getNom()); %></td>
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

                            out.println("<td>");
                            out.println(a.getNom());
                            out.println("</td>");

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
