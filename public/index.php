<?php
require_once "../config.php";

try {
    $MyDB = new PDO(MY_DB_DRIVER . ":host=" . MY_DB_HOST . ";dbname=" . MY_DB_NAME . ";port=" . MY_DB_PORT . ";charset=" . MY_DB_CHARSET, MY_DB_LOGIN, MY_DB_PWD);
} catch (Exception $e) {
    die($e->getMessage());
}

function getNews (PDO $db) 
{
    $sql = "SELECT `news`.`title`, `news`.`date_created`, `user`.`login`, `user`.`thename`
	FROM `news`
	LEFT JOIN `user`
		ON `news`.`user_iduser` = `user`.`iduser`";
    $query = $db->query($sql);
    $result = $query->fetchAll(PDO::FETCH_ASSOC);
    $query->closeCursor();
    return $result;
} 

$news = getnews($MyDB);

foreach ($news as $new) :
echo $new["thename"], $new["title"] ."<br>"; 
endforeach;

$MyDB = null;