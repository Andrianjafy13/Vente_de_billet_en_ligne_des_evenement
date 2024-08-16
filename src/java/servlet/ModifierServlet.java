/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.InsertionDao;
import java.io.IOException;
import java.io.PrintWriter;
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
public class ModifierServlet extends HttpServlet {

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
         
          
        
        try (PrintWriter out = response.getWriter()) { 
            int id = Integer.valueOf(request.getParameter("id"));
            String nom = request.getParameter("nom");            
            String prenom = request.getParameter("prenom");
            String email = request.getParameter("email");
            int billet = Integer.valueOf(request.getParameter("billet"));
            String evenement = request.getParameter("evenement");
            String payment = request.getParameter("payment");
             InsertionModele perso = new InsertionModele();
             HttpSession session = request.getSession();
             perso.setId_user(id);
             perso.setId_organisateur((int) session.getAttribute("id_organisateur"));
             perso.setNom(nom);
             perso.setPrenom(prenom);
             perso.setEmail(email);
             perso.setBillet(billet);
             perso.setEvenement(evenement);
             perso.setPayment(payment);
            InsertionDao dao = new InsertionDao();
            boolean val = false;
            try{
                val = dao.Modifier(perso,id); 
                
                
                  
            }catch(Exception h){ }           
               request.getRequestDispatcher("/page.jsp").forward(request, response);
             
                
                session.invalidate();
                request.getRequestDispatcher("/connect.jsp").forward(request, response);
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
