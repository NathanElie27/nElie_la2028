package sio.la2028.model;

public class Athlete_Epreuve {

    private Epreuve epreuve;
    private Athlete athlete;
    private int place;

    public Athlete_Epreuve() {
        this.epreuve = epreuve;
    }

    public void setEpreuve(Epreuve epreuve) {
        this.epreuve = epreuve;
    }
    public Epreuve getEpreuve() {
        return epreuve;
    }

    public void setAthlete(Athlete athlete) {
        this.athlete = athlete;
    }
    public Athlete getAthlete() {
        return athlete;
    }

    public void setPlace(int place) {
        this.place = place;
    }
    public int getPlace() {
        return place;
    }

}
