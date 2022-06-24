-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Jan 03, 2022 at 02:15 PM
-- Server version: 5.7.32
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `location`
--

-- --------------------------------------------------------

--
-- Table structure for table `Appartient`
--

CREATE TABLE `Appartient` (
  `id_modele` int(11) NOT NULL,
  `id_marque` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `carburant`
--

CREATE TABLE `carburant` (
  `id_carburant` int(11) NOT NULL,
  `type` varchar(15) NOT NULL,
  `id_voiture` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `id_client` int(11) NOT NULL,
  `cin` varchar(10) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `sex` varchar(10) NOT NULL,
  `adresse` text NOT NULL,
  `tel` int(11) NOT NULL,
  `permis` varchar(10) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_contrat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Contrat`
--

CREATE TABLE `Contrat` (
  `id_contrat` int(11) NOT NULL,
  `Nom_client` varchar(40) NOT NULL,
  `Prenom_client` varchar(40) NOT NULL,
  `DateDebut` date NOT NULL,
  `DateFin` date NOT NULL,
  `Montant` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `marque`
--

CREATE TABLE `marque` (
  `id_marque` int(11) NOT NULL,
  `libelle_marque` varchar(30) NOT NULL,
  `id_voiture` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `marque`
--

INSERT INTO `marque` (`id_marque`, `libelle_marque`, `id_voiture`) VALUES
(1, 'FORD', 0),
(2, 'AUDI', 0);

-- --------------------------------------------------------

--
-- Table structure for table `model`
--

CREATE TABLE `model` (
  `id_model` int(11) NOT NULL,
  `model` varchar(20) NOT NULL,
  `annee_model` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `model`
--

INSERT INTO `model` (`id_model`, `model`, `annee_model`) VALUES
(1, 'Q5', 2020);

-- --------------------------------------------------------

--
-- Table structure for table `Reservation`
--

CREATE TABLE `Reservation` (
  `id_res` int(11) NOT NULL,
  `date_heure_depart_vehicule_reservation` datetime DEFAULT NULL,
  `date_heure_retour_vehicule_reservation` datetime DEFAULT NULL,
  `lieu_depart_vehicule_reservation` varchar(100) DEFAULT 'Marrakech',
  `lieu_retour_vehicule_reservation` varchar(100) DEFAULT 'Marrakech',
  `montant_forfait_reservation` int(11) DEFAULT '0',
  `montant_remise_reservation` int(11) DEFAULT '0',
  `mode_paiement_reservation` varchar(50) DEFAULT 'Espèce',
  `id_client` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Réserver`
--

CREATE TABLE `Réserver` (
  `id_voiture` int(11) NOT NULL,
  `id_res` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `user_name` varchar(40) NOT NULL,
  `email` varchar(80) NOT NULL,
  `password` varchar(100) NOT NULL,
  `type_user` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `voiture`
--

CREATE TABLE `voiture` (
  `id_voiture` int(11) NOT NULL,
  `matricule` varchar(30) NOT NULL,
  `carte_grise` varchar(40) NOT NULL,
  `nbporte` int(11) NOT NULL,
  `nbplaces` int(11) NOT NULL,
  `puissance` int(11) NOT NULL,
  `état` varchar(50) NOT NULL,
  `date_acquisition` date NOT NULL,
  `datedebut_assurance` date NOT NULL,
  `datefin_assurance` date NOT NULL,
  `cout_assurance` int(11) NOT NULL,
  `id_client` int(11) NOT NULL,
  `id_res` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Appartient`
--
ALTER TABLE `Appartient`
  ADD KEY `id_modele` (`id_modele`),
  ADD KEY `id_marque` (`id_marque`);

--
-- Indexes for table `carburant`
--
ALTER TABLE `carburant`
  ADD PRIMARY KEY (`id_carburant`),
  ADD KEY `id_voiture` (`id_voiture`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id_client`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_contrat` (`id_contrat`);

--
-- Indexes for table `Contrat`
--
ALTER TABLE `Contrat`
  ADD KEY `id_contrat` (`id_contrat`);

--
-- Indexes for table `marque`
--
ALTER TABLE `marque`
  ADD PRIMARY KEY (`id_marque`),
  ADD KEY `id_voiture` (`id_voiture`);

--
-- Indexes for table `model`
--
ALTER TABLE `model`
  ADD PRIMARY KEY (`id_model`);

--
-- Indexes for table `Reservation`
--
ALTER TABLE `Reservation`
  ADD PRIMARY KEY (`id_res`),
  ADD KEY `id_client` (`id_client`);

--
-- Indexes for table `Réserver`
--
ALTER TABLE `Réserver`
  ADD KEY `id_voiture` (`id_voiture`),
  ADD KEY `id_res` (`id_res`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `voiture`
--
ALTER TABLE `voiture`
  ADD PRIMARY KEY (`id_voiture`),
  ADD KEY `id_client` (`id_client`),
  ADD KEY `id_re` (`id_res`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carburant`
--
ALTER TABLE `carburant`
  MODIFY `id_carburant` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `id_client` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Contrat`
--
ALTER TABLE `Contrat`
  MODIFY `id_contrat` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marque`
--
ALTER TABLE `marque`
  MODIFY `id_marque` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `model`
--
ALTER TABLE `model`
  MODIFY `id_model` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Reservation`
--
ALTER TABLE `Reservation`
  MODIFY `id_res` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `voiture`
--
ALTER TABLE `voiture`
  MODIFY `id_voiture` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Appartient`
--
ALTER TABLE `Appartient`
  ADD CONSTRAINT `appartient_ibfk_1` FOREIGN KEY (`id_marque`) REFERENCES `marque` (`id_marque`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `appartient_ibfk_2` FOREIGN KEY (`id_modele`) REFERENCES `model` (`id_model`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `carburant`
--
ALTER TABLE `carburant`
  ADD CONSTRAINT `carburant_ibfk_1` FOREIGN KEY (`id_voiture`) REFERENCES `voiture` (`id_voiture`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `client_ibfk_1` FOREIGN KEY (`id_contrat`) REFERENCES `Contrat` (`id_contrat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `client_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Réserver`
--
ALTER TABLE `Réserver`
  ADD CONSTRAINT `réserver_ibfk_1` FOREIGN KEY (`id_voiture`) REFERENCES `voiture` (`id_voiture`);

--
-- Constraints for table `voiture`
--
ALTER TABLE `voiture`
  ADD CONSTRAINT `voiture_ibfk_1` FOREIGN KEY (`id_res`) REFERENCES `Reservation` (`id_res`) ON DELETE CASCADE ON UPDATE CASCADE;
