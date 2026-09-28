document.addEventListener('DOMContentLoaded', () => {

    // Effet interactif sur le titre au mouvement de la souris
    const interactiveText = document.getElementById('interactive-text');

    document.addEventListener('mousemove', (e) => {
        // Calcul de la position de la souris par rapport au centre de l'écran
        const xPos = (e.clientX / window.innerWidth - 0.5) * 20; // 20 est l'intensité
        const yPos = (e.clientY / window.innerHeight - 0.5) * 20;

        // Application d'une légère ombre portée dynamique pour un effet 3D
        if (interactiveText) {
            interactiveText.style.textShadow = `${-xPos}px ${-yPos}px 0px rgba(255, 0, 85, 0.4)`;
            interactiveText.style.transform = `translate(${xPos * 0.2}px, ${yPos * 0.2}px)`;
            interactiveText.style.transition = 'transform 0.1s ease-out, text-shadow 0.1s ease-out';
        }
    });

    // Reset quand la souris sort de la page
    document.addEventListener('mouseleave', () => {
        if (interactiveText) {
            interactiveText.style.textShadow = 'none';
            interactiveText.style.transform = 'translate(0, 0)';
            interactiveText.style.transition = 'transform 0.5s ease, text-shadow 0.5s ease';
        }
    });
});