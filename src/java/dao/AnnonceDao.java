/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import common.AccessBdd;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import modele.AjoutModele;
import modele.AnnonceModele;
import modele.FestivaleModele;
import modele.TheatreModele;


/**
 *
 * @author USER
 */
public class AnnonceDao {
  public void ajoutAnnonce(AnnonceModele ajout){
        String sql = "INSERT INTO annonce(titre_annonce,date,Lieu,image)VALUES "
                + ""+"( '"+ajout.getTitre()+"','"+ajout.getDate()+"','"+ajout.getLieu()+"','"+ajout.getImage()+"')";
        AccessBdd access = new AccessBdd();
        access.loadDriver();
        access.executeUpdate(sql);
    }
  
  public void ajoutFestivale(FestivaleModele ajout){
        String sql = "INSERT INTO festivale(titre_festivale,date_debut,date_fin,Lieu,image)VALUES "
                + ""+"( '"+ajout.getTitre()+"','"+ajout.getDate_debut()+"','"+ajout.getDate_fin()+"','"+ajout.getLieu()+"','"+ajout.getImage()+"')";
        AccessBdd access = new AccessBdd();
        access.loadDriver();
        access.executeUpdate(sql);
    }
  
  public void ajoutTheatre(TheatreModele ajout){
      String sql = "INSERT INTO theatre(titre_theatre,date_heure,lieu,image) VALUES "
              + "('"+ajout.getTitre()+"','"+ajout.getDate()+"','"+ajout.getLieu()+"','"+ajout.getImage()+"')  ";
      AccessBdd access = new AccessBdd();
      access.loadDriver();
      access.executeUpdate(sql);
  }
  
    public List<AnnonceModele> findAllEvent() throws SQLException{
        List<AnnonceModele> listEvent = new ArrayList<AnnonceModele>();
        String sql = "SELECT * FROM annonce";
        AccessBdd access = new AccessBdd();
        access.loadDriver();
        ResultSet resultat = access.executeSelect(sql);
        try{
            while(resultat.next()){
                AnnonceModele insert = new AnnonceModele();
                
                 insert.setTitre(resultat.getString("titre_annonce"));
                 insert.setDate(resultat.getString("date"));
                 insert.setLieu(resultat.getString("Lieu"));
                 insert.setImage(resultat.getString("image"));
                  listEvent.add(insert);
            }
        }catch (SQLException ex){
             Logger.getLogger(InsertionDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        access.closeConnection();
        return listEvent;
        
    }
    
     public List<TheatreModele> findAllEvent1() throws SQLException{
        List<TheatreModele> listEvent1 = new ArrayList<TheatreModele>();
        String sql = "SELECT * FROM theatre";
        AccessBdd access = new AccessBdd();
        access.loadDriver();
        ResultSet resultat = access.executeSelect(sql);
        try{
            while(resultat.next()){
                TheatreModele insert = new TheatreModele();
                
                 insert.setTitre(resultat.getString("titre_theatre"));
                 insert.setDate(resultat.getString("date_heure"));
                 insert.setLieu(resultat.getString("Lieu"));
                 insert.setImage(resultat.getString("image"));
                  listEvent1.add(insert);
            }
        }catch (SQLException ex){
             Logger.getLogger(InsertionDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        access.closeConnection();
        return listEvent1;
        
    }
    
     public List<FestivaleModele> findAllEvent2() throws SQLException{
        List<FestivaleModele> listEvents = new ArrayList<FestivaleModele>();
        String sql = "SELECT * FROM festivale";
        AccessBdd access = new AccessBdd();
        access.loadDriver();
        ResultSet resultat = access.executeSelect(sql);
        try{
            while(resultat.next()){
                FestivaleModele insert = new FestivaleModele();
                 insert.setId(Integer.valueOf(resultat.getString("id_festivale")));
                 insert.setTitre(resultat.getString("titre_festivale"));
                 insert.setDate_debut(resultat.getString("date_debut"));
                 insert.setDate_fin(resultat.getString("date_fin"));
                 insert.setLieu(resultat.getString("Lieu"));
                 insert.setImage(resultat.getString("image"));
                  listEvents.add(insert);
            }
        }catch (SQLException ex){
             Logger.getLogger(InsertionDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        access.closeConnection();
        return listEvents;
        
    }
     
     public List<AjoutModele> findAllAjout() throws SQLException{
         List<AjoutModele> listAjout = new ArrayList<AjoutModele>();
         //String sql = "SELECT * FROM ajout";
         
          String sql = "SELECT ajout.id, ajout.id_organisateur, organisateur.nom_organisateur, organisateur.email,"
                  + " ajout.date_heure, ajout.lieu, ajout.titre, ajout.image, ajout.nombre_de_place,ajout.prix "
               + "FROM ajout "
               + "INNER JOIN organisateur ON ajout.id_organisateur=organisateur.id_organisateur " ;
         
         AccessBdd access = new AccessBdd();
        access.loadDriver();
        ResultSet resultat = access.executeSelect(sql);
        try{
            while(resultat.next()){
                  AjoutModele insert = new AjoutModele();
                  insert.setId(Integer.valueOf(resultat.getString("id")));
                  //insert.setNom(resultat.getString("nom_organisateur"));
                  insert.setId_organisateur(Integer.valueOf(resultat.getString("id_organisateur")));
                  insert.setNom_organisateur(resultat.getString("nom_organisateur"));
                  insert.setEmail_organisateur(resultat.getString("email"));
                  insert.setTitre(resultat.getString("titre"));
                  insert.setDate(resultat.getString("date_heure"));
                  insert.setLieu(resultat.getString("lieu"));
                  insert.setNombre(Integer.parseInt(resultat.getString("nombre_de_place")));
                  insert.setPaf(Integer.valueOf(resultat.getString("prix")));
                                
                  listAjout.add(insert);
            }
        }catch (SQLException ex){
             Logger.getLogger(InsertionDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        access.closeConnection();
        return listAjout;
     }
}
