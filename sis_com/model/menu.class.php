<?php
	require_once "connection.class.php";

	class Menu{
		private $idmenu;
		private $idrol;
		public $src;

		public function setId($val){
			$thiss->idmenu = $val;
		}

		public function setRol($val){
			$this->idrol = $val;
		}

		public function consultarMenusCabeceras(){
			try{
				$cnx = new DB();
				$sql = "select M.detalle, M.src FROM menu M inner join rol_detalle_menu RM on M.idmenu = RM.idmenu inner join rol R on RM.idrol = R.idrol WHERE M.idmenu_sub IS NULL AND R.idrol=".$this->idrol;
				$query = $cnx->query($sql);
				if($query){
					return $query;
				}else{
					throw new Exception("Ocurrio un error al procesar la consulta.");
				}
			}catch(Exception $e){
				return  $e->getMessage();
			}
		}

		public function consultarMenusSecundarios(){
			try{
				$cnx = new DB();
				$sql = "select M.detalle, M.src FROM menu M inner join rol_detalle_menu RM on M.idmenu = RM.idmenu inner join rol R on RM.idrol = R.idrol WHERE M.idmenu_sub in (SELECT idmenu FROM menu WHERE src like '".$this->src."') and R.idrol = ".$this->idrol;
				$query = $cnx->query($sql);
				return $query;
			}catch(Exception $e){
				return $e->getMessage();
			}
		}
	}