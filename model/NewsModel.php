<?php

function getAllTheNews(){
    $sql = "SELECT title, date_published,    "
}

Dans model/NewsModel.php, créez une fonction qui va charger toutes les News publiées avec le titre, la date de publication, les 250 premiers caractères de l'article (si possible ne pas couper dans les mots ), thename de l'auteur par ordre de publication décroissante. rajouter les catégories si possible (même liens que dans le menu).
