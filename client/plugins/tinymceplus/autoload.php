<?php

function thelia_kc_autoload($class)
{
    $kcfinder_dir = realpath(dirname(__FILE__)) . '/kcfinder/';
    if ($class == "uploader")
        require $kcfinder_dir . "core/uploader.php";
    elseif ($class == "browser")
        require $kcfinder_dir . "core/browser.php";
    elseif (file_exists($kcfinder_dir . "core/types/$class.php"))
        require $kcfinder_dir . "core/types/$class.php";
    elseif (file_exists($kcfinder_dir . "lib/class_$class.php"))
        require $kcfinder_dir . "lib/class_$class.php";
    elseif (file_exists($kcfinder_dir . "lib/helper_$class.php"))
        require $kcfinder_dir . "lib/helper_$class.php";
}

spl_autoload_register('thelia_kc_autoload');