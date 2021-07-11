const user = document.getElementById('userName_login');
const password = document.getElementById('password_login');
var p = false;
var u;

$(document).ready(function(){
  $("#lUok").hide();  //Login User bien
  $("#lUmal").hide(); //Login User mal
  $("#lPok").hide();  //Login password bien
  $("#lPmal").hide(); //Login password mal
  $("#lerr").hide();  //Login msg contraseña /


  $("#userName_login").keyup(function(){
    if(isEmail($("#userName_login").val())){
      $("#lUok").show();
      $("#lUmal").hide();
      $("#lUerr").hide();
      setNeutralFor(document.getElementById('userName_login'));
      u = true;
    } 
    else{
      $("#lUmal").show();
      $("#lUok").hide();
      setErrorFor(document.getElementById('userName_login'));
      u = false;
    }
  });

  $("#password_login").change(function(){

    var url="loginMatch.php?user=" + $("#userName_login").val() + "&pswd=" + $("#password_login").val() ;
    $.get(url, match);       

  });

});

function valida(){
  return p && u;
}


function isEmail(email) {
    var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    return regex.test(email);
}

function match(data, status) {
  if (data.trim()=='mal'){
    $("#lUok").hide();  //Login User bien
    $("#lUmal").show(); //Login User mal
    $("#lPok").hide();  //Login password bien
    $("#lPmal").show(); //Login password mal
    $("#lerr").show();
    setErrorFor(document.getElementById('userName_login'));
    setErrorFor(document.getElementById('password_login'));
  }
  else{
    p = true;
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