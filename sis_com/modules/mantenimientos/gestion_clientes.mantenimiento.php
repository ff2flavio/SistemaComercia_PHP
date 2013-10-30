<?php
	require_once "./model/documento_tipo.class.php";
	require_once "./model/person_tipo.class.php";	
	require_once "./model/contacto_tipo.class.php";	
	require_once "./model/estado_civil.class.php";	
?>
<div class="page-header align-left form-title">			
	<h4>Gestión de Clientes:</h4>
	<div id="sistema-mensaje" class="pull-right inline"></div>
	<!-- <div id="loader-container"><div id="movingBallG"><div class="movingBallLineG"></div><div id="movingBallG_1" class="movingBallG"></div></div></div> -->
</div>
<div class="row-fluid">
	<div class="span12">
		<div class="span5 login">
			<form id="frmGestionClientes" name="frmGestionClientes" method="post" action="gestion_clientes.mantenimiento.php" enctype="multipart/form-data" class="form-horizontal">
				<div class="control-group">
					<label class="control-label" for="cboDocumentoTipo">Tipo de Documento:</label>
					<div class="controls">
				     	<select name="cboDocumentoTipo" id="cboDocumentoTipo" class="input-medium">
				     		<option value="" disabled selected>Seleccione uno</option>
				     		<?php
				     			$objDocumentoTipo = new DocumentoTipo();
				     			$query_documentoTipo = $objDocumentoTipo->consultar();
				     			$data = '';
				     			while($reg = $query_documentoTipo->fetchObject()){
				     				$data .= '<option value="'.$reg->iddocumento_tipo.'">'.$reg->detalle.'</option>';
				     			}
				     			echo $data;
				     		?>
				     	</select>
				     	<div class="input-append">
				     		<input type="text" class="input-medium" name="txtNumeroDocumento" id="txtNumeroDocumento" placeholder="Documento" required />
				     		<button id="btnAgregarDocumentoPersona" class="btn btn-inverse" type="button"><i class="icon-white icon-search"></i></button>
						</div>
						<div id="lista-documentos" class="lista">
							<table class="table table-striped table-hover table-detail table-condensed datagrid">
							    <thead>
								     <tr>
								        <th>#</th>
								        <th>Tipo Doc</th>
								        <th colspan="2">Detalle</th>
								     </tr>
							    </thead>
							    <tbody>
							    </tbody>
							 </table>
						</div>
				    </div>
				    
				</div>
				<div class="control-group">
					<label class="control-label" for="cboTipoPersona">Tipo:</label>
					<div class="controls">
				     	<select name="cboTipoPersona" id="cboTipoPersona">
				     		<option value="" disabled selected>Seleccione uno</option>
				     		<?php
				     			$objPersonaTipo = new PersonaTipo();
				     			$query_personaTipo = $objPersonaTipo->consultar();
				     			$data = '';
				     			while($reg = $query_personaTipo->fetchObject()){
				     				$data .= '<option value="'.$reg->idpersona_tipo.'">'.$reg->detalle.'</option>';
				     			}
				     			echo $data;
				     		?>
				     	</select>
				    </div>
				</div>
				<div class="control-group">
					<label class="control-label" for="txtNombreCompletoPersona">Nombre completo:</label>
					<div class="controls">
						<input type="text" class="input-block-level" name="txtNombreCompletoPersona" id="txtNombreCompletoPersona" placeholder="Nombre completo / Razon social" required />
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="txtDireccionPersona">Dirección:</label>
					<div class="controls">
						<input type="text" class="input-block-level" name="txtDireccionPersona" id="txtDireccionPersona" placeholder="Direccion" required />
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="divSexoPersona">Sexo:</label>
					<div class="controls" id="divSexoPersona">
						<label class="radio inline">
							<input type="radio" name="optSexoPersona" id="optSexoPersonaH" value="true" required /> Hombre
						</label>
						<label class="radio inline">
							<input type="radio" name="optSexoPersona" id="optSexoPersonaM" vale="false" required /> Mujer
						</label>

					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="divEstadoCivil">Estado Civil:</label>
					<div class="controls" id="divEstadoCivil">
						<?php
							$objEstadoCivil = new EstadoCivil();
							$query_estadoCivil = $objEstadoCivil->Consultar();
							$data = '';
							while ($reg = $query_estadoCivil->fetchObject()) {
								$data .= '<label class="radio inline"><input type="radio" name="optEstadoCivil" id="optEstadoCivilPersona'.$reg->detalle.'" value="'.$reg->idestado_civil.'" required /> '.$reg->detalle.'</label>';
							}
							echo $data;
						?>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="txtUsuarioPersona">Usuario y contraseña:</label>
					<div class="controls">
						<input type="password" class="input-medium" name="txtUsuarioPersona" id="txtUsuarioPersona" placeholder="Usuario" required />
						<input type="password" class="input-medium" name="txtClavePersona" id="txtClavePersona" placeholder="Contraseña" required />
						<label class="checkbox inline"> 
							<input type="checkbox" /> 
							Automático
						</label>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="cboContactoTipoPersona">Contácto:</label>
					<div class="controls">
						<select name="cboContactoTipoPersona" id="cboContactoTipoPersona">
				     		<option value="" disabled selected>Seleccione uno</option>
				     		<?php
				     			$objContactoTipo = new ContactoTipo();
				     			$query_contactoTipo = $objContactoTipo->consultar();
				     			$data = '';
				     			while($reg = $query_contactoTipo->fetchObject()){
				     				$data .= '<option value="'.$reg->idcontacto_tipo.'">'.$reg->detalle.'</option>';
				     			}
				     			echo $data;
				     		?>
				     	</select>
				     	<div class="input-append">
				     		<input type="text" class="input-medium" name="txtContactoPersona" id="txtContactoPersona" placeholder="Detalle contacto" />
				     		<button id="btnAgregarContactoPersona" class="btn btn-inverse" type="button"><i class="icon-white icon-plus"></i></button>
						</div>
						<div id="lista-contacto" class="lista">
							<table class="table table-striped table-hover table-condensed table-detail datagrid">
							    <thead>
								     <tr>
								        <th>#</th>
								        <th>Tipo</th>
								        <th colspan="2">Detalle</th>
								     </tr>
							    </thead>
							    <tbody>
							    </tbody>
							 </table>
						</div>
					</div>
				</div>

				<div class="form-actions">
					<button type="reset" class="btn"><i class="icon-white icon-remove"></i> Cancelar</button>
					<button type="submit" class="btn btn-success"><i class="icon-white icon-ok"></i> Aceptar</button>
				</div>
			</form>
		</div>
		<div class="span7 pr">
			<div class="align-left p">
				<div class="btn-group inline">
				   <button id="btnConsultarClientes" class="btn btn-primary btn-small"><i class="icon-white icon-refresh"></i> Actualizar</button>
				   <button id="btnEliminarClientes" class="btn btn-primary btn-small"><i class="icon-white icon-trash"></i> Eliminar seleccionado(s)</button>
				</div>
				<div class="pull-right inline" style="padding-right:0;">
					<label>
						<input type="range" id="rngPaginaClientes" name="rngPaginaClientes" value="1" min="1" max="0" class="" />
						&nbsp;&nbsp;<span id="PaginaActualClientes" class="paginacion">Pag: </span>
					</label>
				</div>
			</div>
			<div class="p">
			<table id="lista-clientes" class="table table-bordered table-striped table-hover datagrid">
			    <thead>
				     <tr>
				      	<th><input type="checkbox" id="chkListaClientes" style="margin:0" /></th>
				        <th>#</th>
				        <th>Nombre Completo</th>
				        <th>Dirección</th>
				        <!--<th>Usuario</th>-->
				        <th colspan="2">Tipo</th>
				     </tr>
			    </thead>
			    <tbody>
			    </tbody>
			 </table>
			</div>
		</div>
	</div>
</div>
