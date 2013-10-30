<?php

	session_start();
	header("Content-type: text/html; charset=utf-8");

	$pg["sis"]["title"] = "Sistema de Comercio [Compra-Venta-Alamacen]";
	$pg["sis"]["author"] = "PiLMee GaTes";
	$pg["sis"]["description"] = "Sistema de comercializacion desarrollado basicamente con los modulos de persona - compras ventas y almacen";
	$pg["sis"]["year"] = "2013";
	$pg["sis"]["logo"] = "./static/images/logo.png";
	$pg["sis"]["tag"] = "";
	$pg["sis"]["footer"] = "2013";
	$pg["sis"]["charset"] = "utf-8";

	$pg["sis"]["meta"] = [
							"viewport" => "width=device-width, initial-scale=1.0",
							"description" => $pg["sis"]["description"],
							"author" => $pg["sis"]["author"],
							"shortcut icon" => "http://mediatemplestatic.hongkiat.netdna-cdn.com/logo/hkdc/favicon.ico"
						 ];

	$pg["sis"]["css"] = [
							"sistema" => "./static/stylesheet/sistema.css",
							"bootstrap-css" => "./static/stylesheet/bootstrap.css",
							"bootstrap-responsive" => "./static/stylesheet/bootstrap-responsive.min.css"
							//"modernizr" => "./static/javascript/modernizr.custom.js"
							//"animaciones" => "./static/stylesheet/animaciones.css"
						];

	$pg["sis"]["js"] = [
							"jquery" => "http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js",
							"bootstrap-js" => "./static/javascript/bootstrap.min.js",
							"sistema" => "./static/javascript/sistema.js",
							"carrito" => "./static/javascript/carrito.js"
					   ];

	$pg["sis"]["db"]["driver"] = "pgsql";
	$pg["sis"]["db"]["host"] = "localhost";
	$pg["sis"]["db"]["user"] = "postgres";
	$pg["sis"]["db"]["password"] = "pilmee";
	$pg["sis"]["db"]["port"] = "5432";
	$pg["sis"]["db"]["database"] = "sis_com";

