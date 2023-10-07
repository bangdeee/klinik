-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3307
-- Generation Time: Jan 10, 2021 at 04:38 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rumahsakit`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `id_pendaftaran` int(12) NOT NULL,
  `id_user` int(12) NOT NULL,
  `id_jadwal` int(12) NOT NULL,
  `gejala` varchar(256) NOT NULL,
  `pesan` varchar(256) NOT NULL,
  `status_janji` varchar(50) NOT NULL DEFAULT 'queue'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`id_pendaftaran`, `id_user`, `id_jadwal`, `gejala`, `pesan`, `status_janji`) VALUES
(1, 1, 2, 'Sakit', 'Bekasi', 'queue'),
(3, 1, 9, 'Alergi', 'Bekasi', 'done'),
(4, 1, 3, 'Pusing', 'Bekasi', 'queue'),
(5, 1, 3, 'sakit', 'Bekasi', 'queue'),
(6, 1, 2, 'Alergi', 'Bekasi', 'queue'),
(7, 1, 3, 'Pusing', 'Bekasi', 'queue'),
(8, 1, 3, 'Capek', 'Bekasi', 'queue');

-- --------------------------------------------------------

--
-- Table structure for table `checkup`
--

CREATE TABLE `checkup` (
  `id_checkup` int(5) NOT NULL,
  `id_user` int(5) NOT NULL,
  `paket` varchar(128) NOT NULL,
  `tanggal` date NOT NULL,
  `pesan` varchar(248) NOT NULL,
  `status_checkup` varchar(10) NOT NULL DEFAULT 'queue'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `checkup`
--

INSERT INTO `checkup` (`id_checkup`, `id_user`, `paket`, `tanggal`, `pesan`, `status_checkup`) VALUES
(1, 3, 'Woman Silver Packet', '2021-01-05', 'halohlao', 'queue');

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `id_dokter` int(12) NOT NULL,
  `nama_dokter` varchar(128) NOT NULL,
  `email_dokter` varchar(128) NOT NULL,
  `spesialisasi` varchar(50) NOT NULL,
  `nomor_telepon` varchar(15) NOT NULL,
  `kota` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`id_dokter`, `nama_dokter`, `email_dokter`, `spesialisasi`, `nomor_telepon`, `kota`) VALUES
(1, 'Dr. Anina', 'anina@gmail.com', 'Dokter Umum', '087702840399', 'Surabaya'),
(2, 'Ani', 'ani@gmail.com', 'Bidan Profesional', '087702840399', 'Jakarta'),
(3, 'Ana', 'ana@gmail.com', 'Bidan Pendamping', '0871513545212', 'Bandung'),
(4, 'Vania', 'vania@gmail.com', 'Bidan Cantik', '08123456789', 'Jakarta'),
(5, 'Nina', 'nina@gmail.com', 'Bidan', '0871513545', 'Aceh'),
(6, 'Nano', 'nano@gmail.com', 'Perawat', '087702840399', 'Jakarta'),
(7, 'Nino', 'nino@gmail.com', 'TLM', '08123456789', 'Surabaya'),
(8, 'Ina', 'ina@gmail.com', 'Bidan', '0871513545212', 'Surabaya');

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `idSchedule` int(12) NOT NULL,
  `idDoctors` int(12) NOT NULL,
  `dateSchedule` date NOT NULL,
  `daySchedule` varchar(10) NOT NULL,
  `starttime` time NOT NULL,
  `endtime` time NOT NULL,
  `avail` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`idSchedule`, `idDoctors`, `dateSchedule`, `daySchedule`, `starttime`, `endtime`, `avail`) VALUES
(2, 1, '2020-12-25', 'Wednesday', '13:00:00', '00:00:00', 'full'),
(3, 1, '2021-01-09', 'Friday', '12:00:00', '12:30:00', 'available'),
(4, 2, '2020-12-27', 'Saturday', '12:00:00', '00:00:00', 'available'),
(5, 3, '2021-01-25', 'Monday', '08:30:00', '09:45:00', 'available'),
(6, 4, '2021-01-09', 'Thursday', '12:00:00', '09:45:00', 'available'),
(7, 5, '2021-01-01', 'Sunday', '15:00:00', '15:45:00', 'available'),
(8, 6, '2020-12-25', 'Thursday', '06:30:00', '09:00:00', 'available'),
(9, 7, '2020-12-16', 'Tuesday', '15:00:00', '00:00:00', 'available'),
(10, 8, '2021-01-15', 'Monday', '13:00:00', '15:45:00', 'available');

-- --------------------------------------------------------

--
-- Table structure for table `spesialisasi`
--

CREATE TABLE `spesialisasi` (
  `jenis_spesialisasi` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `spesialisasi`
--

INSERT INTO `spesialisasi` (`jenis_spesialisasi`) VALUES
('Bidan'),
('Bidan Cantik'),
('Bidan Profesional'),
('Bidan Pendamping'),
('Dokter Umum'),
('Perawat'),
('TLM');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `usersId` int(12) NOT NULL,
  `usersName` varchar(128) NOT NULL,
  `usersUsername` varchar(128) NOT NULL,
  `usersEmail` varchar(128) NOT NULL,
  `phoneNumber` varchar(15) NOT NULL,
  `usersPassword` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`usersId`, `usersName`, `usersUsername`, `usersEmail`, `phoneNumber`, `usersPassword`) VALUES
(1, 'adam al hafidh', 'adam', 'adam@gmail.com', '08123456789', '$2y$10$J0AwsIjQulrOhti5zk9DMeAZ8KETNu59N6UN/pSi7J1bWnBWU4f6i'),
(2, 'zakky okky', 'zakky', 'zakky.okky@gmail.com', '087702840399', '$2y$10$xeG0p4oQ8gBPxTKv51Y0K.AuTeype0IexrbMQNPsrwLTkouI1GG32'),
(3, 'dani luluk', 'luluk', 'luluk@gmail.com', '087702840399', '$2y$10$BqLMSzvxoPStCnHNK9iFS.ydVMUqXOYMBmaAwKVJB95gmqkbjgK1O'),
(4, 'budi santoso', 'budi', 'budi@gmail.com', '08123456789', '$2y$10$ONSVqnWN/DNQ9d6JePVQA.iZw9wWXBjLB8a2e2HY88zbFxOJx2LFO'),
(5, 'adam', 'adam11', 'adam11@gmail.com', '08123456789', '$2y$10$0Ojce5tJ6K/bbQs.oK/XR.V9onAJ8jjh9klGmL5SoVVidtfsLJ8fC');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`id_pendaftaran`);

--
-- Indexes for table `checkup`
--
ALTER TABLE `checkup`
  ADD PRIMARY KEY (`id_checkup`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id_dokter`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`idSchedule`);

--
-- Indexes for table `spesialisasi`
--
ALTER TABLE `spesialisasi`
  ADD PRIMARY KEY (`jenis_spesialisasi`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`usersId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `id_pendaftaran` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `checkup`
--
ALTER TABLE `checkup`
  MODIFY `id_checkup` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id_dokter` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `idSchedule` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `usersId` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
