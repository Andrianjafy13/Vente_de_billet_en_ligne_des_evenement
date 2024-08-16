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
    <style>
        body {
            background: white;
            box-shadow: 0px 0px 10px blue;
        }
        .qrCode {
            text-align: center;
            color: blue;
            font-size: 25px;
        }
       
        .h2{
            background-color: rgba(69, 231, 249, 0.789);
            width: 550px;
            margin-left: 25px;
            border-radius: 1000px 10px ;
            text-align: center;
            color: black;
            font-size: 50px;
        }
        /* Cacher le bouton initialement */
        #hiddenButton {
            display: none;
        }
    </style>
    <script>
       // Fonction pour afficher le bouton
        function showButton() {
            document.getElementById('hiddenButton').style.display = 'block';
        }

        // Vérifier les changements dans le localStorage
        window.addEventListener('storage', function(event) {
            if (event.key === 'showButton' && event.newValue === 'true') {
                showButton();
                // Optionnel : enlever l'élément du localStorage après usage
                localStorage.removeItem('showButton');
            }
        });

        // Vérifier si le bouton doit être visible au chargement de la page
        if (localStorage.getItem('showButton') === 'true') {
            showButton();
        }
        
                window.jsPDF = window.jspdf.jsPDF;

                $(function () {

                    $("#tabs").tabs();
                    $(".button").button();
                });

                function demoTwoPageDocument() {
                    var doc = new jsPDF();
                    
                    alert("Telecharger le billlet en pdf");
                   
                    var p1 = document.getElementById("p1").innerText;
                    var p2 = document.getElementById("p2").innerText;
                    var p3 = document.getElementById("p3").innerText;
                    var p4 = document.getElementById("p4").innerText;
                    var p5 = document.getElementById("p5").innerText;
                    var p6 = document.getElementById("p6").innerText;
                    var p7 = document.getElementById("p7").innerText;
                    var p8 = document.getElementById("p8").src;
                    

                    // Définir une autre couleur pour un autre texte
                    doc.setFontSize(30);
                    doc.setTextColor(0, 0, 255); // Bleu (R, G, B)
                   

                    doc.text(60, 10, "Billet d'événement");
                    
                    doc.setFontSize(16);
                    //doc.setTextColor(255, 0, 0)
                    doc.setTextColor(0, 0, 0);
                    doc.text(70, 20,p5);
                    doc.text(70, 30,p1);
                    doc.text(70, 40,p2);
                    doc.text(70, 50,p3);
                    doc.text(70, 60,p4);
                    doc.text(70, 70,p6);
                    doc.text(70, 80,p7);
                    
                    let base64Image = $('#p8').attr('src');
                    console.log(base64Image)
                    doc.addImage(base64Image, 'jpg', 70, 80, 80, 80);
                     
                    doc.addPage();
                    // Save the PDF
                    doc.save("Billet.pdf");
                    
                }
                
        </script>
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
                    <p class="p" id="p4"><ins>Nombre de billet(s) </ins> :  <%out.println(user.getBillet());%></p>
                </div>
                <div class="div">
                    <p class="p" id="p5"><ins>Evenement </ins> :   <%out.println(user.getEvenement());%></p>
                </div>
                <div class="div">
                    <p class="p" id="p6"><ins>Payment </ins> :  <%out.println(user.getPayment());%></p>
                </div>
                <div class="div">
                    <div>
                        <p class="qrCode" id="p7">Verification : </p>
                    </div>
                    <center>
                        <img id="p8" src="QRCodeServlet" alt="QR Code">
                    </center>
                </div>
                <button type="submit" id="hiddenButton" onclick="demoTwoPageDocument()">Télécharger en PDF</button>
                <button class="btn">
                    <a class="lien" href="accuiel.jsp">Retour</a>
                </button>
    </body>
   
</html>
