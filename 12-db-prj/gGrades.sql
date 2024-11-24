-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Czas generowania: 28 Paź 2021, 12:23
-- Wersja serwera: 5.7.36-0ubuntu0.18.04.1
-- Wersja PHP: 7.2.24-0ubuntu0.18.04.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `gGrades`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `answer`
--

CREATE TABLE `answer` (
  `id` int(8) NOT NULL,
  `questId` int(8) NOT NULL,
  `pub` int(1) DEFAULT '1',
  `lockd` int(1) DEFAULT '1',
  `ansLabel` varchar(64) NOT NULL,
  `ansDesc` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `answer`
--

INSERT INTO `answer` (`id`, `questId`, `pub`, `lockd`, `ansLabel`, `ansDesc`) VALUES
(1, 1, 1, 1, 'Tak', NULL),
(2, 1, 1, 1, 'Nie', NULL),
(3, 1, 1, 1, 'Raczej tak', NULL),
(4, 1, 1, 1, 'Raczej nie', NULL),
(5, 1, 1, 1, 'Nie wiem', NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `answers`
--

CREATE TABLE `answers` (
  `id` int(8) NOT NULL,
  `idDoc` int(8) NOT NULL,
  `idQuest` int(8) NOT NULL,
  `idAnsw` int(8) NOT NULL,
  `idPerson` int(8) NOT NULL,
  `dataDod` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `dataMod` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `documents`
--

CREATE TABLE `documents` (
  `id` int(8) NOT NULL,
  `typeId` int(2) NOT NULL DEFAULT '0',
  `ownerId` int(8) NOT NULL DEFAULT '1',
  `pub` int(1) DEFAULT '0',
  `lockd` int(1) DEFAULT '0',
  `intro` int(1) DEFAULT '1',
  `questPerView` int(1) DEFAULT '0',
  `dspRes` int(1) DEFAULT '0',
  `dspAnsw` int(1) DEFAULT '0',
  `dspCorAnsw` int(1) DEFAULT '0',
  `rndQuest` int(1) DEFAULT '0',
  `rndAnsw` int(1) DEFAULT '0',
  `limitTime1` int(8) DEFAULT '360',
  `limitTime2` int(8) DEFAULT '180',
  `name` varchar(128) NOT NULL DEFAULT 'noName',
  `desc` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `documents`
--

INSERT INTO `documents` (`id`, `typeId`, `ownerId`, `pub`, `lockd`, `intro`, `questPerView`, `dspRes`, `dspAnsw`, `dspCorAnsw`, `rndQuest`, `rndAnsw`, `limitTime1`, `limitTime2`, `name`, `desc`) VALUES
(1, 5, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 360, 180, 'Co sprawia problem w systemie Linux?', 'na prawdę co?'),
(2, 4, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 360, 180, 'Co należy poprawić w witrynie edu.gplweb.pl?', 'Odpowiedz szczerze'),
(3, 2, 1, 1, 0, 1, 0, 1, 1, 0, 0, 0, 360, 180, 'HTML: znaczniki liniowe i blokowe, struktury danych, formularze', 'Pogrupuj znaczniki do odpowiednich kategorii');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `documentTypes`
--

CREATE TABLE `documentTypes` (
  `id` int(8) NOT NULL,
  `pub` int(1) DEFAULT '1',
  `label` varchar(16) NOT NULL,
  `desc` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `documentTypes`
--

INSERT INTO `documentTypes` (`id`, `pub`, `label`, `desc`) VALUES
(1, 1, 'test', NULL),
(2, 1, 'sprawdzian', NULL),
(3, 1, 'kartkówka', NULL),
(4, 1, 'ankietaJawna', NULL),
(5, 1, 'ankietaAnonimowa', NULL),
(6, 1, 'quiz', NULL),
(7, 1, 'konkurs', NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `question`
--

CREATE TABLE `question` (
  `id` int(8) NOT NULL,
  `docId` int(8) NOT NULL,
  `typeId` int(8) DEFAULT '0',
  `pub` int(1) DEFAULT '0',
  `lockd` int(1) DEFAULT '1',
  `letMod` int(1) DEFAULT '1',
  `limitAnsw` varchar(8) DEFAULT '360',
  `quName` varchar(128) NOT NULL,
  `quDesc` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `question`
--

INSERT INTO `question` (`id`, `docId`, `typeId`, `pub`, `lockd`, `letMod`, `limitAnsw`, `quName`, `quDesc`) VALUES
(1, 1, 1, 0, 1, 1, '360', 'Czy to fakt, że to nie Windows?', NULL),
(2, 1, 1, 0, 1, 1, '360', 'Czy to fakt, że ikonki są inne?', NULL),
(3, 3, 2, 1, 1, 1, '360', 'Elementy liniowe samozamykające', NULL),
(4, 3, 2, 1, 1, 1, '360', 'Elementy liniowe z treścią', NULL),
(5, 3, 2, 1, 1, 1, '360', 'Elementy blokowe podstawowe', NULL),
(6, 3, 2, 1, 1, 1, '360', 'Elementy blokowe strukturalne', NULL),
(7, 3, 2, 1, 1, 1, '360', 'Elementy blokowe formularzy', NULL),
(8, 3, 2, 1, 1, 1, '360', 'Czy zapis działa?', 'Napisz ntt. sprawozdanie');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `questionTypes`
--

CREATE TABLE `questionTypes` (
  `id` int(2) NOT NULL,
  `pub` int(1) DEFAULT '1',
  `label` varchar(16) NOT NULL,
  `desc` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `questionTypes`
--

INSERT INTO `questionTypes` (`id`, `pub`, `label`, `desc`) VALUES
(1, 1, 'tak/nie', NULL),
(2, 1, 'otwarte', NULL),
(3, 1, 'macierz', NULL),
(4, 1, 'wybórPojed', NULL),
(5, 1, 'wybórWielokrotny', NULL),
(6, 1, 'prześlijPlik', NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `studEnrols`
--

CREATE TABLE `studEnrols` (
  `id` int(11) NOT NULL,
  `actId` int(8) NOT NULL,
  `studId` int(8) NOT NULL,
  `present` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `students`
--

CREATE TABLE `students` (
  `id` int(8) NOT NULL,
  `class` int(8) NOT NULL,
  `group` int(8) NOT NULL,
  `name` varchar(16) NOT NULL,
  `surname` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `teachers`
--

CREATE TABLE `teachers` (
  `id` int(8) NOT NULL,
  `title` varchar(10) DEFAULT NULL,
  `name` varchar(16) NOT NULL,
  `surname` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wyniki`
--

CREATE TABLE `wyniki` (
  `id` int(8) NOT NULL,
  `docId` int(8) NOT NULL,
  `studId` int(8) NOT NULL,
  `points` int(3) DEFAULT NULL,
  `data` timestamp NULL DEFAULT NULL,
  `desc` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `answer`
--
ALTER TABLE `answer`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_answ_answs_idx` (`idAnsw`),
  ADD KEY `fk_answ_studs_idx` (`idPerson`);

--
-- Indeksy dla tabeli `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_docTypes_idx` (`typeId`);

--
-- Indeksy dla tabeli `documentTypes`
--
ALTER TABLE `documentTypes`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_quest_docs_idx` (`docId`),
  ADD KEY `fk_questTypes_idx` (`typeId`);

--
-- Indeksy dla tabeli `questionTypes`
--
ALTER TABLE `questionTypes`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `studEnrols`
--
ALTER TABLE `studEnrols`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_enrols_act_idx` (`actId`),
  ADD KEY `fk_enrols_stud_idx` (`studId`);

--
-- Indeksy dla tabeli `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `wyniki`
--
ALTER TABLE `wyniki`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_wyn_docs_idx` (`docId`),
  ADD KEY `fk_wyn_studs_idx` (`studId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `answer`
--
ALTER TABLE `answer`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `answers`
--
ALTER TABLE `answers`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `documents`
--
ALTER TABLE `documents`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `documentTypes`
--
ALTER TABLE `documentTypes`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT dla tabeli `question`
--
ALTER TABLE `question`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT dla tabeli `questionTypes`
--
ALTER TABLE `questionTypes`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT dla tabeli `studEnrols`
--
ALTER TABLE `studEnrols`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `students`
--
ALTER TABLE `students`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `wyniki`
--
ALTER TABLE `wyniki`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `answers`
--
ALTER TABLE `answers`
  ADD CONSTRAINT `fk_answ` FOREIGN KEY (`idAnsw`) REFERENCES `answer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_answ_studs` FOREIGN KEY (`idPerson`) REFERENCES `students` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `documents`
--
ALTER TABLE `documents`
  ADD CONSTRAINT `fk_docTypes` FOREIGN KEY (`typeId`) REFERENCES `documentTypes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `fk_questTypes` FOREIGN KEY (`typeId`) REFERENCES `questionTypes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_quest_docs` FOREIGN KEY (`docId`) REFERENCES `documents` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `studEnrols`
--
ALTER TABLE `studEnrols`
  ADD CONSTRAINT `fk_enrols_act` FOREIGN KEY (`actId`) REFERENCES `activities` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_enrols_stud` FOREIGN KEY (`studId`) REFERENCES `students` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `wyniki`
--
ALTER TABLE `wyniki`
  ADD CONSTRAINT `fk_wyn_docs` FOREIGN KEY (`docId`) REFERENCES `documents` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_wyn_studs` FOREIGN KEY (`studId`) REFERENCES `students` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
