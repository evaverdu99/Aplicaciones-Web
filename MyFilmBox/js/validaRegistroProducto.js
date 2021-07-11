const nombre = document.getElementById('nombre_producto');
const precio = document.getElementById('precio_producto');
const descripcion = document.getElementById('descripcion_producto');
const categoria = document.getElementById('categoria_producto');



function validaRegistroProducto(){
   var valid = true; 
    if( nombre.value.trim() === ""){
        setErrorFor(nombre, "Introduzca el nombre del producto.")
        valid= false; 
    }else setSuccessFor(nombre);
	
    if( precio.value.trim() === ""){
        setErrorFor(precio, "Introduzca el precio del producto.")
        valid= false; 
    }else setSuccessFor(precio);
    
    
    if( descripcion.value.trim() === ""){
        setErrorFor(descripcion, "Introduzca la descripciondel producto.")
        valid= false; 
    }else setSuccessFor(descripcion);
	
	if( categoria.value.trim() === ""){
        setErrorFor(categoria, "Introduzca la categoria del producto.")
        valid= false; 
    }else setSuccessFor(categoria);

    if( categoria.value.trim() === "Seleccione una categoria:"){
        setErrorFor(categoria, "Seleccione la categoria")
        valid= false; 
    }else setSuccessFor(categoria);
	
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



        
        
        