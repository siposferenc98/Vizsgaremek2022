<?php 
    session_start();
    include_once "CallApi_2.php";
    include_once "Foglal.php";
    
    if($_SERVER["REQUEST_METHOD"] == "POST")
    {      
        if(isset($_POST["szemelydb"]) && !empty($_POST["szemelydb"]) &&
        isset($_POST["datum"]) && !empty($_POST["datum"]) &&
        isset($_POST["idopont"]) && !empty($_POST["idopont"]))
            {
                $token = $_SESSION['Token'];
                $azon = $_SESSION['Azonosito'];
                $nev = $_SESSION['Felhasznalonev'];
                $szemelydb = $_POST["szemelydb"];
                $datum = $_POST["datum"];
                $idopont = $_POST["idopont"];

                $foglalas = $idopont.$datum;
                
                $foglalasido = date(DATE_ATOM, strtotime($foglalas));

                $date = new DateTime('NOW');
                $leadva = $date->format(DateTime::ATOM);
                
                $date1 = date_create($datum);
                $date2 = date("Y-m-d");

                $ido1 = date_timestamp_get($date1);
                $date2Creat = date_create($date2);
                $ido2 = date_timestamp_get($date2Creat);
                $idoKulombseg = $ido1 - $ido2;
                //echo $idoKulombseg;
                if($idoKulombseg < 0){
                    echo "<script>alert('Az Ön által megadott időpont korábbi a mai napnál!                      Kérjük adjon meg egy másik időpontot!')</script>";
                    //echo "<script>location.href='foglalas.php'</script>";
                }
                else{
                    $f = new Foglal();
                    $f->Fazon = 0;
                    $f->Azon = $azon;
                    $f->Szemelydb = $szemelydb;
                    $f->Foglalasido = $foglalasido;
                    $f->Leadva = $leadva;
                    $f->Megjelent = false;

                    $jsonfoglal = json_encode($f);
                    $result = CallAPI("POST", "https://localhost:5001/Foglalasok", $jsonfoglal, $token);
                    echo "<script>alert('Köszönjük a foglalást!')</script>";
                    header("Refresh:0");  // Ne ragadjonak be az adatok!!!!
                    //echo "<script>location.href='foglalas.php'</script>";
                }
            }
            
            //kijelentkezésnél is elküldődik a form, de a post arraybe benne lesz a kilépés gomb is
            if(isset($_POST["kilepes"]))
            {
                session_unset();
                header("Location: index.php");
            }
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
        <br />
        <div class="container">
            <div class="ujfelhasznalo">
                <form method="POST" action= "">
                    <div>
                        <h2> Üdvözöljük <?php echo " ".$_SESSION['Felhasznalonev'] ?> !</h2>
                        <h3> Foglalásához kérjük adja meg a vendégek számát, a dátumot és az időpontot!</h3>
                    </div>
                    <br /><br />
                    <div>
                        <label class="labella">Vendégek száma:</label><br />
                        <select class="bevitel" name="szemelydb">
                            <option>1</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                            <option>6</option>
                            <option>7</option>
                            <option>8</option>
                        </select>
                    </div>
                    <div>
                        <label class="labella">Dátum: </label><br />
                        <input type="date" class="bevitel" name="datum">
                    </div>
                    <div>
                        <label class="labella">Időpont:</label><br />
                        <select class="bevitel" name="idopont">
                            <option>12:00:00</option>
                            <option>13:00:00</option>
                            <option>14:00:00</option>
                            <option>15:00:00</option>
                            <option>16:00:00</option>
                            <option>17:00:00</option>
                            <option>18:00:00</option>
                            <option>19:00:00</option>
                            <option>20:00:00</option>
                            <option>21:00:00</option>
                        </select>
                    </div>
                    <br />
                    <input type="submit" class="btn btn-success" value="Foglalom!">
                    <br /><br />
                    <a class="btn btn-primary" href="foglalasaim.php">Előző foglalásaim</a>
                    <br /><br />
                    <input type="submit" name="kilepes" class="btn btn-danger" value="Kilépés">
                </form>
            </div>
        </div>
        <br/>
        <footer class="page-footer text-center wow fadeIn">
            <div class="py-3 bg-dark">
                <span class="footer-copyright text-secondary center" id="copyright">© 2022 Copyright:</span>
                <span class="text-secondary center">Burger Étterem</span>
            </div>
        </footer>
        <script crossorigin src="https://unpkg.com/react@17/umd/react.development.js"></script>
        <script crossorigin src="https://unpkg.com/react-dom@17/umd/react-dom.development.js"></script>
        <script src="app.js" defer></script>
    </body>
</html>