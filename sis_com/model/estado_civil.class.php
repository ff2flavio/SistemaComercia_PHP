<?php
	require_once "connection.class.php";

	class EstadoCivil{

		public function Consultar(){
			$cnx = new DB();
			$sql = "select idestado_civil, detalle from estado_civil;";
			$query = $cnx->query($sql);
			return $query;	
		}
	}
