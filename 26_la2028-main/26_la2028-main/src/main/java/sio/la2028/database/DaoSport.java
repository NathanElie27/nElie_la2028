/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sio.la2028.database;

import sio.la2028.model.Athlete;
import sio.la2028.model.Pays;
import sio.la2028.model.Sport;

import java.sql.*;
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

    public static Sport getSportById(Connection cnx, int idSport){

        Sport s = new Sport();
        try{
            requeteSql = cnx.prepareStatement("SELECT s.id as s_id, s.nom as s_nom, s.photo_spo as photo \n" +
                    "FROM sports s \n" +
                    "where s.id = ?;");

            //System.out.println("REQ="+ requeteSql);
            requeteSql.setInt(1, idSport);
            resultatRequete = requeteSql.executeQuery();

            if (resultatRequete.next()){

                s.setId(resultatRequete.getInt("s_id"));
                s.setNom(resultatRequete.getString("s_nom"));
                s.setPhoto(resultatRequete.getString("photo"));

            }
        }
        catch (SQLException e){
            e.printStackTrace();
            System.out.println("La requête de getLesPompiers e généré une erreur");
        }
        return s;
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

                s.setId(resultatRequete.getInt("s_id"));
                s.setNom(resultatRequete.getString("s_nom"));

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

    public static Sport addSport(Connection connection, Sport spt){
        int idGenere = -1;

        try
        {
            //preparation de la requete
            // id (clé primaire de la table Sport) est en auto_increment,donc on ne renseigne pas cette valeur
            // la paramètre RETURN_GENERATED_KEYS est ajouté à la requête afin de pouvoir récupérer l'id généré par la bdd (voir ci-dessous)
            // supprimer ce paramètre en cas de requête sans auto_increment.
            requeteSql=connection.prepareStatement("INSERT INTO sports (nom) \n" +
                    "VALUES (?);", requeteSql.RETURN_GENERATED_KEYS );
            requeteSql.setString(1, spt.getNom());

            /* Exécution de la requête */
            requeteSql.executeUpdate();

            // Récupération de id auto-généré par la bdd dans la table client
            resultatRequete = requeteSql.getGeneratedKeys();
            while ( resultatRequete.next() ) {
                idGenere = resultatRequete.getInt( 1 );
                spt.setId(idGenere);

                spt = DaoSport.getSportById(connection, spt.getId());
            }

        }
        catch (SQLException e)
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
        }
        return spt ;
    }



}
