<%-- 
    Document   : consulterAthlete
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="sio.la2028.model.Athlete"%>
<%@page import="sio.la2028.model.Pays"%>
<%@page import="sio.la2028.model.Sport"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@ page import="sio.la2028.model.Athlete_Epreuve" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LA 2028 - Fiche Athlète</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Anton&family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <!-- CSS Personnalisé -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/style.css">
    <style>
        body { background-color: #f3f4f6 !important; color: #1f2937 !important; }
        .light-card { background-color: #ffffff; border: 1px solid #e5e7eb; border-radius: 16px; box-shadow: 0 10px 25px rgba(0, 0, 0, 0.05); overflow: hidden; }
        .circle-logo { width: 160px; height: 160px; margin: 0 auto; border-radius: 50%; background-color: #ffffff; border: 3px solid var(--la-magenta); display: flex; align-items: center; justify-content: center; overflow: hidden; box-shadow: 0 8px 20px rgba(255, 0, 85, 0.15); }
        .circle-logo img { width: 100%; height: 100%; object-fit: cover; }
        .table-light-theme th { background-color: #f9fafb; color: #6b7280; font-weight: 700; text-transform: uppercase; font-size: 0.85rem; letter-spacing: 1px; border-bottom: 2px solid #e5e7eb; }
        .table-light-theme td { color: #374151; border-bottom: 1px solid #f3f4f6; vertical-align: middle; }
        .table-light-theme tbody tr:hover td { background-color: #f9fafb; }
    </style>
</head>
<body class="d-flex flex-column min-vh-100">

<!-- INCLUSION DU HEADER GLOBAL -->
<jsp:include page="../includes/header.jsp">
    <jsp:param name="active" value="athlete" />
</jsp:include>

<main class="container py-5 flex-grow-1">
    <%
        Athlete a = (Athlete)request.getAttribute("pAthlete");
        DateTimeFormatter formatFr = DateTimeFormatter.ofPattern("dd/MM/yyyy");
    %>

    <!-- En-tête -->
    <div class="d-flex align-items-center justify-content-between mb-4 fade-in">
        <div>
            <span class="badge" style="background-color: var(--la-magenta); font-size: 0.8rem; letter-spacing: 1px;">PROFIL ATHLÈTE</span>
        </div>
        <a href="${pageContext.request.contextPath}/ServletAthlete/lister" class="action-btn text-decoration-none" style="color: #4b5563;">
            <span style="transform: rotate(180deg); display: inline-block; margin-right: 8px;">→</span> Retour aux athlètes
        </a>
    </div>

    <div class="row g-4 mb-5 fade-in">
        <!-- 1. CARTE PROFIL -->
        <div class="col-12 col-lg-4">
            <div class="light-card p-4 h-100 d-flex flex-column text-center">

                <div class="circle-logo mb-4 mt-3">
                    <img src="${pageContext.request.contextPath}<%= a.getPhoto() %>" alt="Photo de <%= a.getNom() %>">
                </div>

                <h2 class="mb-1 text-dark" style="font-family: 'Anton', sans-serif; letter-spacing: 1px; font-size: 2.2rem;">
                    <%= a.getNom() %>
                </h2>
                <h4 class="mb-4 text-secondary"><%= a.getPrenom() %></h4>

                <div class="w-100 mt-auto text-start">
                    <ul class="list-unstyled mb-0 border-top pt-3" style="border-color: #e5e7eb !important;">
                        <li class="d-flex justify-content-between py-2">
                            <span class="text-uppercase small fw-bold text-muted">Identifiant</span>
                            <span class="badge bg-secondary rounded-pill px-2">#<%= a.getId() %></span>
                        </li>
                        <li class="d-flex justify-content-between py-2">
                            <span class="text-uppercase small fw-bold text-muted">Naissance</span>
                            <span class="fw-medium"><%= a.getDateNaiss().format(formatFr) %> (<%= a.getAge() %> ans)</span>
                        </li>
                        <li class="d-flex justify-content-between py-2">
                            <span class="text-uppercase small fw-bold text-muted">Pays</span>
                            <span class="fw-bold text-dark"><%= a.getPays().getNom() %></span>
                        </li>
                        <li class="d-flex justify-content-between py-2">
                            <span class="text-uppercase small fw-bold text-muted">Sport</span>
                            <span class="fw-bold" style="color: var(--la-magenta);"><%= a.getSport().getNom() %></span>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <!-- 2. TABLEAU DES ÉPREUVES -->
        <div class="col-12 col-lg-8">
            <div class="light-card h-100 d-flex flex-column">
                <div class="p-4 border-bottom" style="background-color: #ffffff; border-color: #e5e7eb !important;">
                    <h3 class="m-0" style="font-family: 'Anton', sans-serif; font-size: 1.6rem; letter-spacing: 1px; color: var(--la-magenta);">
                        PALMARÈS & ÉPREUVES
                    </h3>
                </div>

                <div class="table-responsive p-0 flex-grow-1" style="background-color: #ffffff;">
                    <% ArrayList<Athlete_Epreuve> lesAthletesEpreuves = (ArrayList)request.getAttribute("pLesAthletesEpreuves"); %>
                    <table class="table table-light-theme mb-0 w-100">
                        <thead>
                        <tr>
                            <th class="py-3 px-4 text-center" style="width: 100px;">Place</th>
                            <th class="py-3 px-4">Épreuve</th>
                            <th class="py-3 px-4">Sport</th>
                        </tr>
                        </thead>
                        <tbody>
                        <% if(lesAthletesEpreuves != null && !lesAthletesEpreuves.isEmpty()) {
                            for (Athlete_Epreuve ae : lesAthletesEpreuves) { %>
                        <tr style="transition: background 0.2s;">
                            <td class="py-3 px-4 align-middle text-center">
                                <% if(ae.getPlace() == 1) { %>
                                <span class="badge" style="background-color: #fbbf24; color: #000;">1er 🥇</span>
                                <% } else if(ae.getPlace() == 2) { %>
                                <span class="badge" style="background-color: #9ca3af; color: #fff;">2ème 🥈</span>
                                <% } else if(ae.getPlace() == 3) { %>
                                <span class="badge" style="background-color: #b45309; color: #fff;">3ème 🥉</span>
                                <% } else { %>
                                <span class="fw-bold"><%= ae.getPlace() %></span>
                                <% } %>
                            </td>
                            <td class="py-3 px-4 align-middle fw-bold" style="color: #111827;">
                                <%= ae.getEpreuve().getLibelle() %>
                            </td>
                            <td class="py-3 px-4 align-middle">
                                <%= a.getSport().getNom() %>
                            </td>
                        </tr>
                        <%  } } else { %>
                        <tr>
                            <td colspan="3" class="text-center py-5" style="color: #6b7280; font-size: 1.1rem; background-color: #f9fafb;">
                                <i>Cet athlète n'est rattaché à aucune épreuve pour le moment.</i>
                            </td>
                        </tr>
                        <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</main>

<jsp:include page="../includes/footer.jsp" />

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/style/script.js"></script>
</body>
</html>