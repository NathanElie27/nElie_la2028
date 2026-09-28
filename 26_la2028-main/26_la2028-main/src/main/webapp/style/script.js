document.addEventListener('DOMContentLoaded', () => {
    // Détection du scroll avec Intersection Observer natif (sans librairie externe)
    const observer = new IntersectionObserver((entries) => {
        entries.forEach((entry) => {
            if (entry.isIntersecting) {
                entry.target.classList.add('visible');
                observer.unobserve(entry.target);
            }
        });
    }, {
        threshold: 0.15
    });

    document.querySelectorAll('.fade-in').forEach((card) => {
        observer.observe(card);
    });
});