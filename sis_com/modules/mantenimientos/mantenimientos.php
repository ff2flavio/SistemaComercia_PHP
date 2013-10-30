<?php
	if(isset($_GET["pag"]) && !empty($_GET["pag"]) && is_string($_GET["pag"]) && isset($_SESSION["login"]["rol"]) && !empty($_SESSION["login"]["rol"]) && is_numeric($_SESSION["login"]["rol"])){
		require_once "model/menu.class.php";
		$objMenu = new Menu();
		$objMenu->src = $_GET["pag"];
		$objMenu->setRol($_SESSION["login"]["rol"]);

		$query_menuSecundario = $objMenu->consultarMenusSecundarios();

		$data_menuSec = '<div class="subnav subnav-fixed"><ul class="nav nav-pills">';
		while ($reg = $query_menuSecundario->fetchObject()) {
			$active = '';
			if(isset($_GET['sub']) && !empty($_GET['sub']) && is_string($_GET['sub']) && $_GET['sub'] == $reg->src){
				$active = ' class="active"';
			}
			$data_menuSec .= '<li'.$active.'><a href="?pag='.$_GET["pag"].'&sub='.$reg->src.'">'.$reg->detalle.'</a></li>';
		}
		$data_menuSec .= '</ul></div>';
		echo $data_menuSec;

		if(isset($_GET["sub"]) && !empty($_GET["sub"]) && is_string($_GET["sub"])){
			if(file_exists("modules/".$_GET["pag"]."/".$_GET["sub"].".mantenimiento.php")){
				echo '<div class="row-fluid page-main">';
				require_once "modules/".$_GET["pag"]."/".$_GET["sub"].".mantenimiento.php";
				echo '</div>';
			}else{
				echo PG::error("El sub-modulo elegido no existe.");
			}
		}
	}