<html>
    <head> 
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
        <link rel="stylesheet" type="text/css" href="css/registrocss.css" />
        <title>Sing up</title>
    </head>

    <body>
        <div class="container">
        <div class ="panel">
            
            <div class="tittleForm"><p> Registra un producto </p></div>
            <div class ="contenedor">
                    
                <div class ="input-contenedor">
                    
                    <input type="text" id="nombre_producto" name="nombre" placeholder="Nombre del producto: ">
                    <small> text-here </small>
                </div>
                                            
                            
                <div class ="input-contenedor">
                    
                    <input type="text" id="precio_producto" name="precio" placeholder="Precio: ">
                    <small> text-here </small>
                </div>
            
                <div class ="input-contenedor">
                    
                    <input type="text" id="descripcion_producto" name="descripcion" placeholder="Descripción del producto:">                   
                    <small> text-here </small>
                </div>

               
				 <div class ="input-contenedor">                 
                    
					<select name="categoria" id="categoria_producto">
				      <option selected="true" disabled="disabled">Seleccione una categoria: </option>
					  <option value="pelicula">Pelicula</option>
					  <option value="serie">Serie</option>
					  <option value="accesorio">Accesorio</option>
					  <option value="merchandicing">Merchandising</option>
					
					</select>
					<small> text-here </small>
                </div>
				
				
                <input type="submit" onclick="return validaRegistroProducto()" value="Enviar" class="button" name="subir">
               
            </div>
            

        </div>
        </div>
    </body>
    <script src="js/validaRegistroProducto.js"> </script>
       
</html>
