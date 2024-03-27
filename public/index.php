<?php

<<<<<<< HEAD
require_once '../config.php';


try {
    $MyPDO = new PDO(DB_DRIVER . ":host=" . DB_HOST . ";dbname=" . DB_NAME . ";port=" . DB_PORT . ";charset=" . DB_CHARSET,DB_LOGIN, DB_PWD);
    
    $query = "SELECT news.*, user.* FROM news LEFT JOIN user ON news.user_iduser  = user.iduser";
    $statement = $MyPDO->query($query);
    
    echo "<h1>Liste des articles</h1>";
    echo "<ul>";
    while ($row = $statement->fetch(PDO::FETCH_ASSOC)) {
        echo "<li>" . $row['title'] . " - Auteur: " . ($row['nom_auteur'] ?? "Inconnu") . "</li>";
    }
    echo "</ul>";
} catch (PDOException $e) {
    echo "Erreur de connexion : " . $e->getMessage();
}
=======
require_once("../config.php");
>>>>>>> fb50f2b36ea71d4137521a6a8eea52af47f03add
