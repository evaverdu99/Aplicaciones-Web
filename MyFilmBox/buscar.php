<!DOCTYPE html>
<html>
<head>
		<?php include_once('includes/config.php'); ?>
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
		<link rel="stylesheet" type="text/css" href="css/buscar.css" />
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
		<meta charset="utf-8">

</head>
<body>
	<div id="contenedor">
		<?php
			include('includes/common/cabecera.php');
		?>
		
		<div id="contenido" class="main">			
			<?php
				
				es\ucm\fdi\aw\Pelicula::buscarPeliculas();
			?>		
		</div>
		
		
	</div> 

</body>
<?php include('includes/common/pie.php');?>
<script type="text/javascript" src="js/search.js"></script>
</html>
