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
            session_start();
            include_once("navbar.php");
        ?>


        <div class="clearfix">
            <p>
                A magas minőségű alapanyagokat magunk dolgozzuk fel, szigorú kontroll alatt, és úgy állítottuk össze, hogy a hozzávalók tökéletes harmóniája fokozza a gasztronómiai élményt. <br>
                Minden burger más, kóstold meg őket, és garantált, hogy több kedvenced is lesz.
            </p>

            <p>
                Amikor 2013-ban úgy döntöttünk, felpörgetjük, megreformáljuk az utcai étkezést, nem is gondoltuk, hogy ilyen gyorsan még ennél is tovább lépünk. <br>
                A célunk már akkor is az volt, hogy minőségi, ízletes, prémium hamburgert készítsünk; olyat, ami a városban mozgolódva a legnagyobb rendezvényeken is elérhető.
            </p>

            <p>
                Tudtuk, hogy külföldön van ilyen, és működik, sőt eszméletlenül menő. <br>
                Elhatároztuk, hogy amit eddig itthon csak filmekben láttunk, igenis kell nekünk, és mi szeretnénk lenni a hazai “food truck mozgalom” zászlóvivői. <br>
                Neki is láttunk, hogy Európa-szerte felkutassuk a legízletesebb összetevőket, a legomlósabb zsemlét és az igazi marhahúst. Ezeket összegyúrtuk, és el is készültek az első finom hamburgerek.
            </p>

            <div>
                <img class="img-fluid float-end rounded mainImg" src="images/hatter/Livepool-St-restaurant14-optimised.jpg" alt="étterem-háttér1">
            </div>

            <p>
                A nyári fesztiválokon és az esti pörgésen túl fő irány, hogy nagyobb irodaházak, forgalmasabb városi csomópontok mellett álljunk meg egy food truckkal, és kínáljunk minőségi street food alternatívát a munkahelyi étkezésre. <br>
                A kínálatot mindig a helyszínhez igazítjuk, így a burgerek mellett különböző snackeket kínálunk, és szomjaznotok sem kell nálunk.
            </p>

            <p>
                2014 novemberéhez köthető az újabb mérföldkő a Burger Étterem életében: megnyitottuk Budapest egyik legfinomabb gyorséttermét, a Seholnemtalálható utca 60. szám alatt, ahol a már megszokott minőségi és prémium hamburgereinket tálcán 
                kínáljuk Nektek egy olyan barátságos és hangulatos helyen, ahol télen kedvetekre üldögélhettek a barátaitokkal egy-egy finom hamburger, snack, meleg ital mellett, használhatjátok a wifinket, és amint kisüt a nap, akár a teraszunkon is falatozhattok, a város szívében.
            </p>

            <p>
                És azóta sem álltunk meg.
            </p>

            <p>
                2015 januárjában begurultunk egy food truckkal a Városmajorba. A 2016-os évről pedig büszkén kijelenthetjük, hogy a mi évünk volt: májusban megnyitottuk első állandó helyünket Budán, a Kálmán Király téren. <br>
                Hogy ez miért nagyszerű? <br>
                Mert így nem kell beutaznod Pestre, ha burgerezni szeretnél. <br>
                Októberben, Budapest szívében, a Szabó utcai Konyha&Co. egységgel bővültünk, ahol a burgerek mellett ínycsiklandozó ételkülönlegességekkel és hétről hétre változó ebéd menüvel találkozhatsz, melyeket 
                Szabó Dániel, Sipos Ferenc és Majercsik Zsolt séfek állít össze. <br>
            </p>

            <div>
                <img class="img-fluid float-start rounded mainImg" src="images/hatter/LiverpoolSt_05.jpg" alt="étterem-háttér2">
            </div>

            <p>
                2017 szeptemberétől az Alien Bevásárlóközpont bejáratánál is ott vagyunk egy food truckkal, vagyis Budán már két helyünk van. <br>
                Továbbá “összekötöttük” a Királyka utcai 4-6-os megállót a II.Ferenc József térrel; a Királyka 60 mellett a Királyka utca 20. szám alá is beköltöztünk!
            </p>
            <br />
            <p>
                Folyamatosan bővülünk, és járjuk az országot, néha pedig külföldre is kikacsintunk, hogy mindenki megismerhesse finom hamburgereinket. <br>
                Te még nem próbáltad a Burger Éttermet? Akkor legfőbb ideje!
            </p>
        </div>


        <footer class="page-footer text-center wow fadeIn">
            <div class="py-5 bg-dark">
                <span class="footer-copyright text-secondary center" id="copyright">© 2022 Copyright:</span>
                <span class="text-secondary center">Burger Étterem</span>
            </div>
        </footer>

        <script crossorigin src="https://unpkg.com/react@17/umd/react.development.js"></script>
        <script crossorigin src="https://unpkg.com/react-dom@17/umd/react-dom.development.js"></script>
        <script src="app.js"></script>
    </body>
</html>