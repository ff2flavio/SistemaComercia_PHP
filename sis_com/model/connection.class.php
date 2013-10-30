<?php
	class DB extends PDO{
		private $driver;
		private $host;
		private $user;
		private $password;
		private $port;
		private $database;
		private	$status;
		private $charset;

		public function __construct(){
			try{
				global $pg;
				$this->driver = $pg["sis"]["db"]["driver"];
				$this->host = $pg["sis"]["db"]["host"];
				$this->user = $pg["sis"]["db"]["user"];
				$this->password = $pg["sis"]["db"]["password"];
				$this->port = $pg["sis"]["db"]["port"];
				$this->database = $pg["sis"]["db"]["database"];
				$this->charset = $pg["sis"]["charset"];

				//parent::__construct($this->driver.':dbname='.$this->database.';port='.$this->port.';host='.$this->host.';charset='.$this->charset, $this->user, $this->password);
				parent::__construct("$this->driver:dbname=$this->database;host=$this->host;port=$this->port;", $this->user, $this->password);
				$this->status =  "Connection OK";
			}catch(PDOException $e){
				$this->status = $e->getMessage();
			}
		}

		public function getStatus(){
			return $this->status;
		}
	}
