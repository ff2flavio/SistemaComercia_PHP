<!doctype html>
<html lang="es_PE" class="no-js">
	<head>
		<meta charset="<?=$pg["sis"]["charset"]?>" />
		<title><?=$pg["sis"]["title"]?></title>
	    <?php
	    	foreach ($pg["sis"]["meta"] as $key => $value) { echo '<meta name="'.$key.'" rel="'.$key.'" content="'.$value. '" />'; }
	    	foreach ($pg["sis"]["css"] as $key => $value) { echo '<link rel="stylesheet" id="'.$key.'" href="'.$value. '" />'; }
	    ?>
	</head>
	<body>
		<section id="main">
			<header>
				<div class="navbar navbar-fixed-top">
				   <div class="navbar-inner">
				     	<div class="container-nav">
				       		<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
				         		<span class="icon-bar"></span>
				         		<span class="icon-bar"></span>
				         		<span class="icon-bar"></span>
				       		</a>
				       		<a class="brand" href="main">
				       			<img src="<?=$pg["sis"]["logo"]?>" class="logo" alt="logo" /> 
				       			<b class="logo-margin">SiSCoM</b> 
				       			<i class="icon-white icon-share-alt"></i> 
				       			<i>Sistema Comercial Base</i></a>
				       		<div class="nav-collapse collapse" id="main-menu">
				       			<?php
				       				if(isset($_SESSION["login"]["status"]) && isset($_SESSION["login"]["rol"]) && $_SESSION["login"]["status"] && !empty($_SESSION["login"]["rol"])){
				       					require_once "model/menu.class.php";
										$objMenu = new Menu();
										$objMenu->setRol($_SESSION['login']['rol']);
										$query_rol = $objMenu->consultarMenusCabeceras();
										$data_menu = '<ul class="nav pull-right" id="main-menu-right">';
										while ($reg = $query_rol->fetchObject()) {
											$active = '';
											if(isset($_GET['pag']) && !empty($_GET['pag']) && is_string($_GET['pag']) && $_GET['pag'] == $reg->src){
												$active = ' class="active"';
											}
											$data_menu .= '<li'.$active.'><a rel="tooltip" target="_self" href="?pag='.$reg->src.'" title="" data-original-title="descripcion">'.$reg->detalle.'</a></li>';
										}
										$data_menu .= '</ul>';
										echo $data_menu;
				       				}	
				       			?>
				       		</div>
				     	</div>
				   	</div>
				</div>
			</header>
			<section id="system">