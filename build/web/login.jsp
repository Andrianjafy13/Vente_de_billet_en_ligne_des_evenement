<%-- 
    Document   : login
    Created on : 25 mars 2024, 18:40:32
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="login1.css">
    <script src="login1.js"></script>
    <title>Document</title>
</head>
<style>
    .retour {
        width: 150px;
        height: 30px;
        border-radius: 10px;
        background: red;
        color: white;
        margin: 10px;
        margin-left: 100px;
        text-align: center
        
    }
    .retour a {
        color: white;
        font-size: 25px;
        margin: 40px;
    }
    
</style>
<body>
    <div class="container">
        <div class="curved-shape"></div>
        <div class="curved-shape2"></div>
        <!-- LOGIN -->
        <div class="form-box Login">
            <h2 class="animation" style="--D:0; --S:21;">Login</h2>
            
            <form action="ConnectServlet" method="POST">
                <div class="input-box animation" style="--D:1; --S:22;">
                    <input type="text" name="email">
                    <label for="">Email</label>
                </div>
                <div class="input-box animation" style="--D:2; --S:23;"> 
                    <input type="password" name="password">
                    <label for="">Mot de Pass</label>
                </div>
                <div class="input-box animation" style="--D:3; --S:24;">
                    <button class="btn" type="submit">login</button>
                </div>
                <div class="regi-link animation" style="--D:4; --S:25;">
                    <p>Don't have an accout ?<a href="#" class="SignUpLink">Inscription</a></p>
                    <div class="retour">
                        <a href="accuiel.jsp" class="retour">Retour</a>
                    </div>
                    
                </div>
            </form>
        </div>
        <div class="info-content Login">
            <h2 class="animation" style="--D:0">Bienvenue !</h2>
            <p class="animation" style="--D:1">Lorem ipsum dolor sit amet consectetur adipisicing elit. Deserunt, dignissimos.</p>
        </div>

        <!-- SIGN UP -->
        <div class="form-box Register">
            <h2 class="animation" style="--li:17; --S:0;">Register</h2>
            
            <form action="formulairServlet" method="POST">
                <div class="input-box animation" style="--li:18; --S:1;">
                    <input type="text" name="nom">
                    <label for="">Nom</label>
                </div>
                <div class="input-box animation" style="--li:19; --S:2;">
                    <input type="text" name="prenom">
                    <label for="password">Prenom</label>
                </div>
                 <div class="input-box animation" style="--li:19; --S:2;">
                    <input type="text" name="login">
                    <label for="password">Login</label>
                </div>
                 <div class="input-box animation" style="--li:19; --S:2;">
                    <input type="text" name="email">
                    <label for="password">Email</label>
                </div>
                <div class="input-box animation" style="--li:19; --S:3;">
                    <input type="password" name="password">
                    <label for="password">Mot de Pass</label>
                </div>
                <div class="input-box animation" style="--li:20; --S:4;">
                    <button class="btn" type="submit">Register</button>
                </div>
                <div class="regi-link animation" style="--li:21; --S:5;">
                    <p>Don't have an accout ?<a href="#" class="SignInLink">Login</a></p>
                </div>
            </form>
        </div>
        <div class="info-content Register">
            <h2 class="animation" style="--li:17; --S:0;">Bienvenue inscrit !</h2>
            <p class="animation" style="--li:18; --S:1;">Lorem ipsum dolor sit amet consectetur adipisicing elit. Deserunt, dignissimos.</p>
        </div>
    </div>
    <script>
        const container = document.querySelector('.container');
        const LoginLink = document.querySelector('.SignInLink');
        const RegisterLink = document.querySelector('.SignUpLink');

        RegisterLink.addEventListener('click',()=>{
            container.classList.add('active');
        })

        LoginLink.addEventListener('click',()=>{
            container.classList.remove('active');
        })
    </script>
</body>
</html>
