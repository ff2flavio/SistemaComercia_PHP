			</section>
			<footer class="footer">
				<?php echo isset($_SESSION["login"]["status"]) && $_SESSION["login"]["status"] ? 'Bienvenido al sistema, <span style="color:#fff">'.$_SESSION['login']['nombre'].'</span>. &nbsp;&nbsp;|&nbsp;&nbsp; <a href="salir">Cerrar sesión</a> &nbsp;&nbsp;|&nbsp;&nbsp; &copy; ' .$pg["sis"]["footer"] : ''; ?>
			</footer>
		</section>
		<?php foreach ($pg["sis"]["js"] as $key => $value) { echo '<script id="'.$key.'" src="'.$value. '"></script>'; } ?>
		<?php
			if(isset($_GET["pag"]) && !empty($_GET["pag"]) && is_string($_GET["pag"]) && isset($_GET["sub"]) && !empty($_GET["sub"]) && is_string($_GET["sub"])){
				PG::include_js('./modules/'.$_GET["pag"].'/javascript/'.$_GET["sub"].'.mantenimiento.js');
			}
		?>
		<div id="loader"><div class="well"></div></div>
	</body>
</html>