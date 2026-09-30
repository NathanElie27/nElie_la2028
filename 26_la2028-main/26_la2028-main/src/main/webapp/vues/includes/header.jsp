<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Récupération de la page active pour colorer le menu en magenta
    String activePage = request.getParameter("active");
%>
<!-- En-tête global avec logo grand format et couleur blanche -->
<header class="d-flex justify-content-between align-items-center py-2 px-4 px-md-5 border-bottom" style="border-color: var(--card-border) !important; background-color: rgba(15, 15, 17, 0.95);">
    <nav class="nav-links d-none d-md-flex gap-4">
        <a href="${pageContext.request.contextPath}/index.html">Accueil</a>
        <a href="${pageContext.request.contextPath}/ServletAthlete/lister" style="<%= "athlete".equals(activePage) ? "color: var(--la-magenta);" : "" %>">Athlètes</a>
        <a href="${pageContext.request.contextPath}/ServletSport/lister" style="<%= "sport".equals(activePage) ? "color: var(--la-magenta);" : "" %>">Sports</a>
        <a href="${pageContext.request.contextPath}/ServletEpreuve/lister" style="<%= "epreuve".equals(activePage) ? "color: var(--la-magenta);" : "" %>">Épreuves</a>
        <a href="${pageContext.request.contextPath}/ServletPays/lister" style="<%= "pays".equals(activePage) ? "color: var(--la-magenta);" : "" %>">Pays</a>
        <a href="${pageContext.request.contextPath}/ServletSite/lister" style="<%= "site".equals(activePage) ? "color: var(--la-magenta);" : "" %>">Sites</a>
    </nav>
    <div class="logo ms-auto">
        <a href="${pageContext.request.contextPath}/index.html">
            <!-- Même taille de logo que sur l'accueil (140x65) -->
            <img src="${pageContext.request.contextPath}/images/index/logo_La2028.webp" alt="Logo Los Angeles 2028" width="140" height="65" style="object-fit: contain; filter: brightness(0) invert(1);">
        </a>
    </div>
</header>