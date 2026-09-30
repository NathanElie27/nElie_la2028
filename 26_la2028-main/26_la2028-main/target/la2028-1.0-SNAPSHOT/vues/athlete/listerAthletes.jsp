<%-- 
    Document   : listerAthletes
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="sio.la2028.model.Athlete"%>
<%@page import="sio.la2028.model.Pays"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LA 2028 - Liste des Athlètes</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Anton&family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <!-- CSS Personnalisé -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/style.css">

    <style>
        body { background-color: #f3f4f6 !important; color: #1f2937 !important; }
        .light-card {
            background-color: #ffffff;
            border: 1px solid #e5e7eb;
            border-radius: 16px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.05);
            overflow: hidden;
        }
        .table-light-theme th {
            background-color: #f9fafb;
            color: #6b7280;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 1px;
            border-bottom: 2px solid #e5e7eb;
            font-size: 0.85rem;
        }
        .table-light-theme td { color: #374151; border-bottom: 1px solid #f3f4f6; vertical-align: middle; }
        .table-light-theme tbody tr:hover td { background-color: #f9fafb; }
        .btn-add {
            background-color: var(--la-magenta); color: white; font-weight: 700; text-transform: uppercase;
            letter-spacing: 1px; padding: 0.7rem 1.5rem; border-radius: 8px; transition: all 0.3s ease;
            box-shadow: 0 4px 12px rgba(255, 0, 85, 0.2);
        }
        .btn-add:hover { background-color: #e6004c; color: white; transform: translateY(-2px); box-shadow: 0 6px 16px rgba(255, 0, 85, 0.3); }
    </style>
</head>
<body class="d-flex flex-column min-vh-100">

<!-- INCLUSION DU HEADER GLOBAL -->
<jsp:include page="../includes/header.jsp">
    <jsp:param name="active" value="athlete" />
</jsp:include>

<main class="container py-5 flex-grow-1 modules-section" style="padding-top: 3rem !important;">
    <div class="mx-auto" style="max-width: 1100px;">

        <!-- En-tête -->
        <div class="d-flex align-items-end justify-content-between mb-4 fade-in">
            <div>
                <span class="badge mb-2" style="background-color: var(--la-magenta); font-size: 0.85rem; letter-spacing: 1px;">PARTICIPANTS</span>
                <h1 class="text-dark m-0" style="font-family: 'Anton', sans-serif; font-size: 3rem; letter-spacing: 1.5px;">LISTE DES ATHLÈTES</h1>
            </div>
            <a href="${pageContext.request.contextPath}/ServletAthlete/ajouter" class="text-decoration-none d-none d-md-flex align-items-center btn-add">
                Ajouter un athlète <span class="ms-2 fs-5" style="line-height: 1;">+</span>
            </a>
        </div>

        <!-- Tableau -->
        <div class="light-card fade-in p-0">
            <div class="table-responsive" style="background-color: #ffffff;">
                <%
                    ArrayList<Athlete> lesAthletes = (ArrayList)request.getAttribute("pLesAthletes");
                    DateTimeFormatter formatFr = DateTimeFormatter.ofPattern("dd/MM/yyyy");
                %>
                <table class="table table-light-theme mb-0 w-100">
                    <thead>
                    <tr>
                        <th class="py-3 text-center" style="width: 80px;">ID</th>
                        <th class="py-3">Nom</th>
                        <th class="py-3">Prénom</th>
                        <th class="py-3 text-center">Date de naissance</th>
                        <th class="py-3 text-center">Âge</th>
                        <th class="py-3 text-center">Pays</th>
                        <th class="py-3 text-center">Sport</th>
                    </tr>
                    </thead>
                    <tbody>
                    <% if (lesAthletes != null && !lesAthletes.isEmpty()) {
                        for (Athlete a : lesAthletes) { %>
                    <tr style="transition: background 0.2s;">
                        <td class="py-3 align-middle text-center">
                            <span class="badge bg-light text-secondary border px-2 py-1">#<%= a.getId() %></span>
                        </td>
                        <td class="py-3 align-middle fw-bold">
                            <a href="${pageContext.request.contextPath}/ServletAthlete/consulter?idAthlete=<%= a.getId() %>"
                               class="text-decoration-none fs-5"
                               style="color: #111827; transition: color 0.3s;"
                               onmouseover="this.style.color='var(--la-magenta)'"
                               onmouseout="this.style.color='#111827'">
                                <%= a.getNom() %>
                            </a>
                        </td>
                        <td class="py-3 align-middle fs-5"><%= a.getPrenom() %></td>
                        <td class="py-3 align-middle text-center"><%= a.getDateNaiss().format(formatFr) %></td>
                        <td class="py-3 align-middle text-center fw-semibold"><%= a.getAge() %> ans</td>
                        <td class="py-3 align-middle text-center">
                            <span class="badge bg-dark text-white px-3"><%= a.getPays().getNom() %></span>
                        </td>
                        <td class="py-3 align-middle text-center" style="color: var(--la-magenta); font-weight: 500;">
                            <%= a.getSport().getNom() %>
                        </td>
                    </tr>
                    <%  }
                    } else { %>
                    <tr>
                        <td colspan="7" class="text-center py-5" style="color: #6b7280; font-size: 1.1rem; background-color: #f9fafb;">
                            <i>Aucun athlète répertorié pour le moment.</i>
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