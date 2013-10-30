$(document).on("ready", init);

function init(){
	/** LOAD **/
	consultarClientes();

	/** EVENTOS LLAMADOS DESDE EL DOM **/
	$("#btnAgregarDocumentoPersona").click(agregarDocumentoPersona);
	$("#btnAgregarContactoPersona").click(agregarContactoPersona);
	$("#btnConsultarClientes").click(consultarClientes);
		$("input#rngPaginaClientes").mouseup(consultarClientes);
		$("input#rngPaginaClientes").change(presentarPaginacion);
	$("#btnEliminarClientes").click(eliminarClientes);
	$("#chkListaClientes").change(checkListaClientes)

}

/** VARIABLES GLOBALES DE PAGINA **/
	var objContenedor = new Contenedor()
	   ,objContenedorDocumentos = new Contenedor();

/** FUNCIONES Y METODOS DEFINIDAS **/

/** MANTENIMIENTOS **/
	function checkListaClientes(e){
		var estado = e.target.checked;
		seleccionarCheckbox('chkCliente[]', estado, function(e,num){
			var mensaje = "";
			if(num == 0){
				mensaje = "<span class='text-warning'> No se ha seleccionado ningun elemento. </span>";
			}else{
				if(e){
					
					mensaje = "<span class='text-warning'><b>" + num + "</b> elementos han sido seleccionados.</span>";	
							
				}else{
					mensaje = "<span class='text-warning'><b>" + num + "</b> elementos han sido deseleccionados.</span>";
				}
			}

			$("#sistema-mensaje").html(mensaje);
			$("#sistema-mensaje span").delay(5000).fadeOut('slow');
		});
	}

	function eliminarClientes(){
		loaderBlock(true);
	};

	function consultarClientes(){	

		$.ajax({
			type: "get",
			url: "modules/mantenimientos/ajax/consultar_clientes.ajax.php",
			data: { pagina : $("input#rngPaginaClientes").val() },
			dataType: "json",
			beforeSend: function(){ preLoad(true); },
			complete: function(){ preLoad(false);  },
			success: function(data){
				$("table#lista-clientes tbody").html("");
				var indice = 0;
				var info = data[1], data = data[0];
				for(var pos in data){
					indice = parseInt(pos) + 1;
					$("table#lista-clientes tbody").append('<tr><td><input type="checkbox" name="chkCliente[]" style="margin:0" /></td><td>'+(parseInt(indice)+parseInt(info[0].inicio))+'</td><td>'+data[pos].nombre+'</td><td>'+data[pos].direccion+'</td><!--<td>'+data[pos].usuario+'</td>--><td>'+data[pos].tipo+'</td><td><i class="icon-white icon-edit" onclick="editarCliente('+data[pos].id+')"></i></td></tr>');				
				}
				$("input#rngPaginaClientes").attr("max",info[0].paginas);	
				presentarPaginacion();
			}
		});
		
	};

	function presentarPaginacion(){
		$("span#PaginaActualClientes").html("Pag: "+$("input#rngPaginaClientes").val() +" de "+ $("input#rngPaginaClientes").attr("max"));
	}


/** AGREGAR TIPO DE CONTACTO AL CLIENTE **/
	function agregarContactoPersona(){
		if($("select#cboContactoTipoPersona").val() != null && $("input#txtContactoPersona").val() != ""){
			var tipoPersonaId  = $("select#cboContactoTipoPersona").val()
			   ,tipoPersonaVal = $("select#cboContactoTipoPersona option:selected").html()
			   ,tipoPersonaCon = $("input#txtContactoPersona").val()
			   ,tipoPersonaCombo = $("select#cboContactoTipoPersona").html();			

			objContenedor.agregar(tipoPersonaId,tipoPersonaVal,tipoPersonaCon,0,0,0);			   	
			
			    consultarContactoPersona();
			    $("input#txtContactoPersona").val("");
			    $("select#cboContactoTipoPersona").html("").html(tipoPersonaCombo);
			$("select#cboContactoTipoPersona option[value="+tipoPersonaId+"]").attr('disabled','true');

		}else{
			Mensaje("error","Debe seleccionar un tipo de <b><i>contacto</i></b> y escribirlo antes de poder agregarlo.");
		}
	};

	function eliminarContactoPersona(pos, ref){	
		objContenedor.eliminar(pos);
		$("select#cboContactoTipoPersona option[value="+ref+"]").removeAttr('disabled');
		consultarContactoPersona();
	};

	function consultarContactoPersona(){
		var elementos = objContenedor.consultar()
		   ,data      = ''
		   ,pos       = 0;
		for(i=0;i<elementos.length;i++){
			pos = i + 1;
			data += '<tr><td>'+pos+'</td><td>'+elementos[i][1]+'</td><td>'+elementos[i][2]+'</td><td><i class="icon-white icon-remove pointer" onclick="eliminarContactoPersona('+i+','+elementos[i][0]+')"></i></td></tr>';
		}
		console.log(data);
		$("div#lista-contacto table tbody").html(data);
	};


	/** AGREGAR TIPO DE DOCUMENTO AL CLIENTE **/
	function agregarDocumentoPersona(){
		if($("select#cboDocumentoTipo").val() != null && $("input#txtNumeroDocumento").val() != ""){
			var documentoTipoId  = $("select#cboDocumentoTipo").val()
			   ,documentoTipoVal = $("select#cboDocumentoTipo option:selected").html()
			   ,documentoTipoCon = $("input#txtNumeroDocumento").val()
			   ,documentoTipoCombo = $("select#cboDocumentoTipo").html();			

			objContenedorDocumentos.agregar(documentoTipoId,documentoTipoVal,documentoTipoCon,0,0,0);			   	
			
			    consultarDocumentoPersona();
			    $("input#txtNumeroDocumento").val("");
			    $("select#cboDocumentoTipo").html("").html(documentoTipoCombo);
			$("select#cboDocumentoTipo option[value="+documentoTipoId+"]").attr('disabled','true');

		}else{
			Mensaje("error","Debe seleccionar un tipo de <b><i>documento</i></b> y escribirlo antes de poder agregarlo.");
		}
	};

	function eliminarDocumentoPersona(pos, ref){	
		objContenedorDocumentos.eliminar(pos);
		$("select#cboDocumentoTipo option[value="+ref+"]").removeAttr('disabled');
		consultarDocumentoPersona();
	};

	function consultarDocumentoPersona(){
		var elementos = objContenedorDocumentos.consultar()
		   ,data      = ''
		   ,pos       = 0;
		for(i=0;i<elementos.length;i++){
			pos = i + 1;
			data += '<tr><td>'+pos+'</td><td>'+elementos[i][1]+'</td><td>'+elementos[i][2]+'</td><td><i class="icon-white icon-remove pointer" onclick="eliminarDocumentoPersona('+i+','+elementos[i][0]+')"></i></td></tr>';
		}
		console.log(data);
		$("div#lista-documentos table tbody").html(data);
	};