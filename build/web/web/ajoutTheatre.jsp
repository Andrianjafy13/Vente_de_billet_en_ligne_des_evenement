<%-- 
    Document   : theatre.jsp
    Created on : 3 mars 2024, 06:44:15
    Author     : USER
--%>

<%@page import="java.text.DateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" href="bootstrap.min.css">
        <title>Ajout theatre</title>
    </head>
     <style>
        
        .ajouter{

            margin: 60px;
            margin-left: 350px;
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
            margin-left: 550px; 
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
    </style>
    <body>
        <form action="TheatreServlet" method="POST">
             <h2 class="h2">AJOUT D'EVENEMENT PARTICULIER</h2>
                <div class="container"> 
                    <div class="row g-3">
                            <div class="col-12">
                                <label for="date" class="form-label">Titre :</label>
                                <select class="form-select" id="country" name="titre">
                                    <option class="telma" value="Theatre">Theatre </option>
                                    <option class="airtel" value="Salon_des_exposition">Salon d'expositon</option>
                                    <option class="orange" value="Grand_Cofferance">Grand Cofferance</option>
                        
                                </select>
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
                                <label for="nombre" class="form-label">Ajout image :</label>
                                <input type="file" id="img" name="img" placeholder="ajouter un image" accept="image/*">
                            </div>
                    </div>
                    <button type="submit" class="ajouter">Enregistrer</button>
                    <a href="page.jsp" class="lien" style="text-decoration: none;">Retour </a>
                    
                </div>
        </form>
    </body>
</html>
