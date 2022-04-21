-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2022. Feb 25. 23:06
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

--
-- A tábla adatainak kiíratása `burger`
--

INSERT INTO `burger` (`bazon`, `bnev`, `bar`, `bleir`, `aktiv`) VALUES
(1, '-', 0, '-', 1),
(2, 'Testburger', 2000, 'sdfsdfs', 1);

-- --------------------------------------------------------

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

--
-- A tábla adatainak kiíratása `desszert`
--

INSERT INTO `desszert` (`dazon`, `dnev`, `dar`, `dleir`, `aktiv`) VALUES
(1, '-', 0, '-', 1),
(2, 'Testdesszert', 2000, 'asdsdffsd', 1);

-- --------------------------------------------------------

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

--
-- A tábla adatainak kiíratása `felhasznalo`
--

INSERT INTO `felhasznalo` (`azon`, `nev`, `lak`, `tel`, `email`, `jog`, `pw`) VALUES
(0, 'Vendég', 'Helyben', '0', 'vendeg@vendeg', 0, 'b59c67bf196a4758191e42f76670ceba'),
(1, 'Admin', '-', '9999999', 'admin', 4, '21232f297a57a5a743894a0e4a801fc3');

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

--
-- A tábla adatainak kiíratása `foglalas`
--

INSERT INTO `foglalas` (`fazon`, `azon`, `szemelydb`, `foglalasido`, `leadva`, `megjelent`) VALUES
(1, 0, 1, '2022-02-25 23:02:21', '2022-02-25 23:02:21', 1),
(2, 0, 1, '2022-02-25 23:02:48', '2022-02-25 23:02:48', 1),
(3, 0, 1, '2022-02-25 23:03:14', '2022-02-25 23:03:14', 1),
(4, 1, 1, '2022-01-26 23:03:14', '2022-02-25 23:03:14', 1);

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

--
-- A tábla adatainak kiíratása `ital`
--

INSERT INTO `ital` (`iazon`, `inev`, `iar`, `ileir`, `aktiv`) VALUES
(1, '-', 0, '-', 1),
(2, 'Testital', 1000, 'Test ital leírás', 1);

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

--
-- A tábla adatainak kiíratása `koret`
--

INSERT INTO `koret` (`kazon`, `knev`, `kar`, `kleir`, `aktiv`) VALUES
(1, '-', 0, '-', 1),
(2, 'Testkoret', 1000, 'Test köret leírás', 1);

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

--
-- A tábla adatainak kiíratása `rendeles`
--

INSERT INTO `rendeles` (`razon`, `fazon`, `asztal`, `ido`, `etelstatus`, `italstatus`) VALUES
(1, 1, 5, '2022-02-25 23:02:21', 4, 4),
(2, 2, 8, '2022-02-25 23:02:48', 4, 4),
(3, 3, 2, '2022-02-25 23:03:14', 4, 4),
(4, 4, 2, '2022-01-26 23:03:14', 4, 4);

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

--
-- A tábla adatainak kiíratása `tetel`
--

INSERT INTO `tetel` (`tazon`, `razon`, `bazon`, `bdb`, `kazon`, `kdb`, `dazon`, `ddb`, `iazon`, `idb`, `etelstatus`, `italstatus`, `megjegyzes`) VALUES
(1, 1, 2, 1, 1, 1, 1, 1, 2, 1, 4, 4, NULL),
(2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 4, 4, NULL),
(3, 2, 1, 1, 1, 1, 1, 1, 2, 1, 4, 4, NULL),
(4, 2, 1, 1, 1, 1, 2, 2, 1, 1, 4, 4, NULL),
(5, 3, 2, 1, 2, 1, 1, 1, 1, 1, 4, 4, NULL),
(6, 4, 2, 1, 2, 1, 1, 1, 1, 1, 4, 4, NULL),
(7, 4, 1, 1, 1, 1, 1, 1, 2, 1, 4, 4, NULL);

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
  MODIFY `bazon` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT a táblához `desszert`
--
ALTER TABLE `desszert`
  MODIFY `dazon` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT a táblához `felhasznalo`
--
ALTER TABLE `felhasznalo`
  MODIFY `azon` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT a táblához `foglalas`
--
ALTER TABLE `foglalas`
  MODIFY `fazon` int(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT a táblához `ital`
--
ALTER TABLE `ital`
  MODIFY `iazon` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT a táblához `koret`
--
ALTER TABLE `koret`
  MODIFY `kazon` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT a táblához `rendeles`
--
ALTER TABLE `rendeles`
  MODIFY `razon` int(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT a táblához `tetel`
--
ALTER TABLE `tetel`
  MODIFY `tazon` int(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
