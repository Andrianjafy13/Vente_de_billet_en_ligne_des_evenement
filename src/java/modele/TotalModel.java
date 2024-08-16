/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modele;

/**
 *
 * @author USER
 */
public class TotalModel {
    int id_total;
    int id_organisateur;
    int id;
    int total;
    String titre;

    public String getTitre() {
        return titre;
    }

    public void setTitre(String titre) {
        this.titre = titre;
    }

    public int getId_total() {
        return id_total;
    }

    public void setId_total(int id_total) {
        this.id_total = id_total;
    }

    public int getId_organisateur() {
        return id_organisateur;
    }

    public void setId_organisateur(int id_organisateur) {
        this.id_organisateur = id_organisateur;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }
    
}
