package sio.la2028.model;

public class Athlete_Epreuve {

    private Epreuve epreuve_id;
    private Athlete athlete_id;
    private int place;

    public Athlete_Epreuve() {
        this.epreuve_id = epreuve_id;
    }

    public void setEpreuve_id(Epreuve epreuve_id) {
        this.epreuve_id = epreuve_id;
    }

    public void setAthlete_id(Athlete athlete_id) {
        this.athlete_id = athlete_id;
    }

    public void setPlace(int place) {
        this.place = place;
    }

    public Epreuve getEpreuve_id() {
        return epreuve_id;
    }

    public Athlete getAthlete_id() {
        return athlete_id;
    }

    public int getPlace() {
        return place;
    }


}
