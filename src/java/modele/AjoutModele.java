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
public class AjoutModele {
    private int id;
    private int id_organisateur;
    private String nom_organisteur;
    private String email_organisateur;
    private String nom;
    private String titre;
    private String lieu;
    private String date;
    private int nombre;
    private int paf;
    private String img;
    private int billet;
    private String sponsore;

    public String getNom_organisteur() {
        return nom_organisteur;
    }

    public void setNom_organisteur(String nom_organisteur) {
        this.nom_organisteur = nom_organisteur;
    }

    public String getNom_organisateur() {
        return nom_organisteur;
    }

    public void setNom_organisateur(String nom_organisteur) {
        this.nom_organisteur = nom_organisteur;
    }

    public String getEmail_organisateur() {
        return email_organisateur;
    }

    public void setEmail_organisateur(String email_organisateur) {
        this.email_organisateur = email_organisateur;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId_organisateur() {
        return id_organisateur;
    }

    public void setId_organisateur(int id_organisateur) {
        this.id_organisateur = id_organisateur;
    }
     
     public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }
    
    public String getTitre() {
        return titre;
    }

    public void setTitre(String titre) {
        this.titre = titre;
    }

    public String getLieu() {
        return lieu;
    }

    public void setLieu(String lieu) {
        this.lieu = lieu;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getNombre() {
        return nombre;
    }

    public void setNombre(int nombre) {
        this.nombre = nombre;
    }
    
     public int getPaf() {
        return paf;
    }

    public void setPaf(int paf) {
        this.paf = paf;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getSponsore() {
        return sponsore;
    }

    public void setSponsore(String sponsore) {
        this.sponsore = sponsore;
    }
   
    public void getDate(String date) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
