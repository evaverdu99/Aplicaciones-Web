const titulo = document.getElementById('titulo_pelicula');
const duracion = document.getElementById('duracion_pelicula');
const director = document.getElementById('director_pelicula');
const anyo = document.getElementById('anyo_pelicula');
const reparto = document.getElementById('reparto_pelicula');
const sinopsis = document.getElementById('sinopsis_pelicula');
const productora = document.getElementById('productora_pelicula');
const genero = document.getElementById('genero_pelicula');
const calificacion = document.getElementById('calificacion_pelicula');
const origen = document.getElementById('origen_pelicula');


function validaRegistroPelicula(){
   var valid = true; 
    if( titulo.value.trim() === ""){
        setErrorFor(titulo, "Introduzca el titulo de la pelicula.")
        valid= false; 
    }else setSuccessFor(titulo);
	
    if( duracion.value.trim() === ""){
        setErrorFor(duracion, "Introduzca la duracion de la pelicula.")
        valid= false; 
    }else setSuccessFor(duracion);
    
    
    if( director.value.trim() === ""){
        setErrorFor(director, "Introduzca el director de la pelicula")
        valid= false; 
    }else setSuccessFor(director);
	
	if( anyo.value.trim() === ""){
        setErrorFor(anyo, "Introduzca el año de la pelicula")
        valid= false; 
    }else setSuccessFor(anyo);
	
	if( reparto.value.trim() === ""){
        setErrorFor(reparto, "Introduzca el reparto de la pelicula")
        valid= false; 
    }else setSuccessFor(reparto);
	
	if( sinopsis.value.trim() === ""){
        setErrorFor(sinopsis, "Introduzca la sinopsis de la pelicula")
        valid= false; 
    }else setSuccessFor(sinopsis);
	
	if( productora.value.trim() === ""){
        setErrorFor(productora, "Introduzca la productora de la pelicula")
        valid= false; 
    }else setSuccessFor(productora);
	
	if( genero.value.trim() === "Seleccione el género:"){
        setErrorFor(genero, "Seleccione el genero de la pelicula")
        valid= false; 
    }else setSuccessFor(genero);
	
	if( calificacion.value.trim() === "Seleccione la calificación:"){
        setErrorFor(calificacion, "Introduzca la calificacion de la pelicula")
        valid= false; 
    }else setSuccessFor(calificacion);
	
	if( origen.value.trim() === ""){
        setErrorFor(origen, "Seleccione el origen de la pelicula")
        valid= false; 
    }else setSuccessFor(origen);
	

	
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



        
        
        