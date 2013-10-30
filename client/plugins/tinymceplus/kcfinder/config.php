<?php

/** This file is part of KCFinder project
  *
  *      @desc Base configuration file
  *   @package KCFinder
  *   @version 2.21
  *    @author Pavel Tzonkov <pavelc@users.sourceforge.net>
  * @copyright 2010 KCFinder Project
  *   @license http://www.opensource.org/licenses/gpl-2.0.php GPLv2
  *   @license http://www.opensource.org/licenses/lgpl-2.1.php LGPLv2
  *      @link http://kcfinder.sunhater.com
  */

// IMPORTANT!!! Do not remove uncommented settings in this file even if
// you are using session configuration.
// See http://kcfinder.sunhater.com/install for setting descriptions
$thelia_base = realpath(dirname(__FILE__)."/../../../../");

if(file_exists($thelia_base."/fonctions/error_reporting.php"))
{
    require_once $thelia_base."/fonctions/error_reporting.php";
}

include_once("$thelia_base/classes/Variable.class.php");

require_once realpath(dirname(__FILE__)) . "/../autoload.php";

// Trouver l'URL absolue
$urlsite = new Variable();
$urlsite->charger("urlsite");

$baseurl = rtrim('/' . preg_replace('!http://[^\/]+/?!', '', $urlsite->valeur), '/');

$_CONFIG = array(


    'disabled' => true,
    'readonly' => true,
    'denyZipDownload' => true,

    'theme' => "oxygen",

    'uploadURL' => "$baseurl/client/gfx/utilisateur",
    'uploadDir' => "$thelia_base/client/gfx/utilisateur",

    'dirPerms' => 0755,
    'filePerms' => 0644,

    'deniedExts' => "exe com msi bat php cgi pl",

	'types' => array(
	    'file'   =>  "",
	    'flash'  =>  "swf flv avi mpg mpeg qt mov wmv asf rm",
	    'image'  =>  "*img",
	),

    'mime_magic' => "",

    'maxImageWidth' => 0,
    'maxImageHeight' => 0,

    'thumbWidth' => 100,
    'thumbHeight' => 100,

    'thumbsDir' => ".thumbs",

    'jpegQuality' => 90,

    'cookieDomain' => "",
    'cookiePath' => "",
    'cookiePrefix' => 'KCFINDER_',

    // THE FOLLOWING SETTINGS CANNOT BE OVERRIDED WITH SESSION CONFIGURATION

    '_check4htaccess' => true,
    '_tinyMCEPath' => "$baseurl/client/plugins/tinymceplus",

    '_sessionVar' => &$_SESSION['KCFINDER'],
    //'_sessionLifetime' => 30,
    //'_sessionDir' => "/full/directory/path",

    //'_sessionDomain' => ".mysite.com",
    //'_sessionPath' => "/my/path",
);

?>