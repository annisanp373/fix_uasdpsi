-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 24, 2024 at 07:12 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_uasdpsi7`
--

-- --------------------------------------------------------

--
-- Table structure for table `complaints`
--

CREATE TABLE `complaints` (
  `id` int(11) NOT NULL,
  `studentId` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `status` enum('submitted','in progress','resolved') DEFAULT 'submitted',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `staffId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `complaints`
--

INSERT INTO `complaints` (`id`, `studentId`, `title`, `description`, `status`, `createdAt`, `updatedAt`, `staffId`) VALUES
(1, 1, 'Pelayanan TU Hukum', 'Perkenalkan saya nisa prodi Hukum angkatan 21. Saya ingin melakukan pengaduan terkait pelayanan TU Hukum, dimana pelayanan dari salah satu anggota TU Hukum kurang ramah dan terkesan kurang baik. Mohon untuk ditindak lanjut agar pelayanan nya lebih baik. Terimakasih ', 'resolved', '2024-07-24 16:51:27', '2024-07-24 16:56:59', 2),
(2, 1, 'Perubahan kelas', 'Perkenalkan saya ingin melakukan perubahan kelas A ke kelas B pada mata kuliah C. Terimakasih ', 'resolved', '2024-07-24 16:52:57', '2024-07-24 16:57:40', 2);

-- --------------------------------------------------------

--
-- Table structure for table `responses`
--

CREATE TABLE `responses` (
  `id` int(11) NOT NULL,
  `complaintId` int(11) NOT NULL,
  `responseText` text NOT NULL,
  `staffId` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `responses`
--

INSERT INTO `responses` (`id`, `complaintId`, `responseText`, `staffId`, `createdAt`, `updatedAt`) VALUES
(1, 1, 'Halo mba annisanp. Kami memohon maaf terkait pelayanan TU Hukum yang kurang ramah, untuk selanjutnya akan kami tindak lanjuti kepada yang bersangkutan. Terimakasih atas pengaduan nya', 2, '2024-07-24 16:56:59', '2024-07-24 16:56:59'),
(2, 2, 'Halo mba annisanp. Baik permintaan saudara akan kami proses. Terimakasih atas pengaduan nya', 2, '2024-07-24 16:57:40', '2024-07-24 16:57:40');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('student','staff') NOT NULL,
  `nim` varchar(255) DEFAULT NULL,
  `id_staff` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `nim`, `id_staff`, `createdAt`, `updatedAt`) VALUES
(1, 'nisaa', 'nisaa@gmail.com', '$2b$10$dt4Clw/oxbCwpgUhSYeG1OyYTH3awYYSkJHSt5uu8UpqhNIYKjGGK', 'student', '2100016016', NULL, '2024-07-24 16:47:22', '2024-07-24 16:47:22'),
(2, 'kayla', 'kayla@gmail.com', '$2b$10$6jZ7c9gqj4sLKhRZJPZcE.PJ2mN2nyuYSFeoBoAH4cR.XAT5eh106', 'staff', NULL, '10001', '2024-07-24 16:49:57', '2024-07-24 16:49:57');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `complaints`
--
ALTER TABLE `complaints`
  ADD PRIMARY KEY (`id`),
  ADD KEY `studentId` (`studentId`),
  ADD KEY `staffId` (`staffId`);

--
-- Indexes for table `responses`
--
ALTER TABLE `responses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `complaintId` (`complaintId`),
  ADD KEY `staffId` (`staffId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `complaints`
--
ALTER TABLE `complaints`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `responses`
--
ALTER TABLE `responses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `complaints`
--
ALTER TABLE `complaints`
  ADD CONSTRAINT `complaints_ibfk_1` FOREIGN KEY (`studentId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `complaints_ibfk_2` FOREIGN KEY (`staffId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `responses`
--
ALTER TABLE `responses`
  ADD CONSTRAINT `responses_ibfk_1` FOREIGN KEY (`complaintId`) REFERENCES `complaints` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `responses_ibfk_2` FOREIGN KEY (`staffId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
