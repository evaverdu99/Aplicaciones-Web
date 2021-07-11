
<?php 
    include_once('includes/config.php');

    if(es\ucm\fdi\aw\Usuario::login($_REQUEST["user"], $_REQUEST["pswd"])){
        echo "ok";
    }
    else{
        echo "mal";
    }
?>


