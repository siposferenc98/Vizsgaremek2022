<?php 
    session_start();
    include "CallApi_2.php";

    $azon = $_SESSION['Azonosito'];
    $token = $_SESSION['Token'];
    // adott felhasználóhoz tartozó foglalások lekérdezése
    $foglalasaim = CallAPI("GET","https://localhost:5001/Foglalasok?felh=".$_SESSION['Azonosito'], false, $token);
    
    $foglalasdecod = json_decode($foglalasaim[1]); // A visszakapott válasz json formátummá alakítjuk, a html-ben használjuk fel!
    //Foglalás törlése
    if($_SERVER["REQUEST_METHOD"] == "POST")
    {
        $torlesAzon = $_POST["fazon"];
        $foglalastorles = CallAPI("DELETE","https://localhost:5001/Foglalasok/$torlesAzon", false, $_SESSION['Token']);
        header("Refresh:0");
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
                <div>
                    <h2>Kedves <?php echo $_SESSION['Felhasznalonev']?> !</h2>
                    <h3>Éttermünkben az alábbi foglalásai vannak / voltak:</h3>
                </div>
            </div>
                <br/>
            <div class="ujfelhasznalo">
                <table class="table table-dark table-striped">
                    <thead >
                        <tr>
                            <th>Foglalás azonosító</th>
                            <th>Vendégek száma</th>
                            <th>Foglalás időpontja</th>
                            <th>Foglalás leadásának ideje</th>
                            <th>Foglalás törlése</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php   
                            $sor = 0;
                            while($sor < count($foglalasdecod)) //ciklus a dekódolt eredmény végéig
                            {
                                //A db-ből kapott időpontok átalakítása a megjelenítéshez
                                $fogdate=date_create($foglalasdecod[$sor]->{"Foglalasido"});
                                $leaddate = date_create($foglalasdecod[$sor]->{"Leadva"});
                                echo
                                "<tr>
                                    <td>".$foglalasdecod[$sor]->{"Fazon"}."</td>    
                                    <td>".$foglalasdecod[$sor]->{"Szemelydb"}."</td>
                                    <td>".date_format($fogdate,"Y.m.d H:i:s")."</td>
                                    <td>".date_format($leaddate,"Y.m.d H:i:s")."</td>
                                    <td>
                                        <form method='POST' onsubmit='return megerosites()'>
                                        <input type='text' name='fazon' id='fazon' style='display: none;' value=".$foglalasdecod[$sor]->{"Fazon"}.">";
                                        if ($foglalasdecod[$sor]->{"Megjelent"} == false){
                                            echo"<input type='submit' class='btn btn-danger' value='Törlés'>";
                                        }
                                        else{
                                            echo"<input type='submit' class='btn btn-danger' value='Törlés' disabled>";
                                        }
                                        echo"</form>
                                    </td>
                                </tr>";
                                $sor++;
                            }
                        ?>
                    </tbody>
                </table>
            </div>
                <br />
                <br />
            <div class="ujfelhasznalo">
                <a class="btn btn-success" href="foglalas.php">Vissza a foglalásokhoz</a>
            </div>
        </div>
        <br />
        <footer class="page-footer text-center wow fadeIn">
            <div class="py-3 bg-dark">
                <span class="footer-copyright text-secondary center" id="copyright">© 2022 Copyright:</span>
                <span class="text-secondary center">Burger Étterem</span>
            </div>
        </footer>
        <script crossorigin src="https://unpkg.com/react@17/umd/react.development.js"></script>
        <script crossorigin src="https://unpkg.com/react-dom@17/umd/react-dom.development.js"></script>
        <script src="app.js"></script>
    </body>
</html>
<script>
    function megerosites(){
        if(confirm("Valóban törölni kívánja a foglalását?")){
            return true;
        }
        else{
            return false;
        }
    }

</script>
