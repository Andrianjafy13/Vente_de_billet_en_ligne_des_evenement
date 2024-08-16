<%-- 
    Document   : formulair
    Created on : 6 sept. 2023, 13:40:07
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="bootstrap.min.css">
        <link rel="stylesheet" href="css/formulaire.css">
        <title>JSP Page</title>
    </head>
   <style>
        body {
              background: 
            linear-gradient(180deg, rgba(0, 0, 0, 0.92), rgba(54, 54, 54, 0.5) 39.24%, rgba(28, 28, 28, 0.4)), 
            url(image/couchere4.jpg) center center / cover no-repeat;
            height: 100%;
        }
    </style>
    <body> 
       
        <form action="" method="post">
        
                <div class="imgcontainer">
                     <img src="image/12.jpg" alt="Avatar" class="avatar">
                </div>
                <div class="container">

                   <div class=" row g-3">
                            <label class="form-label"><b>Nom  :</b></label>
                            <input type="text" class="nom" id="nom" name="nom" placeholder="Enter Nom" required>
                   </div>
                   <div class=" row g-3">
                            <label class="form-label"><b>Prenom  :</b></label>
                            <input type="text" class="prenom" id="prenom" name="prenom" placeholder="Enter Prenom" required>
                   </div>
                     <div class="row g-3">
                        <label for="uname" class="form-label"><b>Login  :</b></label>
                        <input class="form-control" type="text" placeholder="login" name="login" required>
                    </div>
                     <div class="row g-3">
                        <label for="psw" class="form-label"><b>Password  :</b></label>
                        <input class="form-control" id="mdp" type="password" placeholder="Enter Password" name="password" required>
                    </div>
                    
                   <div class=" row g-3">
                            <label class="form-label"><b>Email   :</b></label>
                            <input type="text" class="adress" id="adress" name="email" placeholder="Enter Email" required>
                   </div>
                   
                    
                   
                    <div class="btn">
                         <button type="submit">inscrit</button>
                         <button class="a"><a href="connect.jsp">Retour</a></button>
                    </div>
             </div>
        </form>
   </body>
</html>
