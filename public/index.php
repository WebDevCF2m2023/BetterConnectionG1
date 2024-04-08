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

// router temporaire
if(isset($_GET['section'])){

        // récupération/ protection de la variable slug de category
        $categ = htmlspecialchars(strip_tags(trim($_GET['section'])),ENT_QUOTES);

        // chargement de la catégorie via le slug
        $category = getCategoryBySlug($db,$categ);

        // si on récupère du texte
        if(is_string($category)){
            // on a une erreur SQL, on peut l'afficher (pas nécessaire)
            $message = $category;
        // si on récupère false, la rubrique n'existe pas    
        }elseif($category===false){
            $message = "Rubrique inconnue";
            include_once "../view/404.view.php";
            // Fermeture de connexion
            $db = null;
            // arrêt du script
            exit();
        }

        // Chargement des news de la catégorie actuelle via son Slug
        $newsIntoSection = getNewsFromCategorySlug($db, $categ);

        if(empty($newsIntoSection)){
            $message = "Pas encore d'article dans cette section";
        }

        // var_dump($category);
        /*
        Appel de la vue
        */
        include_once "../view/section.view.php";
}else{
/*
homepage
*/
        

        // chargement des news pour la page d'accueil
        $newsHomepage = getAllNewsHomePage($db);

        // var_dump($menuSlug);
        // var_dump($newsHomepage);

        /*
        Appel de la vue
        */
        include_once "../view/homepage.view.php";
}

// Fermeture de connexion
$db = null;