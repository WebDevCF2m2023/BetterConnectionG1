<?php

/**
 * getAllNewsHomePage
 *
 * @param  PDO $connect
 * @return array|string
 */
function getAllNewsHomePage(PDO $connect): array|string
{
    $sql = "SELECT n.`title`, n.`slug`, SUBSTRING(n.`content`, 1, 260) AS content, n.`date_published`, 
                   u.`login`, u.`thename`,
                   -- champs de category concaténés
                   GROUP_CONCAT(c.`title` SEPARATOR '|||') AS categ_title,
                   GROUP_CONCAT(c.`slug` SEPARATOR '|||') AS categ_slug 
	FROM `news` n
	LEFT JOIN `user` u
		ON n.`user_iduser` = u.`iduser`
-- on va sélectionner les champs title (as categ_title) et slug (as categ_slug) de la table category qu'il y ait des catégories ou pas
    LEFT JOIN `news_has_category` h
        ON h.`news_idnews` = n.`idnews`
    LEFT JOIN `category` c
        ON h.`category_idcategory` = c.`idcategory`


-- Condition de récupération
    WHERE n.`is_published` = 1
-- on groupe par la clef de la table du FROM (news)
    GROUP BY n.`idnews`    
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

/**
 * cutTheText
 *
 * @param  string $text
 * @param  int $nbCharacter
 * @param  bool $cutWord
 * @return string
 */
function cutTheText(string $text, int $nbCharacter=200, bool $cutWord = false): string
{
    // on coupe à la longueure indiquée
    $output = substr($text,0,$nbCharacter);

    // si on ne souhaîte pas couper dans un mot
    if($cutWord===false){
        // on prend la position du dernier espace dans la chaîne
        $lastSpace = strrpos($output, " ");

        // ou recoupe la chaîne pour l'envoie
        $output = substr($output,0,$lastSpace);
    }

    return $output;
}