<?php
require_once "../config.php";
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Exe1</title>
    <style>  
table, th, td {  
    border: 1px solid grey;  
}  
</style> 
</head>
<body>

<?php

try{
    
    $db = new PDO(MY_DB_DRIVER.":host=".MY_DB_HOST.";port=".MY_DB_PORT.";dbname=". MY_DB_NAME.";charset=".MY_DB_CHARSET, MY_DB_LOGIN, MY_DB_PWD);   
    $db->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
   
}catch(Exception $e){
    die("Erreur : ".$e->getMessage());
}


$sql = "SELECT * FROM news INNER JOIN user ON news.user_iduser = user.iduser"; 

$query = $db->query($sql); 

while($item = $query->fetch(PDO::FETCH_ASSOC)){

    echo "
    <table>
    <tr>
        <th>user</th> 
        <th>item</th>
    </tr>
    <tr>
        <td>$item[login]</td> 
        <td>$item[content]</td>
    </tr>
    </table>";      
}
?>
    
</body>
</html>

