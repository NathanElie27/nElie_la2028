/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package sio.la2028.servlet;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import sio.la2028.database.*;
import sio.la2028.form.FormEpreuve;
import sio.la2028.form.FormSite;
import sio.la2028.model.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author zakina
 */
public class ServletSite extends HttpServlet {

    Connection cnx ;

    @Override
    public void init()
    {
        ServletContext servletContext=getServletContext();

        System.out.println("SERVLKET CONTEXT=" + servletContext.getContextPath());
        cnx = (Connection)servletContext.getAttribute("connection");

        try {
            System.out.println("INIT SERVLET=" + cnx.getSchema());
        } catch (SQLException ex) {
            Logger.getLogger(ServletSport.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

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
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ServletSite</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServletSite at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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

        String url = request.getRequestURI();

        // Récup et affichage les Sports
        if(url.equals("/la2028/ServletSite/lister"))
        {
            ArrayList<Site> lesSites = DaoSite.getLesSites(cnx);
            request.setAttribute("pLesSites", lesSites);
            //System.out.println("lister eleves - nombres d'élèves récupérés" + lesEleves.size() );
            getServletContext().getRequestDispatcher("/vues/site/listerSite.jsp").forward(request, response);
        }if(url.equals("/la2028/ServletSite/consulter"))
        {
            int idSite = Integer.parseInt((String)request.getParameter("idSite"));
            Site s = DaoSite.getSiteById(cnx,idSite);
            ArrayList<Sport> sp = DaoSite.getSportsBySiteId(cnx, idSite);
            request.setAttribute("pSite", s);
            request.setAttribute("plesSports", sp);
            //System.out.println("lister eleves - nombres d'élèves récupérés" + lesEleves.size() );
            getServletContext().getRequestDispatcher("/vues/site/consulterSite.jsp").forward(request, response);
        }
        if(url.equals("/la2028/ServlerSite/ajouter"))
        {
            ArrayList<Sport> lesSports = DaoSport.getLesSports(cnx);
            request.setAttribute("pLesSports", lesSports);
            this.getServletContext().getRequestDispatcher("/vues/site/ServlerSite.jsp" ).forward( request, response );
        }
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


        FormSite form = new FormSite();

        /* Appel au traitement et à la validation de la requête, et récupération du bean en résultant */
        Site sit = form.addSite(request);

        /* Stockage du formulaire et de l'objet dans l'objet request */
        request.setAttribute( "form", form );
        request.setAttribute( "pSite", sit );

        if (form.getErreurs().isEmpty()){
            Site siteInsere =  DaoSite.addSite(cnx, sit);
            if (siteInsere != null ){

                request.setAttribute( "pSite", siteInsere );
                request.setAttribute("pLesSports", new ArrayList<Sport>());
                this.getServletContext().getRequestDispatcher("/vues/site/consulterSite.jsp" ).forward( request, response );
            }
            else
            {
                // Cas oùl'insertion en bdd a échoué
                //renvoyer vers une page d'erreur
            }

        }
        else
        {
            // il y a des erreurs. On réaffiche le formulaire avec des messages d'erreurs
            ArrayList<Sport> lesSports = DaoSport.getLesSports(cnx);
            request.setAttribute("pLesSports", lesSports);
            this.getServletContext().getRequestDispatcher("/vues/site/ajouterSite.jsp" ).forward( request, response );
        }


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
