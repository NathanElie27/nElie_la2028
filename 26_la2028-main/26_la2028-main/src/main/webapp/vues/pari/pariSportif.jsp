<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>LA 2028 - Paris Sportifs Officiels</title>
  <!-- Bootstrap 5 CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css2?family=Anton&family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
  <!-- CSS Personnalisé -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/style/style.css">

  <style>
    body { background-color: #f3f4f6 !important; color: #1f2937 !important; }
    .light-card { background-color: #ffffff; border: 1px solid #e5e7eb; border-radius: 16px; box-shadow: 0 10px 25px rgba(0, 0, 0, 0.05); overflow: hidden; }
    .odds-btn { border: 1px solid #d1d5db; background-color: #f9fafb; color: #1f2937; font-weight: 600; transition: all 0.2s ease; width: 100%; border-radius: 8px; padding: 10px; text-align: center; }
    .odds-btn:hover, .odds-btn.selected { background-color: var(--la-magenta); color: #ffffff; border-color: var(--la-magenta); }
    .btn-magenta { background-color: var(--la-magenta); color: white; font-weight: 700; text-transform: uppercase; letter-spacing: 1px; border: none; transition: all 0.3s ease; }
    .btn-magenta:hover { background-color: #e6004c; color: white; box-shadow: 0 6px 16px rgba(255, 0, 85, 0.3); }
    .balance-badge { background: linear-gradient(135deg, #111827 0%, #374151 100%); color: #ffffff; border-radius: 12px; padding: 15px 25px; }
  </style>
</head>
<body class="d-flex flex-column min-vh-100">

<!-- INCLUSION DU HEADER GLOBAL -->
<jsp:include page="../includes/header.jsp">
  <jsp:param name="active" value="pari" />
</jsp:include>

<main class="container py-5 flex-grow-1">

  <!-- En-tête et Solde Virtuel -->
  <div class="d-flex flex-column flex-md-row align-items-md-end justify-content-between mb-5 gap-3">
    <div>
      <span class="badge mb-2" style="background-color: var(--la-magenta); font-size: 0.85rem; letter-spacing: 1px;">OFFICIAL BETTING 2028</span>
      <h1 class="text-dark m-0" style="font-family: 'Anton', sans-serif; font-size: 3rem; letter-spacing: 1.5px;">PARIS OLYMPIQUES</h1>
    </div>

    <!-- Bloc Solde & Dépôt -->
    <div class="balance-badge d-flex align-items-center justify-content-between gap-4 shadow-sm">
      <div>
        <span class="d-block text-muted small text-uppercase" style="color: #9ca3af !important; letter-spacing: 1px;">Solde du compte</span>
        <span id="userBalance" class="fs-4 fw-bold" style="font-family: 'Anton', sans-serif; letter-spacing: 1px;">100.00 €</span>
      </div>
      <button class="btn btn-sm btn-magenta px-3 py-2" data-bs-toggle="modal" data-bs-target="#depositModal">
        + Créditer
      </button>
    </div>
  </div>

  <div class="row g-4">
    <!-- LISTE DES PARIS SPORTIFS (GAUCHE) -->
    <div class="col-12 col-lg-8">
      <div class="light-card p-4">
        <h3 class="mb-4" style="font-family: 'Anton', sans-serif; font-size: 1.5rem; letter-spacing: 1px;">ÉVÈNEMENTS À LA UNE</h3>

        <!-- Match 1 : 100m Hommes -->
        <div class="p-3 mb-3 border rounded-3 bg-light">
          <div class="d-flex justify-content-between text-muted small mb-2 text-uppercase fw-bold">
            <span>Athlétisme • 100m Finale Hommes</span>
            <span class="text-danger">En direct / À venir</span>
          </div>
          <div class="row align-items-center g-2">
            <div class="col-12 col-md-6 fw-bold">🥇 Vainqueur de la course</div>
            <div class="col-4 col-md-2">
              <button class="odds-btn" onclick="selectBet('100m - Noah Lyles', 1.85, this)">Lyles <br><small class="text-muted">1.85</small></button>
            </div>
            <div class="col-4 col-md-2">
              <button class="odds-btn" onclick="selectBet('100m - Letsile Tebogo', 2.40, this)">Tebogo <br><small class="text-muted">2.40</small></button>
            </div>
            <div class="col-4 col-md-2">
              <button class="odds-btn" onclick="selectBet('100m - Autre Athlète', 4.50, this)">Autre <br><small class="text-muted">4.50</small></button>
            </div>
          </div>
        </div>

        <!-- Match 2 : Basketball USA vs France -->
        <div class="p-3 mb-3 border rounded-3 bg-light">
          <div class="d-flex justify-content-between text-muted small mb-2 text-uppercase fw-bold">
            <span>Basketball • Finale Hommes</span>
            <span>Stade Crypto.com Arena</span>
          </div>
          <div class="row align-items-center g-2">
            <div class="col-12 col-md-6 fw-bold">USA vs FRANCE</div>
            <div class="col-6 col-md-3">
              <button class="odds-btn" onclick="selectBet('Basket - USA (Victoire)', 1.15, this)">USA <br><small class="text-muted">1.15</small></button>
            </div>
            <div class="col-6 col-md-3">
              <button class="odds-btn" onclick="selectBet('Basket - France (Exploit)', 5.20, this)">France <br><small class="text-muted">5.20</small></button>
            </div>
          </div>
        </div>

        <!-- Match 3 : Judo +100kg -->
        <div class="p-3 border rounded-3 bg-light">
          <div class="d-flex justify-content-between text-muted small mb-2 text-uppercase fw-bold">
            <span>Judo • +100kg (Teddy Riner)</span>
            <span>Arena Paul Vi</span>
          </div>
          <div class="row align-items-center g-2">
            <div class="col-12 col-md-6 fw-bold">Médaille d'Or</div>
            <div class="col-6 col-md-3">
              <button class="odds-btn" onclick="selectBet('Judo - Teddy Riner (Or)', 1.45, this)">Riner (Or) <br><small class="text-muted">1.45</small></button>
            </div>
            <div class="col-6 col-md-3">
              <button class="odds-btn" onclick="selectBet('Judo - Adversaire', 2.70, this)">Challenger <br><small class="text-muted">2.70</small></button>
            </div>
          </div>
        </div>

      </div>
    </div>

    <!-- PANIER DE PARI (DROITE) -->
    <div class="col-12 col-lg-4">
      <div class="light-card p-4 h-100 d-flex flex-column">
        <h3 class="mb-3" style="font-family: 'Anton', sans-serif; font-size: 1.5rem; letter-spacing: 1px;">MON TICKET</h3>

        <div id="noBetSelected" class="text-center text-muted my-auto py-4">
          <i>Aucune sélection en cours.<br>Cliquez sur une cote pour parier.</i>
        </div>

        <div id="betSlipContent" style="display: none;" class="flex-grow-1 d-flex flex-column">
          <div class="p-3 border rounded mb-3 bg-white">
            <span id="selectedEventName" class="d-block fw-bold text-dark">Sélection</span>
            <div class="d-flex justify-content-between mt-2 text-muted small">
              <span>Cote : <strong id="selectedOdds" class="text-dark">0.00</strong></span>
            </div>
          </div>

          <div class="mb-3">
            <label class="form-label small fw-bold text-uppercase">Mise (€)</label>
            <input type="number" id="stakeInput" class="form-control" value="10" min="1" oninput="calculateWin()">
          </div>

          <div class="p-3 rounded mb-4" style="background-color: #f8fafc; border: 1px dashed #cbd5e1;">
            <span class="d-block text-muted small text-uppercase">Gains potentiels</span>
            <span id="potentialWin" class="fs-4 fw-bold text-success">0.00 €</span>
          </div>

          <button class="btn btn-magenta w-100 py-3 mt-auto rounded-pill" onclick="placeBet()">
            VALIDER MON PARI
          </button>
        </div>
      </div>
    </div>
  </div>
</main>

<!-- MODALE DE PAIEMENT / CRÉDIT (FAIRE COMME VRAI) -->
<div class="modal fade" id="depositModal" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content rounded-4 border-0 shadow">
      <div class="modal-header border-0 pb-0">
        <h5 class="modal-title fw-bold" style="font-family: 'Anton', sans-serif; letter-spacing: 1px;">CRÉDITER MON COMPTE</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>
      <div class="modal-body p-4">
        <div class="mb-3">
          <label class="form-label small fw-bold text-uppercase">Méthode de paiement</label>
          <div class="row g-2">
            <div class="col-6">
              <input type="radio" class="btn-check" name="paymentMethod" id="cb" checked>
              <label class="btn btn-outline-dark w-100 py-2" for="cb">💳 Carte Bancaire</label>
            </div>
            <div class="col-6">
              <input type="radio" class="btn-check" name="paymentMethod" id="paypal">
              <label class="btn btn-outline-dark w-100 py-2" for="paypal">🅿️ PayPal</label>
            </div>
          </div>
        </div>

        <div class="mb-3">
          <label class="form-label small fw-bold text-uppercase">Montant à créditer</label>
          <select id="depositAmount" class="form-select">
            <option value="10">10.00 €</option>
            <option value="20" selected>20.00 €</option>
            <option value="50">50.00 €</option>
            <option value="100">100.00 €</option>
          </select>
        </div>

        <div id="cbFields">
          <div class="mb-3">
            <label class="form-label small text-muted">Numéro de carte (Simulation)</label>
            <input type="text" class="form-control" value="4976 •••• •••• 8820" readonly>
          </div>
          <div class="row g-2">
            <div class="col-6">
              <label class="form-label small text-muted">Expiration</label>
              <input type="text" class="form-control" value="08/28" readonly>
            </div>
            <div class="col-6">
              <label class="form-label small text-muted">CVV</label>
              <input type="text" class="form-control" value="•••" readonly>
            </div>
          </div>
        </div>

        <button class="btn btn-magenta w-100 py-3 mt-4 rounded-pill" onclick="validateDeposit()">
          CONFIRMER LE PAIEMENT SÉCURISÉ
        </button>
      </div>
    </div>
  </div>
</div>

<!-- INCLUSION DU FOOTER GLOBAL -->
<jsp:include page="../includes/footer.jsp" />

<!-- Scripts Bootstrap & Logique des Paris -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/style/script.js"></script>

<script>
  let currentBalance = 100.00;
  let selectedEvent = "";
  let selectedOdds = 0.00;

  function selectBet(eventName, odds, btnElement) {
    // Retirer la sélection précédente
    document.querySelectorAll('.odds-btn').forEach(b => b.classList.remove('selected'));
    btnElement.classList.add('selected');

    selectedEvent = eventName;
    selectedOdds = odds;

    document.getElementById('noBetSelected').style.display = 'none';
    document.getElementById('betSlipContent').style.display = 'flex';
    document.getElementById('selectedEventName').innerText = eventName;
    document.getElementById('selectedOdds').innerText = odds.toFixed(2);

    calculateWin();
  }

  function calculateWin() {
    let stake = parseFloat(document.getElementById('stakeInput').value) || 0;
    let totalWin = stake * selectedOdds;
    document.getElementById('potentialWin').innerText = totalWin.toFixed(2) + ' €';
  }

  function placeBet() {
    let stake = parseFloat(document.getElementById('stakeInput').value) || 0;
    if (stake <= 0) {
      alert("Veuillez entrer une mise valide.");
      return;
    }
    if (stake > currentBalance) {
      alert("Solde insuffisant ! Veuillez créditer votre compte.");
      return;
    }

    currentBalance -= stake;
    document.getElementById('userBalance').innerText = currentBalance.toFixed(2) + ' €';

    alert("🎉 Pari enregistré avec succès pour l'événement : " + selectedEvent + " !");

    // Réinitialisation du ticket
    document.getElementById('betSlipContent').style.display = 'none';
    document.getElementById('noBetSelected').style.display = 'block';
    document.querySelectorAll('.odds-btn').forEach(b => b.classList.remove('selected'));
  }

  function validateDeposit() {
    let amount = parseFloat(document.getElementById('depositAmount').value);
    currentBalance += amount;
    document.getElementById('userBalance').innerText = currentBalance.toFixed(2) + ' €';

    // Fermer la modale
    let modalEl = document.getElementById('depositModal');
    let modal = bootstrap.Modal.getInstance(modalEl);
    modal.hide();

    alert("✅ Paiement accepté ! Votre compte a été crédité de " + amount.toFixed(2) + " €.");
  }
</script>
</body>
</html>