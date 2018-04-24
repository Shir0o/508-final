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
    <form action="playeradded.php" method="post">
      Add a New player
      <p> Enter your Username: <input name="name" type="text" class="nameinput"></p>
      <p> Enter Total Matches: <input name="matches" type="number" class="nameinput"></p>
      <p> Enter Total Wins: <input name="wins" type="number" class="nameinput"></p>
      <input type="submit" name="submit" class="swagButton" value="send">
    </form>
  </div>
  <footer class="footer">
    <p>Copyright © 2018 LOLSTATS</p>
  </footer>
</body>

</html>
