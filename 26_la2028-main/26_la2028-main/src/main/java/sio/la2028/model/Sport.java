package sio.la2028.model;

import java.util.ArrayList;

public class Sport {

    private int id;
    private String nom;
    private ArrayList<Athlete> lesAthletes;
    private ArrayList<Epreuve> lesEpreuves;
    private String photo;
    private ArrayList<Site> lesSites;

    public Sport () {}

    public  Sport(int id) {this.id = id;}

    public int getId() { return id; }
    public void setId( int id ) { this.id = id; }

    public String getNom() { return nom; }
    public void setNom(String nom) { this.nom = nom; }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public ArrayList<Athlete> getLesAthletes() {
        return lesAthletes;
    }
    public void setLesAthletes (ArrayList<Athlete> lesAthletes) {
        this.lesAthletes = lesAthletes;
    }

    public ArrayList<Epreuve> getLesEpreuves() { return  lesEpreuves; }
    public void setLesEpreuves(ArrayList<Epreuve> lesEpreuves) {
        this.lesEpreuves = lesEpreuves;
    }

    public ArrayList<Site> getLesSites() { return lesSites; }
    public void setLesSites(ArrayList<Site> lesSites) { this.lesSites = lesSites; }

    public void addAthlete(Athlete s){
        if (lesAthletes == null){
            lesAthletes = new ArrayList<Athlete>();
        }
        lesAthletes.add(s);
    }
}
