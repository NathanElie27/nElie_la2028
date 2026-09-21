/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sio.la2028.database;

import sio.la2028.model.Athlete;
import sio.la2028.model.Pays;
import sio.la2028.model.Sport;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author zakina
 */
public class DaoSport {
    
    Connection cnx;
    static PreparedStatement requeteSql = null;
    static ResultSet resultatRequete = null;
    
    public static ArrayList<Sport> getLesSports(Connection cnx){
        
         ArrayList<Sport> lesSports = new ArrayList<Sport>();
        try{
            requeteSql = cnx.prepareStatement("select s.id as s_id, s.nom as s_nom \n "+
                    " from sports s");
            //System.out.println("REQ="+ requeteSql);
            resultatRequete = requeteSql.executeQuery();
            
            while (resultatRequete.next()){
                
                Sport s = new Sport();
                s.setId(resultatRequete.getInt("s_id"));
                s.setNom(resultatRequete.getString("s_nom"));
                
                lesSports.add(s);
            }
           
        }
        catch (SQLException e){
            e.printStackTrace();
            System.out.println("La requête de getLespayss e généré une erreur");
        }
        return lesSports;
        
    }

    public static ArrayList<Athlete> getAthletesBySportId(Connection cnx, int idSport) {

        ArrayList<Athlete> as = new ArrayList<>();

        try{
            requeteSql = cnx.prepareStatement("SELECT a.id as a_id, a.nom as a_nom, a.prenom as a_prenom, s.id as s_id, s.nom as s_nom FROM athlete a \n" +
                    "inner join sports s \n" +
                    "on s.id = a.sport_id \n" +
                    "WHERE s.id = ?;");

            requeteSql.setInt(1, idSport);
            resultatRequete = requeteSql.executeQuery();

            while(resultatRequete.next()){

                Sport s = new Sport();

                s.setId(resultatRequete.getInt("p_id"));
                s.setNom(resultatRequete.getString("p_nom"));

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
