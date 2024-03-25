<?php

require_once "../config.php";

try{
    $MyBeautifulPDO = new PDO(DB_DRIVER.":host=".DB_HOST.";dbname=".DB_NAME.";port=".DB_PORT.";charset=".DB_CHARSET, DB_LOGIN, DB_PWD);
}catch(Exception $e){
    die($e);
}

function getThemArticles(PDO $db) {

$sql = "SELECT ALL * FROM `category`";
$query = $db->query($sql);
$result = $query-fetchAll(PDO::FETCH_ASSOC);
$query->closeCursor();

return $result;

}

function WeShallSeeThemArticles(PDO $db) {
    
}