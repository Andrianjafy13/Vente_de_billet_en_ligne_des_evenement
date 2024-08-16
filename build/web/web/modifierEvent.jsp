<%-- 
    Document   : modifierEvent.jsp
    Created on : 14 juin 2024, 05:27:39
    Author     : USER
--%>

<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="modele.AjoutModele"%>
<%@page import="dao.SelectDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    SelectDao modifier = new SelectDao();
    List<AjoutModele> listMod = new ArrayList<AjoutModele>();
    listMod = modifier.findByModifierEvent(Integer.valueOf(request.getParameter("id")));
    AjoutModele EventMod = listMod.get(0);
%>
<!DOCTYPE html>
<html>
    <head>
      
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="bootstrap.min.css">
        <link rel="stylesheet" href="css/modifier.css">
        <title>MODIFICATION EVENEMENT</title>     
    </head>
   
    <body>
            <form action="ModifierEventModServlet" method="POST">
                <div class="imgcontainer">
                     <img src="image/12.jpg" alt="Avatar" class="avatar">
                </div>
     <div class="container">
        <div class=" row g-3">
                 <label>Id Ajout :</label>
                 <input type="text" class="nom" id="nom" name="id" value="<% out.print(EventMod.getId());%>" readonly="false">
        </div>
        <div class=" row g-3">
                 <label>Titre  :</label>
                 <input type="text" class="nom" id="nom" name="titre" value="<% out.print(EventMod.getTitre());%>">
        </div>
        <div class=" row g-3">
                 <label>Date et Heure  :</label>
                 <% DateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd"); %>
                 <input type="dateHeure" class="nom" id="prenom" name="date" value="<% out.print(EventMod.getDate());%>" min="<%= df.format(new java.util.Date())%>">
        </div>
        <div class=" row g-3">
                 <label>Lieu   :</label>
                 <input type="text" class="nom" id="adress" name="lieu" value="<% out.print(EventMod.getLieu());%>">
        </div>
         <div class=" row g-3">
                 <label>Nombre de place   :</label>
                 <input type="number" class="nom" id="adress" name="nombre" min="0" value="<% out.print(EventMod.getNombre());%>">
        </div>
        <div class=" row g-3">
                 <label>Paf   :</label>
                 <input type="number" class="nom" id="adress" name="paf" min="200" value="<% out.print(EventMod.getPaf());%>">
        </div>
          <div class=" row g-3">
                 <label>Sponsore   :</label>
                 <input type="text" class="nom" id="adress" name="sponsore" value ="<%out.print(EventMod.getSponsore());%>" >
        </div>
        <div>
            <button class="ajouter">Modifier</button>
            <a class="lien" style="text-decoration: none;" href="page.jsp">Annuler</a>
                 
                 
        </div>
       </div> 
    </form>
    </body>
</html>
