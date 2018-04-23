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
            <div class="header2">
            <header>
              <h1> <?php
                  require_once('connect.php');
                  $username = $_POST["name"];
                  echo "Hello " . $username. "!";
                  ?>
                </h1>
            </header>
          </div>
            <div class="banner">
              <h2> This banner will show user's most played champs </h2>
            </div>
          </div>
          <div class="content">
            <p>
            <?php
                require_once('connect.php');
                $username = $_POST["name"];
                

                $query = "SELECT playerName, datePlayed, rating
                          FROM info
                          WHERE playerName = '$username'";

                $response = @mysqli_query($db, $query);

                if ($response){
                  echo '<table align="left" cellspacing="5" cellpadding="8">

                  <tr><td align="left"><b>Player Name</b></td>
                  <td align="left"><b>Date Played</b></td>
                  <td align="left"><b>Rating</b></td>
                  </tr>';


                  while($row = mysqli_fetch_array($response)){
                    echo '<tr><td align="left">' .
                    $row['playerName'] . '</td><td align="left">' .

                    $row['datePlayed'] . '</td><td align="left">' .

                    $row['rating'] . '</td><td align="left">';

;

                    echo '</tr>';

                  }

                  echo '</table>';

                }

                else{
                  echo "couldn't issue query";

                  echo mysqli_error($db);
                }

                mysqli_close($db);
            ?>
          </p>
          </div>
          <footer class="footer">
            <p>Copyright © 2018 Sudhansu Shrestha and Tony Wang</p>
          </footer>
      </body>

</html>
