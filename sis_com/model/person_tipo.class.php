<?php
	require_once "connection.class.php";
	class PersonaTipo{
		public function consultar(){
			$cnx = new DB();
			$sql = "select * from persona_tipo order by idpersona_tipo asc";
			$query = $cnx->query($sql);
			return $query;
		}
	}