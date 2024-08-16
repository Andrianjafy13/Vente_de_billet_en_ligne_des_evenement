<%-- 
    Document   : recherche
    Created on : 2 oct. 2023, 15:00:44
    Author     : USER
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="modele.AjoutModele"%>
<%@page import="dao.SelectDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    SelectDao dao = new SelectDao();
    List<AjoutModele> listRecherche = new ArrayList<AjoutModele>();
    listRecherche = dao.findAllRecherche(request.getParameter("titre"));
    //out.println(request.getParameter("titre"));
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" href="bootstrap.min.css">
         <link href="css/bootstrap-4.4.1.css" rel="stylesheet">
	 <link href="css/recherche.css" rel="stylesheet" type="text/css">
         <title>JSP Page</title>
    </head>
    <style>
        div.gallery {
                margin: 20px;
                border: 2px solid black;
                border-radius: 10px;
                float: left;
                width: 350px;
               
}
        
    </style>
    <body>
         <h2 class="h2">LISTES DES EVENEMENT</h2>
    <div class="row">
         <% for( AjoutModele ajoutM : listRecherche) {%>
                        
                        <div class="gallery" >
                            
                            <img src="<% out.println(ajoutM.getImg()); %>" alt="Cinque Terre" width="200" height="400">
                          <div class="card-body">
                            <!--<div class="desc">-->
                                <h5 class="card-title">Titre  :   <% out.println(ajoutM.getTitre()); %></h5>
                                 <li>Date et Heure  :   <% out.println(ajoutM.getDate()); %></li>
                                 <li>Lieu  :   <% out.println(ajoutM.getLieu()); %></li>
                                <li>Paf  :   <% out.println(ajoutM.getPaf()); %>  Ariary</li>
                                  <a class="btn btn-primary" href="vente.jsp?id=<% out.println(ajoutM.getId()); %>">Acheter</a>
                                  <a class="btn btn-secondary" href="detaile.jsp?id=<% out.println(ajoutM.getId()); %>">Voire detaile</a>
                            <!--</div>-->
                            
                            </div>
                        </div>
                       <%  }  %>
    </div>
    <div>
        <center><a class="lien" href="accuiel.jsp">Anuller</a></center>
    </div>
    <p class="text-center">&nbsp;</p>
    </body>
    <script src="js/jquery-3.4.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap-4.4.1.js"></script>
</html>
