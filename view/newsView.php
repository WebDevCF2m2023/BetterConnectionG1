<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles/style.css">    
    <title><?=$title?></title>

</head>
<body>
    <h1>News du Jour</h1>
    <?php foreach ($getNews as $news) : ?>
        <div class="newsDiv">
            <h2><?=$news["title"]?></h2>
            <h4>écris par <?= empty($news["thename"]) ? "unknown" : $news["thename"]?></h4>
            <p><?=$news['content']?></p>
        </div>
        <?php endforeach; ?>
</body>