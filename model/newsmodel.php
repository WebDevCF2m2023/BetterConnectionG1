<?php

function getTheNews (PDO $db){


        $sql = "SELECT * FROM news n
                LEFT JOIN user u
                ON n.user_iduser = u.iduser
                 ";
         
            $query = $db->query($sql);
                $result = $query->fetchAll(PDO::FETCH_ASSOC);
            $query->closeCursor();
        return $result;
    }


