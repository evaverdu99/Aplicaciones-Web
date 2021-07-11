
<?php
require_once __DIR__.'/includes/config.php';


if(!isset($_SESSION['esAdmin']) || !$_SESSION['esAdmin'] ){
echo "No tienes permisos para acceder a esta página";
exit;
}

?>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>Añadir pelicula</title>
	</head>

	<body>
		<div id="contenedor">
			
			<?php
			
				require("includes/common/cabecera.php");
			?>

			<div id="contenido">
				
				<?php 
					
					$form = new es\ucm\fdi\aw\FormularioRegistroPelicula(); $form->gestiona();
				?>
			</div>

			


		</div>
	</body>
	<?php require("includes/common/pie.php");?>
</html>
