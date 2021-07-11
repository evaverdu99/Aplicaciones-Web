<?php
namespace es\ucm\fdi\aw;

class Producto{
	
	public function imprimeProducto($id){
		$app = AplicacionProductos::getSingleton();
		$conn = $app->conexionBd();
	
			if ($conn->connect_error) {
				die("Fallo de conexion con la base de datos: " . $conn->connect_error);
			}
			else{
				$conn->set_charset("utf8");
				$sql = "SELECT * FROM producto WHERE id = '$id'";
				$result = $conn->query($sql)
					   or die ($conn->error. " en la línea ".(LINE-1));

				if($result->num_rows > 0){
					$fila = $result->fetch_assoc();
							echo "<h2>".$fila["nombre"]."<h2>";
				    echo '<img class = "img_producto" src="'.$fila["imagen"].'">';
				$html ='
				    <body>
				    <table>
					    <tr><td><p>Precio: </p></td><td>'.$fila["precio"]. ' € </td></tr>
					    <tr><td><p>Descripción: </p></td><td>' .$fila["descripcion"].'</td></tr>
				    </table>
				    </body>
				';
				echo $html;
				}
			}
		$conn -> close();
		if(isset($_SESSION["login"])&& $_SESSION["login"]){
			echo '<a href="pago.php?precio='.$fila["precio"].'" button class="button button1">Comprar</a>';
		}
		else{
			echo '<a href="login.php" button class="button button1">Login</a>';
		}
		
	}
	
	public static function buscaProducto($nombre)
    {
        $app = AplicacionProductos::getSingleton();
        $conn = $app->conexionBd();
       
        $query = sprintf("SELECT * FROM producto U WHERE U.nombre = '%s'", $conn->real_escape_string($nombre));
        $rs = $conn->query($query);
        $result = false;
        if ($rs) {
            if ( $rs->num_rows == 1) {
                $fila = $rs->fetch_assoc();
                $Producto = new Producto($fila['nombre'], $fila['precio'], $fila['descripcion'], $fila['categoria'], $fila['imagen']);
                $Producto->Id = $fila['Id'];
                $result = $Producto;
            }
            $rs->free();
        } else {
            echo "Error al consultar en la BD: (" . $conn->errno . ") " . utf8_encode($conn->error);
            exit();
        }
        return $result;
    }
    
    public static function crea($nombre, $precio, $descripcion, $categoria, $imagen)
    {
        $Producto = self::buscaProducto($nombre);
        if ($Producto) {
            return false;
        }
        $Producto = new Producto($nombre, $precio, $descripcion, $categoria, $imagen);
        return self::inserta($Producto);
    }
    
    private static function inserta($Producto)
    {
        $app = AplicacionProductos::getSingleton();
        $conn = $app->conexionBd();
        $query=sprintf("INSERT INTO producto(nombre, precio, descripcion, categoria, imagen) VALUES('%s', '%s', '%s', '%s','%s')"
            , $conn->real_escape_string($Producto->nombre)
            , $conn->real_escape_string($Producto->precio)
            , $conn->real_escape_string($Producto->descripcion)
            , $conn->real_escape_string($Producto->categoria)
			, $conn->real_escape_string($Producto->imagen));        
        if ( $conn->query($query) ) {
            $Producto->Id = $conn->insert_id;
        } else {
            echo "Error al insertar en la BD: (" . $conn->errno . ") " . utf8_encode($conn->error);
            exit();
        }
        return $Producto;
    }
    
  
	private $Id;
	private $nombre;
	private $precio;
	private $descripcion;
	private $categoria;
	private $imagen;

    public function __construct($nombre, $precio, $descripcion, $categoria, $imagen)
    {
        $this->nombre= $nombre;
        $this->precio = $precio;
        $this->descripcion = $descripcion;
        $this->categoria = $categoria;
		$this->imagen = $imagen;
    }
	public function Id()
    {
        return $this->Id;
    }
	public function imagen()
    {
        return $this->imagen;
    }
    public function nombre()
    {
        return $this->nombre;
    }
	public function precio()
    {
        return $this->precio;
    }
	public function descripcion()
    {
        return $this->descripcion;
    }
	public function categoria()
    {
        return $this->categoria;
    }
    
    private static function getControlButtonPages($page, $numPagsTot, $numregs, $sort,$url){

        if($page+1<$numPagsTot) {
            $nextPage = $page+1;
            $max=false;
        }
        else{
            $nextPage = $page;
            $max=true;
        }
        if($page>0){
            $prevPage=$page-1;
            $min=false;
        }
        else{
            $prevPage = $page;
            $min=true;
        }
    
        $html = '<div id="controlTable">';
        $aux = '<div id="numregs">
                <a href="'.$url.'?page=0&numregs=12">12</a>
                <a href="'.$url.'?page=0&numregs=24">24</a> 
                <a href="'.$url.'?page=0&numregs=36">36</a> 
                <a href="'.$url.'?page=0&numregs=todo">Todo</a>
                </div>';
        if(!$min && !$max){
            $html.='
                <div id="prev"><a href="'.$url.'?page='.$prevPage.'&numregs='.$numregs.'&sort='.$sort.'"><i class="fas fa-backward"></a></i></div>';
            $html.= $aux;            
            $html.='<div id="next"><a href="'.$url.'?page='.$nextPage.'&numregs='.$numregs.'&sort='.$sort.'"><i class="fas fa-forward"></a></i></div>
                ';
        }                        
        else if($min && !$max){
            $html .= $aux;
            $html.=' <div id="next"><a href="'.$url.'?page='.$nextPage.'&numregs='.$numregs.'&sort='.$sort.'"><i class="fas fa-forward"></a></i></div>';
        }
        else if(!$min && $max){
            $html.='
                <div id="prev"><a href="'.$url.'?page='.$prevPage.'&numregs='.$numregs.'&sort='.$sort.'"><i class="fas fa-backward"></a></i></div>';
            $html.= $aux;
        }
        else{
            $html.=  $aux;
    
        }
    
        $html.='</div>';
        return $html;
    
    }

	 public static function imprimeListaProductos($page, $numregs, $sort)
    {
        if($numregs =="todo") $numregs =10000;
        $app = AplicacionProductos::getSingleton();
        $conn = $app->conexionBd();
        $sql = "SELECT Id, nombre, imagen, categoria FROM producto ORDER BY ".$sort;
        $result = $conn->query($sql);
        if ($result) {
            if ( $result->num_rows > 0) {
                $html = '
                    <html>
                        <head>
                            <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
							<link rel="stylesheet" type="text/css" href="css/tienda.css" />                            <meta charset="utf-8">
                            
                        </head>
						
						<div class = "contenedor">
                        <body>
                            <?php
                                include("includes/common/cabecera.php");
                            ?>
                        <div class="contenido" class="main">
							<div class="myBtnContainer">
							  <button  class="btn" onclick="filterSelection(\'all\')"> Todos</button>
							  <button  class="btn"onclick="filterSelection(\'pelicula\')"> Peliculas</button>
							  <button  class="btn"onclick="filterSelection(\'serie\')"> Serie</button>
							  <button  class="btn" onclick="filterSelection(\'accesorio\')"> Accesorios</button>
							  <button  class="btn" onclick="filterSelection(\'merchandicing\')"> Merchandising</button> 
							  
							</div>
							
							';
                $conta =0;  //Numero de peliculas que llevas impresas
                $i = $numregs * $page;
                $j= ($i+$numregs);
                while($fila = $result->fetch_assoc()){
                   if($i<=$conta && $conta<$j){
                   $html .= '
				   <div class="column '.$fila["categoria"].'">
								<div class="content">
									<div class = "card-peli">
										<img src="'.$fila["imagen"].'"style="width:100%">
										<div class = "container-card">
											<h4> <a href="viewProducto.php?id='.$fila["Id"].'">'.$fila["nombre"].'</a> </h4>
	
										</div>
									</div>
								</div>
                            </div>';
                        $i++;
                    }
                    $conta++;            
                }

                $numPagsTot = $conta/$numregs;
                if ($conta%$numregs==0) $numPagsTot++;

                $html .= self::getControlButtonPages($page, $numPagsTot,$numregs, $sort,'tienda.php'); 

                $html.= '
                    </div>
                    </body>
                    <?php	
                        include("includes/common/pie.php");
                    ?>
					</div>
					<script type="text/javascript" src="js/catalogo.js"></script>
                    </html>';

            }
            $result->free();
        } else {
            echo "Error al consultar en la BD: (" . $conn->errno . ") " . utf8_encode($conn->error);
            exit();
        }
        echo $html;
    }
	public static function ultimosProductos(){
	$app = AplicacionProductos::getSingleton();
        $conn = $app->conexionBd();
        $sql = "SELECT Id, nombre, imagen FROM producto ORDER BY id DESC LIMIT 5";
        $result = $conn->query($sql);
        if ($result) {
            if ( $result->num_rows > 0) {
                $html = '
                    
							<h3> Últimos productos: </h3>
							
						
							<div class="row">
							
							';

                while($fila = $result->fetch_assoc()){
                   $html .= '
							

						<div class="column">
							<div class = "card-peli" >
							
									<img src="'.$fila["imagen"].'"style="width:100%">
									<div class = "container-card">
										<h4> <a href="viewProducto.php?id='.$fila["Id"].'">'.$fila["nombre"].'</a> </h4>
										
									</div>
								
								
							
							</div>
							</div>
						';         
                                
                }
               

            }
            $result->free();
        } else {
            echo "Error al consultar en la BD: (" . $conn->errno . ") " . utf8_encode($conn->error);
            exit();
        }
        echo $html;
	}


    public static function eliminaProducto($id){
        $app = AplicacionProductos::getSingleton();
        $conn = $app->conexionBd();
       
     
            $sql = "DELETE FROM producto WHERE Id = '$id'";
            
            $result = $conn->query($sql)
							   or die ($conn->error. " en la línea ".(LINE-1));
            return true;


    }

    public static function imprimeTablaProductos($page,$numregs,$sort)
    {  
        if($numregs=="todo") $numregs =10000;
        $nextPage;
        $prevPage;
        $app = AplicacionProductos::getSingleton();
        $conn = $app->conexionBd();
        $sql = "SELECT * FROM producto ORDER BY ".$sort;
        $result = $conn->query($sql);
        if ($result) {
            if ( $result->num_rows > 0) {
                $html = '
                    <html>
                        <head>
                            <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
                            <link rel="stylesheet" type="text/css" href="css/tablaPeliculas.css" />
                            <meta charset="utf-8">
                            <title>Producto</title>
                        </head>

                        <body>
                            <?php
                                include("includes/common/cabecera.php");
                            ?>
                        <div id="tablaPeliculas_panel">
                            <table> 
                                <tr> 
                                    <th>Nombre <a href="tablaProductos.php?page='.$page.'&numregs='.$numregs.'&sort=nombre"><i class="fas fa-sort" style="float:right"></i></a></th>
                                    <th>Precio <a href="tablaProductos.php?page='.$page.'&numregs='.$numregs.'&sort=precio"><i class="fas fa-sort" style="float:right"></i></a></th>
                                    <th>Descripción <a href="tablaProductos.php?page='.$page.'&numregs='.$numregs.'&sort=descripcion"><i class="fas fa-sort" style="float:right"></a></i></th>
                                    <th>Categoría <a href="tablaProductos.php?page='.$page.'&numregs='.$numregs.'&sort=categoria"><i class="fas fa-sort" style="float:right"></i></a></th>
                                    <th>Acciones</h>
                                </tr>';
                    $conta =0;  //Numero de productos que llevas impresas
                    $i = $numregs * $page;
                    $j= ($i+$numregs);
                    while($fila = $result->fetch_assoc()){
                        if($i<=$conta && $conta<$j){
                        $html .='
                            <tr>
                                <td>'.$fila["nombre"].'</td>
                                <td>'.$fila["precio"].' €</td>
                                <td>'.substr($fila["descripcion"],0,100).'....</td>
                                <td>'.$fila["categoria"].'</td>
                                <td> <a href="viewProducto.php?id='.$fila["Id"].'"><i class="fas fa-eye"></a></i>
                                <a href="eliminaProducto.php?id='.$fila["Id"].'&page='.$page.'&numregs='.$numregs.'&sort='.$sort.'"><i class="far fa-trash-alt"></a></i>
                                </td>   
                                
                            </tr>';
                            $i++;
                        }
                        $conta++;
                        
                    }
                    
                    $numPagsTot = $conta/$numregs;
                    if ($conta%$numregs==0) $numPagsTot++;

                   

                $html.= ' </table></div>';
                
                
                        
                $html .= self::getControlButtonPages($page, $numPagsTot, $numregs, $sort,'tablaProductos.php');
               
                $html.='
                    
            
                
                    <div id="contButton"> <button class="button" onclick=window.location.href="anyadirProducto.php">Añadir Producto</button> </div>
                        
                    </body>
                    <?php
                        include("includes/common/pie.php");
                    ?>
                    </html>';

            }
            $result->free();
        } else {
            echo "Error al consultar en la BD: (" . $conn->errno . ") " . utf8_encode($conn->error);
            exit();
        }
        echo $html;
    }

}

