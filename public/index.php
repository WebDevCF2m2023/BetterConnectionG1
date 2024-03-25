<?php
require_once "../config.php";
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Exe1</title>
</head>
<body>

<?php

try{
    
    $db = new PDO(MY_DB_DRIVER.":host=".MY_DB_HOST.";port=".MY_DB_PORT.";dbname=". MY_DB_NAME.";charset=".MY_DB_CHARSET, MY_DB_LOGIN, MY_DB_PWD);   
    $db->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
   
}catch(Exception $e){
    die("Erreur : ".$e->getMessage());
}


$sql = "SELECT * FROM news INNER JOIN user ON news.idnews = user.iduser"; 

$query = $db->query($sql); 

while($item = $query->fetch(PDO::FETCH_ASSOC)){
    echo "<h1>$item[login]</h1>";
    echo "<p>$item[content]</p>";
}
?>
    
</body>
</html>

