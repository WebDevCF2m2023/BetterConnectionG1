<?php

function getTheNews (PDO $db){


        $sql = "SELECT * FROM news n
                LEFT JOIN user u
                ON n.user_iduser = u.iduser
                ON h.category_idcategory = c.idcategory
                 ";
         
            $query = $db->query($sql);
                $result = $query->fetchAll(PDO::FETCH_ASSOC);
            $query->closeCursor();
        return $result;
    }


