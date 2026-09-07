/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sio.la2028.model;

import java.sql.Date;
import java.time.LocalDate;
import java.time.Period;
import java.util.Calendar;

/**
 *
 * @author zakina
 */
public class Athlete {
    
    private int id;
    private String nom ;
    private String prenom;
    private LocalDate dateNaiss;
    private int age;
    private Pays pays ;

    public Athlete() {
    }

    public Athlete(int id, String nom, String prenom, LocalDate dateNaiss, int age) {
        this.id = id;
        this.nom = nom;
        this.prenom = prenom;
        this.dateNaiss = dateNaiss;
        this.age = age;
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

    public LocalDate getDateNaiss() { return dateNaiss;}

    public void setDateNaiss(LocalDate dateNaiss) { this.dateNaiss = dateNaiss; }

    public Pays getPays() {
        return pays;
    }

    public void setPays(Pays pays) {
        this.pays = pays;
    }

    public int getAge() {
        return Period.between(getDateNaiss(), LocalDate.now()).getYears();
    }

    public void setAge(int age) {
        this.age = age;
    }
}
