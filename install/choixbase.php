<?php
	session_start();

	$page = "choixbase";
	require("etapes.php");

	header("Content-type: text/html; charset=utf-8");

	if (isset($_POST['serveur']) && isset($_POST['utilisateur'])  && isset($_POST['motdepasse'])){

				$_SESSION['serveur'] = $_POST['serveur'];
				$_SESSION['utilisateur'] = $_POST['utilisateur'];
				$_SESSION['motdepasse'] = $_POST['motdepasse'];

		if(! $cnx = @mysql_connect($_SESSION['serveur'], $_SESSION['utilisateur'], $_SESSION['motdepasse'])){

			$vars = array('serveur', 'utilisateur');

			$url = "bdd.php?err=1";

			foreach($vars as $var) {
				$url .= "&$var=" . urlencode($_POST[$var]);
			}

			rediriger($url);

		} else {

			$config_file = "../client.orig/config_thelia.php";

			if(file_exists($config_file)){

				$fic = file_get_contents($config_file);

				$fic = str_replace("votre_serveur", $_SESSION['serveur'], $fic);
				$fic = str_replace("votre_login_mysql", $_SESSION['utilisateur'], $fic);
				$fic = str_replace("votre_motdepasse_mysql",  $_SESSION['motdepasse'], $fic);

				file_put_contents($config_file, $fic);

				$_SESSION['etape']=3;

				$droitscreation=false;
			}

			// Mettre en place le Cnx.class.php définitif, en effaçant le précédent.
			$cnxfile = "../classes/Cnx.class.php";

			if (file_exists("$cnxfile.orig")) {
				@unlink($cnxfile);
				rename("$cnxfile.orig", "$cnxfile");
			}
		}
	}
	elseif($_SESSION['etape']>=3) {
            
            mysql_connect($_SESSION['serveur'], $_SESSION['utilisateur'], $_SESSION['motdepasse']);
        }
        else {
		rediriger("bdd.php?err=1");
	}

	$titre_page = "ETAPE 4";

	include(__DIR__."/entete.php");
?>
<div id="chapeau"style="overflow:hidden;zoom: 1">

	<h2>Choix de la base</h2>

	<br />

	<form action="configuration.php" method="post">
		Veuillez choisir votre base de données. <br /><br />

		<?php
		$selection=false;

		$listbdd = @mysql_list_dbs();

		if($listbdd) {

			while($row = mysql_fetch_object($listbdd)) {

				// Ne pas permettre l'installation dans information_schema
				if ($row->Database == 'information_schema') continue;

				mysql_select_db($row->Database);

				$querylstable = "show tables";
				$resullstable = mysql_query($querylstable);

				$trouve = false;

				while($resullstable && $rowlstable = mysql_fetch_array($resullstable))
					if(strstr($rowlstable[0], "produitdesc"))
						$trouve = true;

				if (! $trouve && ! $selection) {
						$selection = true;
						$checked = 'checked="checked"';
				}
				else {
						$checked = '';
				}

				?>
				<input type="radio" name="choixbase" value="<?php echo $row->Database; ?>"  <?php echo $checked; ?> <?php if($trouve) echo 'disabled="disabled"'; ?>  />
				<?php echo $row->Database; ?>
				<?php if($trouve) { ?> (THELIA est déjà installé dans cette base.)<?php } ?>
				<br />

				<?php
			}
		}
		else {
		?>
			<input type="text" name="choixbase" />
			<?php if(isset($_GET['err']) && $_GET['err']) { ?>
			<span class="erreur">(vous n'avez pas accés à cette base)</span>
			<?php } ?>
			<br />

		<?php
		}

		try {
			$connexion = mysql_connect($_SESSION['serveur'], $_SESSION['utilisateur'],$_SESSION['motdepasse']);
			$db = mysql_select_db("information_schema");

			$req = mysql_query("SELECT COUNT( * ) FROM  `USER_PRIVILEGES`
				WHERE PRIVILEGE_TYPE =  'CREATE'
				AND GRANTEE LIKE  '%".$_SESSION['utilisateur']."%'
				AND IS_GRANTABLE =  'YES';");

			$data = mysql_fetch_array($req);

			mysql_free_result($req);

			mysql_close($connexion);

			if($data[0]>0)
				$droitscreation=true;
		}
		catch(Exception $e) {
		}
		?>

		<br />
		<?php if(isset($droitscreation) && $droitscreation==true) {?>
			Vous pouvez aussi choisir de cr&eacute;er une base : <input type="text" name="creerbase" />
			<br />
		<?php }?>
		<input type="submit" value="Continuer" />
	</form>
</div>

<?php
include(__DIR__."/pied.php");
?>