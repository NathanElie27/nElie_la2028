<%@ page import="sio.la2028.model.Pays" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="sio.la2028.model.Athlete" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="sio.la2028.model.Epreuve" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LOS ANGELES 2028 - Consulter Pays</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <!-- Ton style centralisé -->
    <link rel="stylesheet" href="../../style/style.css">
</head>
<body>
<!-- Remplacer par ton header global si tu as créé le header.jsp -->
<header>
    <nav class="navbar navbar-default">
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand" href="../../index.html">JO 2028</a>
            </div>
        </div>
    </nav>
</header>

<main class="container">
    <% Pays p = (Pays) request.getAttribute("pPays"); %>

    <!-- En-tête du pays avec la photo -->
    <div class="row text-center" style="margin-bottom: 30px;">
        <h1 class="page-header"><% out.println(p.getNom()); %></h1>
        <% out.println("<img src='" + request.getContextPath() + p.getPhoto() + "' alt='Photo du Pays' class='img-thumbnail' style='max-width: 250px;'>"); %>
    </div>

    <!-- Tableau des informations du pays -->
    <div class="row">
        <div class="col-md-6 col-md-offset-3">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">Informations</h3>
                </div>
                <table class="table table-bordered table-striped">
                    <tr>
                        <th style="width: 30%;">Id</th>
                        <td><% out.println(p.getId()); %></td>
                    </tr>
                    <tr>
                        <th>Nom</th>
                        <td><% out.println(p.getNom()); %></td>
                    </tr>
                </table>
            </div>
        </div>
    </div>

    <hr>

    <!-- Liste des athlètes -->
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <div class="container-fluid special">
                <h2 class="h2 text-center" style="margin-bottom: 20px;">Liste des athlètes</h2>
                <div class="table-responsive">
                    <%
                        ArrayList<Athlete> lesAthletes = (ArrayList)request.getAttribute("pLesAthletes");
                    %>
                    <table class="table table-striped table-hover table-bordered table-sm">
                        <thead class="bg-primary">
                        <tr>
                            <th class="text-center" style="color: white;">ID</th>
                            <th style="color: white;">Nom</th>
                            <th style="color: white;">Prénom</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            if (lesAthletes != null) {
                                for (Athlete a : lesAthletes) {
                                    out.println("<tr>");

                                    out.println("<td class='text-center'>" + a.getId() + "</td>");

                                    out.println("<td><a href='../ServletAthlete/consulter?idAthlete="+ a.getId()+ "'>" + a.getNom() + "</a></td>");

                                    out.println("<td>" + a.getPrenom() + "</td>");

                                    out.println("</tr>");
                                }
                            }
                        %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</main>

<script src="../../style/script.js"></script>
</body>
</html>