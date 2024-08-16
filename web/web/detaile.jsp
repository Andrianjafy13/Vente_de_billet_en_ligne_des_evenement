<%-- 
    Document   : detaile.jsp
    Created on : 10 juin 2024, 18:41:55
    Author     : USER
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="modele.AjoutModele"%>
<%@page import="dao.SelectDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
   SelectDao listDetaile = new SelectDao();
    List<AjoutModele> listeDetaile = new ArrayList<AjoutModele>();
    listeDetaile = listDetaile.findAllDetaile(Integer.valueOf(request.getParameter("id")));
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="bootstrap.min.css">
        <link href="css/bootstrap-4.4.1.css" rel="stylesheet">
	<link href="css/style.css" rel="stylesheet" type="text/css">
        <title>Voire detailes</title>
    </head>
    <style>
        *{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            
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
                width: 700px;
                background-color: blanchedalmond;
}

div.gallery:hover {
  border: 1px solid #777;
}

div.gallery img {
  width: 100%;
  height: auto;
}


div.gallery0 img {
    background: wheat;
    border: 1px solid black;
    border-radius: 50%;
    margin: 20px;
    margin-left: 140px;
    width: 100px;
    height: auto;
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
    margin-left: 150px;
}
.row{
    margin-left: 250px;
}
.card-title {
    text-align: center;
    font-size: 30px; 
    font-weight: bolder;
    font-variant: small-caps slashed-zero;
}
li {
    list-style-type: "\1F44D";
}
#btns {
  border: 0;
  line-height: 2.5;
  padding: 0 20px;
  font-size: 1rem;
  text-align: center;
  color: #fff;
  text-shadow: 1px 1px 1px #000;
  border-radius: 10px;
  background-color: rgba(220, 0, 0, 1);
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

#btns:hover {
  background-color: rgba(255, 0, 0, 1);
}

#btns:active {
  box-shadow:
    inset -2px -2px 3px rgba(255, 255, 255, 0.6),
    inset 2px 2px 3px rgba(0, 0, 0, 0.6);
}
#btns1 {
  border: 0;
  line-height: 2.5;
  padding: 0 20px;
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




    </style>
    <body>
    <div class="container-fluid">
        <div class="container"> 
                <div class="row">
                                <% for( AjoutModele ajoutM : listeDetaile) {%>

                                    <div class="gallery" >
                                        <img src="image/<% out.println(ajoutM.getImg()); %>" alt="Cinque Terre">
                                            <div class="card-body">
                                                <h5 class="card-title">  Titre  :   <% out.println(ajoutM.getTitre()); %></h5>
                                                <li>  Date et Heure  :   <% out.println(ajoutM.getDate()); %></li>
                                                <li>  Lieu  :   <% out.println(ajoutM.getLieu()); %></li>
                                                <li>  Organisateur  :   <% out.println(ajoutM.getNom_organisateur()); %></li>
                                                <li>  Email  :   <% out.println(ajoutM.getEmail_organisateur()); %></li>
                                                <li>  Paf  :   <% out.println(ajoutM.getPaf()); %>  Ariary</li>
                                                <li>  Sponsore  :   <% out.println(ajoutM.getSponsore()); %> </li>
                                                <a class="btn btn-primary" id="btns1" href="vente.jsp?id=<% out.println(ajoutM.getId()); %>">Acheter</a>
                                                <a class="btn btn-secondary" id="btns" href="accuiel.jsp">Retour</a>
                                            </div>
                                    </div>
                               <%  }  %>

                </div>
        </div>
    </div>
    </body>
</html>
