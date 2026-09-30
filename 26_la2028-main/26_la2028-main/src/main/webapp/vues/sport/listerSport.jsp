<%--
    Document   : listerSports
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="sio.la2028.model.Sport"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LA 2028 - Liste des Sports</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Anton&family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <!-- CSS Personnalisé avec chemin absolu basé sur le contexte -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/style.css">

    <style>
        /* Surcharges pour le design CLAIR et LUMINIEUX (Identique à la fiche sport) */
        body {
            background-color: #f3f4f6 !important; /* Fond gris très clair */
            color: #1f2937 !important; /* Texte gris foncé */
        }
        .light-card {
            background-color: #ffffff;
            border: 1px solid #e5e7eb;
            border-radius: 16px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.05); /* Ombre douce */
            overflow: hidden;
        }
        /* Design du tableau clair */
        .table-light-theme th {
            background-color: #f9fafb;
            color: #6b7280;
            font-weight: 700;
            text-transform: uppercase;
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
        /* Bouton d'ajout moderne */
        .btn-add-sport {
            background-color: var(--la-magenta);
            color: white;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 1px;
            padding: 0.7rem 1.5rem;
            border-radius: 8px;
            transition: all 0.3s ease;
            box-shadow: 0 4px 12px rgba(255, 0, 85, 0.2);
        }
        .btn-add-sport:hover {
            background-color: #e6004c;
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 6px 16px rgba(255, 0, 85, 0.3);
        }
    </style>
</head>
<body class="d-flex flex-column min-vh-100">

<!-- INCLUSION DU HEADER GLOBAL -->
<jsp:include page="../includes/header.jsp">
    <jsp:param name="active" value="sport" />
</jsp:include>

<!-- Contenu principal -->
<main class="container py-5 flex-grow-1 modules-section" style="padding-top: 3rem !important;">

    <!-- En-tête de la page -->
    <div class="d-flex align-items-end justify-content-between mb-5 fade-in">
        <div>
            <span class="badge mb-2" style="background-color: var(--la-magenta); font-size: 0.85rem; letter-spacing: 1px;">CATALOGUE OFFICIEL</span>
            <h1 class="text-dark m-0" style="font-family: 'Anton', sans-serif; font-size: 3rem; letter-spacing: 1.5px;">LISTE DES SPORTS</h1>
        </div>
        <a href="${pageContext.request.contextPath}/ServletSport/ajouter" class="text-decoration-none d-none d-md-flex align-items-center btn-add-sport">
            Ajouter un sport <span class="ms-2 fs-5" style="line-height: 1;">+</span>
        </a>
    </div>

    <!-- Carte blanche englobant le tableau -->
    <div class="light-card fade-in p-0">
        <div class="table-responsive" style="background-color: #ffffff;">
            <%
                ArrayList<Sport> lesSports = (ArrayList)request.getAttribute("pLesSports");
            %>
            <table class="table table-light-theme mb-0 w-100">
                <thead>
                <tr>
                    <th class="py-4 text-center" style="width: 150px; font-size: 1.05rem;">ID</th>
                    <th class="py-4 text-center" style="font-size: 1.05rem;">Nom de la discipline</th>
                </tr>
                </thead>
                <tbody>
                <% if (lesSports != null && !lesSports.isEmpty()) {
                    for (Sport s : lesSports) { %>
                <tr style="transition: background 0.2s;">

                    <!-- ID du Sport -->
                    <td class="py-4 align-middle text-center">
                        <span class="badge bg-light text-secondary border fs-6 px-3 py-2">#<%= s.getId() %></span>
                    </td>

                    <!-- Nom du Sport (cliquable) -->
                    <td class="py-4 align-middle fw-bold text-center">
                        <a href="${pageContext.request.contextPath}/ServletSport/consulter?idSport=<%= s.getId() %>"
                           class="text-decoration-none fs-4"
                           style="color: #111827; transition: color 0.3s; display: block;"
                           onmouseover="this.style.color='var(--la-magenta)'"
                           onmouseout="this.style.color='#111827'">
                            <%= s.getNom() %>
                        </a>
                    </td>
                </tr>
                <%  }
                } else { %>
                <tr>
                    <td colspan="2" class="text-center py-5" style="color: #6b7280; font-size: 1.1rem; background-color: #f9fafb;">
                        <i>Aucun sport répertorié pour le moment.</i>
                    </td>
                </tr>
                <% } %>
                </tbody>
            </table>
        </div>
    </div>
</main>

<!-- INCLUSION DU FOOTER GLOBAL -->
<jsp:include page="../includes/footer.jsp" />

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/style/script.js"></script>
</body>
</html>