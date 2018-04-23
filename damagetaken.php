<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="css/other_page.css">
  <link href="https://fonts.googleapis.com/css?family=Julius+Sans+One%7CRaleway:300,400" rel="stylesheet">
  <link href="https://opensource.keycdn.com/fontawesome/4.7.0/font-awesome.min.css" rel="stylesheet">
  <title>League Stats</title>
</head>

<body>
  <header>
    <div class="container">
      <img src="images/logo_nav_final.jpg" alt="logo" class="logo">
      <nav>
        <ul>
          <li><a href="index.php">Home</a></li>
          <li><a href="playersindatabase.php">Players</a></li>
        </ul>
      </nav>
    </div>
  </header>

  <div class="container2">
    <p>
      <?php
      require_once('connect.php');
      session_start();
      $username = $_SESSION["name"];

      $query = "SELECT playerName, info.damageTaken - avg_participation.avgDmgTaken AS 'Damage taken compared with average'
      FROM info, avg_participation
      WHERE playerName='$username'";

      $response = @mysqli_query($db, $query);

      if ($response){
        echo '<b>Damage Taken</b>';
        echo '<table align="left" cellspacing="5" cellpadding="8">
        <tr><td align="left"><b>Player Name</b></td>
        <td align="left"><b>Damage Taken</b></td>

        </tr>';

        while($row = mysqli_fetch_array($response)){
          echo '<tr><td align="left">' .
          $row['playerName'] . '</td><td align="left">' .
          $row['Damage taken compared with average'] . '</td><td align="left">';

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
    <p>Copyright © 2018 LOLSTATS</p>
  </footer>
</body>

</html>
