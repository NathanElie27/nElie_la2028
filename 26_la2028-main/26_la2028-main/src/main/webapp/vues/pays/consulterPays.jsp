<%@ page import="sio.la2028.model.Pays" %>
<%@ page import="java.time.format.DateTimeFormatter" %><%--
  Created by IntelliJ IDEA.
  User: sio2
  Date: 21/09/2026
  Time: 10:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<%
    Pays p = (Pays)request.getAttribute("pAthlete");
%>
<h1><% out.println(p.getNom()); %></h1>
<body>
    <table>
        <tr>
            <td>Id : </td><td><% out.println(p.getId()); %></td>
        </tr>
        <tr>
            <td Code : ></td><td><% out.println(p.getCode());%></td>
        </tr>
        <tr>
            <td>Nom : </td><td><% out.println(p.getNom()); %></td>
        </tr>
    </table>
</body>
</html>
