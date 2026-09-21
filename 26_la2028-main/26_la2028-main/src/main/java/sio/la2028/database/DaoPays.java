/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sio.la2028.database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import sio.la2028.model.Athlete;
import sio.la2028.model.Pays;
import sio.la2028.model.Sport;

/**
 *
 * @author zakina
 */
public class DaoPays {
    
    Connection cnx;
    static PreparedStatement requeteSql = null;
    static ResultSet resultatRequete = null;
    
    public static ArrayList<Pays> getLesPays(Connection cnx){
        
         ArrayList<Pays> lesPays = new ArrayList<Pays>();
        try{
            requeteSql = cnx.prepareStatement("select id, code, nom FROM pays;");
            //System.out.println("REQ="+ requeteSql);
            resultatRequete = requeteSql.executeQuery();
            
            while (resultatRequete.next()) {

                Pays p = new Pays();
                p.setId(resultatRequete.getInt("id"));
                p.setCode(resultatRequete.getString("code"));
                p.setNom(resultatRequete.getString("nom"));

                lesPays.add(p);
            }
        }
        catch (SQLException e){
            e.printStackTrace();
            System.out.println("La requête de getLespays e généré une erreur");
        }
        return lesPays;
    }

    public static Pays getPaysById(Connection cnx, int idPays){

        Pays p = new Pays();
        try{
            requeteSql = cnx.prepareStatement("SELECT p.id as p_id, p.code as p_code, p.nom as p_nom \n" +
                    "FROM pays p \n" +
                    "where id = ?;");

            //System.out.println("REQ="+ requeteSql);
            requeteSql.setInt(1, idPays);
            resultatRequete = requeteSql.executeQuery();

            if (resultatRequete.next()){

                p.setId(resultatRequete.getInt("p_id"));
                p.setNom(resultatRequete.getString("p_nom"));
                p.setCode(resultatRequete.getString("p_code"));

            }
        }
        catch (SQLException e){
            e.printStackTrace();
            System.out.println("La requête de getLesPompiers e généré une erreur");
        }
        return p;
    }
}
