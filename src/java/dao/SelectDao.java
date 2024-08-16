/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import static com.sun.corba.se.spi.presentation.rmi.StubAdapter.request;
import common.AccessBdd;
import java.awt.Event;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;
import modele.AjoutModele;
import modele.InsertionModele;
import modele.TotalModel;

/**
 *
 * @author USER
 */
public class SelectDao {
    
    public List<AjoutModele> findAll() throws SQLException{
        List<AjoutModele> listePersonnels = new ArrayList<AjoutModele>();
        String sql = "SELECT nombre_de_place,prix FROM ajout";
        System.out.println(sql);
        AccessBdd access = new AccessBdd();
        access.loadDriver();
        ResultSet resultat = access.executeSelect(sql);
        try{
            while(resultat.next()){
                AjoutModele ajout = new AjoutModele();
                ajout.setNombre(Integer.valueOf(resultat.getString("nombre_de_place")));
                ajout.setPaf(Integer.valueOf(resultat.getString("prix")));
                listePersonnels.add(ajout);
            }
        }catch(Exception ex){
            Logger.getLogger(InsertionDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        access.closeConnection();
        return listePersonnels;
    }
    
    public List<InsertionModele> findAll(int id_organisateur) throws SQLException{
        List<InsertionModele> listePersonnel = new ArrayList<InsertionModele>();
        String sql = "SELECT * FROM user WHERE id_organisateur =" +id_organisateur;
        AccessBdd access = new AccessBdd();
        access.loadDriver();
        ResultSet resultat = access.executeSelect(sql);
        try{
            while(resultat.next()){
                InsertionModele insert = new InsertionModele();
                 insert.setId_user(Integer.valueOf(resultat.getString("id_user")));
                 insert.setNom(resultat.getString("nom"));
                 insert.setPrenom(resultat.getString("prenom"));
                 insert.setEmail(resultat.getString("email"));
                 insert.setBillet(Integer.parseInt(resultat.getString("nombre_de_billet")));
                 insert.setEvenement(resultat.getString("evenement"));
                 insert.setPayment(resultat.getString("payment"));
                 insert.setCapture(resultat.getString("capture"));
                  listePersonnel.add(insert);
            }
        }catch (SQLException ex){
             Logger.getLogger(InsertionDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        access.closeConnection();
        return listePersonnel;
        
    }
    
    public List<AjoutModele> findAlls(int id_organisteur) throws SQLException{
        List<AjoutModele> listeAjout = new ArrayList<AjoutModele>();
        
       String sql = "SELECT ajout.id, ajout.id_organisateur, organisateur.nom_organisateur, organisateur.email, ajout.date_heure, ajout.lieu, ajout.titre, ajout.image, ajout.nombre_de_place,ajout.prix,ajout.sponsore "
               + "FROM ajout "
               + "INNER JOIN organisateur ON ajout.id_organisateur=organisateur.id_organisateur "
               + "WHERE ajout.id_organisateur="+ id_organisteur;
        
        /* String sql = "SELECT ajout.id,ajout.titre,ajout.date_heure,ajout.lieu,ajout.nombre_de_place,organisateur.nom_organisateur"
                + " FROM ajout INNER JOIN organisateur ON ajout.id_organisateur = organisateur.id_organisateur";
        
        String sql = "SELECT ajout.id,ajout.titre,ajout.date_heure,ajout.lieu,ajout.nombre_de_place,organisateur.nom_organisateur FROM"
                + " ajout INNER JOIN organisateur ON ajout.id = organisateur.id_organisateur";*/
        
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
                  insert.setSponsore(resultat.getString("sponsore"));
                                
                  listeAjout.add(insert);
            }
        }catch (SQLException ex){
             Logger.getLogger(InsertionDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        access.closeConnection();
        return listeAjout;
        
    }
    
     public List<AjoutModele> findAllEvent() throws SQLException{
        List<AjoutModele> listEvent = new ArrayList<AjoutModele>();
        
        String sql = "SELECT ajout.id, organisateur.nom_organisateur, organisateur.email, ajout.date_heure, ajout.lieu, ajout.titre,ajout.prix, ajout.image, ajout.sponsore " +
        "FROM ajout " +
        "INNER JOIN organisateur ON ajout.id_organisateur=organisateur.id_organisateur WHERE date_heure >= CURRENT_DATE ORDER BY date_heure ASC";
        
        AccessBdd access = new AccessBdd();
        access.loadDriver();
        ResultSet resultat = access.executeSelect(sql);
        try{
            while(resultat.next()){
                AjoutModele insert = new AjoutModele();
                 insert.setId(Integer.valueOf(resultat.getString("id")));
                 insert.setNom_organisateur(resultat.getString("nom_organisateur"));
                 insert.setEmail_organisateur(resultat.getString("email"));
                 insert.setDate(resultat.getString("date_heure"));
                 insert.setLieu(resultat.getString("lieu"));
                 insert.setTitre(resultat.getString("titre"));
                 insert.setPaf(Integer.parseInt(resultat.getString("prix")));
                 insert.setSponsore(resultat.getString("sponsore"));
                 insert.setImg(resultat.getString("image"));
                  listEvent.add(insert);
            }
        }catch (SQLException ex){
             Logger.getLogger(InsertionDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        access.closeConnection();
        return listEvent;
        
    }
     
     public List<AjoutModele> findAllEventPasser() throws SQLException{
        List<AjoutModele> listEventPasser = new ArrayList<AjoutModele>();
        String sql = "SELECT ajout.id, organisateur.nom_organisateur, organisateur.email, ajout.date_heure, ajout.lieu, ajout.titre,ajout.prix, ajout.image, ajout.sponsore " +
        "FROM ajout " +
        "INNER JOIN organisateur ON ajout.id_organisateur=organisateur.id_organisateur WHERE date_heure< CURRENT_DATE ORDER BY date_heure ASC";
        AccessBdd access = new AccessBdd();
        access.loadDriver();
        ResultSet resultat = access.executeSelect(sql);
        try{
            while(resultat.next()){
                AjoutModele insert = new AjoutModele();
                 insert.setId(Integer.valueOf(resultat.getString("id")));
                 insert.setNom_organisateur(resultat.getString("nom_organisateur"));
                 insert.setEmail_organisateur(resultat.getString("email"));
                 insert.setDate(resultat.getString("date_heure"));
                 insert.setLieu(resultat.getString("lieu"));
                 insert.setTitre(resultat.getString("titre"));
                 insert.setPaf(Integer.parseInt(resultat.getString("prix")));
                 insert.setSponsore(resultat.getString("sponsore"));
                 insert.setImg(resultat.getString("image"));
                  listEventPasser.add(insert);
            }
        }catch (SQLException ex){
             Logger.getLogger(InsertionDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        access.closeConnection();
        return listEventPasser;
        
    }
     
      public List<AjoutModele> findAllDetaile(int id) throws SQLException{
        List<AjoutModele> listDetaile = new ArrayList<AjoutModele>();
        String sql = "SELECT ajout.id, organisateur.nom_organisateur, organisateur.email, ajout.date_heure, ajout.lieu, ajout.titre,ajout.prix, ajout.image, ajout.sponsore " +
        "FROM ajout " +
        "INNER JOIN organisateur ON ajout.id_organisateur=organisateur.id_organisateur WHERE id="+id;
        AccessBdd access = new AccessBdd();
        access.loadDriver();
        ResultSet resultat = access.executeSelect(sql);
        try{
            while(resultat.next()){
                AjoutModele insert = new AjoutModele();
                 insert.setId(Integer.valueOf(resultat.getString("id")));
                 insert.setNom_organisateur(resultat.getString("nom_organisateur"));
                 insert.setEmail_organisateur(resultat.getString("email"));
                 insert.setDate(resultat.getString("date_heure"));
                 insert.setLieu(resultat.getString("lieu"));
                 insert.setTitre(resultat.getString("titre"));
                 insert.setPaf(Integer.parseInt(resultat.getString("prix")));
                 insert.setSponsore(resultat.getString("sponsore"));
                 insert.setImg(resultat.getString("image"));
                  listDetaile.add(insert);
            }
        }catch (SQLException ex){
             Logger.getLogger(InsertionDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        access.closeConnection();
        return listDetaile;
        
    }
     
    public AjoutModele findEventById(int idEvent) throws SQLException{
        String sql = "SELECT * FROM ajout where id=" + idEvent;
        AccessBdd access = new AccessBdd();
        access.loadDriver();
        ResultSet resultat = access.executeSelect(sql);
        AjoutModele insert = new AjoutModele();
        try{
            while(resultat.next()){
                 insert.setId(Integer.valueOf(resultat.getString("id")));
                 insert.setDate(resultat.getString("date_heure"));
                 insert.setLieu(resultat.getString("lieu"));
                 insert.setTitre(resultat.getString("titre"));
                 insert.setImg(resultat.getString("image"));
                 insert.setNombre(Integer.parseInt(resultat.getString("nombre_de_place")));
                 insert.setPaf(Integer.valueOf(resultat.getString("prix")));
            }
        }catch (SQLException ex){
             Logger.getLogger(InsertionDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        access.closeConnection();
        return insert;
        
    }
     
     public List<InsertionModele> findByPersonnel(int id){
        List<InsertionModele> listePersonnel = new ArrayList<InsertionModele>();
        String sql = "SELECT * FROM user WHERE id_user="+id;
        AccessBdd access = new AccessBdd();
        access.loadDriver();
        ResultSet resultat = access.executeSelect(sql);
        try {
            while(resultat.next()){
                InsertionModele perso = new InsertionModele();
                perso.setId_user(Integer.valueOf(resultat.getString("id_user")));
                perso.setNom(resultat.getString("nom"));
                perso.setPrenom(resultat.getString("prenom"));
                perso.setEmail(resultat.getString("email"));
                perso.setBillet(Integer.valueOf(resultat.getString("nombre_de_billet")));
                perso.setEvenement(resultat.getString("evenement"));
                perso.setPayment(resultat.getString("payment"));
                listePersonnel.add(perso);
            }
        } catch (SQLException ex) {
            Logger.getLogger(InsertionDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        access.closeConnection();
        
        return listePersonnel;
    }
     
     
     public List<AjoutModele> findByModifierEvent(int id_ajout){
        List<AjoutModele> listemodifierEvent = new ArrayList<AjoutModele>();
        String sql = "SELECT * FROM ajout WHERE id="+id_ajout;
        AccessBdd access = new AccessBdd();
        access.loadDriver();
        ResultSet resultat = access.executeSelect(sql);
        try {
            while(resultat.next()){
                AjoutModele modifier = new AjoutModele();
                modifier.setId(Integer.valueOf(resultat.getString("id")));
                modifier.setTitre(resultat.getString("titre"));
                modifier.setDate(resultat.getString("date_heure"));
                modifier.setLieu(resultat.getString("lieu"));
                modifier.setNombre(Integer.valueOf(resultat.getString("nombre_de_place")));
                modifier.setPaf(Integer.valueOf(resultat.getString("prix")));
                modifier.setSponsore(resultat.getString("sponsore"));
                listemodifierEvent.add(modifier);
            }
        } catch (SQLException ex) {
            Logger.getLogger(InsertionDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        access.closeConnection();
        
        return listemodifierEvent;
    }
     
     public List<AjoutModele> findAllRecherche(String titre) throws SQLException{
        List<AjoutModele> listRecherche = new ArrayList<AjoutModele>();
      //  String sql = "SELECT * FROM ajout WHERE titre LIKE '"+ titre +"%'";
        
         String sql = "SELECT ajout.id, ajout.id_organisateur, organisateur.nom_organisateur, organisateur.email, ajout.date_heure, ajout.lieu, ajout.titre, ajout.image, ajout.nombre_de_place,ajout.prix "
               + "FROM ajout "
               + "INNER JOIN organisateur ON ajout.id_organisateur=organisateur.id_organisateur "
               + "WHERE titre LIKE   '"+titre+ "%'";
        
        
        AccessBdd access = new AccessBdd();
        access.loadDriver();
        ResultSet resultat = access.executeSelect(sql);
        try{
            while(resultat.next()){
                AjoutModele ajout = new AjoutModele();
                 ajout.setId(Integer.valueOf(resultat.getString("id")));
                 ajout.setDate(resultat.getString("date_heure"));
                 ajout.setLieu(resultat.getString("lieu"));
                 ajout.setTitre(resultat.getString("titre"));
                 ajout.setNom_organisateur(resultat.getString("nom_organisateur"));
                 ajout.setEmail_organisateur(resultat.getString("email"));
                 ajout.setImg(resultat.getString("image"));
                 ajout.setNombre(Integer.parseInt(resultat.getString("nombre_de_place")));
                 ajout.setPaf(Integer.valueOf(resultat.getString("prix")));
                 listRecherche.add(ajout);
            }
        }
        catch (SQLException ex){
             Logger.getLogger(InsertionDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        access.closeConnection();
        return listRecherche;
     }
     
     
     public List<InsertionModele> findAllRecherchePerso(String nom) throws SQLException{
        List<InsertionModele> listRecherches = new ArrayList<InsertionModele>();
        String sql = "SELECT * FROM user WHERE nom LIKE '"+ nom +"%'";
         /*String sql = "SELECT user.id_user, organisateur.id_organisateur, user.nom, user.prenom, user.email, user.nombre_de_billet,user.evenement, user.payment"
               + "FROM user "
               + "INNER JOIN organisateur ON user.id_organisateur=organisateur.id_organisateur "
               + "WHERE nom LIKE   '"+nom+ "%'";*/
        
        
        AccessBdd access = new AccessBdd();
        access.loadDriver();
        ResultSet resultats = access.executeSelect(sql);
        try{
            while(resultats.next()){
                InsertionModele ajout = new InsertionModele();
                    ajout.setId_user(Integer.valueOf(resultats.getString("id_user")));
                    ajout.setId_organisateur(Integer.valueOf(resultats.getString("id_organisateur")));
                    ajout.setNom(resultats.getString("nom"));
                    ajout.setPrenom(resultats.getString("prenom"));
                    ajout.setEmail(resultats.getString("email"));
                    ajout.setBillet(Integer.parseInt(resultats.getString("nombre_de_billet")));
                    ajout.setEvenement(resultats.getString("evenement"));
                    ajout.setPayment(resultats.getString("payment"));
                    listRecherches.add(ajout);
            }
        }
        catch (SQLException ex){
             Logger.getLogger(InsertionDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        access.closeConnection();
        return listRecherches;
     }
    
     
     
     public InsertionModele facture(){
        String sql = "SELECT * FROM `user` WHERE id_user=(SELECT MAX(id_user) FROM user)";
        AccessBdd access = new AccessBdd();
        access.loadDriver();
         ResultSet resultat = access.executeSelect(sql);
         
                InsertionModele insert = new InsertionModele();
        try{
            while(resultat.next()){
                 insert.setNom(resultat.getString("nom"));
                 insert.setPrenom(resultat.getString("prenom"));
                 insert.setBillet(Integer.parseInt(resultat.getString("nombre_de_billet")));
                 insert.setEmail(resultat.getString("email"));
                 insert.setEvenement(resultat.getString("evenement"));
                 insert.setPayment(resultat.getString("payment"));
                  
            }
        }catch (SQLException ex){
             Logger.getLogger(InsertionDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        access.closeConnection();
        return insert;
    }
     
      public List<TotalModel> findAllTotal(int id_organisateur) throws SQLException{
        List<TotalModel> totals = new ArrayList<TotalModel>();
        String sql = "SELECT totalevent.total,ajout.titre FROM totalevent INNER JOIN ajout ON totalevent.id=ajout.id WHERE totalevent.id_organisateur="+id_organisateur;
        System.out.println(sql);
        AccessBdd access = new AccessBdd();
        access.loadDriver();
        ResultSet resultat = access.executeSelect(sql);
        try{
            while(resultat.next()){
                TotalModel ajout = new TotalModel();
                ajout.setTotal(Integer.valueOf(resultat.getString("total")));
                ajout.setTitre(resultat.getString("titre"));
                totals.add(ajout);
            }
        }catch(Exception ex){
            Logger.getLogger(InsertionDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        access.closeConnection();
        return totals;
    }
     
     public boolean deconnexion(HttpSession session) throws SQLException{
         return session.getAttribute("email") != null;
     
    }
     
}
