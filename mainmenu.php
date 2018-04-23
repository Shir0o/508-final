<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" type="text/css" href="font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="navigation.css">
  <link rel="stylesheet" href="other_page.css">
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
    <li class="navigation_item" id="profile"><a href="winratechamp.php">
      WINRATE</a>
    </li>
    <li class="navigation_item" id="education"><a href="kdachamp.php">
      KDA(CHAMP)</a>
    </li>
    <li class="navigation_item" id="work_experience"><a href="kdamatch.php">
      KDA(MATCH)</a>
    </li>
    <li class="navigation_item" id="skills"><a href="teamcomp.php">
      TEAM COMP</a>
    </li>
    <li class="navigation_item" id="interests">
      GAMES WON
    </li>
    <li class="navigation_item" id="portfolio">
      DAMAGE DEALT
    </li>
    <li class="navigation_item" id="contact">
      GOLD INCOME
    </li>
  </ul>

  <center>
    <a href="#"><h1 class="boxed_item boxed_item_smaller signup">
    <i class="fa fa-user"></i>
      OVERALL PROFILE
    </h1></a>
  </center>
</div><!-- End of sidebar -->

<script src="js/close_menu.js"></script>

  </div>
  <footer class="footer">
    <p>Copyright © 2018 LOLSTATS</p>
  </footer>
</body>

</html>
