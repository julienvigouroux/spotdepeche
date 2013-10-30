<?php

	session_start();

	$page = "index";
	require("etapes.php");

	header("Content-type: text/html; charset=utf-8");

	$titre_page = "ETAPE 1";

	include(__DIR__."/entete.php");
?>

<div id="chapeau"style="overflow:hidden;zoom: 1">

    <?php if (version_compare(PHP_VERSION, '5.3.0', '<')) { ?>

 		<h2>Thelia ne peut pas fonctionner sur ce serveur</h2>
    	<br />
		<span class="erreur">Pour installer Thelia, vous devez disposer de PHP version 5.3.0 au minimum</span>

		<p>Votre serveur utlise PHP version <?php echo PHP_VERSION ?>. Merci de mettre à niveau votre serveur pour poursuivre l'installation.</p>
	<?php
	}
	else if(! file_exists("../classes/Cnx.class.php")) {
		$_SESSION['etape']=1;
		?>
		<h2>Installation de Thelia</h2>
		<br />

		Bienvenue au sein du programme d'installation de Thelia.<br />
		Nous allons vous guider tout au long de ce processus afin d'installer l'application sur votre système.<br /><br />

		<form action="verifications.php" method="post">
			<input type="submit" value="Continuer" />
		</form>
		<?php
	}
	else {
	?>

	<h2>Mise à jour de Thelia</h2>
	<br />
	Bienvenue au sein du programme de mise à jour de Thelia.<br /><br />

	<form action="maj.php" method="post">
		<input type="submit" value="Continuer" />
	</form>

	<?php }	?>

</div>

<?php include(__DIR__."/pied.php"); ?>