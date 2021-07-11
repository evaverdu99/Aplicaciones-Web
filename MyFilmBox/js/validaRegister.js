
        
const name = document.getElementById('name_reg');
const user = document.getElementById('username_reg');
const password1 = document.getElementById('password1_reg');
const password2 = document.getElementById('password2_reg');


function validaRegister(){
   
    var valid = true; 
    if(name.value.trim()===""){
        setErrorFor(name, "Introduce un nombre.");
        valid= false; 
    }

    else if(name.value.trim().length < 6){
        setErrorFor(name, "Introduce un nombre más largo.")
        valid= false; 
    }
    else{
        setSuccessFor(name);
    }

    if(user.value.trim()===""){
        setErrorFor(user, "Introduce un correo electrónico.");
        valid= false; 
    }

    else if(!isEmail(user.value.trim())){
        setErrorFor(user, "Introduce un correo electrónico válido.");
        valid= false; 
    }
    else{
        setSuccessFor(user);
    }


    if(password1.value.trim()===""){
        setErrorFor(password1, "Debes rellenar el campo contraseña.")
        valid= false; 
    }
    else{
        setSuccessFor(password1);
    }
  

    if(password2.value.trim()===""){
        setErrorFor(password2, "Repite la contraseña introducida anteriormente.")
        valid= false; 
    }
    else if(password1.value.trim()!==password2.value.trim()){
        setErrorFor(password2, "Las contraseñas no coinciden.")
        valid= false; 
    }
    else{
        setSuccessFor(password2);
    }


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
}

function isEmail(email){ 
    var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(String(email).toLowerCase());
}

        
        
        