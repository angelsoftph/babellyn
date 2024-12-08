-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 08, 2024 at 05:20 PM
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
-- Database: `babellyn`
--

-- --------------------------------------------------------

--
-- Table structure for table `alembic_version`
--

CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flags`
--

CREATE TABLE `flags` (
  `id` int(11) NOT NULL,
  `translation_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `flag` char(1) NOT NULL,
  `comment` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `flags`
--

INSERT INTO `flags` (`id`, `translation_id`, `user_id`, `flag`, `comment`, `created_at`, `updated_at`) VALUES
(1, 1, 2, '1', 'Accurate!', '2024-11-30 02:31:37', NULL),
(2, 1, 3, '1', 'This is a good translation', '2024-11-30 02:35:04', '2024-12-08 16:11:55'),
(25, 14, 2, '1', 'This is correct', '2024-12-08 16:13:49', NULL),
(26, 8, 2, '1', 'This is correct', '2024-12-08 16:19:44', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `story` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `story`) VALUES
(1, 'Tagalog', 'Tagalog is an Austronesian language spoken as a first language by the ethnic Tagalog people, who make up a quarter of the population of the Philippines, and as a second language by the majority, mostly as or through Filipino.'),
(2, 'Cebuano', 'Cebuano is the lingua franca of Central Visayas, the western parts of Eastern Visayas, some western parts of Palawan and most parts of Mindanao. The name Cebuano is derived from the island of Cebu, which is the source of Standard Cebuano.'),
(3, 'Hiligaynon', 'Hiligaynon, also often referred to as Ilonggo, is an Austronesian regional language spoken in the Philippines by about 9.1 million people, predominantly in Western Visayas, Negros Island Region, and Soccsksargen, most of whom belong to the Hiligaynon peop'),
(4, 'Ilocano', 'Ilocano is the third most spoken native language in the Philippines, with about 11 million speakers. It\'s a lingua franca in Northern Luzon, and is also spoken in Central Luzon, Metro Manila, and other parts of the Philippines.'),
(5, 'Kapampangan', 'Kapampangan is an Austronesian language, and one of the eight major languages of the Philippines. It is the primary and predominant language of the entire province of Pampanga and southern Tarlac, on the southern part of Luzon\'s central plains geographic '),
(6, 'Waray', 'Waray is an Austronesian language and the fifth-most-spoken native regional language of the Philippines, native to Eastern Visayas.'),
(7, 'Chavacano', 'Chavacano is a group of Spanish-based creole language varieties spoken in the Philippines. The variety spoken in Zamboanga City, located in the southern Philippine island group of Mindanao, has the highest concentration of speakers.'),
(8, 'Bicolano', 'Bikol is an Austronesian language spoken by the Bicolanos, primarily in the Bicol Region of southern Luzon, Philippines');

-- --------------------------------------------------------

--
-- Table structure for table `phrases`
--

CREATE TABLE `phrases` (
  `id` int(10) UNSIGNED NOT NULL,
  `phrase` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `phrases`
--

INSERT INTO `phrases` (`id`, `phrase`) VALUES
(1, 'What is this?'),
(2, 'What is that?'),
(3, 'What is your name?'),
(4, 'How much?'),
(5, 'How much is this?'),
(6, 'Where are you from?'),
(7, 'Where are you?'),
(8, 'When will you go?'),
(9, 'Why are you here?'),
(10, 'Who are you?'),
(11, 'What are you doing?'),
(12, 'What do you want?'),
(13, 'I love you'),
(14, 'How are you?'),
(15, 'Please help me'),
(16, 'I want to go to this place'),
(17, 'Who is that man?'),
(18, 'Who is this woman?'),
(19, 'I want to walk'),
(20, 'I want to eat'),
(21, 'I am hungry'),
(22, 'I am thirsty'),
(23, 'Are you hungry?'),
(24, 'What do you want to eat?'),
(25, 'Can you come with me?'),
(26, 'It\'s a pleasure to meet you'),
(27, 'I want to learn to speak'),
(28, 'How much is the fare?'),
(29, 'I want something cheaper'),
(30, 'This is delicious'),
(31, 'Good morning'),
(32, 'Good afternoon'),
(33, 'Good evening'),
(34, 'How\'s your day?'),
(35, 'Thanks'),
(36, 'Thank you very much'),
(37, 'You\'re welcome'),
(38, 'I\'m sorry'),
(39, 'How old are you?'),
(40, 'Where do you live?'),
(41, 'You can do it'),
(42, 'Where are you going?'),
(43, 'Is this the place?'),
(44, 'I\'m fine. And you?'),
(45, 'What is your job?'),
(46, 'Where have you been?'),
(47, 'Take care'),
(48, 'Do you understand?'),
(49, 'I don\'t understand'),
(50, 'Who are you looking for?');

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `phrase_id` int(10) UNSIGNED NOT NULL,
  `language_id` int(10) UNSIGNED NOT NULL,
  `trans` varchar(255) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`id`, `phrase_id`, `language_id`, `trans`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Ano ito?', 1, '2024-11-16 10:41:06', NULL),
(2, 1, 2, 'Unsa ini?', 1, '2024-11-16 10:41:28', NULL),
(3, 1, 3, 'Ano ini?', 1, '2024-11-16 10:41:39', '2024-11-16 10:44:00'),
(4, 1, 4, 'Ania daytoy?', 1, '2024-11-16 10:42:02', '2024-11-16 10:44:05'),
(5, 1, 5, 'Nanu ini?', 1, '2024-11-16 10:42:31', NULL),
(6, 1, 6, 'Nano ini?', 1, '2024-11-16 10:45:57', '2024-11-16 10:46:49'),
(7, 2, 1, 'Ano iyan?', 1, '2024-11-16 10:48:23', NULL),
(8, 2, 2, 'Unsa na?', 1, '2024-11-16 10:49:13', NULL),
(9, 2, 3, 'Ano ina?', 1, '2024-11-16 10:49:20', NULL),
(10, 2, 4, 'Ania dayta?', 1, '2024-11-16 10:49:49', NULL),
(11, 2, 5, 'Nanu ita?', 1, '2024-11-16 10:50:18', NULL),
(12, 2, 6, 'Nano iton?', 1, '2024-11-16 10:50:29', NULL),
(13, 3, 5, 'Nanung lagyu mu?', 1, '2024-11-16 10:51:03', NULL),
(14, 3, 1, 'Ano\'ng pangalan mo?', 1, '2024-11-16 10:51:44', NULL),
(15, 3, 2, 'Unsa imong ngalan?', 1, '2024-11-16 10:52:24', NULL),
(16, 3, 3, 'Ano ngalan mo?', 1, '2024-11-16 10:52:47', NULL),
(17, 3, 4, 'Ania ti nagan mo?', 1, '2024-11-16 10:53:04', NULL),
(18, 3, 6, 'Nano im ngaran?', 1, '2024-11-16 10:53:30', NULL),
(19, 4, 1, 'Magkano?', 1, '2024-11-16 10:54:30', NULL),
(20, 4, 2, 'Tagpila?', 1, '2024-11-16 10:54:38', NULL),
(21, 4, 3, 'Pila?', 1, '2024-11-16 10:54:44', NULL),
(22, 4, 4, 'Mano?', 1, '2024-11-16 10:54:50', NULL),
(23, 4, 5, 'Magkanu?', 1, '2024-11-16 10:54:56', NULL),
(24, 4, 6, 'Pira?', 1, '2024-11-16 10:55:27', NULL),
(25, 5, 1, 'Magkano ito?', 1, '2024-11-16 13:21:28', NULL),
(26, 5, 2, 'Tagpila kini?', 1, '2024-11-16 13:22:27', NULL),
(27, 5, 3, 'Pila ini?', 1, '2024-11-16 13:22:40', NULL),
(28, 5, 5, 'Magkanu ya ini?', 1, '2024-11-16 13:23:21', NULL),
(29, 5, 4, 'Mano daytoy?', 1, '2024-11-16 13:24:14', NULL),
(30, 5, 6, 'Pira ini?', 1, '2024-11-16 13:24:21', NULL),
(31, 6, 1, 'Taga saan ka?', 1, '2024-11-16 13:29:47', NULL),
(32, 6, 2, 'Taga asa ka?', 1, '2024-11-16 13:30:21', NULL),
(33, 6, 3, 'Taga diin ikaw?', 1, '2024-11-16 13:30:29', NULL),
(34, 6, 4, 'Taga-ano ka?', 1, '2024-11-16 13:30:53', NULL),
(35, 6, 5, 'Taga nokarin ka?', 1, '2024-11-16 13:31:20', NULL),
(36, 6, 6, 'Taga hain ka?', 1, '2024-11-16 13:31:31', NULL),
(37, 7, 1, 'Nasaan ka?', 1, '2024-11-16 13:33:34', NULL),
(38, 7, 2, 'Asa ka?', 1, '2024-11-16 13:33:41', NULL),
(39, 7, 3, 'Diin ka?', 1, '2024-11-16 13:33:47', NULL),
(40, 7, 4, 'Sadinno ti ayanmo?', 1, '2024-11-16 13:34:23', NULL),
(41, 7, 5, 'Nokarin ka?', 1, '2024-11-16 13:34:34', NULL),
(42, 7, 6, 'Hain ka?', 1, '2024-11-16 13:34:40', NULL),
(43, 47, 1, 'Mag-ingat ka / Ingat', 1, '2024-11-17 11:59:37', '2024-11-27 08:50:45'),
(44, 47, 2, 'Pag-amping / Amping', 1, '2024-11-17 11:59:48', '2024-11-27 08:50:51'),
(45, 47, 3, 'Paghalong / Halong', 1, '2024-11-17 12:00:10', '2024-11-27 08:50:56'),
(46, 47, 4, 'Agalwad ka / Agannad', 1, '2024-11-17 12:00:15', '2024-11-27 08:51:33'),
(47, 47, 6, 'Pag atamana', 1, '2024-11-17 12:00:57', NULL),
(48, 47, 7, 'Ten cuidado / Quidao', 1, '2024-11-17 12:02:39', '2024-11-27 08:51:04'),
(49, 49, 1, 'Hindi ko maunawaan', 1, '2024-11-17 12:04:57', NULL),
(50, 49, 2, 'Dili ko kasabot', 1, '2024-11-17 12:05:53', NULL),
(51, 49, 3, 'Waay ko kaintindi', 1, '2024-11-17 12:06:16', NULL),
(52, 49, 4, 'Diak maawatan', 1, '2024-11-17 12:07:00', NULL),
(53, 49, 5, 'E ke ayintindyan', 1, '2024-11-17 12:08:32', NULL),
(54, 49, 6, 'Diri ko nasabot', 1, '2024-11-17 12:09:29', NULL),
(55, 49, 7, 'Hinde io ta entende', 1, '2024-11-17 12:10:14', NULL),
(56, 13, 1, 'Mahal kita', 1, '2024-11-17 12:11:36', NULL),
(57, 13, 2, 'Gihigugma ko ikaw', 1, '2024-11-17 12:12:14', NULL),
(58, 13, 3, 'Palangga ta ka', 1, '2024-11-17 12:12:21', NULL),
(59, 13, 4, 'Ay-ayaten ka', 1, '2024-11-17 12:12:39', NULL),
(60, 13, 5, 'Kaluguran daka', 1, '2024-11-17 12:13:01', NULL),
(61, 13, 6, 'Hinigugma ko ikaw', 1, '2024-11-17 12:13:13', NULL),
(62, 13, 7, 'Ta ama iyo contigo', 1, '2024-11-17 12:13:25', NULL),
(63, 31, 1, 'Magandang umaga', 1, '2024-11-17 12:13:55', NULL),
(64, 31, 2, 'Maayong buntag', 1, '2024-11-17 12:14:04', NULL),
(65, 31, 3, 'Mayad nga aga', 1, '2024-11-17 12:14:42', NULL),
(66, 31, 4, 'Naimbag a bigat', 1, '2024-11-17 12:14:59', NULL),
(67, 31, 6, 'Maupay nga aga', 1, '2024-11-17 12:15:18', NULL),
(68, 31, 5, 'Máyap a abak', 1, '2024-11-17 12:16:24', NULL),
(69, 31, 7, 'Buenos dias', 1, '2024-11-17 12:16:32', NULL),
(70, 32, 2, 'Magandang tanghali', 1, '2024-11-17 12:17:00', NULL),
(71, 32, 2, 'Maayong hapon', 1, '2024-11-17 12:17:58', NULL),
(72, 32, 3, 'Mayad nga hapon', 1, '2024-11-17 12:18:15', NULL),
(73, 32, 4, 'Naimbag a malem', 1, '2024-11-17 12:18:26', NULL),
(74, 32, 5, 'Mayap a gatpanapun', 1, '2024-11-17 12:18:56', NULL),
(75, 32, 6, 'Maupay nga kulop', 1, '2024-11-17 12:19:19', NULL),
(76, 32, 7, 'Buenas tardes', 1, '2024-11-17 12:19:28', NULL),
(77, 33, 1, 'Magandang gabi', 1, '2024-11-17 12:19:56', NULL),
(78, 33, 2, 'Maayong gabii', 1, '2024-11-17 12:20:28', NULL),
(79, 33, 3, 'Mayad nga gab-i', 1, '2024-11-17 12:20:37', NULL),
(80, 33, 4, 'Naimbag a rabii', 1, '2024-11-17 12:21:00', NULL),
(81, 33, 6, 'Maupay nga gab-i', 1, '2024-11-17 12:21:42', '2024-11-17 12:22:02'),
(82, 33, 5, 'Mayap a bengi', 1, '2024-11-17 12:22:23', NULL),
(83, 33, 7, 'Buenas noches', 1, '2024-11-17 12:22:32', NULL),
(84, 42, 1, 'Saan ka pupunta?', 1, '2024-11-26 12:19:43', NULL),
(85, 42, 2, 'Asa ka paingon?', 1, '2024-11-26 12:20:50', NULL),
(86, 42, 3, 'Diin ka makadto?', 1, '2024-11-26 12:21:06', NULL),
(87, 42, 4, 'Sadino ti papanam?', 1, '2024-11-26 12:21:39', NULL),
(88, 42, 5, 'Nukarin ka munta?', 1, '2024-11-26 12:22:04', NULL),
(89, 42, 6, 'Hain ka maadto?', 1, '2024-11-26 12:22:28', NULL),
(90, 42, 7, 'A dónde vas?', 1, '2024-11-26 12:23:05', NULL),
(91, 7, 7, 'Donde tu?', 1, '2024-11-26 12:24:36', NULL),
(92, 3, 7, 'Kosa di tuyu nombre?', 1, '2024-11-26 12:27:29', NULL),
(93, 14, 7, 'Quetal ya tu?', 1, '2024-11-26 12:28:15', NULL),
(94, 14, 5, 'Komusta naka?', 1, '2024-11-26 12:28:45', NULL),
(95, 14, 4, 'Kumusta kan?', 1, '2024-11-26 12:29:05', NULL),
(96, 14, 1, 'Kumusta ka?', 1, '2024-11-26 12:30:11', NULL),
(97, 14, 2, 'Kumusta ka?', 1, '2024-11-26 12:30:38', NULL),
(98, 14, 3, 'Kamusta ikaw?', 1, '2024-11-26 12:31:04', NULL),
(99, 14, 6, 'Kamusta ka?', 1, '2024-11-26 12:32:07', NULL),
(100, 8, 1, 'Kailan ka pupunta?', 1, '2024-11-27 08:40:57', NULL),
(101, 8, 2, 'Kanus-a ka muadto?', 1, '2024-11-27 08:41:33', '2024-11-27 08:47:15'),
(102, 8, 3, 'Kasan-o ka makadto?', 1, '2024-11-27 08:41:45', '2024-11-27 08:47:21'),
(103, 8, 4, 'Kaano ti papanam?', 1, '2024-11-27 08:42:21', '2024-11-27 08:47:07'),
(104, 8, 1, 'Kailan ka pupunta?', 1, '2024-11-27 08:43:21', NULL),
(105, 8, 5, 'Kapilan ka munta?', 1, '2024-11-27 08:43:53', '2024-11-27 08:46:55'),
(106, 8, 6, 'Kan-o ka maadto?', 1, '2024-11-27 08:49:38', NULL),
(107, 47, 5, 'Mimingat ka / Mimingat', 1, '2024-11-27 08:53:25', NULL),
(108, 10, 7, 'Quetal ya tu?', 1, '2024-11-27 08:54:49', NULL),
(109, 10, 1, 'Sino ka?', 1, '2024-11-27 08:54:57', NULL),
(110, 10, 2, 'Kinsa ka?', 1, '2024-11-27 08:55:06', NULL),
(111, 10, 3, 'Sin-o ikaw?', 1, '2024-11-27 08:55:13', '2024-11-27 08:56:17'),
(112, 10, 6, 'Hin-o ka?', 1, '2024-11-27 08:55:32', NULL),
(113, 10, 5, 'Ninu ika?', 1, '2024-11-27 08:55:45', NULL),
(114, 10, 4, 'Asinno ka?', 1, '2024-11-27 08:55:59', '2024-11-27 08:56:13'),
(115, 50, 2, 'Kinsa imong gipangita?', 1, '2024-11-27 08:58:02', '2024-11-27 08:58:49'),
(116, 50, 3, 'Sin-o ang ginapangita mo?', 1, '2024-11-27 08:58:18', '2024-11-27 08:58:47'),
(117, 50, 4, 'Siasino ti sapsapulem?', 1, '2024-11-27 08:58:34', NULL),
(118, 50, 1, 'Sino ang hinahanap mo?', 1, '2024-11-27 08:59:00', NULL),
(119, 50, 5, 'Ninu ing panintunan mu?', 1, '2024-11-27 08:59:18', NULL),
(120, 50, 6, 'Hin-o an imo ginbibiling?', 1, '2024-11-27 08:59:39', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `uname` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `pword` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `uname`, `email`, `pword`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@babellyn.com', '$2b$12$fy1tR1/Vrq4L9ibkjvVgBO1gFzqL1p3BdPxHRJgpnAuZy3X..cY4G', '2024-11-16 10:41:02', '2024-12-08 15:44:44'),
(2, 'boybastos', 'boy@bastos.com', '$2b$12$fy1tR1/Vrq4L9ibkjvVgBO1gFzqL1p3BdPxHRJgpnAuZy3X..cY4G', '2024-11-30 02:15:24', '2024-12-08 15:44:41'),
(3, 'jackcollins', 'jack@collins.com', '$2b$12$fy1tR1/Vrq4L9ibkjvVgBO1gFzqL1p3BdPxHRJgpnAuZy3X..cY4G', '2024-12-08 15:34:27', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `words`
--

CREATE TABLE `words` (
  `id` int(10) UNSIGNED NOT NULL,
  `word` varchar(50) NOT NULL,
  `trans` varchar(50) NOT NULL,
  `language_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alembic_version`
--
ALTER TABLE `alembic_version`
  ADD PRIMARY KEY (`version_num`);

--
-- Indexes for table `flags`
--
ALTER TABLE `flags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phrases`
--
ALTER TABLE `phrases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `words`
--
ALTER TABLE `words`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `flags`
--
ALTER TABLE `flags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `phrases`
--
ALTER TABLE `phrases`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `words`
--
ALTER TABLE `words`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
