<?php
	session_start();

	$page = "bdd";
	require("etapes.php");

	header("Content-type: text/html; charset=utf-8");

	$params = array(
		'serveur' => '',
		'utilisateur' => ''
	);

	foreach($params as $var => $defaut) {
		$$var = isset($_REQUEST[$var]) ? $_REQUEST[$var] : $defaut;
	}

	$titre_page = "ETAPE 3";

	include(__DIR__."/entete.php");
?>
<div id="chapeau"style="overflow:hidden;zoom: 1">
<h2>Connexion &agrave; la base de données</h2>

	<br />
	Nous allons installer les informations nécessaires en base de données.<br /><br />

	Nous allons pour cela vous demander différentes informations. <br /><br />

	<?php if(isset($_GET['err']) && $_GET['err']) { ?>
		<span class="erreur">Erreur ! Veuillez vérifier vos informations de connexion</span>
	<?php } ?>
	<form action="choixbase.php" method="post">

	<div class="col">Serveur MySQL :</div>
	<div class="col"><input type="text" name="serveur" size="30" value="<?php echo $serveur; ?>"/></div>
	<div class="col">Nom d'utilisateur :</div>
	<div class="col"><input type="text" name="utilisateur" size="30" value="<?php echo $utilisateur; ?>"/></div>
	<div class="col">Mot de passe :</div>
	<div class="col"><input type="password" name="motdepasse" size="30" autocomplete="off" /></div>

	<div class="col">&nbsp;</div>

	<br /><br />

	<input style="clear: both; float: left;" type="submit" value="Continuer" /></a>

	</form>
</div>

<?php include(__DIR__."/pied.php"); ?>