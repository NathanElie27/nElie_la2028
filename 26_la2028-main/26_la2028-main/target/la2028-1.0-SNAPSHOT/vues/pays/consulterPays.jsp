<%@ page import="sio.la2028.model.Pays" %>
<%@ page import="sio.la2028.model.Athlete" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LA 2028 - Fiche Pays</title>
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
    <jsp:param name="active" value="pays" />
</jsp:include>

<main class="container py-5 flex-grow-1">
    <% Pays p = (Pays) request.getAttribute("pPays"); %>

    <!-- En-tête -->
    <div class="d-flex align-items-center justify-content-between mb-4 fade-in">
        <div>
            <span class="badge" style="background-color: var(--la-magenta); font-size: 0.8rem; letter-spacing: 1px;">DÉLÉGATION NATIONALE</span>
        </div>
        <a href="${pageContext.request.contextPath}/ServletPays/lister" class="action-btn text-decoration-none" style="color: #4b5563;">
            <span style="transform: rotate(180deg); display: inline-block; margin-right: 8px;">→</span> Retour aux pays
        </a>
    </div>

    <div class="row g-4 mb-5 fade-in">
        <!-- 1. CARTE PROFIL DU PAYS -->
        <div class="col-12 col-lg-4">
            <div class="light-card p-4 h-100 d-flex flex-column text-center">

                <div class="circle-logo mb-4 mt-3">
                    <img src="${pageContext.request.contextPath}<%= p.getPhoto() %>" alt="Drapeau de <%= p.getNom() %>">
                </div>

                <h2 class="mb-4 text-dark" style="font-family: 'Anton', sans-serif; letter-spacing: 1px; font-size: 2.2rem;">
                    <%= p.getNom() %>
                </h2>

                <div class="w-100 mt-auto text-start">
                    <ul class="list-unstyled mb-0 border-top pt-3" style="border-color: #e5e7eb !important;">
                        <li class="d-flex justify-content-between py-2 border-bottom" style="border-color: #f3f4f6 !important;">
                            <span class="text-uppercase small fw-bold text-muted">ID Système</span>
                            <span class="badge bg-secondary rounded-pill px-2">#<%= p.getId() %></span>
                        </li>
                        <li class="d-flex justify-content-between py-2">
                            <span class="text-uppercase small fw-bold text-muted">Code ISO</span>
                            <span class="fw-bold text-dark"><%= p.getCode() %></span>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <!-- 2. TABLEAU DES ATHLÈTES -->
        <div class="col-12 col-lg-8">
            <div class="light-card h-100 d-flex flex-column">
                <div class="p-4 border-bottom" style="background-color: #ffffff; border-color: #e5e7eb !important;">
                    <h3 class="m-0" style="font-family: 'Anton', sans-serif; font-size: 1.6rem; letter-spacing: 1px; color: var(--la-magenta);">
                        ATHLÈTES DE LA DÉLÉGATION
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
                                <i>Aucun athlète n'est rattaché à cette délégation pour le moment.</i>
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