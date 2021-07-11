
<?php 
    include_once('includes/config.php');

    if(es\ucm\fdi\aw\Usuario::buscaUsuario($_REQUEST["username"])){
        echo "mal";
    }
    else{
        echo "ok";
    }
    
?>

