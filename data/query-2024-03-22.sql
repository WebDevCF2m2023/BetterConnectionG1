# On sélectionne tous les champs de la table category
SELECT * FROM `category`;

# On sélectionne tous les champs de la table news
SELECT * FROM `news`;

# On affiche tous les champs de la table user
SELECT * FROM `user`;

# on affiche tous les champs de la table news_has_category
SELECT * FROM `news_has_category`;

# on insert dans la table news_has_category (news_idnews,category_idcategory) avec (2,4)
#INSERT INTO `news_has_category` 
#(`news_idnews`,`category_idcategory`) 
#VALUES (2,4); # Erreur car paire de clefs dèja existante !

# on sélectionne les champs login et thename de la table user
SELECT `login`, `thename` FROM `user`;

# on sélectionne les champs idcategory, title et slug de la table category ordonné par slug ascendant
SELECT `idcategory`,`title`,`slug` 
	FROM `category`
    ORDER BY `slug` ASC;
    
# Jointures internes : (INNER) JOIN :
# Ne sélectionne que les articles qui ont des news   

# on sélectionne les champs title, date_created de la table news ainsi que le login et thename de la table user, uniquement lorsque une news a un utilisateur.

SELECT `news`.`title`, `news`.`date_created`, `user`.`login`, `user`.`thename`
	FROM `news`
	INNER JOIN `user`
		ON `news`.`user_iduser` = `user`.`iduser`
        ;
        
        
# Jointures externes : LEFT JOIN :
# Sélectionne tous les articles, même ceux sans user 

# on sélectionne les champs title, date_created de la table news ainsi que le login et thename de la table user, même lorsque une news n'a pas d'utilisateur.

SELECT `news`.`title`, `news`.`date_created`, `user`.`login`, `user`.`thename`
	FROM `news`
	LEFT JOIN `user`
		ON `news`.`user_iduser` = `user`.`iduser`
        ;
	
# Jointures externes : RIGHT JOIN :
# Sélectionne les articles et les users, même ceux qui n'ont pas écrit d'articles

# on sélectionne les champs title, date_created de la table news ainsi que le login et thename de la table user, et ce même pour les users qui n'ont pas d'articles.

SELECT `news`.`title`, `news`.`date_created`, `user`.`login`, `user`.`thename`
	FROM `news`
	RIGHT JOIN `user`
		ON `news`.`user_iduser` = `user`.`iduser`
        ;

# on sélectionne les champs title, date_created de la table news ainsi que le login et thename de la table user, uniquement lorsque une news a un utilisateur. On récupère également les category.title et category.slug Si la news a des catégories (on affiche la news si elle n'a pas de catégorie

SELECT `news`.`title`, `news`.`date_created`, 
		`user`.`login`, `user`.`thename`,
        `category`.`title`, `category`.`slug`
	FROM `news`
	INNER JOIN `user`
		ON `news`.`user_iduser` = `user`.`iduser`
	LEFT JOIN `news_has_category`
		ON `news_has_category`.`news_idnews` = `news`.`idnews`
	LEFT JOIN `category`
		ON `news_has_category`.`category_idcategory` = `category`.`idcategory`
        ;
      
# on sélectionne les champs title, date_created de la table news ainsi que le login et thename de la table user, uniquement lorsque une news a un utilisateur. On récupère également les category.title et category.slug Si la news a des catégories (on affiche la news si elle n'a pas de catégorie avec ALIAS de sortie pour éviter les doublons sur title

SELECT `news`.`title`, `news`.`date_created`, 
		`user`.`login`, `user`.`thename`,
        `category`.`title` AS categ_title, `category`.`slug`
	FROM `news`
	INNER JOIN `user`
		ON `news`.`user_iduser` = `user`.`iduser`
	LEFT JOIN `news_has_category`
		ON `news_has_category`.`news_idnews` = `news`.`idnews`
	LEFT JOIN `category`
		ON `news_has_category`.`category_idcategory` = `category`.`idcategory`
        ;
        
# on sélectionne les champs title, date_created de la table news ainsi que le login et thename de la table user, uniquement lorsque une news a un utilisateur. On récupère également les category.idcategory category.title et category.slug Si la news a des catégories (on affiche la news si elle n'a pas de catégorie avec ALIAS de sortie pour éviter les doublons sur title. On va créer des alias internes, ce sont des alias pour le nom des tables, pas pour la sortie. Ov va grouper par la clef primaire ou l'* de news.

SELECT n.`title`, n.`date_created`, 
		u.`login`, u.`thename`,
        GROUP_CONCAT(c.`idcategory`) AS idcategory, 
        GROUP_CONCAT(c.title SEPARATOR '|||') AS categ_title, 
        GROUP_CONCAT(c.slug SEPARATOR '|||') AS categ_slug
	FROM `news` n
	INNER JOIN `user` u
		ON n.`user_iduser` = u.`iduser`
	LEFT JOIN `news_has_category` h
		ON h.`news_idnews` = n.`idnews`
	LEFT JOIN `category` c
		ON h.`category_idcategory` = c.`idcategory`
	GROUP BY n.idnews
        ;
        
# on sélectionne les champs title, date_created de la table news ainsi que le login et thename de la table user, avec user facultatif. On récupère également les category.idcategory category.title et category.slug Si la news a des catégories (on affiche la news si elle n'a pas de catégorie avec ALIAS de sortie pour éviter les doublons sur title. On va créer des alias internes, ce sont des alias pour le nom des tables, pas pour la sortie. Ov va grouper par la clef primaire ou l'* de news.

SELECT n.title, n.date_created, 
		u.login, u.thename,
        GROUP_CONCAT(ca.idcategory) AS idcategory, 
        GROUP_CONCAT(ca.title SEPARATOR '|||') AS categ_title, 
        GROUP_CONCAT(ca.slug SEPARATOR '|||') AS categ_slug
	FROM news n
	LEFT JOIN `user` u
		ON n.user_iduser = u.iduser
	LEFT JOIN news_has_category h
		ON h.news_idnews = n.idnews
	LEFT JOIN category ca
		ON h.category_idcategory = ca.idcategory
	LEFT JOIN image i 
		ON i.news_idnews = n.idnews
	GROUP BY n.idnews
        ;

# idem mais quand l'article est publié        
SELECT n.title, n.date_created, 
		u.login, u.thename,
        GROUP_CONCAT(c.idcategory) AS idcategory, 
        GROUP_CONCAT(c.title SEPARATOR '|||') AS categ_title, 
        GROUP_CONCAT(c.slug SEPARATOR '|||') AS categ_slug
	FROM news n
	LEFT JOIN `user` u
		ON n.user_iduser = u.iduser
	LEFT JOIN news_has_category h
		ON h.news_idnews = n.idnews
	LEFT JOIN category c
		ON h.category_idcategory = c.idcategory
	WHERE n.is_published = 1 AND n.idnews = 2
	GROUP BY n.idnews

        ;