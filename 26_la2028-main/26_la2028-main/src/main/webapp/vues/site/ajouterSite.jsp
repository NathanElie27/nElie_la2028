<%--
    Document   : ajouterSite
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="sio.la2028.model.Sport"%>
<%@page import="sio.la2028.form.FormSite"%>
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>LA 2028 - Nouveau Site</title>
  <!-- Bootstrap 5 CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css2?family=Anton&family=Inter:wght@400;500;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/style/style.css">
  <style>
    body { background-color: #f3f4f6 !important; color: #1f2937 !important; }
    .light-card { background-color: #ffffff; border: 1px solid #e5e7eb; border-radius: 16px; box-shadow: 0 10px 25px rgba(0, 0, 0, 0.05); }
    .form-light .form-control, .form-light .form-select { background-color: #f9fafb; border: 1px solid #d1d5db; color: #111827; padding: 0.8rem 1rem; transition: all 0.3s ease; }
    .form-light .form-control:focus, .form-light .form-select:focus { background-color: #ffffff; border-color: var(--la-magenta); box-shadow: 0 0 0 0.25rem rgba(255, 0, 85, 0.15); }
    .form-light label { color: #4b5563; font-size: 0.85rem; text-transform: uppercase; letter-spacing: 1px; font-weight: 700; margin-bottom: 0.5rem; }
    .btn-magenta { background-color: var(--la-magenta); color: white; font-weight: 700; text-transform: uppercase; letter-spacing: 1px; padding: 0.8rem; border: none; transition: all 0.3s ease; }
    .btn-magenta:hover { background-color: #ff3377; transform: translateY(-2px); box-shadow: 0 8px 20px rgba(255, 0, 85, 0.25); }
  </style>
</head>
<body class="d-flex flex-column min-vh-100">

<!-- INCLUSION DU HEADER GLOBAL -->
<jsp:include page="../includes/header.jsp">
  <jsp:param name="active" value="site" />
</jsp:include>

<main class="container py-5 flex-grow-1 d-flex justify-content-center align-items-center modules-section" style="padding-top: 3rem !important;">

  <% FormSite form = (FormSite)request.getAttribute("form"); %>

  <div class="light-card p-4 p-md-5 w-100" style="max-width: 600px;">
    <div class="card-content">
      <div class="text-center mb-5">
        <span class="badge mb-2" style="background-color: var(--la-magenta); font-size: 0.8rem; letter-spacing: 1px;">INFRASTRUCTURE</span>
        <h1 class="text-dark mt-2 mb-3" style="font-family: 'Anton', sans-serif; font-size: 2.5rem; letter-spacing: 1px;">NOUVEAU SITE</h1>
        <p class="text-muted small">Ajoutez une nouvelle infrastructure pour l'accueil des Jeux.</p>
      </div>

      <form class="form-light" action="ajouter" method="POST">

        <div class="mb-4">
          <label for="nom" class="form-label">Nom :</label>
          <input id="nom" class="form-control" type="text" name="nom" size="30" maxlength="30" placeholder="Ex: Stade de France" required>
        </div>

        <div class="mb-4">
          <label for="idSport" class="form-label">Sport :</label>
          <select name="idSport" id="idSport" class="form-select">
            <%
              ArrayList<Sport> lesSports = (ArrayList)request.getAttribute("pLesSports");
              if (lesSports != null) {
                for (int i=0; i<lesSports.size(); i++){
                  Sport sp = lesSports.get(i);
                  out.println("<option value='" + sp.getId()+"'>" + sp.getNom()+"</option>" );
                }
              }
            %>
          </select>
        </div>

        <div class="d-grid mt-5 pt-3 border-top" style="border-color: #e5e7eb !important;">
          <input type="submit" name="valider" id="valider" class="btn btn-magenta rounded mt-3" value="Valider"/>
        </div>

        <div class="text-center mt-4">
          <a href="${pageContext.request.contextPath}/ServletSite/lister" class="text-decoration-none small fw-bold" style="color: #6b7280; transition: color 0.3s;" onmouseover="this.style.color='#111827'" onmouseout="this.style.color='#6b7280'">Annuler et retourner à la liste</a>
        </div>
      </form>
    </div>
  </div>
</main>

<!-- INCLUSION DU FOOTER GLOBAL -->
<jsp:include page="../includes/footer.jsp" />

<script src="${pageContext.request.contextPath}/style/script.js"></script>
</body>
</html>