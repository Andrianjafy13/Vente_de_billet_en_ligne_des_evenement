<%-- 
    Document   : formulaire
    Created on : 13 juil. 2023, 15:26:09
    Author     : USER
--%>

<%@page import="dao.SelectDao"%>
<%@page import="modele.InsertionModele"%>
<%@page import="dao.InsertionDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <% 
         SelectDao insert = new SelectDao();
         List<InsertionModele> list = new ArrayList<InsertionModele>();
         list = insert.findByPersonnel(Integer.valueOf(request.getParameter("id")));
         InsertionModele perso = list.get(0);
          
  %>
<!DOCTYPE html>
<html>
    <head>
      
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="bootstrap.min.css">
        <link rel="stylesheet" href="css/modifier.css">
        <title>FORMULAIRE</title>     
    </head>
   
    <body>
            <form action="ModifierServlet" method="POST">
                <div class="imgcontainer">
                     <img src="image/12.jpg" alt="Avatar" class="avatar">
                </div>
     <div class="container">
        <div class=" row g-3">
                 <label>Id :</label>
                 <input type="text" class="nom" id="nom" name="id" value="<% out.print(perso.getId_user());%>" readonly="false">
        </div>
        <div class=" row g-3">
                 <label>Nom  :</label>
                 <input type="text" class="nom" id="nom" name="nom" value="<% out.print(perso.getNom());%>">
        </div>
        <div class=" row g-3">
                 <label>Prenom  :</label>
                 <input type="text" class="nom" id="prenom" name="prenom" value="<% out.print(perso.getPrenom());%>">
        </div>
        <div class=" row g-3">
                 <label>Email   :</label>
                 <input type="text" class="nom" id="adress" name="email" value="<% out.print(perso.getEmail());%>">
        </div>
         <div class=" row g-3">
                 <label>Nombre de billet   :</label>
                 <input type="number" class="nom" id="adress" name="billet" value="<% out.print(perso.getBillet());%>">
        </div>
        <div class=" row g-3">
                 <label>Evenement   :</label>
                 <input type="text" class="nom" id="adress" name="evenement" value="<% out.print(perso.getEvenement());%>" readonly="false">
        </div>
          <div class=" row g-3">
                 <label>Payment   :</label>
                 <input type="text" class="nom" id="adress" name="payment" value ="<%out.print(perso.getPayment());%>" readonly="false">
        </div>
        <div>
            <button class="ajouter">Enregistrer</button>
            <a class="lien" style="text-decoration: none;" href="page.jsp">Annuler</a>
                 
                 
        </div>
       </div> 
    </form>
    </body>
</html>
