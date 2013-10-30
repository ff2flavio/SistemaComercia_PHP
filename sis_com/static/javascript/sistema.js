/**
**   Sistema
**/

var loader = '<img src="./static/images/loader4.png" alt="loader" />';

function loaderBlock(){
	var loader = $("#loader"),
		loaderdiv = $("#loader div");
	if(arguments[0]){
		loader.fadeIn(function(){
			loaderdiv.html("Cargando ...");
		});
		loaderdiv.html("Enviando informacion ...");
	}else{
		loaderdiv.html("Terminado ...");
		loader.fadeOut();
	}
	
};

function preLoad(){
	if(arguments[0]){
		$("#sistema-mensaje").html('<span>'+loader+'</span>');
		return;
	}
	$("#sistema-mensaje span").delay(1000).fadeOut();
};

function Mensaje(tipo, contenido){
	$("#sistema-mensaje").html('<span class="alert alert-'+tipo+'">'+contenido+'</span>');
	$("#sistema-mensaje span").delay(5000).fadeOut(1000);
};

function seleccionarCheckbox(grupo, estado, callback){
	var chk = document.getElementsByName(grupo);
	for(var indice in chk){
		chk[indice].checked = estado;
	}
	callback(estado, chk.length);
};
