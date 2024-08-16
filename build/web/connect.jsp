<%-- 
    Document   : connect
    Created on : 22 juil. 2023, 19:39:31
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
/* out.print(session.getAttribute("email"));
 out.print(session.getAttribute("id_organisateur"));*/
    
%>
<!DOCTYPE html>
<html>
    <link rel="stylesheet" href="css/connect.css">
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Page Admin</title>
    </head>
    <style>
        body{
            background: 
                   linear-gradient(180deg, rgba(0, 0, 0, 0.92), rgba(54, 54, 54, 0.5) 39.24%, rgba(28, 28, 28, 0.4)), 
                   url(image/couchere4.jpg) center center / cover no-repeat;
        }
    </style>
    <body>
      


<h2 class="h2">Login Organisateur</h2>

<form action="" method="POST">
  <div class="imgcontainer">
    <img src="image/12.jpg" alt="Avatar" class="avatar">
  </div>

  <div class="container">
    <label for="uname"><b>Login  :</b></label>
    <input type="text" placeholder="Entrer login" name="login" class="inpt" required>

    <label for="psw"><b>Password  :</b></label>
    <input id="mdp" type="password" placeholder="Enter Password" name="password" class="inpt" required>
         <label for="psw"><b>Afficher password  :</b></label>
         <input id="radio" type="checkbox">
    <button type="submit">Login</button>
    <button class="btn1"><a href="formulair.jsp">Inscription</a></button>
    <button class="btn"><a href="accuiel.jsp">Retour</a></button>
    
  </div>
    <script>
         var a = document.getElementById("radio")
         var b = document.getElementById("mdp") 
          a.addEventListener("click", () =>{
         if(a.checked== true){
               b.setAttribute("type","text")
         }else{
              b.setAttribute("type", "password")
         }
        })
        
    </script>
</form>

    </body>
</html>
