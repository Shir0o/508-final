<html lang="en">

      <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="app.css">
        <link href="https://fonts.googleapis.com/css?family=Julius+Sans+One%7CRaleway:300,400" rel="stylesheet">
        <link href="https://opensource.keycdn.com/fontawesome/4.7.0/font-awesome.min.css" rel="stylesheet">
        <title>League Stats</title>
      </head>

      <body>
          <div class="container2">
            <header>
              <h1> User-Profile </h1>
            </header>

            <div class="banner">
              <h2> This banner will show user's most played champs </h2>
            </div>
          </div>
          <div class="content">
            <p>
            <?php
                $username = $_POST["name"];
                echo "Hello " . $username;
            ?>
          </p>
          </div>
            <footer class="footer">
              <p>Copyright © 2018 Sudhansu Shrestha and Tony Wang</p>
            </footer>
      </body>

</html>
