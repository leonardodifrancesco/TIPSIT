-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Mag 31, 2021 alle 20:03
-- Versione del server: 10.4.18-MariaDB
-- Versione PHP: 8.0.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `elaborato_domanda_offerta_lavoro`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `aree_lavorative`
--

CREATE TABLE `aree_lavorative` (
  `id` int(11) NOT NULL,
  `nome` char(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `aree_lavorative`
--

INSERT INTO `aree_lavorative` (`id`, `nome`) VALUES
(1, 'Legale'),
(2, 'Finanziario'),
(3, 'Assicurativo'),
(4, 'Bancario'),
(5, 'Turismo'),
(6, 'Moda'),
(7, 'Ristorazione e Alberghiero'),
(8, 'Acquisti'),
(9, 'Segreteria'),
(10, 'Call Center'),
(11, 'Produzione'),
(12, 'Industria'),
(13, 'Logistica'),
(14, 'Medico'),
(15, 'Farmaceutico'),
(16, 'Scientifico'),
(17, 'Commerciale'),
(18, 'Vendite'),
(19, 'Marketing');

-- --------------------------------------------------------

--
-- Struttura della tabella `domanda`
--

CREATE TABLE `domanda` (
  `id_domanda` int(11) NOT NULL,
  `altro` varchar(5000) DEFAULT NULL,
  `id_aree_lavorative` int(11) DEFAULT NULL,
  `nome` char(30) DEFAULT NULL,
  `cognome` char(30) DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  `curriculum_vitae` varchar(5000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `domanda`
--

INSERT INTO `domanda` (`id_domanda`, `altro`, `id_aree_lavorative`, `nome`, `cognome`, `telefono`, `curriculum_vitae`) VALUES
(85, '1', 1, '1', '1', 1, '11'),
(86, 'dario cacca', 1, 'Leonardo', 'Di Francesco', 2147483647, 'zuccante'),
(87, 'non mi interessa', 1, 'Emanuela', 'Cais', 23, 'xxxx');

-- --------------------------------------------------------

--
-- Struttura della tabella `offerta`
--

CREATE TABLE `offerta` (
  `id_offerta` int(11) NOT NULL,
  `altro` varchar(5000) DEFAULT NULL,
  `id_aree_lavorative` int(11) DEFAULT NULL,
  `nome_azienda` char(50) DEFAULT NULL,
  `informazioni_azienda` varchar(500) DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `offerta`
--

INSERT INTO `offerta` (`id_offerta`, `altro`, `id_aree_lavorative`, `nome_azienda`, `informazioni_azienda`, `telefono`) VALUES
(27, 'dario mhanz', 1, 'dario company', 'sono scarso', 123);

-- --------------------------------------------------------

--
-- Struttura della tabella `utente`
--

CREATE TABLE `utente` (
  `nome_o_nomeazienda` char(50) DEFAULT NULL,
  `cognome` char(30) DEFAULT NULL,
  `cf_o_id` char(50) NOT NULL,
  `email` char(30) DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  `password` char(30) DEFAULT NULL,
  `tipo` char(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `utente`
--

INSERT INTO `utente` (`nome_o_nomeazienda`, `cognome`, `cf_o_id`, `email`, `telefono`, `password`, `tipo`) VALUES
('1', '1', '', 'leonardo@gmail.com', 1, '1', 'azienda'),
('1', '1', '1', 'smaskedif@gmail.com', 123, 'ciao', 'azienda'),
('32', '', '131', '324@gmail.com', 1, '455', 'azienda'),
('Smaskedif company', '', '37484', '567@gmail.com', 2147483647, 'leo01', 'azienda'),
('wfr3', 'ef', 'crf', '123@gmail.com', 0, '1', 'privato'),
('Leonardo', 'Di Francesco', 'dfrlo3021', 'leonardo.difrancesco@itiszucca', 2147483647, 'Leo01', 'privato'),
('sofia', 'facciolo', 'sofia', 'facciolo.sofia@gmial.com', 323323, 'delfino01', 'privato');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `aree_lavorative`
--
ALTER TABLE `aree_lavorative`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `domanda`
--
ALTER TABLE `domanda`
  ADD PRIMARY KEY (`id_domanda`),
  ADD KEY `domanda_ibfk_1` (`id_aree_lavorative`);

--
-- Indici per le tabelle `offerta`
--
ALTER TABLE `offerta`
  ADD PRIMARY KEY (`id_offerta`),
  ADD KEY `offerta_ibfk_1` (`id_aree_lavorative`);

--
-- Indici per le tabelle `utente`
--
ALTER TABLE `utente`
  ADD PRIMARY KEY (`cf_o_id`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `aree_lavorative`
--
ALTER TABLE `aree_lavorative`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT per la tabella `domanda`
--
ALTER TABLE `domanda`
  MODIFY `id_domanda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT per la tabella `offerta`
--
ALTER TABLE `offerta`
  MODIFY `id_offerta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `domanda`
--
ALTER TABLE `domanda`
  ADD CONSTRAINT `domanda_ibfk_1` FOREIGN KEY (`id_aree_lavorative`) REFERENCES `aree_lavorative` (`id`);

--
-- Limiti per la tabella `offerta`
--
ALTER TABLE `offerta`
  ADD CONSTRAINT `offerta_ibfk_1` FOREIGN KEY (`id_aree_lavorative`) REFERENCES `aree_lavorative` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
