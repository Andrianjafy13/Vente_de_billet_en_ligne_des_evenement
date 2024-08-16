/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.InsertionDao;
import dao.SelectDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modele.AjoutModele;
import modele.InsertionModele;

/**
 *
 * @author USER
 */
public class InsertionServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
         
            String nom = request.getParameter("nom");
           
            String prenom = request.getParameter("prenom");
            String email = request.getParameter("email");
            int billet_dispo =  Integer.parseInt(request.getParameter("billet_dispo"));
            int billet = Integer.parseInt(request.getParameter("billet"));
            int billet_id = Integer.parseInt(request.getParameter("billet_id"));
            String evenement = request.getParameter("evenement");
            String payment = request.getParameter("payment");
            String capture = request.getParameter("capture");
           // int paf = Integer.valueOf(request.getParameter("prix"));
            
        try (PrintWriter out = response.getWriter()) {
           
            InsertionModele insert = new InsertionModele();
             HttpSession session = request.getSession();
            InsertionDao dao = new InsertionDao();
            
            int id_organisateur = dao.findId_organisateur(billet_id);
            insert.setId_organisateur(id_organisateur);
            
            insert.setNom(nom);
            insert.setPrenom(prenom);
            insert.setEmail(email);
            insert.setBillet(billet);
            insert.setEvenement(evenement);
            insert.setPayment(payment);
            insert.setCapture(capture);
            dao.insertPersonnel(insert);
            //out.print(billet_id +" " +  billet_dispo +" "+ billet);
            dao.calculBillet(billet_id, billet_dispo - billet);
             if (billet_dispo == 0 ) {
                 out.println("pas de place disponible");
             }
            AjoutModele ajout = new AjoutModele();
            SelectDao select = new SelectDao();
            try {
                ajout = select.findEventById(billet_id);
            } catch (SQLException ex) {
                Logger.getLogger(InsertionServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            float X = dao.multiplication(id_organisateur,billet_id,billet, ajout.getPaf());
           // out.println(ajout.getPaf() );
            
           // request.getRequestDispatcher("/vente.jsp").forward(request, response);
            //response.sendRedirect("vente.jsp?id=" + billet_id);
            request.getRequestDispatcher("/facture.jsp").forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
