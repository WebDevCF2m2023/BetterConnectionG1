<?php
/*

Contrôleur frontal

*/

/*
chargement des dépendances
*/

require_once("../config.php");
require_once("../model/CategoryModel.php");
require_once("../model/NewsModel.php");

/*
Connexion PDO
*/
try {
    // instanciation de la connexion PDO
    $db = new PDO(DB_DRIVER . ":host=" . DB_HOST . ";dbname=" . DB_NAME . ";charset=" . DB_CHARSET . ";port=" . DB_PORT, DB_LOGIN, DB_PWD);

    // on met l'attribut en FETCH_ASSOC
    $db->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE,PDO::FETCH_ASSOC);

} catch (Exception $e) {
    // Gestion de l'erreur
    die($e->getMessage());
}

// chargement des catégories pour le menu
$menuSlug = getAllCategoriesBySlug($db);

// chargement des news pour la page d'accueil
$newsHomepage = getAllNewsHomePage($db);

// var_dump($menuSlug);
var_dump($newsHomepage);

/*
Appel de la vue
*/
include_once "../view/homepage.view.php";

// Fermeture de connexion
$db = null;