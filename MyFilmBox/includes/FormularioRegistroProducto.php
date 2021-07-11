<?php
namespace es\ucm\fdi\aw;

class FormularioRegistroProducto extends Form
{
    public function __construct() {
        parent::__construct('formRegistroProducto');
    }
    
    protected function generaCamposFormulario($datos)
    {
       $nombre = '';
	   $precio = '';
	   $descripcion = '';
	   $categoria = '';	
	   
        if ($datos) {
            $nombre = isset($datos['nombre']) ? $datos['nombre'] : $nombre;
            $precio = isset($datos['precio']) ? $datos['precio'] : $precio;
            $descripcion = isset($datos['descripcion']) ? $datos['descripcion'] : $descripcion;
            $categoria = isset($datos['categoria']) ? $datos['categoria'] : $categoria;			
        }
    
        $html = file_get_contents("includes/ViewRegistroProducto.php");
        return $html;
    }
    

    protected function procesaFormulario($datos)
    {
		$nombre = isset($datos['nombre']) ? $datos['nombre'] : null;
		$precio = isset($datos['precio']) ? $datos['precio'] : null;
		$descripcion = isset($datos['descripcion']) ? $datos['descripcion'] : null;
		$categoria = isset($datos['categoria']) ? $datos['categoria'] : null;
	
		
		$Producto = Producto::crea($nombre, $precio, $descripcion ,$categoria, 'img/defaultProducto.jpg' );
        if(!$Producto) echo 'No se ha podido crear el producto';
        return 'index.php';
    }
}