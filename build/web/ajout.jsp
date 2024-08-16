<%-- 
    Document   : ajout
    Created on : 26 juil. 2023, 21:19:38
    Author     : USER
--%>

<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modele.AjoutModele"%>
<%@page import="common.AccessBdd"%>
<%
    
    if(session.getAttribute("email")==null){
    response.sendRedirect("index.jsp");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="bootstrap.min.css">
         <link rel="stylesheet" href="css/ajout.css">
        <title>Formule d'ajout événement</title>
         
    </head>
     <style>
         body {
             background: white;
         }
        .ajouter{

            margin: 60px;
            margin-left: 200px;
            border: 1px solid black;
            border-radius: 20px;
            font-size: 20px;
            text-align: center;
            box-shadow: inset -2px -2px 3px rgba(255, 255, 255, 0.6),
                        inset 2px 2px 3px rgba(0, 0, 0, 0.6);
        }
        .ajouter:hover {
            background-color: rgb(21, 182, 241);
        }
        button{

            width: 200px;
            padding-bottom: 10px;
            padding-top: 10px;
            background-color: blue;

        }
        .lien{
            margin-left: 400px; 
            border: 1px solid black;
            border-radius: 20px;
            font-size: 20px;
            text-align: center;
            text-decoration: none;
            margin: 150px;
            width: 200px;
            padding-left: 60px;
            padding-right: 60px;
            padding-bottom: 15px;
            padding-top: 15px;
            background-color: red; 
            box-shadow: inset -2px -2px 3px rgba(255, 255, 255, 0.6),
                        inset 2px 2px 3px rgba(0, 0, 0, 0.6);
        }
        .lien:hover {
            background-color: #f8de4e;
        }
        
        .h2{
            text-align: center;
            color: red;
            font-size: 30px;

        }
        #event {
            color: #f15380;
            font-size: 25px;
            font-weight: bold;
            font-family: Arial, Helvetica, sans-serif;
            font-style: italic;
        }
    </style>
    <body>
        <form action="AjoutServlet" method="POST">
    <div class="container-fluid">
    <div class="container">
            
    <nav class="navbar navbar-expand-lg navbar-light bg-light" id="nav"> 
        <a class="navbar-brand" href="#" id="event">
            Tapakila
        </a>
  	    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent1" aria-controls="navbarSupportedContent1" aria-expanded="false" aria-label="Toggle navigation"> <span class="navbar-toggler-icon"></span> </button>
  	    <div class="collapse navbar-collapse" id="navbarSupportedContent1">
  	    <ul class="navbar-nav mr-auto">
                            <li class="nav-item active"> <a class="nav-link" href="page.jsp" id="home">liste des personnel</a> </li>
			    <li class="nav-item"> <a class="nav-link" href="ajout.jsp" id="home">Ajout d'evenement</a> </li>
            </ul>   
            </div>
    </nav>
     </div>
    </div>
        
        <h2 class="h2">AJOUT D'EVENEMENT</h2>
        <div class="container">
            
            <div class="row g-3">
                    <div class="col-12">
                        <label for="titre" class="form-label">Titre :</label>
                        <input class="form-control" id="titre" type="text" placeholder="Titre d'evenement" name="titre">
                    </div>
                    <div class="col-12">
                        <label for="date" class="form-label">Date :</label>
                        <% DateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd"); %>
                        <input class="form-control" id="date" type="date" placeholder="Date" name="date" min="<%= df.format(new java.util.Date())%>">
                    </div>
                    <div class="col-12">
                        <label for="date" class="form-label">Heure :</label>
                        <input class="form-control" id="date" type="time" placeholder="Heure" name="heure">
                    </div>
                    <div class="col-12">
                        <label for="lieu" class="form-label">Lieu :</label>
                        <input class="form-control" id="lieu" type="text" placeholder="Lieu d'evenement" name="lieu">
                    </div>
                    <div class="col-12">
                        <label for="nombre" class="form-label">Nombre de place :</label>
                        <input class="form-control" id="nombre" type="number" placeholder="nombre de place" name="nombre" min="0">
                    </div>
                    <div class="col-12">
                        <label for="nombre" class="form-label">Paf :</label>
                        <input class="form-control" id="nombre" type="number" placeholder="renter" name="paf" min="200">
                    </div>
                    <div class="col-12">
                        <label for="sponsore" class="form-label">Sponsore :</label>
                        <input class="form-control" id="sponsore" type="text" placeholder="Sponsore" name="sponsore" min="200">
                    </div>
                    <div class="col-12">
                        <label for="nombre" class="form-label">Ajout image :</label>
                        <input type="file" id="img" name="img" placeholder="ajouter un image" accept="image/*">
                    </div>
            </div>
            <button type="submit" class="ajouter">Publier</button>
            <a href="page.jsp" class="lien" style="text-decoration: none;">Retour </a>
             </div>
        </form>
    </body>
</html>
