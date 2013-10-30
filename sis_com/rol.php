<?php
	/**
	**	SELECCION DE ROL
	**/

	include_once "sys.top.php";
	require_once "model/person.class.php";
	$objPersona = new Person();

	if(isset($_GET['idrol']) && !empty($_GET['idrol']) && is_numeric($_GET['idrol'])){
		//*GRABAR EL ROL A UTILIZAR
		if($objPersona->seleccionaRol($_GET['idrol'])){
			header("location: main");
		}else{
			$mensaje = "No se ha podido activar el rol seleccionado. Intentelo nuevamente.";
			header("location: error?err=$mensaje");
		}
	}else{
		
		$objPersona->setId($_SESSION['login']['id']);
		$roles = $objPersona->consultarRoles();

		if($roles->rowCount() > 0){
			
			if(isset($_SESSION["login"]["status"])){
				if($_SESSION["login"]["status"]){
					include_once "view/rol.view.php";
				}else{
					include_once "view/login.form.php";
				}
			}else{
				include_once "view/login.form.php";
			}
		}else{

		}
	}

	include_once "sys.bottom.php";