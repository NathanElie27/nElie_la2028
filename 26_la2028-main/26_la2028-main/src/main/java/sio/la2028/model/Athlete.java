/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sio.la2028.model;

import java.sql.Date;

/**
 *
 * @author zakina
 */
public class Athlete {
    
    private int id;
    private String nom ;
    private String prenom;
    private Date dateNaiss;
    private Pays pays ;

    public Athlete() {
    }

    public Athlete(int id, String nom, String prenom, Date dateNaiss) {
        this.id = id;
        this.nom = nom;
        this.prenom = prenom;
        this.dateNaiss = dateNaiss;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() { return prenom;}

    public void setPrenom(String prenom) { this.prenom = prenom;}

    public Date getDateNaiss() { return dateNaiss;}

    public void setDateNaiss(Date dateNaiss) { this.dateNaiss = dateNaiss; }

    public Pays getPays() {
        return pays;
    }

    public void setPays(Pays pays) {
        this.pays = pays;
    }
    
    
}
