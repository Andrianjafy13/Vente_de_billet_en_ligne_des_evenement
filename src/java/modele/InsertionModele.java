package modele;

public class InsertionModele {
	private int id_user;
        private int id_organisateur;
	private String nom;
	private String prenom;
	private String email;
	private int billet;
        private String evenement;
        private String payment;
        private String capture;
        private int paf;

    public int getId_user() {
        return id_user;
    }

    public void setId_user(int id_user) {
        this.id_user = id_user;
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

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getBillet() {
        return billet;
    }

    public void setBillet(int billet) {
        this.billet = billet;
    }

    public String getEvenement() {
        return evenement;
    }

    public void setEvenement(String evenement) {
        this.evenement = evenement;
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }

    public String getCapture() {
        return capture;
    }

    public void setCapture(String capture) {
        this.capture = capture;
    }
    

     public int getPaf() {
        return paf;
    }

    public void setPaf(int paf) {
        this.paf = paf;
    }
	
}
