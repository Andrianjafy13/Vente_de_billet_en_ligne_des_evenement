<%@page import="dao.SelectDao"%>
<%@page import="modele.AjoutModele"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<%
   SelectDao list = new SelectDao();
    List<AjoutModele> listeEvent = new ArrayList<AjoutModele>();
    List<AjoutModele> listeEventPasser = new ArrayList<AjoutModele>();
    listeEvent = list.findAllEvent();
    listeEventPasser = list.findAllEventPasser();
    
    // PAGINATION DU EVENEMENT ACTUELLE
    int itemsPerPages = 3; // Number of events per page
    int currentPages = request.getParameter("pages") != null ? Integer.parseInt(request.getParameter("pages")) : 1;
    int totalItemss = listeEvent.size();
    int totalPagess = (int) Math.ceil((double) totalItemss / itemsPerPages);
    int startIndexs = (currentPages - 1) * itemsPerPages;
    int endIndexs = Math.min(startIndexs + itemsPerPages, totalItemss);
    List<AjoutModele> paginatedLists = listeEvent.subList(startIndexs, endIndexs);
    
    
    // PAGINATION DU EVENEMENT PASSER
    int itemsPerPage = 3; // Number of events per page
    int currentPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
    int totalItems = listeEventPasser.size();
    int totalPages = (int) Math.ceil((double) totalItems / itemsPerPage);

    int startIndex = (currentPage - 1) * itemsPerPage;
    int endIndex = Math.min(startIndex + itemsPerPage, totalItems);

    List<AjoutModele> paginatedList = listeEventPasser.subList(startIndex, endIndex);
    
    
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="bootstrap.min.css">
        <link href="css/bootstrap-4.4.1.css" rel="stylesheet">
         <link rel="stylesheet" href="aos.css" />
         <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
         <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
	
    <title>Accueil</title>
    <style>
        *{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            
            }
        body{
    /**/
background: 
                linear-gradient(0deg, rgba(0, 0, 0, 0.92), rgba(5, 5, 5, 0.5) 39.24%, rgba(2, 2, 2, 0.4)), 
                url(image/02.jpg) center center / cover no-repeat;
            
        }
        
       
         #conn{
            margin-left: 900px;
        }
         #conn1{
            margin-left: 100px;
        }
        div.gallery {
                margin: 20px;
                border: 2px solid white;
                border-radius: 10px;
                float: left;
                width: 350px;
                background-color: white;
}

div.gallery:hover {
  border: 1px solid #777;
}

div.gallery img {
  width: 100%;
  height: 300px;
}


div.gallery0 img {
    background: wheat;
    border: 1px solid black;
    border-radius: 50%;
    margin: 20px;
    margin-left: 150px;
    width: 100px;
    height: 100px;
}
.lien{
    color: green;
    text-decoration: none;
    text-align: center;
    margin: 20px;
    padding: 5px 14px 2px 14px;
    margin-left: 150px;
    border: 1px solid black;
    border-radius: 10px;
}
.btn{
    margin: 10px;
}
.row{
    margin-left: 165px;
}

.row0{
    margin-left: 100px;
}

.lien1 {
    text-decoration: none;
    text-align: center;
    margin: 0px;
    padding: 0px;
    margin-left: 0px;
    color: white;
    font-size: 20px;
    font-family: 'Courier New', Courier, monospace;
}
.lien2 {
    text-decoration: none;
    text-align: center;
    margin: 0px;
    padding: 0px;
    margin-left: 0px;
    color: white;
    font-size: 20px;
    font-family: 'Courier New', Courier, monospace;
}
li {
    list-style: square;
}
.lien3 {
    text-decoration: none;
    text-align: center;
    margin: 0px;
    padding: 0px;
    margin-left: 0px;
    color: white;
    font-size: 20px;
    font-family: 'Courier New', Courier, monospace;
}

.lien1:hover {
    color: yellow;
}
.lien2:hover {
    color: yellow;
}
.lien3:hover {
    color: yellow;
}
@media only screen and (min-width:920px){
    .lien1 {
        margin-left:120px;
        height: 50px;
    }
    
    .lien2 {
        margin-left:90px;
        height: 50px;
    }
    
    .lien3 {
        margin-left:70px;
        height: 50px;
    }
    
}

h1.titre{
    text-align: center;
    text-transform: uppercase;
    font-family: Arial, Helvetica, sans-serif;
    background: linear-gradient(135deg,transparent,black);
    -webkit-background-clip: text;
    color: transparent;
    animation: trans 4s linear infinite;
}
.aos-all{
    color: white;
    text-align: center;
    margin: 10px;
}

 @keyframes trans{
    0%,50%{
        background-position : 0;
    }
    100%{
        background-position : 50rem;
    }
}
.nav-link:hover{
   border-bottom: 5px solid blueviolet;   
}

#home {
    font-family:'Courier New', Courier, monospace;
    font-size: 20px;
    color: blue;
}

#navbarDropdown1 {
    font-family:'Courier New', Courier, monospace;
    font-size: 20px;
    color: blue;
}

.dropdown-item:hover{
    border-bottom: 5px solid blueviolet; 
}

 .content {
    margin: auto;
    height: 600px;
    width: 100%;
    background-image: url(image/festivale2.jpg);
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
    

    animation-name: animate;
    animation-direction: alternate-reverse;
    animation-play-state: running;
    animation-timing-function: ease-in-out;
    animation-duration: 30s;
    animation-fill-mode: forwards;
    animation-iteration-count: infinite;
}
@keyframes animate{
    0%{
        background-image: url(image/027.jpg);
    }
    20%{
        background-image: url(image/010.jpg);
    }
    40%{
        background-image: url(image/conference.jpg);
    }
    60%{
        background-image: url(image/019.jpg);
    }
    80%{
        background-image: url(image/022.jpg);
    }
    100%{
        background-image: url(image/034.jpg);
    }

}

.reservation {
    
    background: 
        linear-gradient(180deg, rgba(0, 0, 0, 0.92), rgba(54, 54, 54, 0.5) 39.24%, rgba(28, 28, 28, 0.4)), 
        url(image/019.jpg) center center / cover no-repeat;
    color: rgba(255, 255, 255, 0.6);
    padding: 50px 0;
}
.reservation .title {
    color: #FFF;
}
.title {
        margin-bottom: 1.2rem;
    }

    .title::before {
        margin-bottom: 10px;
    }
    .title {
    font-size: 1.75rem;
    line-height: 1.1;
    letter-spacing: 2px;
    color: #000;
    font-weight: bold;
    text-transform: uppercase;
    margin: 1rem 0 0 0;
}

.title span {
    font-family: 'Pinyon Script', serif;
    color: #C89446;
    font-size: 2.5rem;
    display:block;
    text-transform: none;
}

.title::before {
    content: '';
    display: inline-block;
    width: 24px;
    height: 2px;
    background: #C89446;
    margin-bottom: .5rem;
}
.title{
    text-align: center;
}
.dd{
    text-align: center;
    font-size: 35px;
    color: white;
   margin: 20px;
    
}
.content{
    border-radius: 0px 0px 20px 20px;
}
.section {
    background-image: url('image/conference1.jpg');
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
    color: rgb(255, 255, 255);
    width: 74%;
    height: 300px; 
    margin-left: 13%;
}
#event {
    color: #f15380;
    font-size: 25px;
    font-weight: bold;
    font-family: Arial, Helvetica, sans-serif;
    font-style: italic;
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



.titres {
     border-radius: 10% 10% 10% 10% / 50% 50% 50% 50% / 50% 50% 50% 20% / 50% 50% 50% 50%;
     clip-path: polygon(0% 5%, 85% 5%, 100% 50%, 85% 95%, 0% 95%, 15% 50% );
     -webkit-text-stroke: 2px #0dc52f;
}
.aos-all {
    border-bottom-color: hsl(60, 90%, 50%, .8);
}

.pagination-container {
    display: flex;
    text-justify: center;
    justify-content : center;
    margin-top: 20px;
    gap: 10px;  /*Space between buttons */
}

.pagination-btn {
    display: inline-block;
    padding: 10px 15px;
    margin: 0 5px;
    border: 1px solid #ddd;
    border-radius: 5px;
    text-decoration: none;
    color: #007bff;
    background-color: white;
    transition: background-color 0.3s, color 0.3s;
}

.pagination-btn:hover {
    background-color: #007bff;
    color: white;
}

.pagination-btn.active {
    background-color: #007bff;
    color: white;
    border-color: #007bff;
}

.pagination-prev, .pagination-next {
    font-weight: bold;
}

.pagination-btn.disabled {
    pointer-events: none;
    background-color: #f8f9fa;
    color: #6c757d;
    border-color: #ddd;
}


    </style>
</head>
<body> 
<div class="container-fluid">
    <div class="container">    
        <nav class="navbar navbar-expand-lg navbar-light bg-light"> 
            <a class="navbar-brand" href="#" id="event">
                Tapakila
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent1" aria-controls="navbarSupportedContent1" aria-expanded="false" aria-label="Toggle navigation"> <span class="navbar-toggler-icon"></span> </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent1">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active"> <a class="nav-link" href="accuiel.jsp" id="home">Accueil <span class="sr-only"></span></a> </li>
                            <li class="nav-item dropdown"> 
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" > Evenements </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown1"> 
                                        <a class="dropdown-item" href="recherche.jsp?titre=Artist" id="home">Artistes</a>
                                        <a class="dropdown-item" href="recherche.jsp?titre=c" id="home">Course</a>
                                        <a class="dropdown-item" href="recherche.jsp?titre=S" id="home">Sports</a>       
                                         
                                    </div>
                            </li>
                                <li class="nav-item"> <a class="nav-link" href="index.jsp" id="home">Connexion</a> </li>
                    </ul>
                    <form action="RechercheServlet" method="POST" class="form-inline my-2 my-lg-0">
                        <input class="form-control mr-sm-2" type="search" placeholder="Recherche" aria-label="Search" name="titre">
                        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Cherche</button>
                    </form>

                </div>
        </nav>
    <div class="content">

    </div>
    
<h1 id="aos-demo" class="aos-all" >Bienvenue dans  ce SiteWeb&nbsp</h1>
<p id="aos-demo" class="aos-all"></p>      
    </div>
         
    <br>
    <div class="row" data-aos="fade-up" data-aos-delay="250" data-aos-easing="ease-in-out" data-aos-duration="1000" id="pagination">
        <h1 style="color:white; text-align: center" class="titres">Evenement actuelles</h1>
                        <% for( AjoutModele ajoutM : paginatedLists) {%>
                        
                            <div class="gallery" >
                                <img src="image/<% out.println(ajoutM.getImg()); %>" alt="Cinque Terre">
                                    <div class="card-body">
                                        <h5 class="card-title event"><strong>Titre  :   </strong> <% out.println(ajoutM.getTitre()); %></h5>
                                        <li><strong>Date et Heure  :   </strong> <% out.println(ajoutM.getDate()); %></li>
                                        <li><strong>Lieu  :   </strong> <% out.println(ajoutM.getLieu()); %></li>
                                        <li><strong>Paf  :  </strong> <% out.println(ajoutM.getPaf()); %>  Ariary</li>
                                        <a class="btn btn-primary" id="btns1" href="vente.jsp?id=<% out.println(ajoutM.getId()); %>">Acheter</a>
                                        <a class="btn btn-secondary" id="btn1" href="detaile.jsp?id=<% out.println(ajoutM.getId());%>">voir details</a>
                                    </div>
                            </div>
                       <%  }  %>
                       
    <div id="pagination-controls" class="pagination-container">
        <% if (currentPages > 1) { %>
        <a href="?pages=<%= currentPages - 1 %>" class="pagination-btn pagination-prev">Précèdent</a>
        <% } %>
        <% for (int i = 1; i <= totalPagess; i++) { %>
            <a href="?pages=<%= i %>" class="pagination-btn"><%= i %></a>
        <% } %>
        <% if (currentPages < totalPagess) { %>
            <a href="?pages=<%= currentPages + 1 %>" class="pagination-btn pagination-next">Suivant</a>
        <% } %>
    </div>
                    
    </div> 
    <div class="row" data-aos="fade-up" data-aos-delay="250" data-aos-easing="ease-in-out" data-aos-duration="1500" style="margin-top:20px;">
        <h1 style="color:white; text-align: center;" class="titres">Evenement passée</h1>
                       <% for( AjoutModele ajoutP : paginatedList) {%>
                        
                            <div class="gallery" >
                                <img src="image/<% out.println(ajoutP.getImg()); %>" alt="Cinque Terre">
                                    <div class="card-body">
                                        <h5 class="card-title"><strong>Titre  :   </strong> <% out.println(ajoutP.getTitre()); %></h5>
                                        <li><strong>Date et Heure  :   </strong> <% out.println(ajoutP.getDate()); %></li>
                                        <li><strong>Lieu  :   </strong> <% out.println(ajoutP.getLieu()); %></li>
                                        <li><strong>Paf  :  </strong> <% out.println(ajoutP.getPaf()); %>  Ariary</li>
                                        <!-- <a class="btn btn-primary" id="btns1" href="vente.jsp?id=<%-- <% out.println(ajoutP.getId()); %> ---%>">Acheter</a> -->
                                       <!-- <a class="btn btn-secondary" id="btn1" href="detaile.jsp?id=<%-- <% out.println(ajoutP.getId());%> ---%>">voir details</a> -->
                                    </div>
                            </div>
                       <%  }  %>
    <div id="pagination-controls" class="pagination-container">
        <% if (currentPage > 1) { %>
        <a href="?page=<%= currentPage - 1 %>" class="pagination-btn pagination-prev">Précèdent</a>
        <% } %>
        <% for (int i = 1; i <= totalPages; i++) { %>
            <a href="?page=<%= i %>" class="pagination-btn"><%= i %></a>
        <% } %>
        <% if (currentPage < totalPages) { %>
            <a href="?page=<%= currentPage + 1 %>" class="pagination-btn pagination-next">Suivant</a>
        <% } %>
    </div>
    </div>
    
                       
        <section class="section">
             <div class="dd" id="dd" data-aos="fade-up" data-aos-delay="250" data-aos-easing="ease-in-out" data-aos-duration="2000"> <h1 class="titre">TYPE DES AUTRES EVENEMENTS</h1> </div>
            <div class="row0">
                <div class="gallery0" >
                    <img src="image/logo festivale.png" alt="Cinque Terre">
                    <img class="img1" src="image/logo conference.png" alt="Cinque Terre">
                    <img src="image/logoAG.png" alt="Cinque Terre">
                        <div class="card-body">
                            <a href="festivale.jsp" class="lien1">Festivales</a>
                            <a href="affichageTheatre.jsp" class="lien2">Salon et exposition</a>
                            <a href="assembler_Generale.jsp" class="lien3">Assemble General</a>
                        </div>
                </div>
            </div>
            
        </section>
                       
        <div class="container-fluid">
            <div class="container">
                <p class="text-center">&nbsp;</p>
                    <div id="accordion1" role="tablist">
                        <div class="card">
                            <div class="card-header" role="tab" id="headingOne1">
                                <h5 class="mb-0"> <a data-toggle="collapse" href="#collapseOne1" role="button" aria-expanded="true" aria-controls="collapseOne1"> Devenez Organisateur </a> </h5>
                            </div>
                            <div id="collapseOne1" class="collapse show" role="tabpanel" aria-labelledby="headingOne1" data-parent="#accordion1">
                                <div class="card-body">Créez votre compte et gérez tous vos événements.</div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header" role="tab" id="headingTwo1">
                                <h5 class="mb-0"> <a class="collapsed" data-toggle="collapse" href="#collapseTwo1" role="button" aria-expanded="false" aria-controls="collapseTwo1"> Créez vos Evénement </a> </h5>
                            </div>
                            <div id="collapseTwo1" class="collapse" role="tabpanel" aria-labelledby="headingTwo1" data-parent="#accordion1">
                                <div class="card-body">Si l'Organisateur a déja connecter, il peut créer des événement </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header" role="tab" id="headingThree1">
                                <h5 class="mb-0"> <a class="collapsed" data-toggle="collapse" href="#collapseThree1" role="button" aria-expanded="false" aria-controls="collapseThree1">L'achats des billets </a> </h5>
                            </div>
                            <div id="collapseThree1" class="collapse" role="tabpanel" aria-labelledby="headingThree1" data-parent="#accordion1">
                                <div class="card-body">Si l'utilisateur chosit des événements, apres il fait de l'achat de billet</div>
                            </div>
                        </div>
                    </div>
                <section class="reservation" id="reservation">
                    <div class="container">
                        <div class="block block-centered block-last">
                            <div class="block-body">
                                <h2 class="title"><span>Evenement</span> CONFIANCE ET FIDELITE</h2>
                               
                            </div>
                        </div>
                    </div>
                </section>
                    
            </div>   
        </div>   
 <p class="text-center">&nbsp;</p>
</body>
   <script src="js/jquery-3.4.1.min.js"></script>
   <script src="js/popper.min.js"></script>
   <script src="js/bootstrap-4.4.1.js"></script>
   <script src="js/aos.js"></script>
    <script>
     
        AOS.init();
        
    </script>
</html>