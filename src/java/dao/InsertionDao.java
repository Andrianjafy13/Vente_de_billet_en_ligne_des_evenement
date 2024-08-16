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
import modele.InsertionModele;
import modele.OrganisateurModele;
import modele.TotalModel;
import static org.omg.CosNaming.BindingTypeHelper.insert;

/**
 *
 * @author USER
 */
public class InsertionDao {
    public void insertPersonnel(InsertionModele insert){
        String sql = "INSERT INTO user (id_organisateur,nom,prenom,email,nombre_de_billet,evenement,payment,capture) VALUES "
                + ""+"('"+insert.getId_organisateur()+"','"+insert.getNom()+"','"+insert.getPrenom()+"','"+insert.getEmail()+"',"
                + "'"+insert.getBillet()+"','"+insert.getEvenement()+"','"+insert.getPayment()+"','"+insert.getCapture()+"')";
        AccessBdd access = new AccessBdd();
        access.loadDriver();
        access.executeUpdate(sql);
       
    }
     public int findId_organisateur(int id_ajout){
         int id_organisateur = -1;
        String sql = "SELECT id_organisateur from ajout WHERE id =" + id_ajout;
        AccessBdd access = new AccessBdd();
        access.loadDriver();
        access.executeSelect(sql);
        
         ResultSet resultat = access.executeSelect(sql);
        try {
            while(resultat.next()){
                id_organisateur = Integer.valueOf(resultat.getString("id_organisateur"));
                
            }
        } catch (SQLException ex) {
            Logger.getLogger(InsertionDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        access.closeConnection();
        return id_organisateur;
       
    }
    public void insertOrganisateur(OrganisateurModele organiser){
        String sql = "INSERT INTO organisateur (nom_organisateur,prenom,login,password,email) "
                + "VALUES  "+"('"+organiser.getNom()+"','"+organiser.getPrenom()+"','"+organiser.getLogin()+"','"+organiser.getPassword()+"','"+organiser.getEmail()+"')";
        AccessBdd access = new AccessBdd();
        access.loadDriver();
        access.executeUpdate(sql);
    }
    
    public void ajoutEvenement(AjoutModele ajout){
        String sql = "INSERT INTO ajout(id_organisateur,titre,date_heure,lieu,nombre_de_place,prix,image,sponsore)VALUES "
                + ""+"( '"+ajout.getId_organisateur()+"','"+ajout.getTitre()+"','"+ajout.getDate()+"','"+ajout.getLieu()+"','"+ajout.getNombre()+"',"
                + " '"+ajout.getPaf()+"','"+ajout.getImg()+"','"+ajout.getSponsore()+"')";
        AccessBdd access = new AccessBdd();
        access.loadDriver();
        access.executeUpdate(sql);
    }
    
    public void calculBillet(int idEvent, int nombre){
        String sql = "UPDATE `ajout` SET `nombre_de_place` = '"+ nombre  +"' WHERE `ajout`.`id` = "+ idEvent +";";
        AccessBdd access = new AccessBdd();
        access.loadDriver();
        access.executeUpdate(sql);
    } 
     
    public boolean Modifier(InsertionModele insert,int id){
        String sql = "UPDATE user SET id_user = '"+insert.getId_user()+"', nom = '"+insert.getNom()+"',prenom ='"+insert.getPrenom()+"',email = '"+insert.getEmail()+"',"
                + "nombre_de_billet = '"+insert.getBillet()+"',"
                + "evenement = '"+insert.getEvenement()+"', payment = '"+insert.getPayment()+"' WHERE id_user="+id;
       
         boolean val = false;
         AccessBdd access = new AccessBdd();
        access.loadDriver();
       
        try{
        access.executeUpdate(sql);
        val = true;
    }catch(Exception ex){}
    access.closeConnection();
    System.out.println(val);
    System.out.println(insert.getId_user());
    return val;
    }
    
    public boolean ModifierEvent(AjoutModele modEvent, int id) {
        String sql = "UPDATE ajout SET id = '"+modEvent.getId()+"', titre = '"+modEvent.getTitre()+"', date_heure= '"+modEvent.getDate()+"', "
                + "lieu = '"+modEvent.getLieu()+"', nombre_de_place = '"+modEvent.getNombre()+"', prix = '"+modEvent.getPaf()+"',"
                + "sponsore = '"+modEvent.getSponsore()+"' WHERE id = "+id;
        boolean mod = false;
        AccessBdd access = new AccessBdd();
        access.loadDriver();
        
        try {
            access.executeUpdate(sql);
            mod = true;
        }catch(Exception ex){}
        access.closeConnection();
        return mod;
    }
    
    public boolean Suprimer(InsertionModele insert,int id){
        String sql = "DELETE FROM user WHERE id_user = "+id;
        AccessBdd  access = new AccessBdd();
        access.loadDriver();
        boolean sup = false;
        try{
        access.executeUpdate(sql);
        sup=true;
        }catch(Exception ex){ }
        access.closeConnection();
        System.out.println(sup);
        return sup;
    }
    
    public boolean Suprimere(AjoutModele insert,int id){
        String sql = "DELETE FROM ajout WHERE id = "+id;
        AccessBdd  access = new AccessBdd();
        access.loadDriver();
        boolean supr = false;
        try{
        access.executeUpdate(sql);
        supr =true;
        }catch(Exception ex){ }
        access.closeConnection();
        System.out.println(supr);
        return supr;
    }
    
    public float multiplication(int id_organisateur,int billet_id, float billet,float paf){
        float mult = billet * paf;
        boolean update = false;
        TotalModel totalModel = new TotalModel();
        
        String sql = "SELECT * from totalevent WHERE id_organisateur="+ id_organisateur + " and id=" + billet_id;
        
        AccessBdd access = new AccessBdd();
        access.loadDriver();
         ResultSet resultat = access.executeSelect(sql);
        try{
            while(resultat.next()){
                  update = true;
                  totalModel.setId(Integer.valueOf(resultat.getString("id")));
                  totalModel.setId_organisateur(Integer.valueOf(resultat.getString("id_organisateur")));
                  totalModel.setTotal(Integer.valueOf(resultat.getString("total")));
            }
        }catch (SQLException ex){
             Logger.getLogger(InsertionDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        access.closeConnection();
        
        if (update == true) {
           float somme  = mult + totalModel.getTotal();
           sql = "UPDATE totalevent SET total ="+ somme +" WHERE id="+ billet_id;
       
        }
        else {
            sql = "INSERT INTO totalevent(id_organisateur,id,total) VALUES ('"+id_organisateur+"','"+billet_id+"','"+mult+"')";
            
        }
        
       // AccessBdd access = new AccessBdd();
        access.loadDriver();
        access.executeUpdate(sql);
        return mult;
    }
    
}
