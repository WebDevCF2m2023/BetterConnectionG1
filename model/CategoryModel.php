<?php


/**
 * getAllCategoriesBySlug
 *
 * @param  PDO $db
 * @return array|string
 */
function getAllCategoriesBySlug(PDO $db): array|string
{
    $sql = "SELECT title, slug FROM category ORDER BY slug ASC;";
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

function getCatBySection (PDO $db, $catSlug) {

    $cleanedSlug = htmlspecialchars(strip_tags(trim($catSlug)), ENT_QUOTES);
    $sql = "SELECT SUBSTRING(c.description, 1, 120) AS descript, c.title AS ctit
    FROM category c
    WHERE c.slug = ?  
    ";

try{
$query = $db->prepare($sql);
$query->bindValue(1,$cleanedSlug);
$query->execute();
$results = $query->fetchAll();
$query->closeCursor();
return $results;
}catch(Exception $e){
    return $e->getMessage();
}

}