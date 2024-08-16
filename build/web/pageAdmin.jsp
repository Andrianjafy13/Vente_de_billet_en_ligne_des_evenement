<%-- 
    Document   : pageAdmin
    Created on : 2 mars 2024, 02:51:38
    Author     : USER
--%>

<%@page import="modele.FestivaleModele"%>
<%@page import="dao.AnnonceDao"%>
<%@page import="modele.TotalModel"%>
<%@page import="modele.AjoutModele"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="modele.InsertionModele"%>
<%@page import="dao.SelectDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  
    AnnonceDao list = new AnnonceDao();
    List<AjoutModele> listAjout = new ArrayList<AjoutModele>();
    listAjout = list.findAllAjout();
   
    

    List<FestivaleModele> listeEvents = new ArrayList<FestivaleModele>();
    listeEvents = list.findAllEvent2();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" href="bootstrap.min.css">
          <link rel="stylesheet" href="css/page.css">
        <title>Page Admin</title>
         
    </head>
    <style>
        body {
            background: white;
        }
        .a {
            margin: 20px;
            margin-left: 45%;
            color: black;
            font-size: 25px;
            border: solid black 2px;
            width: 150px;
            height: 50px;
            display: block;
            border-radius: 10px;
            text-decoration:  none;
            text-align: center;
          
        }
        
    </style>
    <body> 
        
                <h2 class="h2">LISTES DES EVENEMENT </h2>
        <section class="container col-10 mt-5"> 
            <table class="table table-sm table-bordered"> 
               <thead>
                    <tr>
                        <th>Id_ajoutEvent</th>
                        <th>Id_organisateur</th>
                       <th>Nom_organisateur</th>
                       <th>Email_organisateur</th>
                        <th>Lieu</th>
                        <th>Titre</th>
                        <th>Date et Heure</th>
                        <th>Nombre de billet</th>
                        <th>Paf</th>
                        <th colspan="2">Action</th>
                    </tr>
                </thead>
                     <tbody>
                    <% for(AjoutModele ajout: listAjout) { %>
                    <tr>
                        <td>
                            <%  out.println(ajout.getId());     %>
                        </td>
                        <td>
                             <%  out.println(ajout.getId_organisateur());%> 
                        </td> 
                         <td>
                            <%  out.println(ajout.getNom_organisateur());     %>
                        </td>
                         <td>
                            <%  out.println(ajout.getEmail_organisateur());     %>
                        </td>
                        <td>
                            <%  out.println(ajout.getLieu());     %>
                        </td>
                        <td>
                            <%  out.println(ajout.getTitre());     %>
                        </td>
                        <td>
                            <%  out.println(ajout.getDate());     %>
                        </td>
                        <td>
                            <%  out.println(ajout.getNombre());     %>
                        </td>
                        <td>
                            <%  out.println(ajout.getPaf());     %>
                        </td>
                        
                        <td>
                           <!-- <a href="ModifiereServlet?id=<% out.println(ajout.getId());%> " class=""> <img src="image/mod.png" width="30" height="30" ></a>-->
                             <a href="SuprimereServlet?id=<%  out.println(ajout.getId());%>" class=""><img src="image/sup.png" width="30" height="30"></a>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
           
        
        </section>
                
                <h2 class="h2">LISTES DES EVENEMENT FESTIVALE </h2>
                <section class="container col-10 mt-5"> 
            <table class="table table-sm table-bordered"> 
               <thead>
                    <tr>
                         <th>Id</th>
                        <th>Titre</th>
                        <th>Date debut</th>
                        <th>Date fin</th>
                         <th>Lieu</th>
                       
                        <th colspan="2">Action</th>
                    </tr>
                </thead>
                     <tbody>
                    <% for(FestivaleModele ajout: listeEvents) { %>
                    <tr>
                         <td>
                            <%  out.println(ajout.getId());     %>
                        </td>
                        <td>
                            <%  out.println(ajout.getTitre());     %>
                        </td>
                        <td>
                             <%  out.println(ajout.getDate_debut());%> 
                        </td> 
                         <td>
                            <%  out.println(ajout.getDate_fin());     %>
                        </td>
                        <td>
                            <%  out.println(ajout.getLieu());     %>
                        </td>
                        
                        <td>
                           <!-- <a href="ModifiereServlet?id=<% out.println(ajout.getId());%> " class=""> <img src="image/mod.png" width="30" height="30" ></a>-->
                             <a href="SuprimereServlet?id=<%  out.println(ajout.getId());%>" class=""><img src="image/sup.png" width="30" height="30"></a>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
         <div> 
                
             <a href="accuiel.jsp" class="a">Voire le site</a>   
         </div>        
        
        </section>
    </body>
</html>

