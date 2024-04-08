<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <title>BetterConnection | <?=$categoryBySection["title"]?></title>
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
</head>
<body>
    <?php
require_once "menu.view.php";

    ?>
        <!-- Page Header-->
        <header class="masthead" style="background-image: url('assets/img/home-bg.jpg')">
            <div class="container position-relative px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-md-10 col-lg-8 col-xl-7">
                        <div class="site-heading">
                            <?php 
                                $i=0;
                                foreach($categoryBySection as $catSect) { 
                                    

                                    if($i < 1) {
                                        $i++;
                                        ?>
                            <h1><?=$catSect["ctit"]?></h1>
                            <?php } 
                            ?>
                            <span class="subheading"><?= $catSect["descript"]?></span>
                            <p><?php }?></p>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!-- Main Content-->
        <div class="container px-4 px-lg-5">
            <div class="row gx-4 gx-lg-5 justify-content-center">
                <div class="col-md-10 col-lg-8 col-xl-7">
                    <?php
       
                            if(!count($newsCategoryBySection)) { ?><p>Pas encore d'articles sur ce category</p> <?php }
                            foreach($newsCategoryBySection as $section):     
                                    if($section["other_slug"] == $_GET["section"]) {
                    ?>
                    <!-- Post preview-->
                    <div class="post-preview">
                        <a href="?detailArticle=<?=$section['slug']?>">
                            <h2 class="post-title"><?=$section['title']?></h2>
                            <h5 class="post-subtitle"><?=cutTheText($section['content'],255)?>... Lire la suite</h5>
                        </a><div>
                        <?php
                        }
                        // Pour les catégories, on va devoir couper les chaînes de caractères quand on trouve |||
                       // $categ_slug = explode("|||",$section['categ_slug']);
                       // $categ_title = explode("|||",$section['categ_title']);
                        // tant qu'on a des valeurs
                     //   foreach($categ_slug as $key => $value):
                            // on affiche la valeur de la variable où on fait la boucle dans le lien et la variable contenant les titres en utilisant la clef correspondante
                        ?>
                        
                        <?php
                        endforeach;
                    //    endforeach;
                        ?>
                    </div>
                        <p class="post-meta">
                            Posté par
                            <?php
                            // si pas d'utilisateur ($section['thename'] === null) l'opérateur de coalescence (fusion) ?? fait la même chose que cette condition, on affiche anonyme
                            $name = $section['thename'] ?? "Anonyme";
                            $linkName = $section['login'] ?? "#";
                            ?>
                            <a href="?author=<?=$linkName?>"><?=$name?></a>
                            <?php
                            // pour gérer l'abscence de date de publication
                            $date = $section['date_published'] ?? "";
                            // conversion de la date en timestamp
                            $date = strtotime($date);
                            // si date n'est pas faux
                            echo ($date)? " le ".date("d/m/Y \à H\hi",$date): " Pas publié !";
                            ?>
                        </p>
                    </div>
                    <!-- Divider-->
                    <hr class="my-4" />
                    <?php
                    ?>
                </div>
            </div>
        </div>
        <!-- Footer-->
        <footer class="border-top">
            <div class="container px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-md-10 col-lg-8 col-xl-7">
                        <ul class="list-inline text-center">
                            <li class="list-inline-item">
                                <a href="#!">
                                    <span class="fa-stack fa-lg">
                                        <i class="fas fa-circle fa-stack-2x"></i>
                                        <i class="fab fa-twitter fa-stack-1x fa-inverse"></i>
                                    </span>
                                </a>
                            </li>
                            <li class="list-inline-item">
                                <a href="#!">
                                    <span class="fa-stack fa-lg">
                                        <i class="fas fa-circle fa-stack-2x"></i>
                                        <i class="fab fa-facebook-f fa-stack-1x fa-inverse"></i>
                                    </span>
                                </a>
                            </li>
                            <li class="list-inline-item">
                                <a href="#!">
                                    <span class="fa-stack fa-lg">
                                        <i class="fas fa-circle fa-stack-2x"></i>
                                        <i class="fab fa-github fa-stack-1x fa-inverse"></i>
                                    </span>
                                </a>
                            </li>
                        </ul>
                        <div class="small text-center text-muted fst-italic">Copyright &copy; Better <?=date("Y")?></div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>