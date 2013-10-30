<?php
	require_once "../../../config/global.config.php";

	if(isset($_GET["pagina"]) && !empty($_GET["pagina"]) && is_numeric($_GET["pagina"]) && isset($_SESSION["login"]["status"]) && $_SESSION["login"]["status"] && isset($_SERVER["HTTP_X_REQUESTED_WITH"]) && strtolower($_SERVER["HTTP_X_REQUESTED_WITH"]) === "xmlhttprequest"){
		require_once "../../../model/paginador.class.php";
		require_once "../../../model/person.class.php";

		$pagina = $_GET["pagina"];
		$objPerson = new Person();
		$query = $objPerson->consultar();

		$objPaginador = new Paginador(10,$query);
		$query_paginado = $objPaginador->Consultar($pagina);

		$json = [];
		$data = [];
		$pag = [];

		while ($reg = $query_paginado->fetchObject()) {
			$elemento = [];
			foreach ($reg as $key => $value) {
				$elemento[$key] = $value;
			}
			$data[] = $elemento;
		}

		$paginador["paginas"] = $objPaginador->getTotalPaginas();
		$paginador["pagina"] = $objPaginador->getPagina();
		$paginador["inicio"] = $objPaginador->getInicio();
		$pag[] = $paginador;

		$json[] = $data;
		$json[] = $pag;

		echo json_encode($json);

	}else{
		echo "Error: Acceso denegado.";
	}