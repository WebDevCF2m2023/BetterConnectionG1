<?php

function getAllNews(PDO $db){
    $sql = "SELECT news.title, news.content,user.thename, news.date_published 
    FROM news INNER JOIN user
    ON news.user_iduser = user.iduser
    ORDER BY news.date_published DESC";
     $query = $db->query($sql);
     $result = $query->fetchAll(PDO::FETCH_ASSOC);
     $query->closeCursor();
     return $result;
}

