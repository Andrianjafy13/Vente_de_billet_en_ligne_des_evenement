<%-- 
    Document   : vente
    Created on : 18 juil. 2023, 14:34:19
    Author     : USER
--%>

<%@page import="dao.InsertionDao"%>
<%@page import="modele.InsertionModele"%>
<%@page import="dao.SelectDao"%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modele.AjoutModele"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <%
      SelectDao list = new SelectDao();
      AjoutModele event = list.findEventById(Integer.valueOf(request.getParameter("id")));
      
     
 %>
    <head>
        <link rel="stylesheet" href="bootstrap.min.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap-4.4.1.css" rel="stylesheet">
	<link href="css/vente.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="css/smoothness/jquery-ui-1.8.17.custom.css">
         <link rel="stylesheet" type="text/css" href="css/main.css">

         <script type="text/javascript" src="js/jquery/jquery-1.7.1.min.js"></script>
         <script type="text/javascript" src="js/jquery/jquery-ui-1.8.17.custom.min.js"></script>
         <script type="text/javascript" src="jspdf.umd.js"></script>

        <style>
            .ajouter {
                color: white;
                box-shadow: inset 2px 2px 3px rgba(255, 255, 255, 0.6),
                            inset -2px -2px 3px rgba(0, 0, 0, 0.6);
            }
            .ajouter:hover{
                background-color: rgb(21, 182, 241);
            }
            .lien {
                color: white;
                box-shadow: inset 2px 2px 3px rgba(255, 255, 255, 0.6),
                            inset -2px -2px 3px rgba(0, 0, 0, 0.6);
            }
            .lien:hover{
                background-color: rgb(247, 74, 74);
            }
        </style>
        <title>Page d'achats</title>
   
    </head>
    
    <body>
       <div class="container-fluid">
  	<div class="container">
            <form action="InsertionServlet" method="POST"> 
            <div>    
                  <h2>Nombre de place disponible(s) : <%out.println(event.getNombre());
                  if(event.getNombre()==0) {
                      out.println("Pas de place disponible");
                  }
                  %></h2>
                  <h2>Paf : <%out.println(event.getPaf());%>Ariary</h2>
            </div>
              <div class="container ">
            <div class=" row g-3">
                <input class="form-control" id="firstName" type="hidden" name="billet_id" value="<%out.print(event.getId());%>">
                <input class="form-control" id="firstName" type="hidden" name="billet_dispo" value="<%out.print(event.getNombre());%>">
                <div class="col-sm-6">
                    <label for="firstName" class="form-label">Nom  :</label>
                    <input class="form-control" id="firstNames" type="text" name="nom" required>
                </div>
                <div class="col-sm-6">
                    <label for="lasttName" class="form-label">Prenom  :</label>
                    <input class="form-control" id="lastName" type="text" name="prenom" required>
                </div>
                <div class="col-12">
                    <label for="email" class="form-label">Email :</label>
                    <input class="form-control" id="email" type="text" name="email" required>
                </div>
                 <div class="col-12">
                    <label for="email" class="form-label">Nombre de billet(s) :</label>
                    <input class="form-control" id="emails" type="number" name="billet"  max="<%out.print(event.getNombre());%>" min="0">
                </div>
                  <div class="col-12">
                    <label for="email" class="form-label">Evenement :</label>
                    <input class="form-control" id="evenement" type="text" name="evenement"  value="<%out.print(event.getTitre());%>" readonly="false">
                </div>
               
                <h4 class="mb-3">Payment </h4> 
               <select class="form-select" id="country" name="payment">
                   <option class="telma" value="MVola">MVola (Envoier à 0341234115 )</option>
                   <option class="airtel" value="AirtelMoney">AirtelMoney (Envoier à 0330366413 )</option>
                   <option class="orange" value="OrangeMoney">OrangeMoney (Envoier à 0327220979 )</option>
                        
               </select>
                <div class="col-12">
                        <label for="nombre" class="form-label">Capture de payment par mobileMoney :</label>
                        <input type="file" id="img" name="capture" placeholder="ajouter un image" accept="image/*" required>
                </div>
                <div class="col-md-5">
                    <label for="country" class="form-label">Telma :</label>
                    <select class="form-select" id="country">
                        <option>0341234115</option>
                    </select>
                </div>
                <div class="col-md-4">
                    <label for="state" class="form-label">Airtel :</label>
                    <select class="form-select" id="state">
                        <option>0330366413</option>
                    </select>
                </div>
                <div class="col-md-3">
                    <label for="zip" class="form-label">Orange :</label>
                    <select class="form-select" id="zip">
                        <option>0327220979</option>
                    </select>
                </div>
            </div>
           
                <div class="bouton">
                    <button type="submit" class="ajouter">Acheter</button>
                    <a href="accuiel.jsp" class="lien" style="color: white">Annuler</a>
                </div>
           </div>
        </div>
               
        </form>
    </body>
    <script src="js/jquery-3.4.1.min.js"></script>
   <script src="js/popper.min.js"></script>
   <script src="js/bootstrap-4.4.1.js"></script>
</html>
