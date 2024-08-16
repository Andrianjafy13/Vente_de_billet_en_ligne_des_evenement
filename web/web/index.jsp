<%-- 
    Document   : index.jsp
    Created on : 17 juin 2024, 20:59:05
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Connexion et Inscription</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="bootstrap.min.css">
    <link href="css/bootstrap-4.4.1.css" rel="stylesheet">
</head>

<style>
    body {
        background-color: black;
    }
</style>
<body>
    <div class="wrapper">
        <div class="form-wrapper sign-in">
            <form action="ConnectServlet" method="POST">
                <h2>Login</h2>
                    <div class="input-group">
                        <input type="email" name = "email" required>
                        <label for="">Email</label>

                    </div>
                    <div class="input-group">
                        <input type="password" name="password" required>
                        <label for="">Mot de passe</label>
                        
                    </div>
                    <div class="remember">
                        <label for=""><input type="checkbox">J'accepte</label>
                    
                    </div>
                <button type="submit" style="border-radius: 30px;">Se connecter</button>
                    <div class="signUp-link">
                        <p>N'oublie pas le compte? <a href="#" class="signUpBtn-link">S'inscrire</a></p>
                    </div>
                    <div class="retour">
                        <a href="accuiel.jsp" class="btn btn-danger">Retour</a>
                    </div>

            </form>

        </div>
<!--sign-in-->
        <div class="form-wrapper sign-up">
            <form action="formulairServlet" method="POST">
                <h2>Inscription</h2>
                    
                    <div class="input-group">
                        <input type="text" name="nom" required>
                        <label for="">Nom</label>

                    </div>
                
                    <div class="input-group">
                        <input type="text" name="prenom" required>
                        <label for="">Prenom</label>

                    </div>
                
                    <div class="input-group">
                        <input type="text" name="login" required>
                        <label for="">Login</label>

                    </div>

                    <div class="input-group">
                        <input type="email" name="email" required>
                        <label for="">Email</label>

                    </div>

                    <div class="input-group">
                        <input type="password" name="password" required>
                        <label for="">Mot de passe</label>
                        
                    </div>
                    <div class="remember">
                        <label for=""><input type="checkbox"> j'accepte les conditions</label>
                    
                    </div>
                    <button type="submit" style="border-radius: 30px;">S'inscrire</button>
                    <div class="signUp-link">
                        <p>n'oublier le compte? <a href="#" class="signInBtn-link">Connexion</a></p>
                    </div>
                        

            </form>

        </div>


    </div>
    <script src="js/script.js"></script>
</body>
</html>
