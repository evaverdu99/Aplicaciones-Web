<?php

namespace es\ucm\fdi\aw;
class FormularioPago extends Form
{
    public function __construct() {
        parent::__construct('formPago');
    }
    
    protected function generaCamposFormulario($datos)
    {
        $nombreTitular = '';
        if ($datos) {
            $nombreTitular = isset($datos['nombreTitular']) ? $datos['nombreTitular'] : $nombreTitular;
        }

        $html = file_get_contents("includes/ViewPago.php");
        return $html;
    }

     

    protected function procesaFormulario($datos)
    {
        $result = array();        
        $nombreTitular = isset($datos['nombreTitular']) ? $datos['nombreTitular'] : null;
        $numero = isset($datos['numero']) ? $datos['numero'] : null;
		$app = isset($datos['app']) ? $datos['app'] : null;
		$cvv = isset($datos['cvv']) ? $datos['cvv'] : null;       
        
        $result = 'index.php';
            	
		
        return $result;
    }
}