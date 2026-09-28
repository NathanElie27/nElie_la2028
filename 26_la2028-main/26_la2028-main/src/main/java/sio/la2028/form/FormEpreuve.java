package sio.la2028.form;

import jakarta.servlet.http.HttpServletRequest;
import sio.la2028.model.Epreuve;
import sio.la2028.model.Sport;

import java.util.HashMap;
import java.util.Map;

public class FormEpreuve {

    private String resultat;
    private Map<String, String> erreurs      = new HashMap<String, String>();

    public String getResultat() {
        return resultat;
    }

    public void setResultat(String resultat) {
        this.resultat = resultat;
    }

    public Map<String, String> getErreurs() {
        return erreurs;
    }

    public void setErreurs(Map<String, String> erreurs) {
        this.erreurs = erreurs;
    }

    //méthode de validation du champ de saisie nom
    private void validationNom( String nom ) throws Exception {
        if ( nom != null && nom.length() < 3 ) {
            throw new Exception( "Le nom d'epreuve doit contenir moins de 50 caractères." );
        }
    }

    private void setErreur( String champ, String message ) {
        erreurs.put(champ, message );
    }

    private static String getDataForm(HttpServletRequest request, String nomChamp ) {
        String valeur = request.getParameter( nomChamp );
        if ( valeur == null || valeur.trim().length() == 0 ) {
            return null;
        } else {
            return valeur.trim();
        }
    }


    public Epreuve addEpreuve(HttpServletRequest request ) {

        Epreuve ath  = new Epreuve();

        String libelle = getDataForm( request, "nom" );
        int idSport = Integer.parseInt((String)getDataForm( request, "idSport" ));


        try {
            validationNom( libelle );
        } catch ( Exception e ) {
            setErreur( "nom", e.getMessage() );
        }
        ath.setLibelle(libelle);

        if ( erreurs.isEmpty() ) {
            resultat = "Succès de l'ajout.";
        } else {
            resultat = "Échec de l'ajout.";
        }



        Sport sp = new Sport(idSport);
        ath.setSport(sp);

        return ath ;
    }


}
