<?php
	/**
	*	main
	**/
	include_once "sys.top.php";

	if(isset($_SESSION["login"]["status"])){
		if($_SESSION["login"]["status"]){

			if(isset($_GET["pag"]) && !empty($_GET["pag"]) && is_string($_GET["pag"])){
				if(file_exists("modules/".$_GET["pag"]."/".$_GET["pag"].".php")){
					require_once "modules/".$_GET["pag"]."/".$_GET["pag"].".php";
				}else{
					echo PG::error("El modulo elegido no existe.");
				}
			}else{
				//MOSTRAR ESCRITORIO CON ACCESOS DIRECTOS DEL USUARIO (PERSONALIZADO).
			}


		}else{
				include_once "view/login.form.php";
			}
	}else{
		include_once "view/login.form.php";
	}
	

	include_once "sys.bottom.php";

