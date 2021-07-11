
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
		<title>Resgistro</title>
	</head>

	<body>
		<div class="contenedor">
      <?php require("includes/common/cabecera.php");?>

			<div id="contenido">
				<?php
          if(isset($_REQUEST["page"]))  $page = ($_REQUEST["page"]);
          else $page = 0;

					if (es\ucm\fdi\aw\Usuario::actualizaRol($_REQUEST["id"], $_REQUEST["rol"])){
            es\ucm\fdi\aw\Usuario::imprimelistaUsuarios($page);
          }
          else{
            echo "No se pudo actualizar el usuario.";
          }



				?>
			</div>
      <?php require("includes/common/pie.php");?>
		</div>
	</body>
</html>
