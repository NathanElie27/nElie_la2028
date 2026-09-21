/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sio.la2028.database;

import sio.la2028.model.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author zakina
 */
public class DaoEpreuve {

    Connection cnx;
    static PreparedStatement requeteSql = null;
    static ResultSet resultatRequete = null;

    public static ArrayList<Epreuve> getLesEpreuves(Connection cnx){

        ArrayList<Epreuve> lesEpreuves = new ArrayList<Epreuve>();
        try{
            requeteSql = cnx.prepareStatement("select e.code as e_code, e.libelle as e_libelle, s.id as s_id, s.nom as s_nom \n "+
                    " from epreuve e \n " +
                    "inner join sports s \n "+
                    "on s.id = e.sport_id");
            //System.out.println("REQ="+ requeteSql);
            resultatRequete = requeteSql.executeQuery();

            while (resultatRequete.next()){

                Epreuve e = new Epreuve();
                e.setCode(resultatRequete.getInt("e_code"));
                e.setLibelle(resultatRequete.getString("e_libelle"));

                Sport s = new Sport();
                s.setId(resultatRequete.getInt("s_id"));
                s.setNom(resultatRequete.getString("s_nom"));

                e.setSport(s);
                lesEpreuves.add(e);
            }

        }
        catch (SQLException e){
            e.printStackTrace();
            System.out.println("La requête de getLespayss e généré une erreur");
        }
        return lesEpreuves;

    }

    public static Epreuve getEpreuveById(Connection cnx, int idEpreuve){

        Epreuve ep = new Epreuve();
        try{
            requeteSql = cnx.prepareStatement("SELECT ep.code as ep_code, ep.libelle as ep_libelle \n" +
                    "FROM epreuve ep \n" +
                    "where ep.code = ?;");

            //System.out.println("REQ="+ requeteSql);
            requeteSql.setInt(1, idEpreuve);
            resultatRequete = requeteSql.executeQuery();

            if (resultatRequete.next()){

                ep.setCode(resultatRequete.getInt("ep_code"));
                ep.setLibelle(resultatRequete.getString("ep_libelle"));

            }
        }
        catch (SQLException e){
            e.printStackTrace();
            System.out.println("La requête de getLesPompiers e généré une erreur");
        }
        return ep;
    }

    public static ArrayList<Athlete> getAthletesByEpreuveId(Connection cnx, int idEpreuve) {

        ArrayList<Athlete> as = new ArrayList<>();

        try{
            requeteSql = cnx.prepareStatement("SELECT e.code as e_code, e.libelle as e_libelle, a.id as a_id, a.nom as a_nom, a.prenom as a_prenom \n" +
                    "FROM epreuve e \n" +
                    "INNER JOIN athlete_epreuve ae \n" +
                    "on ae.epreuve_id = e.code \n" +
                    "INNER JOIN athlete a \n" +
                    "on a.id = ae.athlete_id \n" +
                    "where e.code = ?;");

            requeteSql.setInt(1, idEpreuve);
            resultatRequete = requeteSql.executeQuery();

            while(resultatRequete.next()){

                Epreuve ep = new Epreuve();
                ep.setCode(resultatRequete.getInt("e_code"));
                ep.setLibelle(resultatRequete.getString("e_libelle"));

                Athlete a = new Athlete();
                a.setId(resultatRequete.getInt("a_id"));
                a.setNom(resultatRequete.getString("a_nom"));
                a.setPrenom(resultatRequete.getString("a_prenom"));

                as.add(a);

            }
        }catch (SQLException e){
            e.printStackTrace();
            System.out.println("La requête de getLespays e généré une erreur");
        }
        return as;
    }
}
