# Vizsgaremek2022

Ahhoz, hogy az oldalakat tesztelni lehessen, le kell töltenünk az XAMPP programot és fel is kell telepítenünk.

Amelyik meghajtóra telepítettük, ott az xampp mappán belül a htdocs mappába kell bemásolnunk a BurgerEtterem_Vizsgaremek mappát, az összes fájlal együtt. (C:\ meghajtón az útvonal így néz ki: C:\xampp\htdocs\BurgerEtterem_Vizsgaremek)

Ezután el kell indítanunk az XAMPP-ot és a Control Panel-en az Apache és MySQL modulokat.

Az Adatbázis mappán belül található az adatbázis, amit be kell importálnunk a phpMyAdmin-ban. Ehhez meg kell nyitnunk az XAMPP Control Paneljét és a MySQL sorában található Admin gombra kattintva érhetjük el a phpMyAdmin felületét, ami egy böngészőablakban nyílik meg.
Itt az Importálást kell kiválasztanunk, majd a Tallózás gomra kattintva kiválasztanunk az importálandó adatbázist. (burgeretterem.sql)

Majd a Forráskód mappán belül a VizsgaremekAPI-t is.

Ha ezekkel meg vagyunk, akkor a Hamburgerező főoldalát a localhoston tudjuk elérni, a következő címet megadva a böngésző url címében:
localhost/BurgerEtterem_Vizsgaremek/index.php

Az asztali alkalmazás forráskódja a Forráskód/AsztaliAlkalmazas mappában található.

A telepítő a Telepito/Asztali-ban található, a setup.exe-re kattintva elindul a telepítés, utána egyből elindul az applikáció, és a start menüben is megtalálható.
