<?php
 
require_once "../config.php";
 
    try{
    $MyPDO = new PDO(DB_DRIVER.":host=".DB_HOST.";dbname=".DB_NAME.";port=".DB_PORT.";charset=".DB_CHARSET,DB_LOGIN,DB_PWD);
        }catch(Exception $e){
    die($e ->getMessage());
    }
 
