const user = document.getElementById('userName_login');
const password = document.getElementById('password_login');
var valid1 = false;
var valid2 = false;
var valid3 = false;
var valid4 = false;


$(document).ready(function(){

    $("#rNok").hide();      //Nombre_bien
    $("#rNmal").hide();    //Nombre_mal
    $("#rMailok").hide();   //Mail_bien
    $("#rMailmal").hide();  //Mail_mal
    $("#rP1ok").hide();     //Psw1_bien
    $("#rP1mal").hide();    //Psw1_mal
    $("#rP2ok").hide();     //Psw2_bien
    $("#rP2mal").hide();    //Psw2_mal
    $("#rErrMail").hide(); 
    $("#rErrp").hide(); 
    
  $("#name_reg").keyup(function(){

    if($("#name_reg").val().length > 5){
      $("#rNok").show();      
      $("#rNmal").hide();    
      setNeutralFor(document.getElementById('name_reg'));
      valid1 = true;
    } 
    else{
      $("#rNok").hide();      
      $("#rNmal").show(); 
      setErrorFor(document.getElementById('name_reg'));
      valid1 = false; 
    }
  });

  
 

  $("#password1_reg").keyup(function(){
    if($("#password1_reg").val().length > 4){
      $("#rP1ok").show();      
      $("#rP1mal").hide();    
      setNeutralFor(document.getElementById('password1_reg'));
      valid2 = true;
    } 
    else{
      $("#rP1ok").hide();      
      $("#rP1mal").show(); 
      setErrorFor(document.getElementById('password1_reg'));
      valid2 = false; 
    }
  });

  $("#password2_reg").keyup(function(){

    if($("#password1_reg").val() == $("#password2_reg").val()){
      $("#rP2ok").show();      
      $("#rP2mal").hide();  
      $("#rErrp").hide();  
      setNeutralFor(document.getElementById('password2_reg'));
      valid3=true;
    } 
    else{
      $("#rP2ok").hide();      
      $("#rP2mal").show(); 
      $("#rErrp").show();
      setErrorFor(document.getElementById('password2_reg'));
      valid3 = false; 
    }
  });

  $("#username_reg").change(function(){

    if(isEmail($("#username_reg").val())){
      $("#rMailok").show();      
      $("#rMailmal").hide();    
      setNeutralFor(document.getElementById('username_reg'));
      var url="usuarioDisponible.php?username=" +  $("#username_reg").val();
      $.get(url, match);  
    } 
    else{
      $("#rMailok").hide();      
      $("#rMailmal").show(); 
      setErrorFor(document.getElementById('username_reg'));
      valid4 = false; 
    }

        
  });

});

function validaRegister(){
  return valid1 && valid2 && valid3 && valid4;
}


function isEmail(email) {
    var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    return regex.test(email);
}

function match(data, status) {
  if (data.trim()=='mal'){
    $("#rMailok").hide();      
    $("#rMailmal").show(); 
    $("#rErrMail").show(); 
    setErrorFor(document.getElementById('username_reg'));
    valid4= false;     
  }
  else{
    $("#rMailok").show();      
    $("#rMailmal").hide(); 
    $("#rErrMail").hide(); 
    setNeutralFor(document.getElementById('username_reg'));
    valid4=true;
  }

}

function setErrorFor(input){
  const formControl = input.parentElement; 
  formControl.className = 'input-contenedor-err';
}

function setSuccessFor(input){
  const formControl = input.parentElement; 
  formControl.className = 'input-contenedor-ok';
}

function setNeutralFor(input){
  const formControl = input.parentElement; 
  formControl.className = 'input-contenedor';
}