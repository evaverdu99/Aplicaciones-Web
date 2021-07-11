<?php

require_once __DIR__.'/includes/config.php';

if(!isset($_SESSION)) 
    { 
        session_start(); 
    } 


//Doble seguridad: unset + destroy
unset($_SESSION["login"]);
unset($_SESSION["esAdmin"]);
unset($_SESSION["nombre"]);
unset($_SESSION["nick"]);
unset($_SESSION["badLogin"]);
session_destroy();
require("index.php");
?>