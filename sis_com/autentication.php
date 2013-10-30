<?php
	if($_POST && isset($_POST["txtUser"]) && isset($_POST["txtPassword"]) && !empty($_POST["txtUser"]) && !empty($_POST["txtPassword"])){
		$user = strip_tags($_POST["txtUser"]);
		$pass = md5($_POST["txtPassword"]);
		
		require_once "config/global.config.php";
		require_once "model/person.class.php";

		$objPersona = new Person();
		$objPersona->usuario = $user;
		$objPersona->clave = $pass;

		$login = $objPersona->autenticarUsuario();

		if(is_bool($login) && $login == true){
			/** COMPROBACION DE ROLES **/
			header("location: rol");

		}else{
			header("location: index?err=$login");
		}

	}else{
		$mensaje = "Ocurrio un error al recibir la informacion. Vuelva a intentarlo.";
		header("location: error?err=$mensaje");
	}