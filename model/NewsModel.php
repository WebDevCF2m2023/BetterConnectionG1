<?php

function getAllNews(PDO $db): array|string
{
    $sql = "SELECT title, slug FROM category ORDER BY slug ASC;";
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