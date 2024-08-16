<%-- 
    Document   : page
    Created on : 23 juil. 2023, 17:02:39
    Author     : USER
--%>

<%@page import="modele.TotalModel"%>
<%@page import="dao.SelectDao"%>
<%@page import="modele.AjoutModele"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modele.InsertionModele"%>
<%@page import="dao.InsertionDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
   /* out.print(session.getAttribute("login"));
    out.print(session.getAttribute("id_organisateur"));
     out.print(session.getAttribute("nom_organisateur"));*/
   if(session.getAttribute("email")==null){
    response.sendRedirect("index.jsp");
    }
   SelectDao list = new SelectDao();
   int id = (Integer) session.getAttribute("id_organisateur");
  // String uds = session.getAttribute("nom_organisateur");
    List<InsertionModele> listePersonnel = new ArrayList<InsertionModele>();
    listePersonnel = list.findAll(id);
     
    List<AjoutModele> listeAjout = new ArrayList<AjoutModele>();
    listeAjout = list.findAlls(id);
   
    List<TotalModel> totals = new ArrayList<TotalModel>();
    totals = list.findAllTotal(id);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <link rel="stylesheet" href="bootstrap.min.css">
            <link rel="stylesheet" href="css/page.css">
            <script src="js/jquery-3.4.1.min.js"></script>
            <script src="js/popper.min.js"></script>
            <script src="js/bootstrap-4.4.1.js"></script>
        <title>Page Admin</title>
         
    </head>
    <style>
        body {
            background: white;
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
        ul {
            margin-left: 5px;
        }
        .header  {
            background-image: url('image/conference1.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            color: rgb(255, 255, 255);
            height: 400px;
        }
        .baseline {
            padding: 50px 0 70px 0;
            text-align: center;
        }
        .baseline-welcome {
            font-family: 'Courier New', Courier, monospace;
            color: blue;
            font-size: 2rem;
            display: block;
            line-height: 1;
        }
        .baseline-name {
            font-size: 4.375rem;
            font-weight: 700;
            line-height: 1;
            letter-spacing: 5px;
        }
        .baseline-slogan {
            font-size: 1.5rem;
            font-weight: 300;
            display: block;
        }
        
        li {
            font-size: 15px;
        }
        #deco{
            margin-left: 400px;
        }  
        
        .openBtn {
            color: blue;
            border: none;
            font-size: 20px;
            cursor: pointer;
}

        .openBtn:hover {
            border-bottom: 5px solid blueviolet; 
        }

        .overlay {
            height: 20%;
            width: 600px;
            display: none;
            position: fixed;
            z-index: 1;
            margin-top: 0px;
            margin-left: 45.3%;
            background-color: rgb(0,0,0);
            background-color: rgba(0,0,0, 0.9);
        }

        .overlay-content {
            position: relative;
            top: 46%;
            width: 80%;
            text-align: center;
            margin-top: 30px;
            margin: auto;
        }

        .overlay .closebtn {
            position: absolute;
            top: 20px;
            right: 45px;
            font-size: 60px;
            cursor: pointer;
            color: white;
        }

        .overlay .closebtn:hover {
            color: #ccc;
        }

        .overlay input[type=text] {
            padding: 10px;
            font-size: 17px;
            border: none;
            border-radius: 10px;
            float: left;
            width: 300px;
        }

        .overlay input[type=text]:hover {
            background: #f1f1f1;
        }

        .overlay button {
            float: left;
            width: 100px;
            padding: 10px;
            background: #ddd;
            font-size: 17px;
            border: none;
            cursor: pointer;
            margin-left: 10px;
            border-radius: 10px;
        }

        .overlay button:hover {
            background: #ec2da6;
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
    <div class="container-fluid">
     <div class="container">
            
    <nav class="navbar navbar-expand-lg navbar-light bg-light" id="nav"> 
        <a class="navbar-brand" href="#" id="event">
            Tapakila
        </a>
  	    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent1" aria-controls="navbarSupportedContent1" aria-expanded="false" aria-label="Toggle navigation"> <span class="navbar-toggler-icon"></span> </button>
  	    <div class="collapse navbar-collapse" id="navbarSupportedContent1">
  	    <ul class="navbar-nav mr-auto">
                            <li class="nav-item active"> <a class="nav-link" href="page.jsp" id="home">liste personnels</a> </li>
			    <!--<li class="nav-item"> <a class="nav-link" href="ajout.jsp" id="home">Ajout d'evenement</a> </li>-->
                            <li class="nav-item dropdown"> 
                                  <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" > Ajout Evenement </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown1"> 
				  <a class="dropdown-item" href="ajout.jsp" id="home">Ajout Evenement public</a>
                                  <a class="dropdown-item" href="ajoutTheatre.jsp" id="home">Ajout Theatre</a>       
                                  <a class="dropdown-item" href="ajoutAssembler.jsp" id="home">Ajout Assembler</a> 
                                  <a class="dropdown-item" href="ajoutFestivale.jsp" id="home">Ajout Festivale</a>  
                            </div>
                            </li>
                            <li class="nav-item"><button class="openBtn" onclick="openSearch()">Cherche</button></li>
                            <li class="nav-item"> <a class="nav-link" id="deco"  href="DeconectServlet" id="home">Se Deconnecter</a> </li>
            </ul>   
                 
            </div>
    </nav>
         
        <div id="myOverlay" class="overlay">
            <span class="closebtn" onclick="closeSearch()" title="Close Overlay">×</span>
            <div class="overlay-content">
                <form action="ChercheServlet" method="POST">
                  <input type="text" placeholder="Search.." name="nom">
                  <button type="submit"><i class="fa fa-search">cherche</i></button>
               </form>
            </div>
        </div>
         
         <div class="header">
                <div class="baseline">
                       <span class="baseline-welcome">Vous êtes les</span>
                       <strong class="baseline-name">Organisateur</strong>
                </div>
        </div>
        
     </div>
    </div>
   
        <h2 class="h2">LISTE DES PERSONNES ACHATS DE BILLET</h2>
        <section class="container col-10 mt-5"> 
            <table class="table table-striped"> 
               <thead>
                    <tr>
                        <!--<th>Id</th>----->
                        <th scope="col">Nom</th>
                        <th scope="col">Prénom</th>
                        <th scope="col">Email</th>
                        <th scope="col">Nombre de billet(s)</th>
                        <th scope="col">Evenement</th>
                        <!--<th scope="col">Payment</th>--->
                        <th scope="col">Capture de payment</th>
                        <th colspan="2" scope="col">Action</th>
                    </tr>
                </thead>
                     <tbody>
                    <% for(InsertionModele insert: listePersonnel) { %>
                    <tr>
                      <!--  <td>
                      <%-- <%  out.println(insert.getId_user());     %>---%>
                        </td>-->
                        <td>
                            <%  out.println(insert.getNom());     %>
                        </td>
                        <td>
                            <%  out.println(insert.getPrenom());     %>
                        </td>
                        <td>
                            <%  out.println(insert.getEmail());     %>
                        </td>
                        <td>
                            <%  out.println(insert.getBillet());     %>
                        </td>
                        <td>
                            <%  out.println(insert.getEvenement());     %>
                        </td>
                        <!--<td>
                            <%--<%  out.println(insert.getPayment());     %>---%>
                        </td>-->
                        <td>
                            <img src="image/<% out.println(insert.getCapture());%>" width="150" height="70" alt="Cinque Terre">
                        </td>
                        
                        <td>
                            <button class="valide" id="actionButton" onclick="sendMessage()">validé</button>
                            <button class="noValide">non validé</button>
                            <%--<a href="ModifiereServlet?id=<% out.println(insert.getId_user());%> " class=""> <img src="image/mod.png" width="30" height="30" ></a>
                            <a href="SuprimerServlet?id=<%  out.println(insert.getId_user());%>" class=""><img src="image/sup.png" width="30" height="30"></a>---%>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </section>
                
                
                <h2 class="h2">LISTES DES EVENEMENT </h2>
        <section class="container col-10 mt-5"> 
            <table class="table table-striped"> 
               <thead>
                    <tr>
                        <!--<th>Id_ajoutEvent</th>
                        <th>Id_organisateur</th>-->
                        <th scope="col">Nom_organisateur</th>
                        <th scope="col">Email_organisateur</th>
                        <th scope="col">Lieu</th>
                        <th scope="col">Titre</th>
                        <th scope="col">Date et Heure</th>
                        <th scope="col">Nombre de billet(s)</th>
                        <th scope="col">Paf</th>
                        <th scope="col">Sponsores</th>
                        <th colspan="2" scope="col">Action</th>
                    </tr>
                </thead>
                     <tbody>
                    <% for(AjoutModele ajout: listeAjout) { %>
                    <tr>
                       <!-- <td>
                            <%-- <%  out.println(ajout.getId());     %> ---%>
                        </td>
                        <td>
                           <%--  <%  out.println(ajout.getId_organisateur());%> ---%>
                        </td> --->
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
                            <%  out.println(ajout.getSponsore());     %>
                        </td>
                        
                        <td>
                             <a href="ModifiereEventServlet?id=<% out.println(ajout.getId());%> " class=""> <img src="image/mod.png" width="30" height="30" ></a>
                             <a href="SuprimereServlet?id=<%  out.println(ajout.getId());%>" class=""><img src="image/sup.png" width="30" height="30"></a>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
         <div> 
                
            <h2 class="h2">REVENUS </h2>
            <table class="table table-striped">
                <tr>
                    <th scope="col">EVENEMENTS</th>
                    <th scope="col">TOTAL</th>
                    <th scope="col">Action</th>
                </tr>
                <tbody>
                <% for(TotalModel total : totals){%>

                    <tr>
                        <td><% out.println(total.getTitre()+ ": ");%></td>
                        <td><%out.println(total.getTotal());%>Ariary</td>
                        <td>
                            <a href="SuprimereServlet?id=<%  out.println(total.getId_total());%>" class=""><img src="image/sup.png" width="30" height="30"></a>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
         </div>        
        
        </section>
    </body>
    
    <script>
        function openSearch() {
          document.getElementById("myOverlay").style.display = "block";
        }

        function closeSearch() {
          document.getElementById("myOverlay").style.display = "none";
        }
         // Ouvrir la page2 dans un nouvel onglet ou une nouvelle fenêtre
            const page2 = window.open('facture.jsp', '_blank');
            
        function sendMessage() {
            // Stocker un signal dans le localStorage
            localStorage.setItem('showButton', 'true');
        }
    </script>
    
</html>
