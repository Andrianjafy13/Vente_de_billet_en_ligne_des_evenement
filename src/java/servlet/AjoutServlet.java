/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import static com.sun.org.apache.xalan.internal.lib.ExsltDatetime.date;
import dao.InsertionDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modele.AjoutModele;

/**
 *
 * @author USER
 */
public class AjoutServlet extends HttpServlet {

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
        
        
        String  titre = request.getParameter("titre");
        String date = request.getParameter("date");
        String heure = request.getParameter("heure");
        String lieu = request.getParameter("lieu");
        int nombre = Integer.parseInt(request.getParameter("nombre"));
        int paf = Integer.valueOf(request.getParameter("paf"));
        String sponsore = request.getParameter("sponsore");
        String img = request.getParameter("img");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            /* TODO output your page here. You may use following sample code. */
            AjoutModele ajout = new AjoutModele();
            ajout.setId_organisateur((int) session.getAttribute("id_organisateur")); 
            
            //ajout.setNom("nom_organisateur");
            ajout.setTitre(titre);
            ajout.setDate(date + " " + heure);
            ajout.setLieu(lieu);
            ajout.setNombre(nombre);
            ajout.setPaf(paf);
            ajout.setSponsore(sponsore);
            ajout.setImg(img);
            InsertionDao dao = new InsertionDao();
            dao.ajoutEvenement(ajout);
         
           request.getRequestDispatcher("/ajout.jsp").forward(request, response);
                
           //request.getRequestDispatcher("/connect.jsp").forward(request, response);
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
