<?php
	session_start();

	$page = "configuration";

	require("etapes.php");

	$titre_page = "ETAPE 5";

	$err = isset($_GET['err']) && $_GET['err'];

	header("Content-type: text/html; charset=utf-8");

	if (! $err) {
		mysql_connect($_SESSION['serveur'], $_SESSION['utilisateur'], $_SESSION['motdepasse']);
		mysql_query("SET NAMES UTF8");

		if(isset($_POST['choixbase']))
			$_SESSION['choixbase'] = $_POST['choixbase'];

		// est ce que l'utilisateur a demande a creer une nouvelle base ?
		if(isset($_POST['creerbase']) && $_POST['creerbase'] != "")
		{
			$base=$_POST['creerbase'];
			mysql_query("CREATE DATABASE ".$base); // mysql_create_db est deprecated
			mysql_select_db($base);
			$_SESSION['choixbase'] = $base;
		}

		else if( ! isset($_SESSION['choixbase']) || ! mysql_select_db($_SESSION['choixbase']))
			{ rediriger("choixbase.php?err=1"); }


		$query = "ALTER DATABASE " . $_SESSION['choixbase'] . " CHARACTER SET utf8;";
		$resul = mysql_query($query);

		$sql = file_get_contents("thelia.sql");
		$sql = str_replace(";',", "-CODE-", $sql);

		$tab = explode(";", $sql);

		for($i=0; $i<count($tab); $i++){
			$query = str_replace("-CODE-", ";',", $tab[$i]);
			$query = str_replace("|", ";", $query);
			mysql_query($query);
		}

		// le fichier de config est renseigne avec le nom de la base creee/selectionnee
		$config_file = "../client.orig/config_thelia.php";

		if (file_exists($config_file)) {

			$fic = file_get_contents($config_file);

			$fic = str_replace("bdd_sql", $_SESSION['choixbase'], $fic);

			file_put_contents($config_file, $fic);
		}

		if( file_exists("../client.orig")) {
			rename_securise("../client.orig", "../client", 'dossier');
		}

		if( file_exists("../template.orig")) {
			rename_securise("../template.orig", "../template", 'dossier');
		}

		// Mettre en place le Cnx.class.php définitif, en effaçant le précédent.
		$cnxfile = "../classes/Cnx.class.php";

		if (file_exists("$cnxfile.orig")) {
			@unlink($cnxfile);
			rename_securise("$cnxfile.orig", "$cnxfile", 'fichier');
		}
	}

	require_once("../fonctions/divers.php");
	require_once("../classes/Variable.class.php");

	$params = array(
		'utilisateur' => 'admin',
		'nomadmin' => "admin_" . genpass(10),
		'emailcontact' => Variable::lire('emailcontact'),
		'nomsite' => Variable::lire('nomsite'),
		'urlsite' => "http://" . $_SERVER['SERVER_NAME']
	);

	foreach($params as $var => $defaut) {
		$$var = isset($_REQUEST[$var]) ? $_REQUEST[$var] : $defaut;
	}

	$_SESSION['etape']=4;

	include(__DIR__."/entete.php");
?>
<div id="chapeau"style="overflow:hidden;zoom: 1">
<h2>Configuration</h2>

	<form action="modules.php" method="post">

	<br />

	Passons &agrave; la configuration de Thelia <br /><br />

	<?php if($err) { ?>

		<span class="erreur">Veuillez v&eacute;rifier votre nom d'utilisateur/mot de passe</span>

	<?php } ?>

	<div class="col">Nom d'utilisateur (administration) :</div>
	<div class="col"><input type="text" name="utilisateur" value="<?php echo $utilisateur; ?>" size="30" /></div>

	<div class="col">Mot de passe :</div>
	<div class="col"><input type="password" name="motdepasse1" size="30" /></div>

	<div class="col">Re-saisie du mot de passe :</div>
	<div class="col"><input type="password" name="motdepasse2" size="30" /></div>

	<div class="col">Nom du répertoire d'admin :</div>
	<div class="col"><input type="text" name="nomadmin" size="30"  value="<?php echo $nomadmin; ?>"/></div>

	<div class="col">E-Mail de contact :</div>
	<div class="col"><input type="text" name="emailcontact" value="<?php echo $emailcontact; ?>" size="30" /></div>

	<div class="col">Nom du site :</div>
	<div class="col"><input type="text" name="nomsite" value="<?php echo $nomsite; ?>" size="30" /></div>

	<div class="col">Adresse du site :</div>
	<div class="col"><input type="text" name="urlsite" value="<?php echo $urlsite; ?>" size="30" /></div>

	<div class="col">&nbsp;</div>
	<br /><br />
	<input style="clear: both; float: left;" type="submit" value="Continuer" />
 </form>

</div>
<?php
	include(__DIR__."/pied.php");
?>