<?php
require_once "connection.class.php";

class Paginador {
	private $cnx;
	private $query;
	private $num_elementos;
	private $elementos_pagina;
	private $total_paginas;
	private $pagina;
	private $inicio;

	public function __construct($elementos_pagina=10,$query){
		$this->cnx = new DB();
		$this->elementos_pagina = $elementos_pagina;
		$this->pagina = is_null($this->pagina) ? 1 : $this->pagina;
		$this->query = $query;
		$this->num_elementos = $this->query->rowCount();
		$this->total_paginas = ceil($this->num_elementos/$this->elementos_pagina);
	}

	public function getPagina(){ return (int)$this->pagina; }
	public function getTotalPaginas(){ return (int)$this->total_paginas; }
	public function getInicio(){ return (int)$this->inicio; }

	public function setPagina($value = 1){
		if($value < 1){
			$this->pagina = 1;
		}elseif($value > $this->total_paginas){
			$this->pagina = $this->total_paginas;
		}else{
			$this->pagina = $value;
		}
		$this->inicio = ($this->pagina - 1) * $this->elementos_pagina;
	}

	public function Consultar($pagina){
		$this->setPagina($pagina);
		$query = $this->cnx->query($this->query->queryString . " limit $this->elementos_pagina offset $this->inicio");
		return $query;
	}
}
