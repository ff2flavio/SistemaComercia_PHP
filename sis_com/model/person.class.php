<?php
	require_once "connection.class.php";

	class Person{
		private $id;
		private $id_tipo;
		public $nombre;
		public $direccion;
		public $usuario;
		public $clave;

		public function setId($val){
			$this->id = $val;
		}

		public function setIdTipo($val){
			$this->id_tipo = $val;
		}

		public function autenticarUsuario(){
			try{
				$cnx = new DB();
				$sql = "select * from persona P WHERE P.usuario like '".$this->usuario."' and P.clave like '".$this->clave."'";
				var_dump($sql);
				$query = $cnx->query($sql);
				if($query){
					if($query->rowCount() > 0){
						$reg = $query->fetchObject();

						$_SESSION["login"]["status"] = true;
						$_SESSION["login"]["id"] = $reg->idpersona;
						$_SESSION["login"]["nombre"] = $reg->nombre;
						$_SESSION["login"]["direccion"] = $reg->direccion;
						$_SESSION["login"]["usuario"] = $reg->usuario;

						self::setId($reg->idpersona);
						self::setIdTipo($reg->idpersona_tipo);
						$this->nombre = $reg->nombre;
						$this->direccion = $reg->direccion;
						$this->usuario = $reg->usuario;

						return true;

					}else{
						throw new Exception("Ocurrio un error al iniciar sesion, verifique su usuario y contraseña e intentelo nuevamente");
					}
				}else{
					throw new Exception("Ocurrio un error al procesar la instruccion");
				}
			}catch(Exception $e){
				return $e->getMessage();
			}
		}

		public function consultarRoles(){
			$cnx = new DB();
			$sql = "select P.idpersona,R.idrol,R.detalle from persona P inner join persona_detalle_rol PR on P.idpersona = PR.idpersona inner join rol R on PR.idrol = R.idrol where P.idpersona =".$this->id;
			$query = $cnx->query($sql);
			return $query;
		}

		public function seleccionaRol($idrol){
			$cnx = new DB();
			$sql = "select count(*) as num from persona P inner join persona_detalle_rol PR on P.idpersona = PR.idpersona inner join rol R on PR.idrol = R.idrol where R.idrol =".$idrol;
			$query = $cnx->query($sql);
			$reg = $query->fetchObject();
			if($reg->num > 0){
				$_SESSION['login']['rol'] = $idrol;
				return true;
			}else{
				return false;
			}
		}

		public function consultar($grupo = 2){
			$cnx = new DB();
			$sql = "select P.idpersona as id, P.nombre as nombre, P.direccion as direccion, P.usuario as usuario, P.clave as clave, PT.detalle as tipo from persona P inner join persona_tipo PT on P.idpersona_tipo = PT.idpersona_tipo inner join persona_detalle_grupo PDG on P.idpersona = PDG.idpersona inner join persona_grupo PG on PG.idpersona_grupo = PDG.idpersona_grupo WHERE PG.idpersona_grupo =$grupo order by id asc";
			$query = $cnx->query($sql);
			return $query;		
		}
	}	
