<!DOCTYPE html>
<html>
<?php 
include_once('includes/config.php');
include_once('includes/Pelicula.php');
include_once('includes/Comentarios.php');
 ?>
<head>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
	<link rel="stylesheet" type="text/css" href="css/peliculacss.css" />
	<meta charset="utf-8">
	<title>Peliculas</title>
</head>

<body>
 <?php
	include('includes/common/cabecera.php');
 ?>

<form class="formulario">	
	<div class ="contenedor">
		<?php
			$id = $_GET["id"];
			$c = new es\ucm\fdi\aw\Pelicula(null,null,null,null,null,null, null,null,null,null,null);
			$c->imprimePelicula($id);
		?>
	</div>
</form>	
<div class = "formulario">
		<div class = "contenedor">
		<h2> Comentarios </h2>
		 
		<?php 
			if(!isset($_SESSION["login"])){
				echo '<log><a id="ini" href = "login.php" >Inicia sesión</a> para escribir nuevos comentarios</log>';
			}
			else{
				$critico = 0;
				if(isset($_SESSION["esCritico"])&& $_SESSION["esCritico"]){
					$critico = 1;
				}
				$form = new es\ucm\fdi\aw\FormularioRegistroComentarios($id = $_GET["id"],$_SESSION['nombre'],$critico); $form->gestiona();
			}
		?>
		
		<div class="comments-container">
		<ul id="comments-list" class="comments-list">
		<?php
			$c = new es\ucm\fdi\aw\Comentarios(null,null,null,null,null,null,null);
			$comentarios = $c->imprimeComentarios($id);
			foreach ($comentarios as &$value) {
				$html = '
				<html>
				<head>
                            <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
                            <link rel="stylesheet" type="text/css" href="css/comentarioscss.css" />
                            <meta charset="utf-8">
                            <title>Comentarios</title>
                        </head>
				<body>
					<li>
						<div class="comment-main-level">
							<div class="comment-avatar"><img src="img/img_avatar.png" alt=""></div>
							<div class="comment-box">
						<div class="comment-head">
							<h6 class="comment-name"><a>'.$value->usuario().'</a></h6>
							<span>
							"'.$value->titulo().'"</span>
							<i>
							'.$value->estrellas().'★
							</i>
							<fecha>
							'.$value->fecha().'
							</fecha>
							<span>';
							if($value->is_critic() == 1){
								$html .=  '<h6 class="comment-name by-critic"> </h6>';
							}
							$html .= '</span>
							
						</div>
						<div class="comment-content">'.$value->texto().'</div>
					</div>
				</div>
				</body>
				</html>';
				echo $html;
				
			}
    
		?>
		</ul>
		</div>
		</div>
</div>

 </body>
 <?php	
	include('includes/common/pie.php');
?>
 </html>