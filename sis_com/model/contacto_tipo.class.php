<?php
	require_once "connection.class.php";
	class ContactoTipo{
		public function consultar(){
			$cnx = new DB();
			$sql = "select * from contacto_tipo order by idcontacto_tipo asc";
			$query = $cnx->query($sql);
			return $query;
		}
	}