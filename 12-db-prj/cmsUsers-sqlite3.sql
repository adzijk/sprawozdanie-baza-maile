CREATE TABLE `cmsUsers` (
  `id` INT(4) NOT NULL,
  `active` int(1) NOT NULL DEFAULT '0',
  `logTry` int(1) NOT NULL DEFAULT '0',
  `lastLogin` timestamp NOT NULL,
  `email` varchar(40) NOT NULL,
  `user` varchar(40) NOT NULL,
  `name` varchar(25) NOT NULL,
  `surname` varchar(64) NOT NULL,
  `passwd` varchar(120) NOT NULL,
  `token` varchar(255) DEFAULT NULL
);

--
-- Zrzut danych tabeli `cmsUsers`
--

INSERT INTO `cmsUsers` (`id`, `active`, `logTry`, `lastLogin`, `email`, `user`, `name`, `surname`, `passwd`, `token`) VALUES
(1, 1, 0, '2020-02-19 23:00:00', 'jkreciwałek@zse.local', 'jkreciwałek', 'Jolanta', 'Kręciwałek', '12345Ty#', 'spc. ds. Zamówień publicznych '),
(2, 1, 0, '2020-02-19 23:00:00', 'fbrajanusz@zse.local', 'fbrajanusz', 'Fachmann', 'Brajanusz', '12345Ty#', 'spc. ds. Projektów Unijnych '),
(3, 1, 0, '2020-02-19 23:00:00', 'mnieda@zse.local', 'mnieda', 'Miranda', 'Nieda', '12345Ty#', 'kier. gospodarczy   '),
(4, 1, 0, '2020-02-19 23:00:00', 'mwcisnechlam@zse.local', 'mwcisnechlam', 'Marta', 'Wcisnechłam', '12345Ty#', 'spc. ds. sprzedaży  '),
(5, 1, 0, '2020-02-19 23:00:00', 'jdonos@zse.local', 'jdonos', 'Jacek', 'Donos', '12345Ty#', 'spc. ds. kontroli i bezpieczeństwa'),
(6, 1, 0, '2020-02-19 23:00:00', 'kstaraszkola@zse.local', 'kstaraszkola', 'Kazimierz', 'Staraszkoła', '12345Ty#', 'spc. ds. rozwoju  '),
(7, 1, 0, '2020-02-19 23:00:00', 'mkreda@zse.local', 'mkreda', 'Mariusz', 'Kreda', '12345Ty#', 'spc. ds. szkoleń  '),
(8, 1, 0, '2020-02-19 23:00:00', 'fnierusz@zse.local', 'fnierusz', 'Franciszek', 'Nierusz', '12345Ty#', 'spc. ds. technicznych  '),
(9, 1, 0, '2020-02-19 23:00:00', 'akasybrak@zse.local', 'akasybrak', 'Aldona', 'Kasybrak', '12345Ty#', 'spc. ds. finansowo-księgowych  '),
(10, 1, 0, '2020-02-19 23:00:00', 'bbezpamieci@zse.local', 'bbezpamieci', 'Barbara', 'Bezpamięci', '12345Ty#', 'spc. ds. planowania'),
(11, 1, 0, '2020-02-19 23:00:00', 'mwielepiej@zse.local', 'mwielepiej', 'Mirosław', 'Wielepiej', '12345Ty#', 'spc. ds. doradztwa biznesowego ');

ALTER TABLE `cmsUsers`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `cmsUsers`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;
