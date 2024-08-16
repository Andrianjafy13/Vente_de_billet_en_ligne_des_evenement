<%-- 
    Document   : resultatRecherche
    Created on : 25 mai 2024, 20:39:05
    Author     : USER
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="modele.AjoutModele"%>
<%@page import="dao.SelectDao"%>
<%@page import="modele.InsertionModele"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    SelectDao dao = new SelectDao();
    List<InsertionModele> listRecherches = new ArrayList<InsertionModele>();
    listRecherches = dao.findAllRecherchePerso(request.getParameter("nom"));
    //out.println(request.getParameter("titre"));
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <link rel="stylesheet" href="bootstrap.min.css">
            <script src="js/jquery-3.4.1.min.js"></script>
            <script src="js/popper.min.js"></script>
            <script src="js/bootstrap-4.4.1.js"></script>
        <title>JSP Page</title>
    </head>
    <style>
        .h2 {
            text-align: center;
            color: blue;
        }
    </style>
    <body>
         <h2 class="h2">LISTES DES PERSONNES ACHATS DE BILLET</h2>
        <section class="container col-10 mt-5"> 
            <table class="table table-sm table-bordered"> 
               <thead>
                    <tr>
                        <th>Id</th>
                        <th>Nom</th>
                        <th>Prénom</th>
                        <th>Email</th>
                        <th>Nombre de billet</th>
                        <th>Evenement</th>
                        <th>Payment</th>
                        <th colspan="2">Action</th>
                    </tr>
                </thead>
                     <tbody>
                    <% for(InsertionModele insert: listRecherches) { %>
                    <tr>
                        <td>
                            <%  out.println(insert.getId_user());     %>
                        </td>
                        <td>
                            <%  out.println(insert.getNom());     %>
                        </td>
                        <td>
                            <%  out.println(insert.getPrenom());     %>
                        </td>
                        <td>
                            <%  out.println(insert.getEmail());     %>
                        </td>
                        <td>
                            <%  out.println(insert.getBillet());     %>
                        </td>
                        <td>
                            <%  out.println(insert.getEvenement());     %>
                        </td>
                        <td>
                            <%  out.println(insert.getPayment());     %>
                        </td>
                        <td>
                            <a href="ModifiereServlet?id=<% out.println(insert.getId_user());%> " class=""> <img src="image/mod.png" width="30" height="30" ></a>
                             <a href="SuprimerServlet?id=<%  out.println(insert.getId_user());%>" class=""><img src="image/sup.png" width="30" height="30"></a>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        
                <a class="btn btn-danger" href="page.jsp">Retour</a>
        </section>
    </body>
</html>
