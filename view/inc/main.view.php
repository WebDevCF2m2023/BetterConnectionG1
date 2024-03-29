        <!-- Main Content-->
        <div class="container px-4 px-lg-5">
            <div class="row gx-4 gx-lg-5 justify-content-center">
                <div class="col-md-10 col-lg-8 col-xl-7">
                    <!-- Post preview-->
                  <?php
                    require_once("cat.view.php");
                    if (isset($artSlug)) {
                    foreach($artSlug as $as) :?>
                    <div class="post-preview">
                        
                            <h2 class="post-title"><?=$as["title"]?> par <?php if (isset($as["thename"])) {echo $as["thename"];}else{echo "unknown";}?></h2>
                            <p class="post-meta"><?=$as["content"]?><p>
                       
                        <p class="post-meta">
                            Posted le <?php if(isset($as["date_published"])) {echo date("d-m-Y", strtotime($as["date_published"]));}else{echo "unknown";}?>
                        </p>
                    </div>
                    <?php endforeach; }?>
                 </div>
            </div>