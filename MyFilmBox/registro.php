
<!DOCTYPE html>
<?php 
    if(!isset($_SESSION)) 
        { 
            session_start(); 
        } 
    require_once __DIR__.'/includes/config.php';
?>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>Resgistro</title>
	</head>

	<body>
		<div id="contenedor">

			<?php require("includes/common/cabecera.php");?>

			<div id="contenido">
				<?php 
					$form = new es\ucm\fdi\aw\FormularioRegistro(); 
                    $form->gestiona();
				?>
			</div>

			<?php require("includes/common/pie.php");?>
		</div>
	</body>
</html>