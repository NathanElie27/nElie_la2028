/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sio.la2028.database;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;
import sio.la2028.model.Athlete;
import sio.la2028.model.Pays;
import sio.la2028.model.Sport;

/**
 *
 * @author zakina
 */
public class DaoAthlete {

    static PreparedStatement requeteSql = null;
    static ResultSet resultatRequete = null;

    public static ArrayList<Athlete> getLesAthletes(Connection cnx) {

        ArrayList<Athlete> lesAthletes = new ArrayList<>();
        try {
            requeteSql = cnx.prepareStatement(
                    "SELECT a.id AS a_id, a.nom AS a_nom, a.prenom AS a_prenom, a.date_naissance AS a_dateNaiss, " +
                            "       s.id AS s_id, s.nom AS s_nom, p.id AS p_id, p.nom AS p_nom " +
                            "FROM athlete a " +
                            "INNER JOIN pays p ON a.pays_id = p.id " +
                            "INNER JOIN sports s ON a.sport_id = s.id"
            );

            resultatRequete = requeteSql.executeQuery();

            while (resultatRequete.next()) {
                Athlete a = new Athlete();
                a.setId(resultatRequete.getInt("a_id"));
                a.setNom(resultatRequete.getString("a_nom"));
                a.setPrenom(resultatRequete.getString("a_prenom"));
                a.setDateNaiss(resultatRequete.getObject("a_dateNaiss", LocalDate.class));

                Pays p = new Pays();
                p.setId(resultatRequete.getInt("p_id"));
                p.setNom(resultatRequete.getString("p_nom"));

                Sport s = new Sport();
                s.setId(resultatRequete.getInt("s_id"));
                s.setNom(resultatRequete.getString("s_nom"));

                a.setPays(p);
                a.setSport(s);

                lesAthletes.add(a);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lesAthletes;
    }

    public static Athlete getAthleteById(Connection cnx, int idAthlete) {

        Athlete a = null;
        try {
            requeteSql = cnx.prepareStatement(
                    "SELECT a.id AS a_id, a.nom AS a_nom, a.prenom AS a_prenom, a.date_naissance AS a_dateNaiss, " +
                            "       s.id AS s_id, s.nom AS s_nom, p.id AS p_id, p.nom AS p_nom " +
                            "FROM athlete a " +
                            "INNER JOIN pays p ON a.pays_id = p.id " +
                            "INNER JOIN sports s ON a.sport_id = s.id " +
                            "WHERE a.id = ?"
            );

            requeteSql.setInt(1, idAthlete);
            resultatRequete = requeteSql.executeQuery();

            if (resultatRequete.next()) {
                a = new Athlete();
                a.setId(resultatRequete.getInt("a_id"));
                a.setNom(resultatRequete.getString("a_nom"));
                a.setPrenom(resultatRequete.getString("a_prenom"));
                a.setDateNaiss(resultatRequete.getObject("a_dateNaiss", LocalDate.class));

                Pays p = new Pays();
                p.setId(resultatRequete.getInt("p_id"));
                p.setNom(resultatRequete.getString("p_nom"));

                Sport s = new Sport();
                s.setId(resultatRequete.getInt("s_id"));
                s.setNom(resultatRequete.getString("s_nom"));

                a.setPays(p);
                a.setSport(s);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return a;
    }

    public static Athlete addAthlete(Connection connection, Athlete ath) {
        int idGenere = -1;
        try {
            requeteSql = connection.prepareStatement(
                    "INSERT INTO athlete (nom, prenom, date_naissance, pays_id, sport_id) VALUES (?, ?, ?, ?, ?)",
                    Statement.RETURN_GENERATED_KEYS
            );

            requeteSql.setString(1, ath.getNom());
            requeteSql.setString(2, ath.getPrenom());
            requeteSql.setDate(3, ath.getDateNaiss() != null ? Date.valueOf(ath.getDateNaiss()) : null);
            requeteSql.setInt(4, ath.getPays().getId());
            requeteSql.setInt(5, ath.getSport().getId());

            requeteSql.executeUpdate();

            resultatRequete = requeteSql.getGeneratedKeys();
            if (resultatRequete.next()) {
                idGenere = resultatRequete.getInt(1);
                ath = DaoAthlete.getAthleteById(connection, idGenere);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ath;
    }
}