<?php

function getAllNews(PDO $db): array|string
{
    $sql = "SELECT n.title, n.content, u.thename, n.date_published, 
    GROUP_CONCAT(c.title SEPARATOR ' ||| ') AS categ_title, 
	GROUP_CONCAT(c.slug SEPARATOR ' ||| ') AS categ_slug 
    FROM news n
    JOIN user u
        ON n.user_iduser=u.iduser
    LEFT JOIN news_has_category h
		ON h.news_idnews = n.idnews 
    LEFT JOIN category c
        ON h.category_idcategory = c.idcategory 
    WHERE n.is_published = 1 
    ORDER BY n.date_published DESC ;";
    try{
        $query = $db->query($sql);

        if($query->rowCount()==0){
            return "Pas encore de news";
        }

        $result = $query->fetchAll();
        $query->closeCursor();
        return $result;

    }catch(Exception $e){
        return $e->getMessage();
    }
}
