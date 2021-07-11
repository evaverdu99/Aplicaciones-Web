
<?php
require_once __DIR__.'/includes/config.php';

if(!isset($_SESSION['login']) || !$_SESSION['login'] ){
	echo "Registrate para acceder";
	exit;

}


?>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>Pago</title>
	</head>

	<body>
		<div id="contenedor">
			
			<?php
				$precio = $_GET["precio"];
				require("includes/common/cabecera.php");
			?>

			<div id="contenido">
				
				<?php 
					echo '<p> Precio total: '.$precio.'</p>';
					$form = new es\ucm\fdi\aw\FormularioPago(); $form->gestiona();
				?>
			</div>

			<?php
				require("includes/common/pie.php");
			?>


		</div>
	</body>
</html>