<?php

function getAllCategoriesBySlug(PDO $db): array|string
{
    $sql = "SELECT title, slug, `description` FROM category ORDER BY slug ASC;";
    try{
        $query = $db->query($sql);

        if($query->rowCount()==0){
            return "Pas encore de category";
        }

        $result = $query->fetchAll();
        $query->closeCursor();
        return $result;

    }catch(Exception $e){
        return $e->getMessage();
    }
}


function getClippedNewsByCat(PDO $db, $catSlug): array|string {
    $cleanedSlug = htmlspecialchars(strip_tags(trim($catSlug)), ENT_QUOTES);
if ($cleanedSlug == "nouser") {
    $sql = "SELECT SUBSTRING(content, 1, 100) AS con, slug, title AS ntit, date_published
            FROM news 
            WHERE user_iduser IS NULL
    ";
 
}else {
    $sql = "SELECT SUBSTRING(n.content, 1, 120) AS con, n.slug, n.title AS ntit, n.date_published, c.title, u.thename
            FROM news n
            JOIN news_has_category h ON h.news_idnews = n.idnews
            LEFT JOIN category c ON c.idcategory = h.category_idcategory
            JOIN user u ON u.iduser = n.user_iduser 
            WHERE c.slug = '$cleanedSlug'  /* une heure perdu pour réaliser que $cleanedSlug doit être en '' */
            ";
}
    try{
        $query = $db->query($sql);
        $result = $query->fetchAll();
        $query->closeCursor();
        return $result;

    }catch(Exception $e){
        return $e->getMessage();
    }
    

}


