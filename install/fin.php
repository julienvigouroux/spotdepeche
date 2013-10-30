<?php
	session_start();

	$page = "fin";

	require("etapes.php");
	
	$titre_page = "Fin de l'installation";

	header("Content-type: text/html; charset=utf-8");
        
        if($_SESSION['etape'] == 5) {
            require_once(__DIR__ . '/../lib/pclzip.lib.php');
            require_once(__DIR__ . '/../classes/actions/ActionsModules.class.php');
            require_once(__DIR__ . '/' . $_SESSION['rep_admin'] . '/actions/ActionsAdminModules.class.php');
            
            $_SESSION['rapportInstallModules'] = array();
            
            $repertoirePlugin =__DIR__ . "/../client/plugins/";
            $lienModules = (isset($_REQUEST['modules']))?$_REQUEST['modules']:array();
            foreach($lienModules as $lienModule) {
                $nomModule = substr($lienModule, strrpos($lienModule, '/')+1, strrpos($lienModule, '.zip')-strrpos($lienModule, '/')-1);
                if($fichierModule = file_get_contents($lienModule)) {
                    file_put_contents($repertoirePlugin . $nomModule . '.zip', $fichierModule);
                    
                    $archive = new PclZip($repertoirePlugin . $nomModule . '.zip');

                    $resul = $archive->extract(PCLZIP_OPT_PATH, $repertoirePlugin);
                    
                    @unlink($repertoirePlugin . $nomModule . '.zip');

                    if ($resul == 0) {
                        $_SESSION['rapportInstallModules'][] = "Echec à l'installation du module $nomModule. Vous devrez l'installer manuellement.";
                    }
                    elseif(isset($_REQUEST['active_' . $nomModule]) && $_REQUEST['active_' . $nomModule]==1) {
                        /*le module doit être activé*/
                        ActionsAdminModules::instance()->mettre_a_jour();
                        ActionsAdminModules::instance()->activer($nomModule);
                        $_SESSION['rapportInstallModules'][] = "Module $nomModule installé et activé.";
                    }
                    else {
                        $_SESSION['rapportInstallModules'][] = "Module $nomModule installé.";
                    }
                }
            }
        }
        
	$_SESSION['etape'] = 6;
	
	include(__DIR__."/entete.php");
?>
<div id="chapeau"style="overflow:hidden;zoom: 1">
<h2>Fin de l'installation</h2>

<br />

	Thelia est installé avec succès.
	<br />&nbsp;<br />
        <?php echo implode('<br />', $_SESSION['rapportInstallModules']); ?>
        <br />&nbsp;<br />
	Vous pouvez maintenant vous connecter sur l'interface d'administration.

	<br /><br />

	<span class="erreur">Pensez à supprimer le répertoire <strong>install</strong> de votre serveur !</span>

	<br /><br />

	<form action="<?php echo $_SESSION['rep_admin'] ?>/index.php" method="post">
            <input type="submit" value="Continuer" />
	</form>
</div>

<?php
	include(__DIR__."/pied.php");
?>
