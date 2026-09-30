<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // On récupère le paramètre pour savoir quelle page est active (passé par la JSP parente)
    String activePage = request.getParameter("active");
%>
<!-- En-tête avec navigation -->
<header class="d-flex justify-content-between align-items-center p-4 p-md-5 border-bottom" style="border-color: var(--card-border) !important; background-color: rgba(15, 15, 17, 0.95);">
    <nav class="nav-links d-none d-md-flex gap-4">
        <a href="${pageContext.request.contextPath}/index.html">Accueil</a>
        <a href="${pageContext.request.contextPath}/ServletAthlete/lister" style="<%= "athlete".equals(activePage) ? "color: var(--la-magenta);" : "" %>">Athlètes</a>
        <a href="${pageContext.request.contextPath}/ServletSport/lister" style="<%= "sport".equals(activePage) ? "color: var(--la-magenta);" : "" %>">Sports</a>
        <a href="${pageContext.request.contextPath}/ServletEpreuve/lister" style="<%= "epreuve".equals(activePage) ? "color: var(--la-magenta);" : "" %>">Épreuves</a>
        <a href="${pageContext.request.contextPath}/ServletPays/lister" style="<%= "pays".equals(activePage) ? "color: var(--la-magenta);" : "" %>">Pays</a>
        <a href="${pageContext.request.contextPath}/ServletSite/lister" style="<%= "site".equals(activePage) ? "color: var(--la-magenta);" : "" %>">Sites</a>
    </nav>
    <div class="logo ms-auto">
        <a href="${pageContext.request.contextPath}/index.html" class="text-decoration-none">
            <h2 class="m-0" style="font-family: 'Anton', sans-serif; color: white; letter-spacing: 1px;">LA 2028</h2>
        </a>
    </div>
</header>