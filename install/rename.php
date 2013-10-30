<?php
	include(__DIR__."/entete.php");

	$nom = str_replace('..', '', $nom);
	$nom_ren = str_replace('..', '', $nom_ren);
?>
<div id="chapeau"style="overflow:hidden;zoom: 1">
<h2>Renommer un dossier</h2>
	<br />
	Le <?php echo $objet ?> <strong><?php echo $nom ?></strong> n'est pas accessible en écriture, et ne peut pas
	être renommé automatiquement.
	<br />
	<br />
	Veuillez utiliser votre client FTP pour renommer manuellement <strong><?php echo $nom ?></strong> en <strong><?php echo $nom_ren ?></strong>, puis
	cliquer sur continuer.

	<br /><br />

	<button style="clear: both; float: left;" onclick="window.location.reload()">Continuer</button>
</div>

<?php include(__DIR__."/pied.php"); ?>