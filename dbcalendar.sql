-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 09, 2021 at 04:26 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbcalendar`
--

-- --------------------------------------------------------

--
-- Table structure for table `admincalendar`
--

CREATE TABLE `admincalendar` (
  `AdminCalendarID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `CalendarID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `adminevent`
--

CREATE TABLE `adminevent` (
  `AdminEventID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `EventID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `authedcalendar`
--

CREATE TABLE `authedcalendar` (
  `AuthedCalendarID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `CalendarID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `authedevent`
--

CREATE TABLE `authedevent` (
  `AuthedEventID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `EventID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `calendar`
--

CREATE TABLE `calendar` (
  `CalendarID` int(11) NOT NULL,
  `PictureID` int(11) NOT NULL,
  `Info` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `EventID` int(11) NOT NULL,
  `Date` date NOT NULL,
  `HourStart` time NOT NULL,
  `HourFinish` time NOT NULL,
  `Info` varchar(255) NOT NULL,
  `CalendarId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `UserID` int(11) NOT NULL,
  `Username` varchar(20) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `First Name` varchar(20) NOT NULL,
  `Last Name` varchar(20) NOT NULL,
  `Bio` varchar(255) NOT NULL,
  `PictureID` int(11) NOT NULL,
  `SecurityQ` varchar(255) NOT NULL,
  `SecurityA` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admincalendar`
--
ALTER TABLE `admincalendar`
  ADD PRIMARY KEY (`AdminCalendarID`),
  ADD KEY `CalendarID` (`CalendarID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `adminevent`
--
ALTER TABLE `adminevent`
  ADD PRIMARY KEY (`AdminEventID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `EventID` (`EventID`);

--
-- Indexes for table `authedcalendar`
--
ALTER TABLE `authedcalendar`
  ADD PRIMARY KEY (`AuthedCalendarID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `UserID_2` (`UserID`),
  ADD KEY `CalendarID` (`CalendarID`);

--
-- Indexes for table `authedevent`
--
ALTER TABLE `authedevent`
  ADD PRIMARY KEY (`AuthedEventID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `CalendarID` (`EventID`);

--
-- Indexes for table `calendar`
--
ALTER TABLE `calendar`
  ADD PRIMARY KEY (`CalendarID`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`EventID`),
  ADD KEY `CalendarId` (`CalendarId`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admincalendar`
--
ALTER TABLE `admincalendar`
  MODIFY `AdminCalendarID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `adminevent`
--
ALTER TABLE `adminevent`
  MODIFY `AdminEventID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `authedcalendar`
--
ALTER TABLE `authedcalendar`
  MODIFY `AuthedCalendarID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `authedevent`
--
ALTER TABLE `authedevent`
  MODIFY `AuthedEventID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `calendar`
--
ALTER TABLE `calendar`
  MODIFY `CalendarID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `EventID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admincalendar`
--
ALTER TABLE `admincalendar`
  ADD CONSTRAINT `admincalendar_ibfk_1` FOREIGN KEY (`CalendarID`) REFERENCES `calendar` (`CalendarID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `admincalendar_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `adminevent`
--
ALTER TABLE `adminevent`
  ADD CONSTRAINT `adminevent_ibfk_1` FOREIGN KEY (`EventID`) REFERENCES `event` (`EventID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `adminevent_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `authedcalendar`
--
ALTER TABLE `authedcalendar`
  ADD CONSTRAINT `authedcalendar_ibfk_1` FOREIGN KEY (`CalendarID`) REFERENCES `calendar` (`CalendarID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `authedcalendar_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `authedevent`
--
ALTER TABLE `authedevent`
  ADD CONSTRAINT `authedevent_ibfk_1` FOREIGN KEY (`EventID`) REFERENCES `event` (`EventID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `authedevent_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `CalendarId` FOREIGN KEY (`CalendarId`) REFERENCES `calendar` (`CalendarID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
