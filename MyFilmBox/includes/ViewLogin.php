<html>
    <head>
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
        <link rel="stylesheet" type="text/css" href="css/registrocss2.css" />
        <meta charset="utf-8">
        <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
	    <script type="text/javascript" src="js/validaLogin.js"></script>
        <title>Log In</title>
    </head>
    
    <body>
        <div class="container">    
		<div class="panel">
            <div class="tittleForm"><p> Iniciar sesión con tu cuenta FilmBox </p></div>
            
            <div class ="contenedor">
				<div class ="input-contenedor">	
					<i class="fas fa-user-alt icon"></i>
                    <input type="text" name="userName" id="userName_login" placeholder="Introduzca e-mail">
                    <i class="fas fa-exclamation-circle" id="lUmal"></i>
                    <i class="fas fa-check-circle" id="lUok"></i>
                   
                </div>
                      
                <div class ="input-contenedor" id="prueba">
					<i class="fas fa-key icon"></i>
                    <input type="password" name="password" id="password_login" placeholder="********">
                    <i class="fas fa-check-circle" id="lPok"></i>
                    <i class="fas fa-exclamation-circle" id="lPmal"></i>
                   
                </div>
                <small id="lerr">Usuario o contraseña incorrectos. Revisa los datos. </small>
                
              
                <input type="submit" id="buttonLogin" onclick="return valida()" value="Log In" class="button">
                
                <div class="alternative">
                    <p> ¿No tienes una cuenta? <a class="link" href="registro.php"> Regístrate</a></p>
                </div> 
            </div>      
            
        </div>
    </div>  
</body>
    
    
    
   
</html>



