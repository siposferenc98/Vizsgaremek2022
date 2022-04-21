
<?php
    session_start();
    include_once "Felhasznalo.php";
    include_once "CallApi_2.php";

    if(isset($_SESSION["Azonosito"]))
    {
        header("Location: ./foglalas.php");
    }

    if($_SERVER["REQUEST_METHOD"] == "POST")
    {
        if(isset($_POST["email"]) && !empty($_POST["email"]) &&
            isset($_POST["pw1"]) && !empty($_POST["pw1"]))
            {
                $email = $_POST["email"];
                $pw1 = $_POST["pw1"];
                $hashpw = md5($pw1);
                
                $f = new Felhasznalo();
                $f->Email = $email;
                $f->Pw = $hashpw;

                $jsonfelh = json_encode($f);
                var_dump($jsonfelh);
                echo "<br><br>";
                $result = CallAPI("POST", "https://localhost:5001/Felhasznalok", $jsonfelh);
                
                $token = $result[0];
                $felh = json_decode($result[1]);

                if ( $felh != NULL){
                    $_SESSION['Azonosito'] = $felh->{"Azon"};
                    $_SESSION['Felhasznalonev'] = $felh->{"Nev"};
                    $_SESSION['Token'] = $token;
                    echo "<script>alert('Köszöntjük weboldalunkon!')</script><br />";
                    echo "<script>location.href = 'foglalas.php'</script>";
                }
                else{
                    echo "<script>alert('Hibás email cím, vagy jelszó!')</script>";
                }
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
                <form method = "POST" action="" >
                    <div>
                        <h2>Asztalfoglaláshoz kérjük lépjen be a fiókjába, vagy regisztráljon!</h2> <!--<label class="labella">Regisztráció</label><br />-->
                    </div>
                    
                    <div>
                        <label class="labella">E-mail cím:</label><br />
                        <input type="email" class="bevitel" name="email" id="email" placeholder="az Ön email címe">
                    </div>
                    <div>
                        <label class="labella">Jelszó:</label><br />
                        <input type="password" class="bevitel" name="pw1" id="pw1" placeholder="az Ön jelszava">
                    </div>
                    <br />
                    <input type="submit" class="btn btn-success" value="Belépek!">
                    <br />
                    <br />
                    <a class="btn btn-primary" href="regisztracio.php">Regisztrálok!</a>
                </form>
            <br />
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
        <script src="app.js" defer></script>
    </body>
</html>