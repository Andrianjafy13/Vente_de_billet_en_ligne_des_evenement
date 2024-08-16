<%-- 
    Document   : affichageTheatre
    Created on : 3 mars 2024, 07:21:44
    Author     : USER
--%>

<%@page import="dao.AnnonceDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="modele.TheatreModele"%>
<%@page import="modele.AnnonceModele"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
   AnnonceDao list = new AnnonceDao();
    List<TheatreModele> listEvent1 = new ArrayList<TheatreModele>();
    listEvent1 = list.findAllEvent1();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <!-- swiper CSS -->
    <link rel="stylesheet" href="swiper-bundle.min.css">
    <link rel="stylesheet" href="css/assembler.css">
    <title>Thêatre</title>
    </head>
    <style>
        
        .lien1 {
            font-size: 25px;
            border: solid black 2px;
            border-radius: 10px;
            position: absolute;
            width: 250px;
            height: 40px;
            inline-box-align: center;
            left: 40%;
            background: red;
            text-align: center;
            display: block;
        }
        .retour1{
            display: block;
            margin-left: 50px;
        }
        #btns1 {
  border: 0;
  line-height: 2.5;
  padding: 0 10px;
  font-size: 1rem;
  text-align: center;
  color: #fff;
  text-shadow: 1px 1px 1px #000;
  border-radius: 10px;
  background-color: rgb(77, 90, 238);
  background-image: linear-gradient(
    to top left,
    rgba(0, 0, 0, 0.2),
    rgba(0, 0, 0, 0.2) 30%,
    rgba(0, 0, 0, 0)
  );
  box-shadow:
    inset 2px 2px 3px rgba(255, 255, 255, 0.6),
    inset -2px -2px 3px rgba(0, 0, 0, 0.6);
}

#btns1:hover {
  background-color: rgb(21, 182, 241);
}

#btns1:active {
  box-shadow:
    inset -2px -2px 3px rgba(255, 255, 255, 0.6),
    inset 2px 2px 3px rgba(0, 0, 0, 0.6);
}

#btn1 {
    box-shadow: 
    inset 2px 2px 3px rgba(255, 255, 255, 0.6),
    inset -2px -2px 3px rgba(0, 0, 0, 0.6);
}
        
    </style>
    <body>
    <div class="text">
        <h1 class="historique">THEATRE </h1>
       
    </div>    
   
    <div class="contenaire swiper">
       
        <div class="slide-content">
             
            <div class="cadre-image swiper-wrapper">
                <% for( TheatreModele ajoutM : listEvent1) {%>
                <div class="cadre swiper-slide">
                     
                    <div class="image">
                        <a href="#"><img src="image/<% out.println(ajoutM.getImage()); %>" alt="" srcset=""></a>  
                    </div>  
                    <div class="profil">
                        <img src="image/1.jpg" alt="" srcset="">
                        <div class="name-job">
                            <h3 class="name">Titre  :   <% out.println(ajoutM.getTitre()); %></h3>
                            <h3 class="lieu">Date et Heure  :   <% out.println(ajoutM.getDate()); %></h3>
                            <h3 class="lieu">Lieu  :   <% out.println(ajoutM.getLieu()); %></h3>
                        </div>
                    </div>
                         
                </div>
                        <%  }  %>
            </div> 
                         
        </div>
   
        <div class="swiper-button-next swiper-navBtn"></div>
        <div class="swiper-button-prev swiper-navBtn"></div>
        <div class="swiper-pagination"></div>
         
    </div>
    
    
    </div>
        
    <div class="retour1">
        <a href="accuiel.jsp" class="lien1 btn-primary" id="btn1" style="text-decoration: none;">Retour</a>
           <!-- <a href="ajoutTheatre.jsp" class="lien" style="text-decoration: none;">Ajout theatre </a>-->        
    </div>
        
    <script src="js/swiper-bundle.min.js"></script>
    <script>    
    var swiper = new Swiper(".slide-content", {
      slidesPerView: 2.3,
      spaceBetween: 30,
      slidesGQroup: 4,
      loop: true,
      centerSlide: "true",
      grabCursor: "true",
      fade: "true",
      loopFillGroupWithBlank: true,
      pagination: {
        el: ".swiper-pagination",
        clickable: true,
        dynamicBullets: true,
      },
      navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
      },
    });
    </script>
    </body>
</html>

