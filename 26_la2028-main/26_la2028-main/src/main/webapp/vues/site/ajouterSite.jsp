<%--
    Document   : ajouterAthlete
    Created on : 25/08/2026, 13:30:47
    Author     : zakina
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="sio.la2028.model.Pays"%>
<%@page import="sio.la2028.model.Athlete"%>
<%@page import="sio.la2028.form.FormAthlete"%>
<%@ page import="sio.la2028.form.FormEpreuve" %>
<%@ page import="sio.la2028.model.Sport" %>
<%@ page import="sio.la2028.form.FormSite" %>
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>LOS ANGELES 2028 - Nouveau Site</title>

  <!-- Bootstrap -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <!-- Ton style centralisé -->
  <link rel="stylesheet" href="../../style/style.css">
</head>
<body>
<!-- Header pour garder la cohérence du design -->
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
  <div class="row">
    <!-- Colonne centrée pour le formulaire -->
    <div class="col-md-6 col-md-offset-3">
      <div class="panel panel-primary" style="margin-top: 40px;">
        <div class="panel-heading text-center">
          <h2 class="panel-title" style="font-size: 24px; font-weight: bold;">NOUVEAU Site</h2>
        </div>

        <div class="panel-body" style="padding: 30px;">
          <%
            FormSite form = (FormSite)request.getAttribute("form");
          %>

          <form action="ajouter" method="POST">

            <!-- Champ Nom -->
            <div class="form-group">
              <label for="nom">Nom du site :</label>
              <input id="nom" class="form-control" type="text" name="nom" size="30" maxlength="30" placeholder="Ex: Stade de France" required>
            </div>

            <!-- Menu déroulant Sport -->
            <div class="form-group">
              <label for="idSport">Sport :</label>
              <select name="idSport" id="idSport" class="form-control">
                <%
                  ArrayList<Sport> lesSports= (ArrayList)request.getAttribute("pLesSports");
                  if (lesSports != null) {
                    for (int i=0; i<lesSports.size();i++){
                      Sport sp = lesSports.get(i);
                      out.println("<option value='" + sp.getId()+"'>" + sp.getNom()+"</option>" );
                    }
                  }
                %>
              </select>
            </div>

            <!-- Bouton Valider centré -->
            <div class="form-group text-center" style="margin-top: 30px; margin-bottom: 0;">
              <input type="submit" name="valider" id="valider" value="Valider" class="btn btn-primary btn-lg" style="width: 100%;">
            </div>

          </form>
        </div>
      </div>
    </div>
  </div>
</main>

<script src="../../style/script.js"></script>
</body>
</html>