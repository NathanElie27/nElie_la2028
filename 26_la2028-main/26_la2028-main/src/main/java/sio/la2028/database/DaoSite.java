package sio.la2028.database;

import sio.la2028.model.Athlete;
import sio.la2028.model.Pays;
import sio.la2028.model.Site;
import sio.la2028.model.Sport;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DaoSite {

    Connection cnx;
    static PreparedStatement requeteSql = null;
    static ResultSet resultatRequete = null;

    public static ArrayList<Site> getLesSites(Connection cnx){

        ArrayList<Site> lesSites = new ArrayList<Site>();
        try{
            requeteSql = cnx.prepareStatement("select * from site;");
            //System.out.println("REQ="+ requeteSql);
            resultatRequete = requeteSql.executeQuery();

            while (resultatRequete.next()){

                Site s = new Site();
                s.setId(resultatRequete.getInt("id"));
                s.setNom(resultatRequete.getString("nom"));

                lesSites.add(s);
            }

        }
        catch (SQLException e){
            e.printStackTrace();
            System.out.println("La requête de getLespayss e généré une erreur");
        }
        return lesSites;

    }

    public static Site getSiteById(Connection cnx, int idSite){

        Site s = new Site();
        try{
            requeteSql = cnx.prepareStatement("SELECT * FROM site p " +
                    "where id = ?;");

            //System.out.println("REQ="+ requeteSql);
            requeteSql.setInt(1, idSite);
            resultatRequete = requeteSql.executeQuery();

            if (resultatRequete.next()){

                s.setId(resultatRequete.getInt("id"));
                s.setNom(resultatRequete.getString("nom"));

            }
        }
        catch (SQLException e){
            e.printStackTrace();
            System.out.println("La requête de getLesPompiers e généré une erreur");
        }
        return s;
    }

    public static ArrayList<Sport> getSportsBySiteId(Connection cnx, int idSite) {

        ArrayList<Sport> sps = new ArrayList<>();

        try{
            requeteSql = cnx.prepareStatement("SELECT s.id as s_id, s.nom as s_nom, sp.id as sp_id, sp.nom as sp_nom FROM site s\n" +
                    "INNER JOIN sports sp\n" +
                    "on s.sport_id = sp.id\n" +
                    "WHERE s.id = ?;");

            requeteSql.setInt(1, idSite);
            resultatRequete = requeteSql.executeQuery();

            while(resultatRequete.next()){

                Sport sp = new Sport();
                sp.setId(resultatRequete.getInt("sp_id"));
                sp.setNom(resultatRequete.getString("sp_nom"));

                Site s = new Site();
                s.setId(resultatRequete.getInt("s_id"));
                s.setNom(resultatRequete.getString("s_nom"));

                sps.add(sp);

            }
        }catch (SQLException e){
            e.printStackTrace();
            System.out.println("La requête de getLespays e généré une erreur");
        }

        return sps;

    }
}
