package sio.la2028.model;

import java.util.ArrayList;

public class Sport {

    private int id;
    private String nom;
    private ArrayList<Athlete> lesAthletes;

    public Sport () {}

    public  Sport(int id) {this.id = id;}

    public int getId() { return id; }
    public void setId( int id ) { this.id = id; }

    public String getNom() { return nom; }
    public void setNom(String nom) { this.nom = nom; }

    public ArrayList<Athlete> getLesAthletes() {
        return lesAthletes;
    }

    public void setLesAthletes (ArrayList<Athlete> lesAthletes) {
        this.lesAthletes = lesAthletes;
    }

    public void addAthlete(Athlete s){

        if (lesAthletes == null){
            lesAthletes = new ArrayList<Athlete>();
        }
        lesAthletes.add(s);
    }
}
