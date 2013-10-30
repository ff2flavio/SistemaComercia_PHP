<?php
	$rol_data = '<div class="well cont" style="padding:8px 0"><ul class="nav nav-list"><li class="nav-header">Roles habilitados al usuario</li>';
		while($reg = $roles->fetchObject()){
			$rol_data .= '<li><a href="rol?idrol='.$reg->idrol.'">'.$reg->detalle.'</a></li>';
		}
	$rol_data .= '</ul></div>';
	echo $rol_data;