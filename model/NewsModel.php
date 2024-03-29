<?php

function getAllNewsHomePage(PDO $connect): array|string
{
    $sql = "SELECT n.`title`, n.`slug`, SUBSTRING(n.`content`, 1, 280) AS content, n.`date_published`, 
                   u.`login`, u.`thename`
	FROM `news` n
	LEFT JOIN `user` u
		ON n.`user_iduser` = u.`iduser`
-- on va sélectionner les champs title (as categ_title) et slug (as categ_slug) de la table category qu'il y ait des catégories ou pas

    

-- Condition de récupération
    WHERE n.`is_published` = 1
    ORDER BY n.`date_published` DESC

        ;";

    try{
    
    $query = $connect->query($sql);

    // si pas de résultats () : string
    if(!$query->rowCount()) return "Pas encore de message";
    
    $result = $query->fetchAll();

    $query->closeCursor();

    return $result; // : array

    }catch(Exception $e){
        return $e->getMessage(); // : string
    }

}