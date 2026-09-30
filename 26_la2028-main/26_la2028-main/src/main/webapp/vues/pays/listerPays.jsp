<%--
    Document   : listerPays
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="sio.la2028.model.Pays"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LA 2028 - Liste des Pays</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Anton&family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <!-- CSS Personnalisé -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/style.css">

    <style>
        body { background-color: #f3f4f6 !important; color: #1f2937 !important; }
        .light-card { background-color: #ffffff; border: 1px solid #e5e7eb; border-radius: 16px; box-shadow: 0 10px 25px rgba(0, 0, 0, 0.05); overflow: hidden; }
        .table-light-theme th { background-color: #f9fafb; color: #6b7280; font-weight: 700; text-transform: uppercase; letter-spacing: 1px; border-bottom: 2px solid #e5e7eb; }
        .table-light-theme td { color: #374151; border-bottom: 1px solid #f3f4f6; vertical-align: middle; }
        .table-light-theme tbody tr:hover td { background-color: #f9fafb; }
    </style>
</head>
<body class="d-flex flex-column min-vh-100">

<!-- INCLUSION DU HEADER GLOBAL -->
<jsp:include page="../includes/header.jsp">
    <jsp:param name="active" value="pays" />
</jsp:include>

<!-- Contenu principal -->
<main class="container py-5 flex-grow-1 modules-section" style="padding-top: 3rem !important;">

    <!-- Conteneur centré pour limiter la largeur du tableau -->
    <div class="mx-auto" style="max-width: 850px;">

        <!-- En-tête de la page -->
        <div class="d-flex align-items-end justify-content-between mb-4">
            <div>
                <span class="badge mb-2" style="background-color: var(--la-magenta); font-size: 0.85rem; letter-spacing: 1px;">DÉLÉGATIONS</span>
                <h1 class="text-dark m-0" style="font-family: 'Anton', sans-serif; font-size: 3rem; letter-spacing: 1.5px;">LISTE DES PAYS</h1>
            </div>
        </div>

        <!-- Carte blanche (SANS LA CLASSE fade-in POUR FORCER L'AFFICHAGE) -->
        <div class="light-card p-0">
            <div class="table-responsive" style="background-color: #ffffff;">
                <% ArrayList<Pays> lesPays = (ArrayList)request.getAttribute("pLesPays"); %>
                <table class="table table-light-theme mb-0 w-100">
                    <thead>
                    <tr>
                        <th class="py-3 text-center" style="width: 120px; font-size: 0.95rem;">ID</th>
                        <th class="py-3 text-center" style="width: 120px; font-size: 0.95rem;">Code</th>
                        <th class="py-3 text-center" style="font-size: 0.95rem;">Nom du pays</th>
                    </tr>
                    </thead>
                    <tbody>
                    <% if (lesPays != null && !lesPays.isEmpty()) {
                        for (Pays p : lesPays) { %>
                    <tr style="transition: background 0.2s;">

                        <!-- ID du Pays -->
                        <td class="py-3 align-middle text-center">
                            <span class="badge bg-light text-secondary border px-3 py-2">#<%= p.getId() %></span>
                        </td>

                        <!-- Code du Pays -->
                        <td class="py-3 align-middle text-center fw-semibold text-muted">
                            <%= p.getCode() %>
                        </td>

                        <!-- Nom du Pays (cliquable) -->
                        <td class="py-3 align-middle fw-bold text-center">
                            <a href="${pageContext.request.contextPath}/ServletPays/consulter?idPays=<%= p.getId() %>"
                               class="text-decoration-none fs-5"
                               style="color: #111827; transition: color 0.3s; display: block;"
                               onmouseover="this.style.color='var(--la-magenta)'"
                               onmouseout="this.style.color='#111827'">
                                <%= p.getNom() %>
                            </a>
                        </td>
                    </tr>
                    <%  }
                    } else { %>
                    <tr>
                        <td colspan="3" class="text-center py-5" style="color: #6b7280; font-size: 1.1rem; background-color: #f9fafb;">
                            <i>Aucun pays répertorié pour le moment.</i>
                        </td>
                    </tr>
                    <% } %>
                    </tbody>
                </table>
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