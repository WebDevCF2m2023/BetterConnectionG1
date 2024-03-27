<?php

function getAllNews(){
    $sql = "SELECT title, content, date_published 
    FROM news INNER JOIN user
    ON news.user_iduser = user.iduser
    ORDER BY date_published DESC";
}

