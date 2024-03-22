# On sélectionne tous les champs de la table category
SELECT * FROM `category`;

# On sélectionne tous les champs de la table news
SELECT * FROM `news`;

# On affiche tous les champs de la table user
SELECT * FROM `user`;

# On affiche tous les champs de la table news_has_category
SELECT * FROM `news_has_category`;

# On insert dans la table news_has_category ( news_idnews,category_idcategory) avec (2.4)
INSERT INTO `news_has_category` (`news_idnews`,`category_idcategory`) VALUES (2,4); # Erreur car paire de clefs déjà existante

# On sélectionne les champs  login et thename de la table user
SELECT `login`, `thename` FROM user;

# On sélectionne les champs idcategory title et slug de la table category ordonné par slug ascendant 
SELECT `idcategory`, `title`,`slug` FROM category ORDER BY `slug` ASC;

# Jointures Internes : (INNER) JOIN :
# Ne sélectionne que les articles qui ont des news

# On sélectionne les champs title, date_created de la table news ainsi que le login et the name de la table user, si uniquement une news à un utilisateur.

SELECT `news`.`title`, `news`.`date_created`, `user`.`login`, `user`.`thename` FROM `news` INNER JOIN `user` ON `news`.`user_iduser`=`user`.`iduser`;

# Jointures Externes : LEFT JOIN :
# sélectionne  TOUS les articles (à gauche après le FROM) avec les news si il y'en a (non obligatoire)

# On sélectionne les champs title, date_created de la table news ainsi que le login et the name de la table user,même lorsque  une news n'a pas d' utilisateur.

SELECT `news`.`title`, `news`.`date_created`, `user`.`login`, `user`.`thename` FROM `news` LEFT JOIN `user` ON `news`.`user_iduser`=`user`.`iduser`;
# Jointures Externes : RIGHT JOIN :
# sélectionne  les articles et les users, même ceux qui n'ont pas d'articles

# On sélectionne les champs title, date_created de la table news ainsi que le login et the name de la table user,et ce même pour les users qui n'ont pas d'articles.

SELECT `news`.`title`, `news`.`date_created`, `user`.`login`, `user`.`thename` FROM `news` RIGHT JOIN `user` ON `news`.`user_iduser`=`user`.`iduser`;
 
