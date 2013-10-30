<?php
	require_once "config/global.config.php";
	require_once "config/functions.php";
		session_destroy();
		session_start();
	include_once "static/php/header.layout.php";

	echo PG::info("Usted a salido exitosamente del Sistema.<br/><a href='index'>Ingresar la Sistema</a>");

	include_once "static/php/footer.layout.php";
	