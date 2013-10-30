<?php

	include_once "sys.top.php";

	if(isset($_SESSION["login"]["status"])){
		if($_SESSION["login"]["status"]){
			echo PG::block("Existe una sesion activa de:<br/><span class='badge badge-important'> <i class='icon-white icon-user'></i> ".$_SESSION["login"]["nombre"]."</span><br/><br/><a href='main'>Volver al sistema</a><br/><a href='salir'>Cerrar sesion</a>");
		}else{
			include_once "view/login.form.php";
		}
	}else{
		include_once "view/login.form.php";
	}
	

	include_once "sys.bottom.php";
