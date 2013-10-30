<?php
	// Mettre à true pour debugger la procedure d'install
	define ('DEBUG_INSTALL_THELIA', false);
        
        //Mettre à true pour désactiver l'appel à la fonction error_reporting
        define ('DEBUG_INSTALL_REPORTING', false);

	if (DEBUG_INSTALL_THELIA) {
		echo "<pre>";
		echo "page=$page, etape=".$_SESSION['etape']."\n";
		print_r($_REQUEST);
		print_r($_SESSION);
		echo "</pre>";
	}
        
        if(! DEBUG_INSTALL_REPORTING){
            include_once __DIR__ . '/../fonctions/error_reporting.php';
        }

	function rediriger($page) {

		if (DEBUG_INSTALL_THELIA)
			echo "<a href=\"$page\">Redirection vers $page</a>";
		else
			header("Location: $page");

		exit;
	}

	function rename_securise($source, $dest, $type /* fichier ou dossier */) {

		global $titre_page;

		if (! @rename($source, $dest)) {

			$object = "dossier";
			$nom = $source;
			$nom_ren = $dest;

			include(__DIR__."/rename.php");

			exit();
		}
	}

	if (! isset($_SESSION['etape']) && $page != "index"){
		rediriger("index.php");
	}

	if(isset($page) && isset($_SESSION['etape']))

		switch($page)
		{
			case 'index':
                            if($_SESSION['etape'] > 1)
                                rediriger("verifications.php");
                            break;
			case 'verifications':
                            if($_SESSION['etape'] > 2)
                                rediriger("bdd.php");
                            break;
			case 'bdd':
                            if($_SESSION['etape'] < 2)
                                rediriger("index.php");
                            elseif($_SESSION['etape'] > 2)
                                rediriger("choixbase.php");
                            break;
			case 'choixbase':
                            if($_SESSION['etape'] < 2)
                                rediriger("index.php");
                            elseif($_SESSION['etape'] > 3)
                                rediriger("configuration.php");
                            break;
			case 'configuration':
                            if($_SESSION['etape'] < 3)
                                rediriger("index.php");
                            elseif($_SESSION['etape'] > 4)
                                rediriger("modules.php");
                            break;
                        case 'modules':
                            if($_SESSION['etape'] < 4)
                                rediriger("index.php");
                            elseif($_SESSION['etape'] > 5)
                                rediriger("fin.php");
                            break;
                        case 'fin':
                            if($_SESSION['etape'] < 5)
                                rediriger("index.php");
                            break;

		}
?>
