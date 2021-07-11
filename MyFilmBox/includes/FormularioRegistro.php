<?php
namespace es\ucm\fdi\aw;

class FormularioRegistro extends Form
{
    public function __construct() {
        parent::__construct('formRegistro');
    }
    
    protected function generaCamposFormulario($datos)
    {
        $nombreUsuario = '';
        $nombre = '';
        if ($datos) {
            $nombreUsuario = isset($datos['nombreUsuario']) ? $datos['nombreUsuario'] : $nombreUsuario;
            $nombre = isset($datos['nombre']) ? $datos['nombre'] : $nombre;
            $password = isset($datos['password']) ? $datos['password'] : null;
            $password2 = isset($datos['password2']) ? $datos['password2'] : null;
        }
        
        
            $html = file_get_contents("includes/ViewRegister.php");  
        
        return $html;
    }
    

    protected function procesaFormulario($datos)
    {
        
        $nombreUsuario = isset($datos['nombreUsuario']) ? $datos['nombreUsuario'] : null;
        
        //correo electronico
        

        $nombre = isset($datos['nombre']) ? $datos['nombre'] : null;
        $password = isset($datos['password']) ? $datos['password'] : null;
       
        $password2 = isset($datos['password2']) ? $datos['password2'] : null;
           
            $user = Usuario::crea($nombreUsuario, $nombre, $password, 'user');
            if ($user) {
                $_SESSION['login'] = true;
                $_SESSION['nombre'] = $nombre;
                $result = 'index.php';
            } 
            else{
                $_SESSION['userExist'] = true;
                $result ='registro.php';
            }
        return $result;
        
    }
}