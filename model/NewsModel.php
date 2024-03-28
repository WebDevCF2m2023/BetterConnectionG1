<?php

function getAllNews(PDO $db): array|string
{
    $sql = "SELECT news.title, news.content, user.thename, news.date_published, category.slug FROM news JOIN user ON news.user_iduser=user.iduser JOIN category ON news.idnews=category.idcategory WHERE news.is_published = 1 ORDER BY news.date_published DESC ;";
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
