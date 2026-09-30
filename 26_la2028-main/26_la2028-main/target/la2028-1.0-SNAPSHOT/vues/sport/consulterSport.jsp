<%@ page import="sio.la2028.model.Sport" %>
<%@ page import="sio.la2028.model.Athlete" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>LA 2028 - Fiche Sport</title>
  <!-- Bootstrap 5 CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css2?family=Anton&family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
  <!-- CSS Personnalisé -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/style/style.css">

  <style>
    /* Surcharges pour un design CLAIR, LUMINIEUX et MODERNE sur cette page */
    body {
      background-color: #f3f4f6 !important; /* Fond gris très clair */
      color: #1f2937 !important; /* Texte gris foncé */
    }
    .bg-overlay {
      display: none; /* On désactive le calque noir global pour cette page */
    }
    .light-card {
      background-color: #ffffff;
      border: 1px solid #e5e7eb;
      border-radius: 16px;
      box-shadow: 0 10px 25px rgba(0, 0, 0, 0.05); /* Ombre douce */
      overflow: hidden;
    }
    /* Conteneur pour rendre le logo circulaire */
    .circle-logo {
      width: 160px;
      height: 160px;
      margin: 0 auto;
      border-radius: 50%;
      background-color: #ffffff;
      border: 3px solid var(--la-magenta);
      display: flex;
      align-items: center;
      justify-content: center;
      overflow: hidden;
      box-shadow: 0 8px 20px rgba(255, 0, 85, 0.15);
    }
    .circle-logo img {
      width: 75%;
      height: 75%;
      object-fit: contain;
    }
    /* Design du tableau clair */
    .table-light-theme th {
      background-color: #f9fafb;
      color: #6b7280;
      font-weight: 700;
      text-transform: uppercase;
      font-size: 0.85rem;
      letter-spacing: 1px;
      border-bottom: 2px solid #e5e7eb;
    }
    .table-light-theme td {
      color: #374151;
      border-bottom: 1px solid #f3f4f6;
      vertical-align: middle;
    }
    .table-light-theme tbody tr:hover td {
      background-color: #f9fafb;
    }
  </style>
</head>
<body class="d-flex flex-column min-vh-100">

<!-- INCLUSION DU HEADER GLOBAL -->
<jsp:include page="../includes/header.jsp">
  <jsp:param name="active" value="sport" />
</jsp:include>

<!-- Contenu principal -->
<main class="container py-5 flex-grow-1">
  <%
    // BACK-END INTACT
    Sport s = (Sport) request.getAttribute("pSport");
  %>

  <!-- En-tête de la page (Bouton retour) -->
  <div class="d-flex align-items-center justify-content-between mb-4 fade-in">
    <div>
      <span class="badge" style="background-color: var(--la-magenta); font-size: 0.8rem; letter-spacing: 1px;">FICHE OFFICIELLE</span>
    </div>
    <a href="${pageContext.request.contextPath}/ServletSport/lister" class="action-btn text-decoration-none" style="color: #4b5563;">
      <span style="transform: rotate(180deg); display: inline-block; margin-right: 8px;">→</span> Retour aux sports
    </a>
  </div>

  <div class="row g-4 mb-5 fade-in">

    <!-- 1. CARTE INFOS DU SPORT (GAUCHE) -->
    <div class="col-12 col-lg-4">
      <div class="light-card p-4 h-100 d-flex flex-column align-items-center text-center">

        <!-- Logo en cercle -->
        <div class="circle-logo mb-4 mt-3">
          <img src="${pageContext.request.contextPath}<%= s.getPhoto() %>" alt="Logo <%= s.getNom() %>">
        </div>

        <!-- Nom du sport en grand sous le logo -->
        <h2 class="mb-4 text-dark" style="font-family: 'Anton', sans-serif; letter-spacing: 1px; font-size: 2.2rem;">
          <%= s.getNom() %>
        </h2>

        <!-- Détails -->
        <div class="w-100 mt-auto">
          <ul class="list-unstyled mb-0">
            <li class="d-flex justify-content-between align-items-center py-3 border-top" style="border-color: #e5e7eb !important;">
              <span class="fw-bold text-uppercase" style="color: #9ca3af; font-size: 0.85rem; letter-spacing: 1px;">Identifiant Interne</span>
              <span class="badge bg-secondary rounded-pill px-3 py-2">#<%= s.getId() %></span>
            </li>
          </ul>
        </div>
      </div>
    </div>

    <!-- 2. TABLEAU DES ATHLÈTES (DROITE) -->
    <div class="col-12 col-lg-8">
      <div class="light-card h-100 d-flex flex-column">

        <!-- En-tête de la carte fixé en haut -->
        <div class="p-4 border-bottom d-flex align-items-center" style="background-color: #ffffff; border-color: #e5e7eb !important;">
          <h3 class="m-0" style="font-family: 'Anton', sans-serif; font-size: 1.6rem; letter-spacing: 1px; color: var(--la-magenta);">
            ATHLÈTES INSCRITS EN <%= s.getNom().toUpperCase() %>
          </h3>
        </div>

        <!-- Tableau -->
        <div class="table-responsive p-0 flex-grow-1" style="background-color: #ffffff;">
          <%
            // BACK-END INTACT
            ArrayList<Athlete> lesAthletes = (ArrayList)request.getAttribute("pLesAthletes");
          %>
          <table class="table table-light-theme mb-0 w-100">
            <thead>
            <tr>
              <th class="py-3 px-4 text-center" style="width: 100px;">ID</th>
              <th class="py-3 px-4">Nom de famille</th>
              <th class="py-3 px-4">Prénom</th>
            </tr>
            </thead>
            <tbody>
            <%
              if(lesAthletes != null && !lesAthletes.isEmpty()) {
                for (Athlete a : lesAthletes) {
            %>
            <tr style="transition: background 0.2s;">
              <td class="py-3 px-4 align-middle text-center">
                <span class="badge bg-light text-secondary border px-2 py-1">#<%= a.getId() %></span>
              </td>
              <td class="py-3 px-4 align-middle fw-bold">
                <a href="${pageContext.request.contextPath}/ServletAthlete/consulter?idAthlete=<%= a.getId() %>"
                   class="text-decoration-none"
                   style="color: #111827; transition: color 0.3s;"
                   onmouseover="this.style.color='var(--la-magenta)'"
                   onmouseout="this.style.color='#111827'">
                  <%= a.getNom() %>
                </a>
              </td>
              <td class="py-3 px-4 align-middle" style="font-weight: 500;">
                <%= a.getPrenom() %>
              </td>
            </tr>
            <%      }
            } else {
            %>
            <tr>
              <td colspan="3" class="text-center py-5" style="color: #6b7280; font-size: 1.1rem; background-color: #f9fafb;">
                <i>Aucun athlète n'est rattaché à ce sport pour le moment.</i>
              </td>
            </tr>
            <%  } %>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</main>

<!-- INCLUSION DU FOOTER GLOBAL -->
<jsp:include page="../includes/footer.jsp" />

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/style/script.js"></script>
</body>
</html>