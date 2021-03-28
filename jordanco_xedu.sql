-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 04, 2021 at 03:59 PM
-- Server version: 5.7.33
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `luqmaned_DB_demo`
--

-- --------------------------------------------------------

--
-- Table structure for table `answer`
--

USE luqmaned_DB_demo;

CREATE TABLE `answer` (
  `id` int(11) NOT NULL,
  `body` varchar(600) NOT NULL,
  `user` int(11) NOT NULL,
  `removed` tinyint(1) NOT NULL DEFAULT '0',
  `question` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `title` varchar(80) NOT NULL,
  `body` varchar(1000) NOT NULL,
  `user` int(11) NOT NULL,
  `lesson` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `contentToCourse`
--

CREATE TABLE `contentToCourse` (
  `courseID` int(11) NOT NULL,
  `contentID` int(11) NOT NULL,
  `contentOrder` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `id` int(11) NOT NULL,
  `title` varchar(80) NOT NULL,
  `description` varchar(400) NOT NULL,
  `instructor` int(11) NOT NULL,
  `demoVideo` varchar(1000) NOT NULL,
  `views` int(11) NOT NULL DEFAULT '0',
  `rating` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`id`, `title`, `description`, `instructor`, `demoVideo`, `views`, `rating`) VALUES
(1358, 'The Basics', 'This is a course about the basics', 2347, 'https://commons.wikimedia.org/wiki/File:Movement_of_organelles_in_Tradescantia_stamen_hair_cells.webm', 5, 4.5),
(1359, 'The Intermediate', 'The most important intermediate information', 2347, 'https://commons.wikimedia.org/wiki/File:Cytoplasmic_streaming.webm', 7, 3.9),
(1360, 'The Advanced Class', 'The most important advanced information', 2347, 'https://commons.wikimedia.org/wiki/File:Sandpile_Matemateca_23.webm', 6, 3.4),
(1361, 'The Basics Again', 'This is a course about the basics again', 2347, 'https://commons.wikimedia.org/wiki/File:Brewer%27s_blackbird_by_Crissy_Field_(16898).webm', 9, 4.9),
(1362, 'The Extra Advanced Class', 'The most important extra advanced information', 2347, 'https://commons.wikimedia.org/wiki/File:Cytoplasmic_streaming.webm', 8, 4.2);

-- --------------------------------------------------------

--
-- Table structure for table `courseContent`
--

CREATE TABLE `courseContent` (
  `id` int(11) NOT NULL,
  `title` varchar(80) NOT NULL,
  `description` varchar(400) NOT NULL,
  `video` varchar(1000) DEFAULT NULL,
  `type` enum('QUIZ','LESSON') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `courseContent`
--

INSERT INTO `courseContent` (`id`, `title`, `description`, `video`, `type`) VALUES
(1, 'Lesson 1', 'This lesson is about how to get started', 'https://commons.wikimedia.org/wiki/File:Movement_of_organelles_in_Tradescantia_stamen_hair_cells.webm', 'LESSON'),
(2, 'Quiz 1', 'A Quiz about Learning', NULL, 'QUIZ'),
(3, 'Lesson 2', 'Keep learning with short videos', 'https://commons.wikimedia.org/wiki/File:Sandpile_Matemateca_23.webm', 'LESSON'),
(4, 'Quiz 2', 'A second quiz about learning', NULL, 'QUIZ'),
(5, 'Lesson 3', 'Another lesson about learning', 'https://commons.wikimedia.org/wiki/File:Cytoplasmic_streaming.webm', 'LESSON');

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `id` int(11) NOT NULL,
  `title` varchar(80) NOT NULL,
  `body` varchar(400) NOT NULL,
  `user` int(11) NOT NULL,
  `course` int(11) NOT NULL,
  `lesson` int(11) NOT NULL,
  `removed` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`id`, `title`, `body`, `user`, `course`, `lesson`, `removed`) VALUES
(1, 'Confused', 'How does this class work', 2347, 1358, 1, 0),
(2, 'This is awesome!', 'I love this class! That bird is so cool!', 2347, 1358, 1, 0),
(3, 'Learning?', 'How do I learn faster?', 2347, 1358, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `quizAnswer`
--

CREATE TABLE `quizAnswer` (
  `id` int(11) NOT NULL,
  `question` int(11) NOT NULL,
  `text` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `quizQuestion`
--

CREATE TABLE `quizQuestion` (
  `id` int(11) NOT NULL,
  `quiz` int(11) NOT NULL,
  `question` varchar(280) NOT NULL,
  `correctAnswer` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `scores`
--

CREATE TABLE `scores` (
  `course` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `score` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `scores`
--

INSERT INTO `scores` (`course`, `name`, `score`) VALUES
(1358, 'Bob', 800),
(1358, 'Sarah', 900),
(1358, 'Susan', 950),
(1358, 'Jordan', 925);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(254) NOT NULL,
  `password` varchar(100) NOT NULL,
  `profilePicture` varchar(1000) DEFAULT NULL,
  `isInstructor` tinyint(1) NOT NULL DEFAULT '0',
  `username` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `profilePicture`, `isInstructor`, `username`) VALUES
(2347, 'jordancowe@gmail.com', 'test', NULL, 1, 'jdcowe');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answer`
--
ALTER TABLE `answer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contentToCourse`
--
ALTER TABLE `contentToCourse`
  ADD PRIMARY KEY (`courseID`,`contentID`),
  ADD UNIQUE KEY `uniqueOrder` (`courseID`,`contentOrder`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `courseContent`
--
ALTER TABLE `courseContent`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quizAnswer`
--
ALTER TABLE `quizAnswer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quizQuestion`
--
ALTER TABLE `quizQuestion`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `unique_user` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answer`
--
ALTER TABLE `answer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1363;

--
-- AUTO_INCREMENT for table `courseContent`
--
ALTER TABLE `courseContent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `quizAnswer`
--
ALTER TABLE `quizAnswer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quizQuestion`
--
ALTER TABLE `quizQuestion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2348;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
