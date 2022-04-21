<?php
    session_start();
    include_once "./Termek.php";
    include_once "CallApi_2.php";
    
    $result = CallAPI("GET", "https://localhost:5001/Koretek/Aktiv", );  // meghívjuk a CallAPI -t

    $decoded = json_decode($result[1]); // a visszakapott válasz json formátumúvá alakítjuk
    //var_dump($decoded);
    $koretek = []; //ebbe lesznek a Termek classú itemek
    $sor = 1;
    while($sor < count($decoded))
    {
        $korets = $decoded[$sor];
        $koret = new Termek($korets->{"Kazon"},$korets->{"Knev"},$korets->{"Kar"},$korets->{"Kleir"},$korets->{"Aktiv"}); //minden tömbből elkészítjük a termékünket
        array_push($koretek,$koret); //és bepusholjuk az arraybe egyenként minden terméket
        $sor++;
    }

?>

<!DOCTYPE html>
<html lang="hu">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="css/style.css">
        <title>Burger Étterem</title>
    </head>
    <body class="container bg-dark">
        <header>
            <div class="row">
                <div id="headerimage_carussel"></div>
            </div>
            <div class="jumbotron jumbotron-fluid bg-dark">
                <div class="text-center text-light bg-dark p-5 display-2">Burger Étterem</div>
            </div>
        </header>

        <?php
            include_once("navbar.php");
        ?>
        
        <div class="tab-content">
            <?php
                foreach($koretek as $k) //végigmegyünk a termékeket tartalmazó tömbön és megjelenítjük
                {
                    echo "<div class='container tab-panel'><br>
                          <div class='row p-2 m-3'>
                              <div class='col-sm-6 col-m-12'>
                                  <div class='text-center'>
                                      <img src='images/koretek/$k->id.jpg' style='width:25rem; height: 18rem;'  class='img-fluid rounded' alt=$k->nev>
                                  </div>
                              </div>
                  
                              <div class='col-sm-6'>
                                  <h1 class='text-center text-light p-2 m-3'>
                                      $k->nev
                                  </h1>
                                  <p>
                                      <span class='text-info'>Összetevők: </span>
                                      <span class='p-2'>$k->leiras</span>
                                  </p>
                                  <p>
                                      <span class='text-warning'>Ár: </span>
                                      <span class='p-2'>$k->ar,-Ft.</span>
                                  </p>
                              </div>
                          </div>
                      </div>";
                }
            ?>
        </div>
        <footer class="page-footer text-center wow fadeIn">
            <div class="py-5 bg-dark">
                <span class="footer-copyright text-secondary center" id="copyright">© 2022 Copyright:</span>
                <span class="text-secondary center">Burger Étterem</span>
            </div>
        </footer>
        <script crossorigin src="https://unpkg.com/react@17/umd/react.development.js"></script>
        <script crossorigin src="https://unpkg.com/react-dom@17/umd/react-dom.development.js"></script>
        <script src="app.js" defer></script>
    </body>
</html>