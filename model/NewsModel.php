<?php

//Dans model/NewsModel.php, créez une fonction qui va charger toutes les News publiées avec le titre, la date de publication, les 250 premiers caractères 
//de l'article (si possible ne pas couper dans les mots ), thename de l'auteur par ordre de publication décroissante. rajouter les catégories si possible (même liens que dans le menu).

function getAllTheNews(PDO $db){

    $sql = "SELECT slug, n.title, n.date_published, SUBSTRING(content, 1, 250) AS cont, u.thename
    FROM news n JOIN user u ON u.iduser = n.user_iduser
    ORDER BY n.date_published DESC
    ";

try{

    $query = $db->query($sql);
    $result = $query->fetchAll();
    $query->closeCursor();
    return $result;

}catch(Exception $e){

        return $e->getMessage();
}
}


