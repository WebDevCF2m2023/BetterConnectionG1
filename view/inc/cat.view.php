<?php
                    if (isset($catSlug)) {
                        if(count($catSlug) == 0) {
                           ?><h3 class="post-meta">Il n'y a pas encore d'article à ce categorie</h3>
                        <?php }
                                       
                        foreach($catSlug as $cs) : ?>
                    <div class="post-preview">
                        <h2 class="post-title"><?=$cs["ntit"]?></h2>
                        <a href="?showArt=<?=$cs["slug"]?>">
                            <h3 class="post-subtitle"><?=$cs["con"]?></h3>
                        </a>
                        <p class="post-meta">
                            Posted by <?php 
                            if(isset($cs["thename"])) {
                                echo $cs["thename"];
                                }else {
                                    echo "unknown";}
                                    ?> on 
                                    <?php 
                                    if(isset($cs["date_published"])) {
                                        echo date("d-m-Y", strtotime($cs["date_published"]));
                                        }else {echo "unknown";}
                                        ?>
                        </p>
                    </div> <?php endforeach; }




