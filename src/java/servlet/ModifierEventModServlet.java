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
import modele.AjoutModele;

/**
 *
 * @author USER
 */
public class ModifierEventModServlet extends HttpServlet {

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
        int id = Integer.valueOf(request.getParameter("id"));
        String titre = request.getParameter("titre");
        String date = request.getParameter("date");
        String lieu = request.getParameter("lieu");
        int nombre = Integer.valueOf(request.getParameter("nombre"));
        int paf = Integer.valueOf(request.getParameter("paf"));
        String sponsore = request.getParameter("sponsore");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            AjoutModele modifier = new AjoutModele();
            HttpSession session = request.getSession();
            modifier.setId(id);
            modifier.setId_organisateur((int) session.getAttribute("id_organisateur"));
            modifier.setTitre(titre);
            modifier.setDate(date);
            modifier.setLieu(lieu);
            modifier.setNombre(nombre);
            modifier.setPaf(paf);
            modifier.setSponsore(sponsore);
            
            InsertionDao insertMod = new InsertionDao();
            boolean mod = false;
            try {
                mod = insertMod.ModifierEvent(modifier, id);
            }catch(Exception ex){}
            request.getRequestDispatcher("/page.jsp").forward(request, response);
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
