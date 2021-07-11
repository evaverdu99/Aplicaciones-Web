<?php
namespace es\ucm\fdi\aw;
setlocale(LC_TIME,"es_ES");

class Comentarios{
	
	private $titulo;
	private $usuario;
	private $texto;
	private $fecha;
	private $id_pelicula;
	private $estrellas;
	private $media;
	private $ic_critic;
	
	public function __construct($_titulo, $_usuario, $_fecha, $_texto, $id_pelicula, $estrellas, $is_critic){
		$this->titulo = $_titulo;
		$this->usuario = $_usuario;
		$this->fecha = $_fecha;
		$this->texto = $_texto;
		$this->id_pelicula = $id_pelicula;
		$this->estrellas = $estrellas;
		$this->is_critic = $is_critic;
	}
	
	public function imprimeComentarios($id){
		$app = AplicacionPeliculas::getSingleton();
		$conn = $app->conexionBd();
		$sql = "SELECT * FROM comentarios WHERE id_pelicula = '$id'";
		$result = $conn->query($sql)
			   or die ($conn->error. " en la línea ".(__LINE__-1));
		$comentarios = array();
		if($result->num_rows > 0){
			$i = 0;
			while($fila = $result->fetch_assoc()){
				$comentarios[$i] = new Comentarios($fila["titulo"],$fila["usuario"],$fila["Fecha"],$fila["texto"], $fila["id_pelicula"], $fila["valoracion"], $fila["is_critic"]);
				$i = $i+1;
			}
		}
		return $comentarios;	
	}
	public function imprimeMedia($id){
		$app = AplicacionPeliculas::getSingleton();
		$conn = $app->conexionBd();
		$sql = "SELECT valoracion FROM comentarios WHERE id_pelicula = '$id'";
		$result = $conn->query($sql)
			   or die ($conn->error. " en la línea ".(__LINE__-1));
		$comentarios = array();
		if($result->num_rows > 0){
			$this->media = 0;
			while($fila = $result->fetch_assoc()){
				$this->media = $this->media + $fila["valoracion"];
			}
			return $this->media / $result->num_rows;
		}
		else{
			return 'No hay valoraciones';
		}
		
	}
	public static function crea($titulo, $usuario, $texto, $id, $estrellas, $is_critic)
    {
        $Comentarios = new Comentarios($titulo, $usuario, null, $texto, $id, $estrellas, $is_critic);
        return self::inserta($Comentarios);
    }
	
	 private static function inserta($Comentarios)
    {
        $app = AplicacionPeliculas::getSingleton();
        $conn = $app->conexionBd();
        $query=sprintf("INSERT INTO comentarios(usuario, titulo, texto, id_pelicula, valoracion, is_critic) VALUES('%s', '%s', '%s','%s', '%s', '%s')"
            , $conn->real_escape_string($Comentarios->usuario)
            , $conn->real_escape_string($Comentarios->titulo)
            , $conn->real_escape_string($Comentarios->texto)
			, $conn->real_escape_string($Comentarios->id_pelicula)
			, $conn->real_escape_string($Comentarios->estrellas)
			, $conn->real_escape_string($Comentarios->is_critic));        
        if ( $conn->query($query) ) {
            $Comentario->id = $conn->insert_id;
        } else {
            echo "Error al insertar en la BD: (" . $conn->errno . ") " . utf8_encode($conn->error);
            exit();
        }
        return $Comentarios;
    }
	
	public function titulo(){
		return $this->titulo;
	}
	
	public function usuario(){
		return $this->usuario;
	}
	
	public function id_pelicula(){
		return $this->id_pelicula;
	}
	
	public function fecha(){
		return $this->fecha;
	}
	
	public function texto(){
		return $this->texto;
	}
	
	public function estrellas(){
		return $this->estrellas;
	}
	
	public function is_critic(){
		return $this->is_critic;
	}
	
	
	
}