package sio.la2028.model;

public class Epreuve {

    private int code;
    private String libelle;
    private Sport sport;

    public Epreuve () {  }

    public int getId() {
        return code;
    }

    public void setId(int code) {
        this.code = code;
    }

    public String setLibelle() {
        return libelle;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }

    public  Sport getSport() { return sport; }

    public void setSport() { this.sport = sport ; }
}
