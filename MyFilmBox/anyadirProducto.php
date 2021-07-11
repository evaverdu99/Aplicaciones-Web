
<?php
require_once __DIR__.'/includes/config.php';

?>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<link rel="stylesheet" type="text/css" href="css/registrocss2.css"/>
		<title>Añadir Producto</title>
	</head>

	<body>
		<div id="contenedor">
			
			<?php
			
				require("includes/common/cabecera.php");
			?>

			<div id="contenido">
				
				<?php 
					
					$form = new es\ucm\fdi\aw\FormularioRegistroProducto(); $form->gestiona();
				?>
			</div>

			


		</div>
	</body>
	<?php require("includes/common/pie.php");?>
</html>
