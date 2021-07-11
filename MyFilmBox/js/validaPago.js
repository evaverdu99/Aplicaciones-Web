
          
const titular = document.getElementById('nombreTitular_pago');
const cvv = document.getElementById('cvv_pago');
const numero = document.getElementById('numero_pago');
const app = document.getElementById('app_pago');
var match; 



function validaPago(){
   
    var valid = true; 
    if( titular.value.trim() == ""){
        setErrorFor(titular, "Introduzca titular de la tarjeta.")
        valid= false; 
    }
	else{
		setSuccessFor(titular);
	}
    if( numero.value.trim() == ""){
        setErrorFor(numero, "Introduzca numero de tarjeta.")
        valid= false; 
    }else setSuccessFor(numero);
    
    
    if( cvv.value.trim() == ""){
        setErrorFor(cvv, "Debes rellenar el campo cvv.")
        valid= false; 
    }else setSuccessFor(cvv);
	
	if( app.value.trim() == ""){
        setErrorFor(app, "Por favor indique la aplicación seleccionada.")
        valid= false; 
    }else setSuccessFor(app);
	
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
	 const small = formControl.querySelector('small');
    formControl.className = 'input-contenedor-ok';
	 small.innerText ="";
}


        
        
        