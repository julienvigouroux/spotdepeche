<?php
	session_start();

	$page = "verifications";
	require("etapes.php");

	header("Content-type: text/html; charset=utf-8");

	$titre_page = "ETAPE 2";

	include(__DIR__."/entete.php");
?>

<div id="chapeau"style="overflow:hidden;zoom: 1">

<?php $verification = 1; ?>

<h2>V&eacute;rification de la configuration syst&egrave;me</h2>

	<form action="bdd.php" method="post">

	<br />

	Nous allons v&eacute;rifier la pr&eacute;sence des librairies n&eacute;cessaires <br /><br />

    <?php
		if ( ! function_exists ("imagefilledarc")) {
			$verification = 0;
	?>
	<span class="erreur">Veuillez installer/activer la librairie GD</span>
	<br /><hr /><br />
	<?php
	    } else {
	?>
		<span class="valide">Les librairies n&eacute;cessaires sont pr&eacute;sentes.</span>
		<br /><hr /><br />

	<?php
		}
	?>
	Nous allons v&eacute;rifier certains droits sur les fichiers et les r&eacute;pertoires <br />
    &nbsp;<br />

	<?php
		$erroot = 0;

		$racine = "../";

		$files = array(
			$racine,
			"../admin",
			"../lib",
			"../fonctions",
			"../classes",
			"../client.orig",

			"../classes/Cnx.class.php.orig",

			"../client.orig/cache",
			"../client.orig/cache/contenu",
			"../client.orig/cache/dossier",
			"../client.orig/cache/flux",
			"../client.orig/cache/parseur",
			"../client.orig/cache/produit",
			"../client.orig/cache/rubrique",

			"../client.orig/commande",
			"../client.orig/document",
			"../client.orig/plugins",
			"../client.orig/gfx",
			"../client.orig/gfx/photos",
			"../client.orig/gfx/photos/produit",
			"../client.orig/gfx/photos/rubrique",
			"../client.orig/gfx/photos/contenu",
			"../client.orig/gfx/photos/dossier",
			"../client.orig/gfx/utilisateur",
			"../client.orig/gfx/utilisateur/Image",
			"../client.orig/gfx/utilisateur/Flash",
			"../client.orig/config_thelia.php"
		);

		// On ajoute Cnx.class.php uniquement s'il existe (improbable, mais on ne sait jamais)
		if (file_exists("../classes/Cnx.class.php")) $files[] = "../classes/Cnx.class.php";

	?>

	<?php
	foreach($files as $file) {

		if(! is_writable($file)) {

			$obj = is_dir($file) ? 'r&eacute;pertoire' : 'fichier';
			?>
			<span class="erreur">Le <?php echo $obj ?> <?php echo str_replace('..', '', $file) ?> n'est pas accessible en &eacute;criture</span><br />
			<?php
			// On permet que la racine ne soit pas writable (cas traité plus tard, sur le rename
			// de client.orig, template.orig et admin), mais pas les autres.
			if ($file == $racine)
				$erroot = 1;
			else
				$verification = 0;
		}
	}
	?>
	<br />
	<?php
		if($verification){
			$_SESSION['etape']=2;
	?>

		<span class="valide">Les droits sont corrects.
		<?php if ($erroot) { ?>
			Néanmoins, il vous sera demandé de renommer manuellement (avec votre client FTP par exemple) certains des dossiers d'installation.
		<?php } ?>
		</span>
		<br /><br />
		<input type="submit" value="Continuer" />

	<?php

		} else {
	?>

		<input type="button" value="Recharger" onclick="location='verifications.php'" />

	<?php
		}
	?>

 </form>

</div>

<?php include(__DIR__."/pied.php"); ?>

