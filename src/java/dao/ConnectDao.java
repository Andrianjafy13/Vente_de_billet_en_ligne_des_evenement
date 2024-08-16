/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import common.AccessBdd;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.http.HttpSession;
import modele.ConnectModele;

/**
 *
 * @author USER
 */
public class ConnectDao {
    
     public String verificationUser(ConnectModele insert) throws SQLException{
        String validation = null;
        String sql = "SELECT * FROM organisateur WHERE email= '"+insert.getEmail()+"' and password='"+insert.getPassword()+"' ";
        AccessBdd access = new AccessBdd();
        access.loadDriver();
        ResultSet resultat = access.executeSelect(sql);
        while(resultat.next()){
            validation = resultat.getInt("id_organisateur") + "";
        }
        access.closeConnection();
        return validation;
        
    }
    
    public boolean deconnexion(HttpSession session) throws SQLException{
       
    return session.getAttribute("email") != null;
     
    }
           
}
