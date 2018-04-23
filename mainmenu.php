<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
  <link rel="stylesheet" href="css/other_page.css">
  <link rel="stylesheet" type="text/css" href="css/navigation.css">
  <link rel="stylesheet" type="text/css" href="css/otherqueries.css">
  <link href="https://fonts.googleapis.com/css?family=Julius+Sans+One%7CRaleway:300,400" rel="stylesheet">
  <link href="https://opensource.keycdn.com/fontawesome/4.7.0/font-awesome.min.css" rel="stylesheet">
  <script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
  <script src="js/menu_toggle.js"></script>
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
      header('Cache-Control: no cache');
      $username = $_POST["name"];
      $_SESSION['name'] = $username;

      $query = "SELECT DISTINCT playerName, positions
      FROM compose
      WHERE playerName = '$username'";

      $response = @mysqli_query($db, $query);

      if ($response){
        echo '<table align="left" cellspacing="5" cellpadding="8">
        <tr><td align="left"><b>Player Name</b></td>
        <td align="left"><b>Position (in lane)</b></td>
        </tr>';

        while($row = mysqli_fetch_array($response)){
          echo '<tr><td align="left">' .
          $row['playerName'] . '</td><td align="left">' .
          $row['positions'] . '</td><td align="left">';
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
    <i class="fa fa-bars toggle_menu"></i>

    <div class="sidebar_menu">
      <i class="fa fa-times"></i>
      <center>
        <a href="index.php"><h1 class="boxed_item">LOL <span class="logo_bold">STATS</span></h1>
        </a>
      </center>

      <ul class="navigation_section">
        <li class="navigation_item"><a href="winratechamp.php">
          WINRATE</a>
        </li>
        <li class="navigation_item"><a href="kdachamp.php">
          KDA(CHAMP)</a>
        </li>
        <li class="navigation_item"><a href="kdamatch.php">
          KDA(MATCH)</a>
        </li>
        <li class="navigation_item"><a href="teamcomp.php">
          TEAM COMP</a>
        </li>
        <li class="navigation_item"><a href="gameswon.php">
          GAMES WON</a>
        </li>
        <li class="navigation_item"><a href="damagedealt.php">
          DAMAGE DEALT</a>
        </li>
        <li class="navigation_item"><a href="goldincome.php">
          GOLD INCOME</a>
        </li>
      </ul>

      <center>
        <a href="overall.php"><h1 class="boxed_item boxed_item_smaller signup">
          <i class="fa fa-user"></i>
          OVERALL PROFILE
        </h1></a>
      </center>
    </div><!-- End of sidebar -->

    <script src="js/close_menu.js"></script>
    <a href="opponentsteam.php" class = "swagButton1">Opponent's team</a>
    <a href="champwinrate.php" class = "swagButton2">Champion WINRATE</a>
    <a href="numofchamps.php" class = "swagButton3">Num of Games CHAMP</a>
    <a href="goldincome.php" class = "swagButton4">Champion WINRATE(Spec)</a>
    <a href="specificchamps.php" class = "swagButton5">Games with Specific champs</a>
    <a href="lostgames.php" class = "swagButton6">Lost GAMES</a>
    <a href="gamemodes.php" class = "swagButton7">Game modes</a>
    <a href="damagetaken.php" class = "swagButton8">Damage Taken per games</a>
    <a href="creepscorecompare.php" class = "swagButton9">Creepscore Comparision</a>
    <a href="playstyle.php" class = "swagButton10">Preferred game style</a>
    <a href="gamerating.php" class = "swagButton11">Game rating</a>
  </div>


  <footer class="footer">
    <p>Copyright © 2018 LOLSTATS</p>
  </footer>
</body>

</html>
