<%-- 
    Document   : facture
    Created on : 3 août 2023, 15:27:21
    Author     : USER
--%>
  <%@page import="dao.SelectDao"%>
<%@page import="modele.InsertionModele"%>
<%@page import="dao.InsertionDao"%>
<%
      SelectDao list = new SelectDao();
    InsertionModele user = list.facture();
 %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" href="css/facture.css">
         <link rel="stylesheet" type="text/css" href="css/smoothness/jquery-ui-1.8.17.custom.css">
         <link rel="stylesheet" type="text/css" href="css/main.css">

         <script type="text/javascript" src="js/jquery/jquery-1.7.1.min.js"></script>
         <script type="text/javascript" src="js/jquery/jquery-ui-1.8.17.custom.min.js"></script>
         <script type="text/javascript" src="jspdf.umd.js"></script>
         <script src="js/jquery-3.4.1.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap-4.4.1.js"></script>

        
        <title>Billet des événements</title>
    </head>
    
    <body>
        <h1 class="h2">Billet d'événement</h1>
                <div class="div">
                    <p class="p" id="p1"><ins>Nom  :</ins>  <%out.println(user.getNom());%></p>
                </div>
                <div class="div">
                    <p class="p" id="p2"><ins>Prenom </ins> :  <%out.println(user.getPrenom());%></p>
                </div>
                <div class="div">
                    <p class="p" id="p3"><ins>Email </ins> :  <%out.println(user.getEmail());%></p>
                </div>
                <div class="div">
                    <p class="p" id="p4"><ins>Nombre de billet </ins> :  <%out.println(user.getBillet());%></p>
                </div>
                <div class="div">
                    <p class="p" id="p5"><ins>Evenement </ins> :   <%out.println(user.getEvenement());%></p>
                </div>
                <div class="div">
                    <p class="p" id="p6"><ins>Payment </ins> :  <%out.println(user.getPayment());%></p>
                </div>
        
        <form action="PdfServlet" method="post">
                  
                        <p>Nom :<input type="text" name="nom" value="namby" /></p>
                        <p>Prenom : <input type="text" name="prenom" value="kely" /></p>
                        <p>Email : <input type="text" name="email" value="andrianjafy...@gmail.com" /></p>
                        <p>Nombre de billet : <input type="text" name="nombreBillet" value="5" /></p>
                        <p>Evenement : <input type="text" name="evenement" value="Sport" /></p>
                        <p>Payment : <input type="text" name="payment" value="MVola" /></p>
                
                <button type="submit">Télécharger en PDF</button>

                <button class="btn">
                    <a class="lien" href="accuiel.jsp">OK</a>
                </button>

        </form>
    </body>
</html>
