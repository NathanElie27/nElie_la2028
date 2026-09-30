<%--
  Document: consulterEpreuve
--%>
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
    <title>LA 2028 - Fiche Épreuve</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Anton&family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/style.css">
    <style>
        body { background-color: #f3f4f6 !important; color: #1f2937 !important; }
        .light-card { background-color: #ffffff; border: 1px solid #e5e7eb; border-radius: 16px; box-shadow: 0 10px 25px rgba(0, 0, 0, 0.05); overflow: hidden; }
        .table-light-theme th { background-color: #f9fafb; color: #6b7280; font-weight: 700; text-transform: uppercase; font-size: 0.85rem; letter-spacing: 1px; border-bottom: 2px solid #e5e7eb; }
        .table-light-theme td { color: #374151; border-bottom: 1px solid #f3f4f6; vertical-align: middle; }
        .table-light-theme tbody tr:hover td { background-color: #f9fafb; }
    </style>
</head>
<body class="d-flex flex-column min-vh-100">

<!-- INCLUSION DU HEADER GLOBAL -->
<jsp:include page="../includes/header.jsp">
    <jsp:param name="active" value="epreuve" />
</jsp:include>

<main class="container py-5 flex-grow-1">
    <% Epreuve ep = (Epreuve) request.getAttribute("pEpreuve"); %>

    <div class="d-flex align-items-center justify-content-between mb-4 fade-in">
        <div>
            <span class="badge" style="background-color: var(--la-magenta); font-size: 0.8rem; letter-spacing: 1px;">DÉTAILS COMPÉTITION</span>
        </div>
        <a href="${pageContext.request.contextPath}/ServletEpreuve/lister" class="action-btn text-decoration-none" style="color: #4b5563;">
            <span style="transform: rotate(180deg); display: inline-block; margin-right: 8px;">→</span> Retour aux épreuves
        </a>
    </div>

    <!-- CARTE EN TÊTE - INFOS ÉPREUVE -->
    <div class="light-card p-4 p-md-5 mb-5 fade-in d-flex justify-content-between align-items-center flex-wrap gap-3">
        <div>
            <span class="text-muted text-uppercase fw-bold small" style="letter-spacing: 1px;">Épreuve Officielle</span>
            <h1 class="m-0 mt-2 text-dark" style="font-family: 'Anton', sans-serif; font-size: 2.8rem; letter-spacing: 1px;">
                <%= ep.getLibelle() %>
            </h1>
        </div>
        <div class="text-end">
            <span class="text-muted text-uppercase fw-bold small d-block mb-1" style="letter-spacing: 1px;">Code Identifiant</span>
            <span class="badge rounded-pill fs-5 px-4 py-2" style="background-color: #111827;">#<%= ep.getCode() %></span>
        </div>
    </div>

    <!-- CARTE TABLEAU ATHLÈTES -->
    <div class="light-card fade-in h-100 d-flex flex-column">
        <div class="p-4 border-bottom" style="background-color: #ffffff; border-color: #e5e7eb !important;">
            <h3 class="m-0" style="font-family: 'Anton', sans-serif; font-size: 1.6rem; letter-spacing: 1px; color: var(--la-magenta);">
                PARTICIPANTS QUALIFIÉS
            </h3>
        </div>

        <div class="table-responsive p-0 flex-grow-1" style="background-color: #ffffff;">
            <% ArrayList<Athlete> lesAthletes = (ArrayList)request.getAttribute("pLesAthletes"); %>
            <table class="table table-light-theme mb-0 w-100">
                <thead>
                <tr>
                    <th class="py-3 px-4 text-center" style="width: 100px;">ID</th>
                    <th class="py-3 px-4">Nom de famille</th>
                    <th class="py-3 px-4">Prénom</th>
                </tr>
                </thead>
                <tbody>
                <% if(lesAthletes != null && !lesAthletes.isEmpty()) {
                    for (Athlete a : lesAthletes) { %>
                <tr style="transition: background 0.2s;">
                    <td class="py-3 px-4 align-middle text-center">
                        <span class="badge bg-light text-secondary border px-2 py-1">#<%= a.getId() %></span>
                    </td>
                    <td class="py-3 px-4 align-middle fw-bold">
                        <a href="${pageContext.request.contextPath}/ServletAthlete/consulter?idAthlete=<%= a.getId() %>"
                           class="text-decoration-none fs-5"
                           style="color: #111827; transition: color 0.3s;"
                           onmouseover="this.style.color='var(--la-magenta)'"
                           onmouseout="this.style.color='#111827'">
                            <%= a.getNom() %>
                        </a>
                    </td>
                    <td class="py-3 px-4 align-middle fs-5">
                        <%= a.getPrenom() %>
                    </td>
                </tr>
                <%  } } else { %>
                <tr>
                    <td colspan="3" class="text-center py-5" style="color: #6b7280; font-size: 1.1rem; background-color: #f9fafb;">
                        <i>Aucun athlète n'est encore qualifié pour cette épreuve.</i>
                    </td>
                </tr>
                <% } %>
                </tbody>
            </table>
        </div>
    </div>
</main>

<jsp:include page="../includes/footer.jsp" />

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/style/script.js"></script>
</body>
</html>