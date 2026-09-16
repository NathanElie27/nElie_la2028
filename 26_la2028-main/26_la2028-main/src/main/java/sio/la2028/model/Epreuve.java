package sio.la2028.model;

import java.util.ArrayList;

public class Epreuve {

    private int code;
    private String libelle;
    private Sport sport;
    private ArrayList<Athlete_Epreuve> lesAthletesEpreuves;

    public Epreuve () {  }

    public int getCode() {
        return code;
    }
    public void setCode(int code) {
        this.code = code;
    }

    public String getLibelle() {
        return libelle;
    }
    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }

    public  Sport getSport() { return sport; }
    public void setSport(Sport sport) {
        this.sport = sport;
    }

    public ArrayList<Athlete_Epreuve> getLesAthletesEpreuves() {
        return lesAthletesEpreuves;
    }

    public void setLesAthletesEpreuves(ArrayList<Athlete_Epreuve> lesAthletesEpreuves) {
        this.lesAthletesEpreuves = lesAthletesEpreuves;
    }


}
