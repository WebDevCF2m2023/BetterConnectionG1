<?php

function getAllCategoriesBySlug(PDO $db): array|Exception{

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