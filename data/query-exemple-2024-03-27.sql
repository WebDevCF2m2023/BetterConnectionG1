# betterconnectiong1_exemple

/* on sélectionne les champs title, date_created de la table news ainsi que le login et thename de la table user, avec user facultatif. On récupère également les category.idcategory category.title et category.slug Si la news a des catégories (on affiche la news si elle n'a pas de catégorie avec ALIAS de sortie pour éviter les doublons sur title. On va créer des alias internes, ce sont des alias pour le nom des tables, pas pour la sortie. Ov va grouper par la clef primaire ou l'* de news.

Si on ajoute des images (en many to one vers news), on ne peut joindre aussi facilement les tables:
Le GROUP BY bug sur le nombre de concaténation en multipliant les nombre d'images par le nombre de
category (3x5 => 15)

*/

SELECT n.title, n.date_created, 
		u.login, u.thename,
        GROUP_CONCAT(ca.idcategory) AS idcategory, 
        GROUP_CONCAT(ca.title SEPARATOR '|||') AS categ_title, 
        GROUP_CONCAT(ca.slug SEPARATOR '|||') AS categ_slug,
        (SELECT
			GROUP_CONCAT(i.idimage)
            FROM image i
				INNER JOIN news n2
					ON n2.idnews = i.news_idnews
				WHERE n.idnews = n2.idnews
        ) AS image
	FROM news n
	LEFT JOIN `user` u
		ON n.user_iduser = u.iduser
	LEFT JOIN news_has_category h
		ON h.news_idnews = n.idnews
	LEFT JOIN category ca
		ON h.category_idcategory = ca.idcategory
	GROUP BY n.idnews
        ;