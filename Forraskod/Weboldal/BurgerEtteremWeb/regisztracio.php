<?php
    session_start();
    include_once "FelhasznEll.php";
    include_once "FelhasznReg.php";
    include_once "CallApi_2.php";
    
    if($_SERVER["REQUEST_METHOD"] == "POST")
    {
    
        if(isset($_POST["nev"]) && isset($_POST["lak"]) && isset($_POST["tel"]) &&
            isset($_POST["email"]) && isset($_POST["pw1"]) && isset($_POST["pw2"]))
            {
                $nev = $_POST["nev"];
                $lak = $_POST["lak"];
                $tel = $_POST["tel"];
                $email = $_POST["email"];
                $pw1 = $_POST["pw1"];
                $pw2 = $_POST["pw2"];
                $_SESSION['Felhasznalonev'] = $nev; //Ezeket a Session-öket a hibás form adat miatti visszatöltéskor használjuk a html-ben!
                $_SESSION['Lakcim'] = $lak;
                $_SESSION['Telefon'] = $tel;
                $_SESSION['Email'] = $email;
                $_SESSION['pw1'] = $pw1;
                $_SESSION['pw2'] = $pw2;

                $hashpw = md5($pw1);

                $f = new FelhasznEll();
                $f->Azon = 0;
                $f->Nev = $nev;
                $f->Lak = $lak;
                $f->Tel = $tel;
                $f->Email = $email;
                $f->Jog = 0;
                $f->Pw = $hashpw;
            
                $jsonfelh = json_encode($f);
                $result = CallAPI("PUT", "https://localhost:5001/Felhasznalok/", $jsonfelh);
                $felh = json_decode($result[1]);
                
                if($result[1] == "")
                {
                    session_unset();
                    echo "<script>alert('Köszönjük a regisztrációt!')</script>";

                    header("Refresh:0");    // Ne ragadjonak be az adatok!!!!
                    echo "<script>location.href='belepes.php'</script>";
                }
                else
                {
                    echo "<script>alert('Ezzel az email címmel már regisztráltak, adj meg egy másikat!')</script>";
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
                <form name="regist" method = "POST" action="" onsubmit="return formEllenorzes()">
                    <div>
                        <h2>Regisztráció<h2>
                    </div>
                    <div><!--Alapból a placeholder felirata jelenik meg az input mezőben, ha már volt beleírva valami, akkor a javításkor már az jelenik meg!  -->
                        <label class="labella">Felhasználónév:</label><br />
                        <input type="text"  class="bevitel" name="nev" id="nev" value="<?php if(isset ($_SESSION['Felhasznalonev'])){ echo "".$_SESSION['Felhasznalonev'];}?>" placeholder="felhasználónév">
                    </div>
                    <div>
                        <label class="labella">Lakhely:</label><br />
                        <input type="text" class="bevitel" name="lak" id="lak" value="<?php if(isset ($_SESSION['Lakcim'])){ echo "".$_SESSION['Lakcim'];}?>" placeholder="lakcím">
                    </div>
                    <div>
                        <label class="labella">Telefonszám:</label><br />
                        <input type="text" class="bevitel" name="tel" id="tel" value="<?php if(isset ($_SESSION['Telefon'])){ echo "".$_SESSION['Telefon'];}?>" placeholder="pl.: +36801111111">
                    </div>
                    <div>
                        <label class="labella">E-mail cím:</label><br />
                        <input type="email" class="bevitel" name="email" id="email" value="<?php if(isset ($_SESSION['Email'])){ echo "".$_SESSION['Email'];}?>" placeholder="pl.: valami@valami.com">
                    </div>
                    <div>
                        <label class="labella">Jelszó:</label><br />
                        <input type="password" class="bevitel" name="pw1" id="pw1" value="<?php if(isset ($_SESSION['pw1'])){ echo "".$_SESSION['pw1'];}?>" placeholder="min. 6 karakter; kibetű, nagybetű, szám">
                    </div>
                    <div>
                        <label class="labella">Jelszó újra:</label><br />
                        <input type="password" class="bevitel" name="pw2" id="pw2" value="<?php if(isset ($_SESSION['pw2'])){ echo "".$_SESSION['pw2'];}?>" placeholder="jelszó megerősítése">
                    </div>
                    <br />
                    <input type="submit" class="btn btn-success" value="Regisztrálok!">
                    <br /><br />
                    <a class="btn btn-danger" href="index.php">Mégsem!</a>
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
        <script src="app.js"></script>
    </body>
</html>
<script>
    // A regisztrációs adatok előzetes ellenőrzése
    function formEllenorzes() {
        // Névmező kitöltésének ellenőrzése
        let a = document.forms["regist"]["nev"].value;
        if (a == "" || a == null) {
            alert("Név megadása kötelező!");
            return false;
        }
        // Lakcím ellenőrzése
        let b = document.forms["regist"]["lak"].value;
        if (b == "" || b == null) {
            alert("Lakcím megadása kötelező!");
            return false;
        }
        // Telefonszám ellenőrzés
        let c = document.forms["regist"]["tel"].value;
        if (c == "" || c == null) {
            alert("Telefonszám megadása kötelező!");
            return false;
        }
        // Telefonszám hossz ellenőrzés
        if (c.length < 10) {
            alert("Telefonszám túl rövid! Kérem használjon előhívó tagot és körzetszámot is!");
            return false;
        }
        // Telefonszám karakterellenőrzés
        let tel1 = c.match(/[A-z]/g);
        let tel2 = c.match(/[§'"!@#$%^&*]/g);
        if (tel1 != null || tel2 != null) {
            alert("Telefonszám csak '+' előtagot és számokat tartalmazhat!");
            return false;
        }
        // Email cím ellenőrzés
        let d = document.forms["regist"]["email"].value;
        if (d == "" || d == null) {
            alert("Email cím megadása kötelező!");
            return false;
        }
        // Jelszómezők ellenőrzése
        // Első mező
        let e = document.forms["regist"]["pw1"].value;
        if (e == "" || e == null) {
            alert("Az első jelszómező nincs kitöltve");
            return false;
        }
        //Második mező
        let f = document.forms["regist"]["pw2"].value;
        if(f == "" || f == null) {
            alert("A második jelszómező nincs kitöltve");
            return false;
        }
        //Jelszavak összehasonlítás
        if (e!=f) {
            alert("A két jelszómező nem egyezik meg!");
            return false;
        }
        // Jelszó hosszának ellenőrzése
        if (e.length < 6) {
            alert("A jelszónak minimum 6 karakter hosszúnak kell lennie!");
            return false;
        }
        // Jelszó karakterellenőrzés
        let jelszo1 = e.match(/[a-z]/g);
        let jelszo2 = e.match(/[A-Z]/g);
        let jelszo3 = e.match(/[0-9]/g);
        //alert(jelszo1 + "    " + jelszo2 + "     " + jelszo3);
        if (jelszo1 == null || jelszo2 == null || jelszo3 == null) {
            alert("A jelszónak tartalmaznia kell kisbetűt, nagybetűt és számot!");
            return false;
        }
        //alert("JS ellenőrzés vége");
    }
</script>
