<?php
	require_once "config/global.config.php";
	require_once "config/functions.php";
	include_once "static/php/header.layout.php";

	if($_GET){
		echo !empty($_GET['err']) ? PG::info($_GET["err"]) : '';
	}