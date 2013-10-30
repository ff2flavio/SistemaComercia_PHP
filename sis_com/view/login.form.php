<?php
	/**
	*		LOGIN	
	**/
?>
<div id="Login" class="login">
	<form id="frmLogin" name="frmLogin" method="post" action="autentication.php" enctype="multipart/form-data" class="form-horizontal">
		<div class="page-header">			
			<h4>Ingreso de usuarios:</h4>
		</div>
		<div class="control-group">
			<label class="control-label" for="txtUser">Usuario:</label>
			<div class="controls">
		     	<input type="password" id="txtUser" name="txtUser" placeholder="Usuario" required />
		    </div>
		</div>
		<div class="control-group">
			<label class="control-label" for="txtPassword">Contraseña:</label>
			<div class="controls">
		     	<input type="password" id="txtPassword" name="txtPassword" placeholder="Contraseña" required />
		    </div>
		</div>

		<div class="form-actions">
			<button type="reset" name="btnReset" class="btn">Restablecer</button>
			<button type="submit" name="btnSend" class="btn btn-success"> <i class="icon-white icon-ok"></i> Ingresar</button>
		</div>
	</form>
</div>