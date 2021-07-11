<?php
namespace es\ucm\fdi\aw;

class Usuario
{

    private function getButton($rol,$id,$page){
        $html ='<div class="data3">';
        $html .='<div><h4 class="header_button"> Cambiar rol</h4>';
        $botonUser = '<a href="actualizarRol.php?id='.$id.'&rol=user&page='.$page.'">
                        <input type="submit" value="Usuario" class="button_users"></a>';

        $botonCritico = '<a href="actualizarRol.php?id='.$id.'&rol=critico&page='.$page.'">
                      <input type="submit" value="Crítico" class="button_users"></a>';

        $botonAdmin= '<a href="actualizarRol.php?id='.$id.'&rol=admin&page='.$page.'">
                      <input type="submit" value="Admin" class="button_users"></a>';


        switch($rol){

            case "user":
                $html.= $botonCritico;
                $html.= $botonAdmin;
                break;

            case "admin":
                $html.= $botonCritico;
                $html.= $botonUser;
                break;

            case "critico":
                $html.= $botonAdmin;
                $html.= $botonUser;
                break;
        }
        $html .='</div></div>';
        return $html;
    }
    private static function getButtonPages($numPagsTot, $page){
        $i=0; 
        $html='<div id="buttons">';
        for ($i=0; $i<$numPagsTot; $i++){
            $j =$i+1;
            if($page == $i){
                $html .= "<a href='#'><button class='currentbuttonpage'>$j</button></a>";
            }else{
                $html .= "<a href='usersControl.php?page=$i'><button class='buttonpage'>$j</button></a>";
            }
        }
        $html.='</div>';
        return $html;

    }

    public static function imprimelistaUsuarios($page)
    {
        $numregs =7;
        $app = Aplicacion::getSingleton();
        $conn = $app->conexionBd();
        $sql = "SELECT * FROM Usuarios U";
        $result = $conn->query($sql);
        if ($result) {
            if ( $result->num_rows > 0) {
                $html = '
                    <html>
                        <head>
                            <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
                            <link rel="stylesheet" type="text/css" href="css/usersControlcss.css" />
                            <meta charset="utf-8">
                            <title>Producto</title>
                        </head>

                        <body>
                            <?php
                                include("includes/common/cabecera.php");
                            ?>
                        <div class="usersControl_panel">';

                    $conta =0;  //Numero de peliculas que llevas impresas
                    $i = $numregs * $page;
                    $j= ($i+$numregs);
                while($fila = $result->fetch_assoc()){
                   if ($i<=$conta && $conta<$j){
                   $html .= '<div class="card_user">

                                <div class="container_user_img">
                                 <img src="img/img_avatar.png" alt="Avatar">
                                </div>
                                <div class="container_user">
                                    <div class="data">
                                        <h4 class="header_user"><b>'.$fila["nombreUsuario"].'</b></h4>
                                    </div>
                                    <div class="data2">
                                        <p>'.$fila["nombre"].'</p>
                                        <p>Rol: '.$fila["rol"].'</p>
                                    </div>
                                ';
                                $html .= self::getButton($fila["rol"], $fila["id"], $page);
                                $html .='<div class="data4"><a href="eliminaUsuario.php?id='.$fila["id"].'"><i class="far fa-trash-alt"></i></a></div>
                                </div>
                            </div>';
                            $i++;
                        }
                        $conta++;
                    }
                    
                    $numPagsTot = $conta/$numregs;
                    
                    $html.= self::getButtonPages($numPagsTot,$page);
                    $html.= '</div>';

                $html.=' </body>
                    <?php
                        include("includes/common/pie.php");
                    ?>
                    </html>';

            }
            $result->free();
        } else {
            echo "Error al consultar en la BD: (" . $conn->errno . ") " . utf8_encode($conn->error);
            exit();
        }
        echo $html;
    }


    public static function actualizaRol($id, $rol)
    {
        $app = Aplicacion::getSingleton();
        $conn = $app->conexionBd();
        $query='UPDATE Usuarios U SET rol="'.$rol.'" WHERE U.id='.$id;

        if ( $conn->query($query) ) {
            if ( $conn->affected_rows != 1) {
                echo "Algo fue mal... No se ha podido camiar el Rol. :( ";
                exit();
            }
        } else {
            echo "Error al insertar en la BD: (" . $conn->errno . ") " . utf8_encode($conn->error);
            exit();
        }

        return true;
    }


    public static function login($nombreUsuario, $password)
    {
        $user = self::buscaUsuario($nombreUsuario);
        if ($user && $user->compruebaPassword($password)) {
            return $user;
        }
        return false;
    }

    public static function buscaUsuario($nombreUsuario)
    {
        $app = Aplicacion::getSingleton();
        $conn = $app->conexionBd();
        $query = sprintf("SELECT * FROM Usuarios U WHERE U.nombreUsuario = '%s'", $conn->real_escape_string($nombreUsuario));
        $rs = $conn->query($query);
        $result = false;
        if ($rs) {
            if ( $rs->num_rows == 1) {
                $fila = $rs->fetch_assoc();
                $user = new Usuario($fila['nombreUsuario'], $fila['nombre'], $fila['password'], $fila['rol']);
                $user->id = $fila['id'];
                $result = $user;
            }
            $rs->free();
        } else {
            echo "Error al consultar en la BD: (" . $conn->errno . ") " . utf8_encode($conn->error);
            exit();
        }
        return $result;
    }

    public static function crea($nombreUsuario, $nombre, $password, $rol)
    {
        $user = self::buscaUsuario($nombreUsuario);
        if ($user) {
            return false;
        }
        $user = new Usuario( $nombreUsuario, $nombre, self::hashPassword($password), $rol);
        return self::guarda($user);
    }

    private static function hashPassword($password)
    {
        return password_hash($password, PASSWORD_DEFAULT);
    }

    public static function guarda($usuario)
    {
        if ($usuario->id == null) {
            return self::inserta($usuario);
        }
           
    }

    public static function eliminaUsuario($id){
        $app = Aplicacion::getSingleton();
        $conn = $app->conexionBd();
       
     
        $sql = "DELETE FROM Usuarios WHERE id = '$id'";
            
        $result = $conn->query($sql)
							   or die ($conn->error. " en la línea ".(LINE-1));
        return true;


    }

    private static function inserta($usuario)
    {
        $app = Aplicacion::getSingleton();
        $conn = $app->conexionBd();
        $query=sprintf("INSERT INTO Usuarios(nombreUsuario, nombre, password, rol) VALUES('%s', '%s', '%s', '%s')"
            , $conn->real_escape_string($usuario->nombreUsuario)
            , $conn->real_escape_string($usuario->nombre)
            , $conn->real_escape_string($usuario->password)
            , $conn->real_escape_string($usuario->rol));
        if ( $conn->query($query) ) {
            $usuario->id = $conn->insert_id;
        } else {
            echo "Error al insertar en la BD: (" . $conn->errno . ") " . utf8_encode($conn->error);
            exit();
        }
        return $usuario;
    }

    private static function actualiza($usuario)
    {
        $app = Aplicacion::getSingleton();
        $conn = $app->conexionBd();
        $query=sprintf("UPDATE Usuarios U SET nombreUsuario = '%s', nombre='%s', password='%s', rol='%s' WHERE U.id=%i"
            , $conn->real_escape_string($usuario->nombreUsuario)
            , $conn->real_escape_string($usuario->nombre)
            , $conn->real_escape_string($usuario->password)
            , $conn->real_escape_string($usuario->rol)
            , $usuario->id);
        if ( $conn->query($query) ) {
            if ( $conn->affected_rows != 1) {
                echo "No se ha podido actualizar el usuario: " . $usuario->id;
                exit();
            }
        } else {
            echo "Error al insertar en la BD: (" . $conn->errno . ") " . utf8_encode($conn->error);
            exit();
        }

        return $usuario;
    }

    private $id;

    private $nombreUsuario;

    private $nombre;

    private $password;

    private $rol;

    private function __construct($nombreUsuario, $nombre, $password, $rol)
    {
        $this->nombreUsuario= $nombreUsuario;
        $this->nombre = $nombre;
        $this->password = $password;
        $this->rol = $rol;
    }

    public function id()
    {
        return $this->id;
    }

    public function rol()
    {
        return $this->rol;
    }


    public function nombreUsuario() //nick - correo
    {
        return $this->nombreUsuario;
    }

    public function compruebaPassword($password)
    {
        return password_verify($password, $this->password);
    }

    public function cambiaPassword($nuevoPassword)
    {
        $this->password = self::hashPassword($nuevoPassword);
    }
    public function nombre(){
        return $this->nombre;
    }
}
