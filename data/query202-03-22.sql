# On sélectionne tous les champs de la table category
SELECT * FROM `category`;

# On sélectionne tous les champs de la table news
SELECT * FROM `news`;

# On sélectionne tous les champs de la table user
SELECT * FROM `user`;

# On affiche tous les champs de la table news_has_category news_has_category
SELECT * FROM `news_has_category`;

# On insert dans la table news_has_category (news_idnews,category_idcategory) avec (2,4)
INSERT INTO `news_has_category` (`news_idnews`,`category_idcategory`) VALUES (2,4); # Erreur car paire de clefs dèja existante!

# On sélectionne les champs login et thename de la table user
SELECT `login`, `thename` FROM `user`;

# On sélectionne les champs idcategory, title et slug  de la table category ordonné par slug ascendant
SELECT `idcategory`, `title`, `slug` FROM `category` ORDER BY `slug` ASC;

# On sélectionne les champs title, date_created de la table news ainsi que le login et thename de la table user, 
# uniquement lorsque une news a un utilisateur
SELECT `news`.`title`, `news`.`date_created`, `user`.`login`, `user`.`thename` FROM news INNER JOIN user ON `news`.`user_iduser` =
 `user`.`iduser` ;
 
# On sélectionne les champs title, date_created de la table news ainsi que le login et thename de la table user, 
# même lorsque une news n'a pas d'utilisateur.
SELECT `news`.`title`, `news`.`date_created`, `user`.`login`, `user`.`thename` FROM news LEFT JOIN user ON `news`.`user_iduser` =
 `user`.`iduser`;


