-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2022. Jan 23. 10:18
-- Kiszolgáló verziója: 10.4.20-MariaDB
-- PHP verzió: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `burgeretterem`
--
CREATE DATABASE IF NOT EXISTS `burgeretterem` DEFAULT CHARACTER SET utf8 COLLATE utf8_hungarian_ci;
USE `burgeretterem`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `burger`
--

CREATE TABLE `burger` (
  `bazon` int(1) NOT NULL,
  `bnev` varchar(50) COLLATE utf8_hungarian_ci NOT NULL,
  `bar` int(4) NOT NULL,
  `bleir` varchar(150) COLLATE utf8_hungarian_ci NOT NULL,
  `aktiv` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------
INSERT INTO `burger` (`bazon`, `bnev`, `bar`, `bleir`) VALUES
(1, '-', 0, '-'),
(2, 'Sajtburger', 950, 'Buci, marhahúspogácsa, jégsaláta, édes hagyma, cheddar sajt, ketchup, mustár.'),
(3, 'Pusztaburger', 1150, 'Buci, marhahúspogácsa, csemegeuborka, rántott hagymakarika, gouda sajt, pusztaszósz.'),
(4, 'Beerburger', 1950, 'Buci, sörben pácolt tépett sertéshús, csemegeuborka, cheddar sajt, majonéz, barbecue szósz.'),
(5, 'Jalapeno burger', 2050, 'Buci, marhahúspogácsa, csemegeuborka, jalapeno, tabasco szósz, jalapeno sajtgolyók.'),
(6, 'Chees4You burger', 2250, 'Buci, marhahúspogácsa, jégsaláta, edami sajt, trappista sajt, gouda sajt, cheddar sajt, majonéz.'),
(7, 'Kentucky burger', 2400, 'Buci, zabpelyhes bundába panírozott csirkemell csíkok, jégsaláta, csemegeuborka, paradicsom, barbecue szósz.');
--
-- Tábla szerkezet ehhez a táblához `desszert`
--

CREATE TABLE `desszert` (
  `dazon` int(1) NOT NULL,
  `dnev` varchar(50) COLLATE utf8_hungarian_ci NOT NULL,
  `dar` int(4) NOT NULL,
  `dleir` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `aktiv` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------
INSERT INTO `desszert` (`dazon`, `dnev`, `dar`, `dleir`) VALUES
(1, '-', 0, '-'),
(2, 'Somlói galuska', 800, 'Kakaós-vaníliás piskóta tészta, mazsolával, vaníliakrémmel, házi készítésű tejszínhabbal.'),
(3, 'Gesztenyepüré', 600, 'Friss gesztenyemassza, házi készítésű tejszínhabbal.'),
(4, 'Gundel palcsinta', 950, 'Diótöltelékes palacsinta, kakaóöntettel, házi készítésű tejszínhabbal.'),
(5, 'Túrógombóc', 850, 'Gőzölt túrógombóc vanília öntettel.'),
(6, 'Prifiterol', 1000, 'Forrázott tésztából készült mini fánkocskák csokis-, vaníliás öntettel.'),
(7, 'Tiramisu', 1100, 'Kávés tejben áztatott babapiskóta, friss mascarpone-ból készült rumos-mandulás krémmel.');
--
-- Tábla szerkezet ehhez a táblához `felhasznalo`
--

CREATE TABLE `felhasznalo` (
  `azon` int(6) UNSIGNED NOT NULL,
  `nev` varchar(50) COLLATE utf8_hungarian_ci NOT NULL,
  `lak` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `tel` varchar(12) COLLATE utf8_hungarian_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_hungarian_ci NOT NULL,
  `jog` int(1) NOT NULL,
  `pw` varchar(40) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;
-- -----------------------------------------------------

INSERT INTO `felhasznalo` (`azon`, `nev`, `lak`, `tel`, `email`, `jog`, `pw`) VALUES
(0, 'Vendég', '-', '9999999', 'vendeg@vendeg', 4, '21232f297a57a5a743894a0e4a801fc3'),
(1, 'Admin', '-', '9999999', 'admin', 4, '21232f297a57a5a743894a0e4a801fc3'),
(2, 'Sipos Ferenc', '2730 Albertirsa Nemtudom u. 6.', '301236547', 'siposf@gmail.com', 4, '61bd60c60d9fb60cc8fc7767669d40a1'),
(3, 'Szabó Dániel', '2700 Cegléd Nemtudom tér 16.', '207654321', 'szabod@gmail.com', 3, '051149610f3f8157794e3e0acccd92ad'),
(4, 'Barna Bettina', '60000 Eztsemtudom u. 28.', '509876547', 'bettina.barna@gmail.com', 2, 'fce81ea0dbf31136163ea60a6ded660d'),
(5, 'Majercsik Zsolt', '2740 Abony Kölcsey Ferenc u. 6.', '701236547', 'majercsikzs73@gmail.com', 1, 'a69d723f2af79917e4a460bf828e948e'),
(7, 'Szabó Emánuel', '2700 Cegléd Nemkossuth u. 7.', '308523547', 'szaboem@gmail.com', 0, '4b27a5474ce58679ea85ed2a52e3acbd'),
(8, 'Lendér Sándor', '2700 Cegléd Nemrákóczi u. 5.', '207536547', 'lender@gmail.com', 0, '2efd51fd2d708f9baeabc9dcae674ecc'),
(9, 'Szabó Géza', '6385 Garga Mitics u. 57.', '302233665', 'szabo.geza@gmail.com', 0, 'ada7a285c4cbd97f6668de34d6fc3e15'),
(10, 'Tóth Endre', '2730 Albertirsa Valamilyen u. 36.', '304455663', 'toth.endre@gmail.com', 0, '9a8d3e5bb1003e04ba47698cf8b845e5'),
(11, 'Kovács István', '2700 Cegléd Akármilyen tér 11.', '207788996', 'kovacs.istvan@gmail.com', 0, '28202f59db5656c8b2d011a4f466fa65'),
(12, 'Fodor Imre', '6000 Kecskemét Tudom u. 21.', '507744112', 'fodor.imre@gmail.com', 0, 'ce797206158d8b6158b0a53d6cb466f9'),
(13, 'Turcsányi Rudolf', '2740 Abony Pipi tér 6.', '708855221', 'turcsanyi.rudolf@gmail.com', 0, 'e6557d61d55b575df43a9dce92185b77'),
(14, 'Horváth Eleonóra', '2700 Cegléd Fő u. 8.', '602233665', 'horvath.eleonora@gmail.com', 0, 'abb88969476fc4e238e6b18bc5690da5'),
(15, 'Demeter Aliz', '2750 Nagykőrös Tatai u. 9.', '304455663', 'demeter.aliz@gmail.com', 0, 'f716ca57a810d2b3b3e888bcadaf78fc'),
(16, 'Varga Izabella', '2700 Cegléd Nemtakács u. 11.', '207755331', 'varga.izabella@gmail.com', 0, '11b3d72e23c78fc7029f0060ab6b0c96');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `foglalas`
--

CREATE TABLE `foglalas` (
  `fazon` int(4) UNSIGNED NOT NULL,
  `azon` int(6) UNSIGNED DEFAULT NULL,
  `szemelydb` int(1) NOT NULL,
  `foglalasido` datetime NOT NULL,
  `leadva` datetime NOT NULL,
  `megjelent` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------
INSERT INTO `foglalas` (`fazon`, `azon`, `szemelydb`, `foglalasido`, `leadva`, `megjelent`) VALUES
(2, 7, 4, '2021-11-23 20:00:00', '2021-11-11 13:45:25', 1),
(3, 8, 6, '2021-11-23 20:00:00', '2021-11-12 14:12:45', 1),
(4, 8, 2, '2021-11-28 18:00:00', '2021-11-13 15:34:31', 1),
(5, 1, 4, '2021-11-28 19:00:00', '2021-11-28 19:25:46', 1),
(6, 7, 2, '2021-12-01 19:00:00', '2021-11-28 16:51:55', 1),
(8, 1, 1, '2021-12-05 20:00:00', '2021-12-05 20:21:11', 0),
(9, 11, 5, '2022-01-20 18:00:00', '2022-01-05 21:28:40', 0),
(10, 9, 4, '2022-01-11 17:00:00', '2022-01-05 21:42:58', 0),
(11, 12, 5, '2022-01-12 20:00:00', '2022-01-05 21:47:51', 0),
(12, 11, 2, '2022-01-12 18:00:00', '2022-01-05 21:49:27', 0),
(13, 12, 4, '2022-01-13 20:00:00', '2022-01-05 21:51:35', 0),
(14, 13, 8, '2022-01-12 19:00:00', '2022-01-05 21:52:08', 0),
(15, 15, 4, '2022-01-14 17:00:00', '2022-01-05 22:00:37', 0),
(16, 14, 5, '2022-01-13 19:00:00', '2022-01-05 22:01:44', 0),
(17, 16, 7, '2022-01-18 20:00:00', '2022-01-05 22:02:38', 0),
(20, 7, 3, '2022-01-21 18:00:00', '2022-01-06 07:23:58', 0),
(21, 7, 4, '2022-01-17 18:00:00', '2022-01-06 07:24:16', 0),
(22, 8, 4, '2022-01-14 19:00:00', '2022-01-06 07:25:08', 0),
(23, 8, 5, '2022-01-18 20:00:00', '2022-01-06 07:25:20', 0),
(24, 9, 4, '2022-01-14 19:00:00', '2022-01-06 07:26:06', 0),
(25, 9, 3, '2022-01-15 19:00:00', '2022-01-06 07:26:23', 0),
(26, 10, 4, '2022-01-15 19:00:00', '2022-01-06 07:27:13', 0),
(27, 10, 4, '2022-01-16 17:00:00', '2022-01-06 07:27:23', 0),
(28, 10, 6, '2022-01-21 20:00:00', '2022-01-06 07:27:44', 0),
(29, 11, 4, '2022-01-22 19:00:00', '2022-01-06 07:28:22', 0),
(30, 11, 2, '2022-01-24 19:00:00', '2022-01-06 07:28:40', 0),
(31, 12, 5, '2022-01-20 20:00:00', '2022-01-06 07:29:09', 0),
(32, 12, 2, '2022-01-22 20:00:00', '2022-01-06 07:29:19', 0),
(33, 12, 4, '2022-01-16 16:00:00', '2022-01-06 07:29:51', 0),
(34, 13, 7, '2022-01-15 18:00:00', '2022-01-06 07:30:36', 0),
(35, 13, 3, '2022-01-17 16:00:00', '2022-01-06 07:30:49', 0),
(36, 13, 4, '2022-01-20 19:00:00', '2022-01-06 07:30:59', 0),
(37, 13, 2, '2022-01-22 18:00:00', '2022-01-06 07:31:11', 0),
(38, 14, 4, '2022-01-15 18:00:00', '2022-01-06 07:31:58', 0),
(39, 14, 2, '2022-01-17 19:00:00', '2022-01-06 07:32:14', 0),
(40, 14, 6, '2022-01-22 18:00:00', '2022-01-06 07:32:27', 0),
(41, 15, 4, '2022-01-12 18:00:00', '2022-01-06 07:33:21', 0),
(42, 15, 2, '2022-01-15 19:00:00', '2022-01-06 07:33:32', 0),
(43, 15, 6, '2022-01-19 19:00:00', '2022-01-06 07:33:48', 0),
(44, 15, 2, '2022-01-22 18:00:00', '2022-01-06 07:33:58', 0),
(45, 16, 2, '2022-01-15 18:00:00', '2022-01-06 07:34:43', 0),
(46, 16, 6, '2022-01-21 17:00:00', '2022-01-06 07:34:54', 0),
(47, 16, 4, '2022-01-23 16:00:00', '2022-01-06 07:35:06', 0),
(48, 10, 2, '2022-01-06 10:18:07', '2022-01-06 10:18:07', 1);

-- --------------------------------------------------------
--
-- Tábla szerkezet ehhez a táblához `ital`
--

CREATE TABLE `ital` (
  `iazon` int(1) NOT NULL,
  `inev` varchar(50) COLLATE utf8_hungarian_ci NOT NULL,
  `iar` int(4) NOT NULL,
  `ileir` varchar(50) COLLATE utf8_hungarian_ci NOT NULL,
  `aktiv` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

INSERT INTO `ital` (`iazon`, `inev`, `iar`, `ileir`) VALUES
(1, '-', 0, '-'),
(2, 'Coca-Cola 0,33l', 350, 'Cola ízű szénsavas üdítőital'),
(3, 'Coca-Cola Zero 0,33l', 350, 'Energiamentes cola ízű szénsavas üdítőital'),
(4, 'Fanta 0,33l', 350, 'Narancs ízű szénsavas üdítőital'),
(5, 'Kinley Tonic 0,33l', 450, 'Tonik ízű szénsavas üdítőital'),
(6, 'Fuzetea Barackos 0,5', 550, 'Barack ízű jegestea'),
(7, 'Fuzetea Citromos 0,5', 550, 'Citrom ízű jegestea');

-- --------------------------------------------------------
--
-- Tábla szerkezet ehhez a táblához `koret`
--

CREATE TABLE `koret` (
  `kazon` int(1) NOT NULL,
  `knev` varchar(50) COLLATE utf8_hungarian_ci NOT NULL,
  `kar` int(4) NOT NULL,
  `kleir` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `aktiv` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

INSERT INTO `koret` (`kazon`, `knev`, `kar`, `kleir`) VALUES
(1, '-', 0, '-'),
(2, 'Csónakburgonya', 640, 'Olajban sült csónak formájú burgonyaszeletek.'),
(3, 'Édesburgonya', 800, 'Olajban sült édesburgonya hasábok.'),
(4, 'Rántott hagymakarikák', 850, 'Olajban sült hagymakarikák.'),
(5, 'Chips', 750, 'Olajban sült burgonyaszirom.'),
(6, 'Philadelphia sajtgolyó', 950, 'Panírozott sajtgolyók krémsajttal töltve.'),
(7, 'Mozzarella sajtgolyó', 900, 'Ropogós, paradicsomos rizottóval töltött golyócskák, mozzarella belsővel.');

-- --------------------------------------------------------
--
-- Tábla szerkezet ehhez a táblához `rendeles`
--

CREATE TABLE `rendeles` (
  `razon` int(4) UNSIGNED NOT NULL,
  `fazon` int(4) UNSIGNED DEFAULT NULL,
  `asztal` int(1) NOT NULL,
  `ido` datetime NOT NULL,
  `etelstatus` int(1) NOT NULL,
  `italstatus` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;
-- ---------------------------------------
INSERT INTO `rendeles` (`razon`, `fazon`, `asztal`, `ido`, `etelstatus`, `italstatus`) VALUES
(2, 2, 1, '2021-11-23 20:08:11', 4, 4),
(3, 2, 3, '2021-11-23 20:11:54', 4, 4),
(4, 3, 4, '2021-11-23 20:06:34', 4, 4),
(5, 4, 1, '2021-11-28 18:04:41', 4, 4),
(6, 4, 4, '2021-11-28 18:08:16', 4, 4),
(7, 5, 3, '2021-11-28 19:28:48', 4, 4),
(8, 6, 2, '2021-12-01 19:07:23', 4, 4),
(11, 48, 4, '2022-01-06 10:23:22', 4, 4);
-- ----------------------------------------
--
-- Eseményindítók `rendeles`
--
DELIMITER $$
CREATE TRIGGER `foglalasmegjelent` AFTER UPDATE ON `rendeles` FOR EACH ROW UPDATE foglalas f INNER JOIN rendeles r ON f.fazon = r.fazon
    SET f.megjelent = IF((SELECT MIN(r.etelstatus) FROM rendeles r WHERE f.fazon = r.fazon) = 4, 1, 0) WHERE f.fazon = r.fazon
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `tetel`
--

CREATE TABLE `tetel` (
  `tazon` int(4) UNSIGNED NOT NULL,
  `razon` int(4) UNSIGNED DEFAULT NULL,
  `bazon` int(1) NOT NULL,
  `bdb` int(1) DEFAULT NULL,
  `kazon` int(1) NOT NULL,
  `kdb` int(1) DEFAULT NULL,
  `dazon` int(1) NOT NULL,
  `ddb` int(1) DEFAULT NULL,
  `iazon` int(1) NOT NULL,
  `idb` int(1) DEFAULT NULL,
  `etelstatus` int(1) NOT NULL,
  `italstatus` int(1) NOT NULL,
  `megjegyzes` varchar(255) COLLATE utf8_hungarian_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;
-- ----------------------------------------------
INSERT INTO `tetel` (`tazon`, `razon`, `bazon`, `bdb`, `kazon`, `kdb`, `dazon`, `ddb`, `iazon`, `idb`, `etelstatus`, `italstatus`, `megjegyzes`) VALUES
(2, 2, 2, 3, 4, 2, 4, 2, 6, 2, 4, 4, ' '),
(3, 2, 3, 1, 1, 1, 1, 1, 1, 1, 4, 4, 'Hagyma nélkül'),
(4, 3, 1, 1, 3, 1, 1, 1, 2, 1, 4, 4, ' '),
(5, 3, 6, 2, 2, 2, 2, 1, 1, 1, 4, 4, ' '),
(6, 4, 4, 3, 1, 3, 1, 2, 3, 3, 4, 4, ' '),
(7, 4, 4, 1, 5, 2, 3, 2, 3, 2, 4, 4, 'Dupla majonézzel'),
(8, 5, 2, 3, 6, 2, 6, 1, 5, 3, 4, 4, ' '),
(9, 6, 3, 1, 1, 1, 5, 2, 2, 3, 4, 4, ' '),
(10, 6, 5, 2, 1, 2, 2, 1, 4, 2, 4, 4, ' '),
(11, 7, 3, 1, 1, 1, 1, 1, 1, 1, 4, 4, ' '),
(12, 7, 2, 3, 4, 2, 4, 2, 6, 2, 4, 4, 'Dupla BBQ'),
(13, 8, 1, 1, 3, 1, 1, 1, 2, 1, 4, 4, ' '),
(14, 8, 6, 2, 2, 2, 2, 1, 1, 1, 4, 4, ' '),
(15, 8, 4, 1, 5, 2, 3, 2, 3, 2, 4, 4, 'Hagyma nélkül'),
(18, 11, 3, 1, 2, 1, 1, 1, 1, 1, 4, 4, ''),
(19, 11, 1, 1, 1, 1, 1, 1, 2, 1, 4, 4, '');

-- ----------------------------------
--
-- Eseményindítók `tetel`
--
DELIMITER $$
CREATE TRIGGER `rendelestetelfrissit` AFTER UPDATE ON `tetel` FOR EACH ROW UPDATE rendeles r INNER JOIN tetel t ON r.razon = t.razon
    SET r.etelstatus = (SELECT MIN( t.etelstatus) FROM tetel t WHERE r.razon = t.razon),
    r.italstatus = (SELECT MIN( t.italstatus) FROM tetel t WHERE r.razon = t.razon)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `rendelestetelfrissitinsert` AFTER INSERT ON `tetel` FOR EACH ROW UPDATE rendeles r INNER JOIN tetel t ON r.razon = t.razon
    SET r.italstatus = (SELECT MIN( t.italstatus) FROM tetel t WHERE r.razon = t.razon),
    r.etelstatus = (SELECT MIN( t.etelstatus) FROM tetel t WHERE r.razon = t.razon)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `urestermekstatus` BEFORE INSERT ON `tetel` FOR EACH ROW SET NEW.italstatus = IF(NEW.iazon = 1,2,1), 
 NEW.etelstatus = IF(NEW.bazon = 1 AND NEW.kazon = 1 AND NEW.dazon = 1,2,1)
$$
DELIMITER ;

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `burger`
--
ALTER TABLE `burger`
  ADD PRIMARY KEY (`bazon`);

--
-- A tábla indexei `desszert`
--
ALTER TABLE `desszert`
  ADD PRIMARY KEY (`dazon`);

--
-- A tábla indexei `felhasznalo`
--
ALTER TABLE `felhasznalo`
  ADD PRIMARY KEY (`azon`);

--
-- A tábla indexei `foglalas`
--
ALTER TABLE `foglalas`
  ADD PRIMARY KEY (`fazon`),
  ADD KEY `fk_foglalas_felhasznalo` (`azon`);

--
-- A tábla indexei `ital`
--
ALTER TABLE `ital`
  ADD PRIMARY KEY (`iazon`);

--
-- A tábla indexei `koret`
--
ALTER TABLE `koret`
  ADD PRIMARY KEY (`kazon`);

--
-- A tábla indexei `rendeles`
--
ALTER TABLE `rendeles`
  ADD PRIMARY KEY (`razon`),
  ADD KEY `fk_rendeles_foglalas` (`fazon`);

--
-- A tábla indexei `tetel`
--
ALTER TABLE `tetel`
  ADD PRIMARY KEY (`tazon`),
  ADD KEY `fk_tetel_rendeles` (`razon`),
  ADD KEY `fk_tetel_burger` (`bazon`),
  ADD KEY `fk_tetel_koret` (`kazon`),
  ADD KEY `fk_tetel_desszert` (`dazon`),
  ADD KEY `fk_tetel_ital` (`iazon`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `burger`
--
ALTER TABLE `burger`
  MODIFY `bazon` int(1) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `desszert`
--
ALTER TABLE `desszert`
  MODIFY `dazon` int(1) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `felhasznalo`
--
ALTER TABLE `felhasznalo`
  MODIFY `azon` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT a táblához `foglalas`
--
ALTER TABLE `foglalas`
  MODIFY `fazon` int(4) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `ital`
--
ALTER TABLE `ital`
  MODIFY `iazon` int(1) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `koret`
--
ALTER TABLE `koret`
  MODIFY `kazon` int(1) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `rendeles`
--
ALTER TABLE `rendeles`
  MODIFY `razon` int(4) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `tetel`
--
ALTER TABLE `tetel`
  MODIFY `tazon` int(4) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `foglalas`
--
ALTER TABLE `foglalas`
  ADD CONSTRAINT `fk_foglalas_felhasznalo` FOREIGN KEY (`azon`) REFERENCES `felhasznalo` (`azon`) ON DELETE CASCADE;

--
-- Megkötések a táblához `rendeles`
--
ALTER TABLE `rendeles`
  ADD CONSTRAINT `fk_rendeles_foglalas` FOREIGN KEY (`fazon`) REFERENCES `foglalas` (`fazon`) ON DELETE CASCADE;

--
-- Megkötések a táblához `tetel`
--
ALTER TABLE `tetel`
  ADD CONSTRAINT `fk_tetel_burger` FOREIGN KEY (`bazon`) REFERENCES `burger` (`bazon`),
  ADD CONSTRAINT `fk_tetel_desszert` FOREIGN KEY (`dazon`) REFERENCES `desszert` (`dazon`),
  ADD CONSTRAINT `fk_tetel_ital` FOREIGN KEY (`iazon`) REFERENCES `ital` (`iazon`),
  ADD CONSTRAINT `fk_tetel_koret` FOREIGN KEY (`kazon`) REFERENCES `koret` (`kazon`),
  ADD CONSTRAINT `fk_tetel_rendeles` FOREIGN KEY (`razon`) REFERENCES `rendeles` (`razon`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
