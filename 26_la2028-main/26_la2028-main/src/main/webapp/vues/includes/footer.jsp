<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Footer institutionnel global -->
<footer class="footer-section mt-auto pt-5 pb-4" style="background-color: rgba(10, 10, 12, 0.95); border-top: 1px solid var(--card-border);">
    <div class="container-fluid px-4 px-md-5">
        <div class="row g-4 pb-4 border-bottom" style="border-color: var(--card-border) !important;">
            <div class="col-12 col-md-4">
                <h4 class="text-white fw-bold">LA 2028 SI</h4>
                <!-- Texte éclairci pour la visibilité -->
                <p class="small mb-0" style="color: #9ca3af; line-height: 1.6;">Système d'information de gestion pour l'organisation des Jeux Olympiques et Paralympiques de Los Angeles 2028.</p>
            </div>
            <div class="col-6 col-md-2">
                <h5 class="text-white small fw-bold text-uppercase">Navigation</h5>
                <ul class="list-unstyled small mb-0">
                    <li class="mb-2"><a href="${pageContext.request.contextPath}/ServletAthlete/lister" class="text-decoration-none" style="color: #d1d5db;" onmouseover="this.style.color='white'" onmouseout="this.style.color='#d1d5db'">Athlètes</a></li>
                    <li class="mb-2"><a href="${pageContext.request.contextPath}/ServletSport/lister" class="text-decoration-none" style="color: #d1d5db;" onmouseover="this.style.color='white'" onmouseout="this.style.color='#d1d5db'">Sports</a></li>
                    <li><a href="${pageContext.request.contextPath}/ServletEpreuve/lister" class="text-decoration-none" style="color: #d1d5db;" onmouseover="this.style.color='white'" onmouseout="this.style.color='#d1d5db'">Épreuves</a></li>
                </ul>
            </div>
            <div class="col-6 col-md-3">
                <h5 class="text-white small fw-bold text-uppercase">Infrastructures</h5>
                <ul class="list-unstyled small mb-0">
                    <li class="mb-2"><a href="${pageContext.request.contextPath}/ServletSite/lister" class="text-decoration-none" style="color: #d1d5db;" onmouseover="this.style.color='white'" onmouseout="this.style.color='#d1d5db'">Sites de compétition</a></li>
                    <li><a href="${pageContext.request.contextPath}/ServletPays/lister" class="text-decoration-none" style="color: #d1d5db;" onmouseover="this.style.color='white'" onmouseout="this.style.color='#d1d5db'">Comités nationaux</a></li>
                </ul>
            </div>
            <div class="col-12 col-md-3">
                <h5 class="text-white small fw-bold text-uppercase">Ressources & Crédits</h5>
                <p class="small mb-1" style="color: #9ca3af;">Visuels sous licence Adobe Stock / CIO.</p>
                <p class="small mb-0" style="color: #9ca3af;">Données sous licence ouverte d'organisation sportive.</p>
            </div>
        </div>

        <div class="row pt-4 small">
            <div class="col-12 col-md-6" style="color: #9ca3af;">
                © 2028 Comité d'organisation des Jeux Olympiques. Tous droits réservés.
            </div>
            <div class="col-12 col-md-6 text-md-end mt-3 mt-md-0">
                <a href="#" class="text-decoration-none me-3" style="color: #9ca3af;" onmouseover="this.style.color='white'" onmouseout="this.style.color='#9ca3af'">Mentions légales</a>
                <a href="#" class="text-decoration-none me-3" style="color: #9ca3af;" onmouseover="this.style.color='white'" onmouseout="this.style.color='#9ca3af'">Politique de confidentialité</a>
                <a href="#" class="text-decoration-none me-3" style="color: #9ca3af;" onmouseover="this.style.color='white'" onmouseout="this.style.color='#9ca3af'">Gestion des cookies</a>
                <a href="#" class="text-decoration-none" style="color: #9ca3af;" onmouseover="this.style.color='white'" onmouseout="this.style.color='#9ca3af'">Accessibilité : conforme</a>
            </div>
        </div>
    </div>
</footer>