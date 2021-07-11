<?php include_once('includes/config.php'); ?>
<!DOCTYPE html>
<html>

<head>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
	<link rel="stylesheet" type="text/css" href="css/productocss.css" />
	<meta charset="utf-8">
	<title>Producto</title>
</head>

<body>
 <?php
	include('includes/common/cabecera.php');




?>
<form class="formulario">	
	<div class ="contenedor">
		<?php
			$id = $_GET["id"];
			$c = new es\ucm\fdi\aw\Producto(null,null,null,null,null);
			$c->imprimeProducto($id);
		?>
		 
	</div>
</form>	

 </body>
 <?php	
	include('includes/common/pie.php');
	?>
 </html>
