<!DOCTYPE html>
<html>
    <head> 
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
        <link rel="stylesheet" type="text/css" href="css/peliculacss.css" />
        <title>Comentarios</title>
    </head>

    <body>
        <div class="container">
        <div class ="panel">

            <div class ="textarea">
                <p class="msg"> Añade un nuevo comentario: </p>
				<div class="clasificacion">
					<input id="radio1" type="radio" name="estrellas" value="5">
					<label for="radio1">★</label>
					<input id="radio2" type="radio" name="estrellas" value="4">
					<label for="radio2">★</label>
					<input id="radio3" type="radio" name="estrellas" value="3">
					<label for="radio3">★</label>
					<input id="radio4" type="radio" name="estrellas" value="2">
					<label for="radio4">★</label>
					<input id="radio5" type="radio" name="estrellas" value="1">
					<label for="radio5">★</label>
					:Valoracion
				</div>
                <div class ="input-contenedor">
                    <input type="varchar" id="titulo_com" name="titulo" placeholder="Titulo"> </br>
                </div>
            
                <div class ="input-contenedor">
                    <textarea id="comentario_com" name="comentario" placeholder="Escriba aqui su comentario" autofocus ></textarea>
				
                </div>
                <input type="submit" onclick="return validaComentario()" value="Publicar" class="button" name="subir">
               
            </div>
            

        </div>
		</div>
	</body>
<script src="js/validaComentario.js"> </script>
</html>
