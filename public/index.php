<?php
<<<<<<< HEAD
//Contrôleur frontal


//Chargement des dépendances

require_once("../config.php");

//Connexion PDO

try {
    //Instanciation de la connexion PDO
    $db = new PDO(MY_DB_DRIVER . ":host=" . MY_DB_HOST . ";dbname=" . MY_DB_NAME . ";port=" . MY_DB_PORT . ";charset=" . MY_DB_CHARSET, MY_DB_LOGIN, MY_DB_PWD);

    // on mets l'attribut en fetch_assoc
    $db->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE,PDO::FETCH_ASSOC);
} catch (Exception $e) {
    die($e->getMessage());
}


//Appel de la vue 

include_once "../view/homepageview.php";

//Fermeture de connexion

=======
/*

Contrôleur frontal

*/

/*
chargement des dépendances
*/

require_once("../config.php");

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

/*
Appel de la vue
*/
include_once "../view/homepage.view.php";

// Fermeture de connexion
>>>>>>> fe2331ba564ea906903e0fb978e219c3841b4c8f
$db = null;