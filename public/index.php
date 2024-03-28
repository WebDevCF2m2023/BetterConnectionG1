<?php
//Contrôleur frontal


//Chargement des dépendances

require_once("../config.php");
require_once("../model/CategoryModel.php");
require_once("../model/NewsModel.php");

try {
    //Instanciation de la connexion PDO
    $db = new PDO(MY_DB_DRIVER . ":host=" . MY_DB_HOST . ";dbname=" . MY_DB_NAME . ";port=" . MY_DB_PORT . ";charset=" . MY_DB_CHARSET, MY_DB_LOGIN, MY_DB_PWD);

    // on mets l'attribut en fetch_assoc
    $db->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE,PDO::FETCH_ASSOC);
} catch (Exception $e) {
    die($e->getMessage());
}


// chargement des catégories pour le menu
$menuSlug = getAllCategoriesBySlug($db);
$news = getAllNews($db);

// var_dump($menuSlug);

/*
Appel de la vue
*/
include_once "../view/homepage.view.php";

//Fermeture de connexion

$db = null;