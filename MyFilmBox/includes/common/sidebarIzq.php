
<html>
<link rel="stylesheet" type="text/css" href="css/sbIzcss.css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">

<div id="sidebar-left">
		<h3> Las últimas opiniones de nuestros usuarios: </h3>
		<div class="ult_comentarios">
			
			<?php
			$conn = new mysqli(BD_HOST, BD_USER, BD_PASS, BD_NAME_PELI);
			if ($conn->connect_error) {
			   die("Fallo de conexion con la base de datos: " . $conn->connect_error);
			}
			else{
				
				$conn->set_charset("utf8");
				$sql = "SELECT id_post, usuario, titulo, Fecha, texto, id_pelicula FROM comentarios ORDER BY id_post DESC LIMIT 7";
				$result = $conn->query($sql)
					   or die ($conn->error. " en la línea ".(LINE-1));

				if($result->num_rows > 0){
					while($fila = $result->fetch_assoc()){	
							$sql0 = "SELECT id, nombre, imagen FROM pelicula WHERE id = ".$fila["id_pelicula"];
							$resultado = $conn->query($sql0)
										or die ($conn->error. " en la línea ".(LINE-1));
							echo '<div class="comentario">';
								echo '<p class="user_">'.$fila["usuario"].' - '.$resultado->fetch_assoc()["nombre"].'</p>';
								echo '<br>';
								echo '<p class="text_c">'.$fila["texto"].'</p>';
							echo '</div>';
					}
				}
			}
			$conn -> close(); 
			
			?>
		</div>
</div>

</html>
