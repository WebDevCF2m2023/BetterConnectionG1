<?php



function getArticle (PDO $db, $artSlug) {
  
    $cleanedSlug = htmlspecialchars(strip_tags(trim($artSlug)), ENT_QUOTES);

    $sql = "SELECT n.content, n.title, n.date_published, u.thename
            FROM news n
            LEFT JOIN user u ON u.iduser = n.user_iduser
            WHERE n.slug = '$cleanedSlug'  
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