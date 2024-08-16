/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.SelectDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modele.InsertionModele;

/**
 *
 * @author USER
 */
public class ChercheServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            InsertionModele insert = new InsertionModele();
            HttpSession session = request.getSession();
            insert.setNom(nom);
            insert.setId_organisateur((int) session.getAttribute("id_organisateur")); 
            SelectDao dao = new SelectDao();
            List<InsertionModele> liste = dao.findAllRecherchePerso(nom);
            for(InsertionModele listeR : liste)
            {
                out.println(listeR.getNom());
                out.println(listeR.getPrenom());
                out.println(listeR.getEmail());
                out.println(listeR.getBillet());
                out.println(listeR.getEvenement());
                out.println(listeR.getPayment());
            }
            request.getRequestDispatcher("/resultatRecherche.jsp?nom="+nom).forward(request, response);
            
        } catch (SQLException ex) {
            Logger.getLogger(ChercheServlet.class.getName()).log(Level.SEVERE, null, ex);
        }    }

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
