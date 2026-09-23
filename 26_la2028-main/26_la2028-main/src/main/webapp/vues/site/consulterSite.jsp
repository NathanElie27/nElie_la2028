<%@ page import="sio.la2028.model.Site" %>
<%@ page import="sio.la2028.model.Sport" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: sio2
  Date: 21/09/2026
  Time: 16:05
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
<body>
  <%
    Site s = (Site) request.getAttribute("pSite");
  %>
  <h1><% out.println(s.getNom()); %></h1>

  <% out.println("<img src='" + request.getContextPath() + s.getPhoto() + "' alt='Photo du Site'>"); %>
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
    <h2 class="h2">Liste des Sports</h2>
    <div class="table-responsive">
      <%
        ArrayList<Sport> lesSports = (ArrayList)request.getAttribute("plesSports");
      %>


      <table class="table table-striped table-sm">
        <tbody>
        <tr>
          <th>id</th>
          <th>nom</th>
        </tr>
        <tr>
          <%
            for (Sport sp : lesSports) {
              out.println("<tr><td>");
              out.println(sp.getId());
              out.println("</td>");

              out.println("<td>");
              out.println(sp.getNom());
              out.println("</a></td>");
            }
          %>
        </tr>
        </tbody>
      </table>
    </div>
  </div>
</body>
</html>
