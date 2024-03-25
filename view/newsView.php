<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <style>body {display: flex; flex-direction: column; align-items: center; background-color: #f4d292;}
            h2, h4  {margin: 0;} h4 {font-style: italic;}
            </style>
    
    <title>News</title>

</head>
<body>
    <h1>News du Jour</h1>
    <?php foreach ($getNews as $news) : ?>
        <div class="newsDiv">
            <h2><?=$news["title"]?></h2>
            <h4>écris par <?=$news["thename"]; if ($news["thename"] == "") echo "unknown"?></h4>
            <p><?=$news['content']?></p>
        </div>
        <?php endforeach; ?>
</body>
</html>