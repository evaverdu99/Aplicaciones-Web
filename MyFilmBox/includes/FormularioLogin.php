<?php

namespace es\ucm\fdi\aw;
class FormularioLogin extends Form
{
    public function __construct() {
        parent::__construct('formLogin');
    }
    
    protected function generaCamposFormulario($datos)
    {
        $nombreUsuario = '';
        if ($datos) {
            $nombreUsuario = isset($datos['nombreUsuario']) ? $datos['nombreUsuario'] : $nombreUsuario;
        }
        $html = file_get_contents("includes/ViewLogin.php");
    
        return $html;
    }

     

    protected function procesaFormulario($datos)
    {
        $_SESSION['badLogin'] = false;
        $result = array();
        
        $nombreUsuario = isset($datos['userName']) ? $datos['userName'] : null;
        $password = isset($datos['password']) ? $datos['password'] : null;
        
        if (count($result) === 0) {
            $usuario = Usuario::login($nombreUsuario, $password);
            if ($usuario)  {
                $_SESSION['login'] = true;
                $_SESSION['nombre'] = $usuario->nombre();
                $_SESSION['esAdmin'] = strcmp($usuario->rol(), 'admin') == 0 ? true : false;
                $_SESSION['esCritico'] = strcmp($usuario->rol(), 'critico') == 0 ? true : false;
                $result = 'index.php';
            } 
            else{
                $_SESSION['badLogin'] = true;
            }
        }
        return $result;
    }
}