<header class="masthead" style="background-image: url('assets/img/home-bg.jpg')">
    <div class="container position-relative px-4 px-lg-5">
        <div class="row gx-4 gx-lg-5 justify-content-center">
            <div class="col-md-10 col-lg-8 col-xl-7">
                <div class="site-heading">
                    <h1>Homepage</h1>
                    <?php 
                        if (!isset($_GET["showCat"]) && (!isset($_GET["showArt"]))) {
                            ?>
                    <span class="subheading">Petit exercice</span>
                    <p>Dans model/NewsModel.php, créez une fonction qui va charger toutes les News publiéeavec le titre, la date de publication, les 250 premiers caractères de l'article (spossible ne pas couper dans les mots ), thename de l'auteur par ordre de publicatiodécroissante. rajouter les catégories si possible (même liens que dans le menu)</p>
                    <p>affichez ces articles à la place des faux articles ci-dessous</p>
                    <?php 
                        }else if (isset($_GET["showCat"]) && count($catSlug) == 0) {
                            ?>
                            <p>Il n'y a pas encore d'article à ce categorie</p>
                            <?php 
                        }else if (isset($catSlug)) {   
                            //   var_dump($catSlug); 
                            foreach ($catSlug as $cs) : 
                              // make this prettier
                              // make slugLinks display relevant article
                              ?>
                                    <div id="showCats">
                                    <?php if(isset($cs["thename"])) echo "Ecris par " .$cs["thename"]?> 
                                        <a href="?showArt=<?=$cs["slug"]?>"><p><?=$cs["con"]?>...</p></a>
                                        <p id="dateP"><?=$cs["date_published"]?></p>
                                    </div>
                            <?php 
                        endforeach;
                    }else if (isset($_GET["showArt"])) {
                    
                        foreach($artSlug as $as) : ?>
                            <h3><?=$as["title"]?></h3>
                            <h5>Par <?php if(isset($as["thename"])) echo $as["thename"]?></h5>
                            <h5>Le <?=$as["date_published"]?></h5>
                        <p><?=($as["content"]);?></p>
                    <?php endforeach; }?>
                       
                    
                </div>
            </div>
        </div>
    </div>
</header>