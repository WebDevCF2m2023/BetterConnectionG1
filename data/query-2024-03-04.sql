# On sélectionne tous les champs de la table category 
SELECT * FROM `category`;
# On sélectionne tous les champs de la table news
SELECT * FROM `news`;
# On sélectionne tous les champs de la table user
SELECT * FROM `user`; 
# On affiche touts les champs de la table news_has_category
SELECT * FROM `news_has_category`;
# on insert dans la table news_has_category 
# (news_idnews, category_idcategory) avec (2,4)
INSERT INTO `news_has_category`
(`news_idnews`, `category_idcategory`)
VALUES (2,4); # Erreur car paire de clefs déja existantce!
# on sélectionne les champs login et thename de la table user
SELECT `login`, `thename` FROM `user`;
# on sélectionne les champs idcategory, title et slug de la table category ordonné par slug ascendant 
SELECT `idcategory`, `title`, `slug` FROM `category` ORDER BY `slug` ASC;
# jointure interne : (INNER"pas obligatoire") JOIN : ne sélectionne que les articles qui ont des news 
# on sélectionne les champ title, date_created de la table news ainsi que le login et thnename de la table user, uniquement lorsque une news a un utilisateur.
SELECT `news`.`title`, `news`.`date_created`, `user`.`login`, `user`.`thename` FROM `news` INNER JOIN `user` ON `news`.`user_iduser` = `user`.`iduser`; 
# jointure externe (LEFT "prends tout même les champs vident.")
SELECT `news`.`title`, `news`.`date_created`, `user`.`login`, `user`.`thename` FROM `news` LEFT JOIN `user` ON `news`.`user_iduser` = `user`.`iduser`;