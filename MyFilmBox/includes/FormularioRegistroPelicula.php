<?php
namespace es\ucm\fdi\aw;

class FormularioRegistroPelicula extends Form
{
    public function __construct() {
        parent::__construct('formRegistroPelicula');
    }
    
    protected function generaCamposFormulario($datos)
    {
       $titulo = '';
	   $anyo = '';
	   $duracion = '';
	   $reparto = '';
	   $director = '';
	   $productora = '';
	   $sinopsis = '';
	   $genero = '';
	   $calificacion='';
	   $origen='';
	
	   
        if ($datos) {
            $titulo = isset($datos['titulo']) ? $datos['titulo'] : $titulo;
            $anyo = isset($datos['anyo']) ? $datos['anyo'] : $anyo;
            $duracion = isset($datos['duracion']) ? $datos['duracion'] : $duracion;
            $reparto = isset($datos['reparto']) ? $datos['reparto'] : $reparto;
			$director = isset($datos['director']) ? $datos['director'] : $director;
            $productora = isset($datos['productora']) ? $datos['productora'] : $productora;
            $sinopsis = isset($datos['sinopsis']) ? $datos['sinopsis'] : $sinopsis;
            $genero = isset($datos['genero']) ? $datos['genero'] : $genero;
			$calificacion = isset($datos['calificacion']) ? $datos['calificacion'] : $calificacion;
            $origen = isset($datos['origen']) ? $datos['origen'] : $origen;
			
        }
    
        $html = file_get_contents("includes/ViewRegistroPelicula.php");
        return $html;
    }
    

    protected function procesaFormulario($datos)
    {
		$titulo = isset($datos['titulo']) ? $datos['titulo'] : null;
		$anyo = isset($datos['anyo']) ? $datos['anyo'] : null;
		$duracion = isset($datos['duracion']) ? $datos['duracion'] : null;
		$reparto = isset($datos['reparto']) ? $datos['reparto'] : null;
		$director = isset($datos['director']) ? $datos['director'] : null;
		$productora = isset($datos['productora']) ? $datos['productora'] : null;
		$sinopsis = isset($datos['sinopsis']) ? $datos['sinopsis'] : null;
		$genero = isset($datos['genero']) ? $datos['genero'] : null;
        $calificacion = isset($datos['calificacion']) ? $datos['calificacion'] : null;
		$origen = isset($datos['origen']) ? $datos['origen'] : null;
		
		$Pelicula = Pelicula::crea($titulo, $anyo, $duracion,$director, $origen, $calificacion, $reparto,  $productora, $genero, $sinopsis,'img/default.jpg' );
        if(!$Pelicula) echo 'No se ha podido crear la pelicula';
        return 'index.php';
    }
}