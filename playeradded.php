<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="css/other_page.css">
  <link rel="stylesheet" href="css/home_page.css">
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
    <?php
    require_once('connect.php');
    session_start();
    $username = $_POST["name"];
    $_SESSION['name'] = $username;
    $matches = $_POST["matches"];
    $_SESSION['matches'] = $matches;
    $wins = $_POST["wins"];
    $_SESSION['wins'] = $wins;

    if (is_null($username)){
      echo 'try again!';
    }

    $query = "INSERT INTO PLAYERS VALUES('$username', '$wins', '$matches')";

    $response = @mysqli_query($db, $query);

    if ($response){
    echo 'Player added';
    }
    else{
      echo 'Error, please try again!';
    }
        ?>




  </div>
  <footer class="footer">
    <p>Copyright © 2018 LOLSTATS</p>
  </footer>
</body>

</html>
