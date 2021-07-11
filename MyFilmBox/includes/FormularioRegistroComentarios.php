<?php
namespace es\ucm\fdi\aw;

class FormularioRegistroComentarios extends Form
{
	private $num = 0;
	private $usu;
	private $crit;
    public function __construct($_id, $_usu, $_crit) {
		$head = "MostrarPelicula.php?id=".$_id;
		$opcionesPorDefecto = array( 'action' => $head );
        parent::__construct('formRegistroComentarios', $opcionesPorDefecto);
		$this->num = $_id;
		$this->usu = $_usu;
		$this->crit = $_crit;
    }
    
    protected function generaCamposFormulario($datos)
    {
       $titulo = '';
	   $usuario = '';
	   $comentario = '';
	   $estrellas = '';
	   
        if ($datos) {
            $titulo = isset($datos['titulo']) ? $datos['titulo'] : $titulo;
            $usuario = isset($datos['usuario']) ? $datos['usuario'] : $usuario;
			$comentario = isset($datos['comentario']) ? $datos['comentario'] : $comentario;
			$estrellas=isset($datos['estrellas']) ? $datos['estrellas'] : $estrellas;
        }
    
        $html = file_get_contents("includes/ViewRegistroComentarios.php");
        return $html;
    }
   

    protected function procesaFormulario($datos)
    {
		$titulo = isset($datos['titulo']) ? $datos['titulo'] : null;
		$usuario = isset($datos['usuario']) ? $datos['usuario'] : null;
		$comentario = isset($datos['comentario']) ? $datos['comentario'] : null;
		$estrellas = isset($datos['estrellas']) ? $datos['estrellas'] : null;
        if($this->num != 0){
			$Comentarios = Comentarios::crea($titulo, $this->usu, $comentario, $this->num, $estrellas, $this->crit);
			if(!$Comentarios) echo 'No se ha podido crear el comentario';
			return "MostrarPelicula.php?id=".$this->num;
		}
		else{
			return 'catalogo.php';
		}
        
    }
}