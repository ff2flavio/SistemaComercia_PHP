<?php
	require_once "connection.class.php";

	class DocumentoTipo{
		public function consultar(){
			$cnx = new DB();
			$sql = "select * from documento_tipo order by iddocumento_tipo asc";
			$query = $cnx->query($sql);
			return $query;
		}
	}