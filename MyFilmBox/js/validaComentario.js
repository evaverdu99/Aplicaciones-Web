const titulo = document.getElementById('titulo_com');
const texto = document.getElementById('comentario_com');
const usuario = document.getElementById('usuario_com');

function validaComentario(){
   var valid = true;
    if( titulo.value.trim() === ""){
        setErrorFor(titulo, "Introduzca el titulo del comentario.")
        valid= false; 
    }else setSuccessFor(titulo);
	
    if(texto.value.trim() === ""){
        setErrorFor(texto, "Introduzca el contenido del comentario.")
        valid= false; 
    }else setSuccessFor(texto);
    
	if(usuario.value.trim() === ""){
        setErrorFor(usuario, "Introduzca el usuario.")
        valid= false; 
    }else setSuccessFor(usuario);
    return valid; 
}

function setErrorFor(input, message){
    const formControl = input.parentElement; 
    const small = formControl.querySelector('small');

    small.innerText =message;

    formControl.className = 'input-contenedor-err';
}

function setSuccessFor(input){
    const formControl = input.parentElement; 
    formControl.className = 'input-contenedor-ok';
	
	const small = formControl.querySelector('small');

    small.innerText ='';
}