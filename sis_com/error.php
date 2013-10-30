<?php
	if($_GET && isset($_GET["err"]) && !empty($_GET["err"]) && is_string($_GET["err"])){
		require_once "config/global.config.php";
		include_once "static/php/header.layout.php";
		echo '<div class="alert alert-error"><a class="close">×</a><strong>Error:</strong> '.strip_tags($_GET["err"]).'.</div>';	
		include_once "static/php/footer.layout.php";
	}else{
		header("location: index.php?from=error");
	}

	