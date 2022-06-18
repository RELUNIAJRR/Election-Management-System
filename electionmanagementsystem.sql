-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 18, 2022 at 01:43 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `electionmanagementsystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(60) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `photo` varchar(150) NOT NULL,
  `created_on` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `firstname`, `lastname`, `photo`, `created_on`) VALUES
(1, 'admin', '$2y$10$0JyeBGTxxvAewb7AIjy8nev3jfRD6FPv7AcatYxH2aJCAn4D5KmZ2', 'SEC', 'Chairman', '', '2022-04-30'),
(3, 'staff', '$2y$10$4xJk80gFEmQc4vzJ9ti8OO17h30hCj3XhwMjn.K8KSqYhSLDllWWi', 'Mark', 'Bautista', '', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `candidates`
--

CREATE TABLE `candidates` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `position_id` int(11) NOT NULL,
  `voter_id` varchar(30) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `photo` varchar(150) NOT NULL,
  `platform` text NOT NULL,
  `party_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `candidates`
--

INSERT INTO `candidates` (`id`, `student_id`, `position_id`, `voter_id`, `firstname`, `lastname`, `photo`, `platform`, `party_id`) VALUES
(19, 1808560, 8, '95', 'Klyde Louise', 'Olitoquit', '1650601072815.jpg', 'Libreng Pabahay para sa mga taga Urban Poor. 50% housing\r\n', 7),
(64, 1706560, 8, '85', 'Maria Theresa', 'Masapol', '', '100% Scholarship', 6),
(65, 1356344, 10, '5', 'Joem', 'Masapol', '', 'Free Wifi for All', 9),
(66, 1123453, 10, '7', 'Dexter', 'Anggulo', '', 'Free Snacks\r\n', 8),
(70, 1809876, 9, '23', 'Michael Jude', 'Jacinta', '', 'Libreng Pabahay', 7),
(86, 0, 11, '96', 'Jan Ryan', 'Relunia', '', '', 8);

-- --------------------------------------------------------

--
-- Table structure for table `partylist`
--

CREATE TABLE `partylist` (
  `id` int(11) NOT NULL,
  `partyname` varchar(30) NOT NULL,
  `tagline` varchar(80) NOT NULL,
  `priority` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `partylist`
--

INSERT INTO `partylist` (`id`, `partyname`, `tagline`, `priority`) VALUES
(6, 'BUGKOS', 'Education for all', 1),
(7, 'LIKSI', 'Kabataan ang pagasa ng bayan', 1),
(8, 'AKO UNC', 'All for one, one for all', 2),
(9, 'INDEPENDENT', 'N/A', 3);

-- --------------------------------------------------------

--
-- Table structure for table `positions`
--

CREATE TABLE `positions` (
  `id` int(11) NOT NULL,
  `description` varchar(50) NOT NULL,
  `max_vote` int(11) NOT NULL,
  `priority` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `positions`
--

INSERT INTO `positions` (`id`, `description`, `max_vote`, `priority`) VALUES
(8, 'Governor', 1, 1),
(9, 'Vice Governor', 1, 2),
(10, 'Councilor', 2, 3),
(11, 'Representative', 4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` int(11) NOT NULL,
  `staff_id` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `photo` varchar(150) NOT NULL,
  `created_on` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `staff_id`, `password`, `firstname`, `lastname`, `photo`, `created_on`) VALUES
(2, 'gnGTaHtQoIUwXiF', '$2y$10$H0aMJzZYTBxbodJchfiUoebhza4k52YdCtYdGv1Buv3', 'Hubert', 'Republika', '', '0000-00-00'),
(3, '4ArXV8SbUB9EJ1G', '$2y$10$yIQ1SaON6WL1kf54QznNrO2MmtWDTDdPAm299i5ZR7r', 'Renz', 'Cas', '', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `voters`
--

CREATE TABLE `voters` (
  `id` int(11) NOT NULL,
  `voters_id` varchar(15) NOT NULL,
  `student_id` int(11) NOT NULL,
  `password` varchar(60) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `middlename` varchar(30) NOT NULL,
  `suffix` varchar(2) NOT NULL,
  `year_level` int(5) NOT NULL,
  `department` varchar(50) NOT NULL,
  `photo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `voters`
--

INSERT INTO `voters` (`id`, `voters_id`, `student_id`, `password`, `firstname`, `lastname`, `middlename`, `suffix`, `year_level`, `department`, `photo`) VALUES
(96, 'erfght5yjr6yer', 1312463, '', 'Kathryn', 'Bernardo', '', '', 4, 'CN', ''),
(126, '', 1234557, '', 'Kobie', 'Olitoquit', '', '', 1, 'CJE', ''),
(127, '', 1234357, '', 'Ma. Theresa', 'Maspol', '', '', 2, 'CJE', ''),
(146, '', 1706560, '', 'Klyde Louise', 'Olitoquit', '', '', 3, 'CCS', ''),
(166, '', 0, '', 'Daniel', 'Padilla', '', '', 1, 'CJE', ''),
(181, '', 1808569, '', 'Ma. Theresa', 'Masapol', '', '', 4, 'CCS', ''),
(187, '', 7145267, '', 'Angulo', 'Dexter', '', '', 2, 'CCS', ''),
(188, '', 7177267, '', 'Babasa', 'Mark', '', '', 4, 'CCS', ''),
(189, '', 7377267, '', 'Angbaba', 'Eunil', '', '', 3, 'CJE', '');

-- --------------------------------------------------------

--
-- Table structure for table `votes`
--

CREATE TABLE `votes` (
  `id` int(11) NOT NULL,
  `voters_id` int(11) NOT NULL,
  `candidate_id` int(11) NOT NULL,
  `position_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `candidates`
--
ALTER TABLE `candidates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `student_id` (`student_id`),
  ADD UNIQUE KEY `voter_id` (`voter_id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `partylist`
--
ALTER TABLE `partylist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `positions`
--
ALTER TABLE `positions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `voters`
--
ALTER TABLE `voters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `student_id` (`student_id`);

--
-- Indexes for table `votes`
--
ALTER TABLE `votes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `candidates`
--
ALTER TABLE `candidates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;
--
-- AUTO_INCREMENT for table `partylist`
--
ALTER TABLE `partylist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `positions`
--
ALTER TABLE `positions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `voters`
--
ALTER TABLE `voters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=190;
--
-- AUTO_INCREMENT for table `votes`
--
ALTER TABLE `votes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
