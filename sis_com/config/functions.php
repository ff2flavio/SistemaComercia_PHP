<?php
	/**
	**  FUNCTION Y METODOS GLOBALES
	**
	**/

	class PG{
		public static function include_js($src){
			echo '<script src="'.$src.'"></script>';
		}
		public static function block($mensaje){
			return '<div class="alert alert-block block"><a class="close">×</a><strong>Importante: </strong> '.$mensaje.'</div>';
		}
		public static function error($mensaje){
			return '<div class="alert alert-error block"><a class="close">×</a><strong>Error: </strong> '.$mensaje.'</div>';
		}
		public static function warning($mensaje){
			return '<div class="alert block"><a class="close">×</a><strong>Advertencia: </strong> '.$mensaje.'</div>';
		}
		public static function info($mensaje){
			return '<div class="alert alert-info block"><a class="close">×</a><strong>Aviso: </strong> '.$mensaje.'</div>';
		}
		public static function success($mensaje){
			return '<div class="alert alert-success block"><a class="close">×</a><strong>Felicitaciones: </strong> '.$mensaje.'</div>';
		}
	}