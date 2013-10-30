<div id="entete">
	<div class="logo">
		<a href="accueil.php"><img src="gfx/thelia_logo.jpg" alt="THELIA solution e-commerce" /></a>
	</div>
	<dl class="Blocmoncompte">
		<dt><a href="index.php?action=deconnexion" ><?php echo trad('Deconnexion', 'admin'); ?></a></dt><dt> | </dt><dt><strong><?php echo($_SESSION["util"]->prenom); ?> <?php echo($_SESSION["util"]->nom); ?></strong> </dt>
	</dl>
	<div class="Blocversion">V <?php echo rtrim(preg_replace("/(.)/", "$1.", Variable::lire('version')), "."); ?></div>
</div>

<div id="menuGeneral">
	<div>
   		<ul id="menu">
	        <li><a href="accueil.php" <?php if($menu == "accueil") { ?>class="selected"<?php } ?>><?php echo trad('Accueil', 'admin'); ?></a></li>
	    </ul>
	   <ul class="separation_menu"><li>&nbsp;</li></ul>

	  <?php	if(est_autorise("acces_clients")){ ?>
	        <ul id="menu1">
		        <li><a href="client.php" <?php if($menu == "client") { ?>class="selected"<?php } ?>><?php echo trad('Clients', 'admin'); ?></a></li>
	        </ul>
	        <ul class="separation_menu"><li>&nbsp;</li></ul>
	  <?php } ?>
	  <?php	if(est_autorise("acces_commandes")){ ?>
	        <ul id="menu2">
  	        <li><a href="commande.php" <?php if($menu == "commande") { ?>class="selected"<?php } ?>><?php echo trad('Commandes', 'admin'); ?></a></li>
            </ul>
            <ul class="separation_menu"><li>&nbsp;</li></ul>
		  <?php } ?>
		  <?php	if(est_autorise("acces_catalogue")){ ?>
             <ul id="menu3">
            <li><a href="parcourir.php" <?php if($menu == "catalogue") { ?>class="selected"<?php } ?>><?php echo trad('Catalogue', 'admin'); ?></a></li>
            </ul>
            <ul class="separation_menu"><li>&nbsp;</li></ul>
		  <?php } ?>
		  <?php	if(est_autorise("acces_contenu")){ ?>
             <ul id="menu4">
            <li><a href="listdos.php" <?php if($menu == "contenu") { ?>class="selected"<?php } ?>><?php echo trad('Contenu', 'admin'); ?></a></li>
            </ul>
            <ul class="separation_menu"><li>&nbsp;</li></ul>
		  <?php } ?>
		  <?php	if(est_autorise("acces_codespromos")){ ?>
             <ul id="menu5">
            <li><a href="promo.php" <?php if($menu == "paiement") { ?>class="selected"<?php } ?>><?php echo trad('Codes_promos', 'admin'); ?></a></li>
            </ul>
            <ul class="separation_menu"><li>&nbsp;</li></ul>
		  <?php } ?>
		  <?php	if(est_autorise("acces_configuration")){ ?>
             <ul id="menu6">
            <li><a href="configuration.php" <?php if($menu == "configuration") { ?>class="selected"<?php } ?>><?php echo trad('Configuration', 'admin'); ?></a></li>
            </ul>
		  <?php } ?>
		  <?php	if(est_autorise("acces_modules")){ ?>
            <ul class="separation_menu"><li>&nbsp;</li></ul>
            <ul id="menu7">
			<li><a href="module_liste.php" <?php if($menu == "plugins") { ?>class="selected"<?php } ?>><?php echo trad('Modules', 'admin'); ?></a></li>
			</ul>
			<ul class="separation_menu"><li>&nbsp;</li></ul>
		  <?php } ?>
      	</div>
		  <?php	if(est_autorise("acces_rechercher")){ ?>
            <div id="moteur_recherche">
             <form action="recherche.php" method="post">
              <div class="bouton_recherche">
	         	<input type="image" src="gfx/icone_recherche.jpg" alt="Valider la recherche" />
	         </div>
             <div class="champs_recherche">
	         	<input type="text" name="motcle" value="<?php echo trad('Rechercher', 'admin'); ?>" class="zonerecherche" onClick="this.value=''" size="14" />
	         </div>

             </form>
            </div>
           <?php } ?>

</div>