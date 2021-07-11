<?php
	session_start();
			
	if($_SESSION["login"] == true){
		echo "Bienvenido<a href='index.php'>Volver a la página principal</a>";
	}
	else{
		echo "Acceso denegado<a href='index.php'>Volver a la página principal</a>";
		
		echo "<div class=\"saludo\">Usuario desconocido<a href='login.php'>Login</a></div>";
		
	}
?>