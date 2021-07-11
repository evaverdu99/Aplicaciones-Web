<?php 
    require_once __DIR__.'/includes/config.php';

    if(!isset($_SESSION['esAdmin']) || !$_SESSION['esAdmin'] ){
        echo "No tienes permisos para acceder a esta página";
        exit;
    }
    require_once __DIR__.'/includes/config.php';
?>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<link rel="stylesheet" type="text/css" href="css/usersControlcss.css"/>
		<title>Control de usuarios</title>
	</head>

	<body>
		<div class="contenedor">

			<?php require("includes/common/cabecera.php");?>

			<div id="contenido">
				<?php 
				if (isset($_REQUEST["page"]))
					$page = $_REQUEST["page"];
				else
					$page=0;
				es\ucm\fdi\aw\Usuario::imprimelistaUsuarios($page);
				?>
			</div>

		</div>
	</body>
	<?php require("includes/common/pie.php");?>
</html>
