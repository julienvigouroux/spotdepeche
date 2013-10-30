<?php
	session_start();
        require_once("../classes/Variable.class.php");
	$page = "modules";

	require("etapes.php");

	$titre_page = "Ajouter des modules";

	header("Content-type: text/html; charset=utf-8");

        if ($_SESSION['etape'] != 5 && (empty($_POST['utilisateur']) || empty($_POST['motdepasse1']) || ($_POST['motdepasse1'] != $_POST['motdepasse2']))) {

		$vars = array('utilisateur', 'nomadmin', 'emailcontact', 'nomsite', 'urlsite');

		$url = "configuration.php?err=1";

		foreach($vars as $var) {
			$url .= "&$var=" . urlencode($_POST[$var]);
		}

		rediriger($url);
	}

	if($_SESSION['etape'] == 4)
        {
            $rep_admin = "../".$_POST["nomadmin"];

            if (! is_dir($rep_admin)) rename_securise("../admin", $rep_admin, 'dossier');

            $_SESSION['rep_admin'] = $rep_admin;
            
            require_once("../classes/Administrateur.class.php");
            
            require_once("../classes/Lang.class.php");
            require_once("../fonctions/divers.php");

            $admin = new Administrateur();
            $admin->charger_id(1);

            $admin->identifiant=$_POST['utilisateur'];
            $admin->motdepasse=$_POST['motdepasse1'];
            $admin->profil = 1;

            $admin->crypter();
            $admin->maj();

            Variable::ecrire("emailcontact", $_POST['emailcontact']);
            Variable::ecrire("emailfrom", $_POST['emailcontact']);
            Variable::ecrire("emailscommande", $_POST['emailcontact']);
            Variable::ecrire("nomsite", $_POST['nomsite']);
            Variable::ecrire("urlsite", $_POST['urlsite']);

            $lang = new Lang();
            $query_cnx = "update $lang->table set url=\"" . rtrim($_POST['urlsite'], "/") . "\" where id=1";
            $resul_cnx = $lang->query($query_cnx);

            Variable::ecrire("rsspass", genpass(40));
        }
        
        $_SESSION['etape'] = 5;

	include_once(__DIR__ . "/entete.php");
        
        $parser = xml_parser_create('UTF-8');
        xml_parser_set_option($parser, XML_OPTION_CASE_FOLDING, 0);
        xml_parser_set_option($parser, XML_OPTION_SKIP_WHITE, 1);
        
        $xml = file_get_contents('http://thelia.net/spip.php?page=xml_modules_promus&var_mode=calcul');
        
        $values = array();
        $index = array();
        xml_parse_into_struct($parser, $xml, $values);
        
        $listeModules = false;
        $infosModule = false;
        $listeModulesPromus = array();
        foreach($values as $key => $node)
        {
            if($node['tag'] == 'modules' && $node['type'] == 'open' && $node['level'] == 1) {
                /*on a une liste de modules*/
                $listeModules = true;
                continue;
            }
            elseif($listeModules && !$infosModule && $node['tag'] == 'modules' && $node['type'] == 'close' && $node['level'] == 1) {
                /*fin de la liste de modules*/
                $listeModules = false;
                continue;
            }
            if(!$listeModules)
                continue;
            
            if($node['tag'] == 'module' && $node['type'] == 'open' && $node['level'] == 2) {
                /*on a les infos sur un module*/
                $infosModule = true;
                $infosModulePromu = array();
                continue;
            }
            elseif($infosModule && $node['tag'] == 'module' && $node['type'] == 'close' && $node['level'] == 2) {
                /*fin des infos sur un module*/
                $infosModule = false;
                $listeModulesPromus[$infosModulePromu['rubrique']][$infosModulePromu['niveau_promotion']][] = $infosModulePromu;
                continue;
            }
            if(!$infosModule)
                continue;
            
            if($node['type'] == 'complete' && $node['level'] == 3) {
                $infosModulePromu[$node['tag']] = $node['value'];
            }
        }
        
        xml_parser_free($parser);
        
        //print_r($listeModulesPromus);
?>
<style type="text/css">
img{display: block;}
.clear{clear: both}
#bloc_modules_principal{padding:0px; margin:0px;}
#bloc_modules_principal .colonne{padding:0px; margin:0px; float:left; width: 50%}
#bloc_modules_principal .colonne .bloc_rubrique{padding:10px 30px 10px 15px; margin:0px;}
#bloc_modules_principal .colonne .bloc_rubrique .titre_rubrique{padding:0px; margin:0px; text-transform: uppercase; font-weight: bold; color: #EC8000; font-family: "Arial"; font-size: 14px;}
#bloc_modules_principal .colonne .bloc_rubrique .titre_rubrique img.puce{display: inline; vertical-align: middle;}
#bloc_modules_principal .colonne .bloc_rubrique .bloc_module{padding:0px; margin:10px 0px 10px 0px; border-top: solid 1px #F8F8F8;}
#bloc_modules_principal .colonne .bloc_rubrique .bloc_module.first{border-top: none;}
#bloc_modules_principal .colonne .bloc_rubrique .bloc_module .titre_plugin{padding:0px; margin:3px 0px 0px 0px; color: #575756; font-family: "Arial"; font-size: 12px;}
#bloc_modules_principal .colonne .bloc_rubrique .bloc_module .titre_plugin img.derouleur{margin:0px; width:15px; float: right; cursor: pointer;}
#bloc_modules_principal .colonne .bloc_rubrique .bloc_module .titre_plugin img.star{margin:0px; display: inline; vertical-align: middle;}
#bloc_modules_principal .colonne .bloc_rubrique .bloc_module .description_plugin{padding:0px; margin:10px 0px 10px 0px; display: none; width: 100%}
#bloc_modules_principal .colonne .bloc_rubrique .bloc_module .description_plugin .gauche{padding:0px; margin:0px; float: left; width: 30%}
#bloc_modules_principal .colonne .bloc_rubrique .bloc_module .description_plugin .gauche img{margin:0px; border-right: solid 1px #F8F8F8; width: 100%}
#bloc_modules_principal .colonne .bloc_rubrique .bloc_module .description_plugin .droite{padding:0px; margin:0px; float: left; width: 60%;}
#bloc_modules_principal .colonne .bloc_rubrique .bloc_module .description_plugin .droite p{padding:0px; margin:10px;}
#bloc_modules_principal .colonne .bloc_rubrique .bloc_module .description_plugin .droite p.description1{color: #3C3C3B;}
#bloc_modules_principal .colonne .bloc_rubrique .bloc_module .description_plugin .droite p.description2{color: #EC8000;}

/*classe d'effet'*/
#bloc_modules_principal .colonne .bloc_rubrique .bloc_module .titre_plugin.est-deroule{}
#bloc_modules_principal .colonne .bloc_rubrique .bloc_module .titre_plugin.est-selection{font-weight: bold;}
</style>
<script type="text/javascript" src="../lib/jquery/jquery.js"></script>
<script type="text/javascript">
jQuery(function($)
{
    $('#bloc_modules_principal .colonne .bloc_rubrique .bloc_module .titre_plugin img.derouleur').click(function(e)
    {
        if($(this).parent().is('.est-deroule'))
        {
            /*on re enroule*/
            $(this).parent().removeClass('est-deroule');
            $(this).parent().parent().children('.description_plugin').hide(300, function()
            {
                $(this).parent().children('.titre_plugin').children('img.derouleur').attr('src', 'gfx/Bouton-plus.png');
            });
        }
        else
        {
            /*on déroule*/
            $(this).parent().addClass('est-deroule');
            $(this).parent().parent().children('.description_plugin').show(300, function()
            {
                $(this).parent().children('.titre_plugin').children('img.derouleur').attr('src', 'gfx/bouton-moins.png');
            });
        }
    });
    
    $('#bloc_modules_principal .colonne .bloc_rubrique .bloc_module .titre_plugin :checkbox.module_selecteur').change(function()
    {
        if($(this).is(':checked'))
        {
            $(this).parent().addClass('est-selection');
        }
        else
        {
            $(this).parent().removeClass('est-selection');
        }
    });
});
</script>
<div id="chapeau"style="overflow:hidden;zoom: 1">
<h2>Installation des modules</h2>

    <form action="fin.php" method="post">

        <br />
        Ajoutez des fonctionnalités à Thelia avec des modules :
        <br /><br />

        
        <div id="bloc_modules_principal">
            <div class="colonne">
<?php
$compteurRubrique = 0;
foreach($listeModulesPromus as $afficheRubrique => $afficheListeNiveaux)
{
    if($compteurRubrique == ceil(count($listeModulesPromus)/2))
    {
?>
            </div>
            <div class="colonne">
<?php
    }
?>
                <div class="bloc_rubrique">
                    <div class="titre_rubrique">
                        <img src="gfx/Puce-fleche-pivot-orange.png" class="puce" />
                        <?php echo $afficheRubrique; ?>
                    </div>
<?php
    krsort($afficheListeNiveaux);
    $compteurModule = 0;
    foreach($afficheListeNiveaux as $afficheNiveau => $afficheListeModules)
    {
        foreach($afficheListeModules as $afficheModule)
        {
            /*verification de la compatibilité*/
            if($afficheModule['thelia'])
            {
                $version_courante = rtrim(preg_replace("/(.)/", "$1.", Variable::lire('version')), ".");
                if(version_compare($version_courante, $afficheModule['thelia']) == -1)
                    continue;
            }
?>
                    <div class="bloc_module <?php echo ($compteurModule==0)?'first':''; ?>">
                        <div class="titre_plugin <?php echo($afficheModule['install_defaut']==1)?'est-selection':''; ?>">
                            <input type="checkbox" name="modules[]" value="<?php echo $afficheModule['lien']; ?>" class="module_selecteur" <?php echo($afficheModule['install_defaut']==1)?'checked="checked"':''; ?> />
<?php
if($afficheModule['install_active']==1)
{
?>
                            <input type="hidden" name="active_<?php echo substr($afficheModule['lien'], strrpos($afficheModule['lien'], '/')+1, strrpos($afficheModule['lien'], '.zip')-strrpos($afficheModule['lien'], '/')-1); ?>" value="1" />
<?php
}
?>
<?php
if($afficheNiveau==1)
{
?>
                            <img class="star" src="gfx/Icone-etoile.png" />
<?php
}
?>
                            <?php echo $afficheModule['nom']; ?>
                            <img class="derouleur" src="gfx/Bouton-plus.png" />
                            <div class="clear"></div>
                        </div>
                        <div class="description_plugin">
                            <div class="gauche">
                                <img src="<?php echo $afficheModule['logo']; ?>" />
                            </div>
                            <div class="droite">
                                <p class="description1">
                                    <?php echo $afficheModule['description']; ?>
                                </p>
                                <p class="description2">
                                    <?php echo $afficheModule['description_complementaire']; ?>
                                </p>
                            </div>
                            <div class="clear"></div>
                        </div>
                    </div>
<?php        
            $compteurModule++;
        }
    }
?>
                </div>
<?php
    $compteurRubrique++;
}
?>
            </div>
            <div class="clear"></div>
        </div>
        
        <input type="submit" value="Continuer" style="margin-top: 40px;" />
        
    </form>
</div>

<?php
	include(__DIR__."/pied.php");
?>
