<<<<<<< HEAD
<?php 
    require_once "../config.php";







// connexion à la DB
try {
    // création d'une instance de PDO - Connexion à la base de données
    $db = new PDO(MY_DB_DRIVER . ":host=" . MY_DB_HOST . ";dbname=" . MY_DB_NAME . ";charset=" . MY_DB_CHARSET . ";port=" . MY_DB_PORT, MY_DB_LOGIN, MY_DB_PWD);
} catch (Exception $e) {
    die($e->getMessage());
}


$sql = "SELECT * FROM news INNER JOIN user ON news.idnews = user.iduser"; // requête non exécutée

$query = $db->query($sql); // exécution de la requête de type SELECT avec query()

while($item = $query->fetch(PDO::FETCH_ASSOC)){
    echo "<h1>$item[login]</h1>";
    echo "<h3>$item[content]</h3>";
}




$db = null;
=======
<?php

require_once("../config.php");
>>>>>>> fb50f2b36ea71d4137521a6a8eea52af47f03add
