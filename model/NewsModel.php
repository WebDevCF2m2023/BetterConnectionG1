<?php

function getAllNews(PDO $db): array|string
{
    $sql = "SELECT news.title, news.content, news.date_published user.thename FROM news JOIN user ON news.idnews=user.iduser ORDER BY user.thename DESC WHERE news.date_published = 1;";
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
