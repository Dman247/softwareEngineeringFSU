-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 06, 2021 at 02:45 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
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

--
-- Dumping data for table `admincalendar`
--

INSERT INTO `admincalendar` (`AdminCalendarID`, `UserID`, `CalendarID`) VALUES
(0, 3, 4),
(5, 1, 1),
(7, 3, 1),
(8, 1, 3),
(9, 1, 4),
(10, 1, 2),
(11, 2, 2);

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

--
-- Dumping data for table `authedcalendar`
--

INSERT INTO `authedcalendar` (`AuthedCalendarID`, `UserID`, `CalendarID`) VALUES
(3, 3, 1),
(4, 3, 3),
(5, 1, 4),
(6, 1, 2),
(7, 2, 2),
(8, 4, 3),
(9, 3, 2);

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
  `Name` varchar(50) NOT NULL,
  `PictureID` int(11) NOT NULL,
  `Info` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `calendar`
--

INSERT INTO `calendar` (`CalendarID`, `Name`, `PictureID`, `Info`) VALUES
(1, 'test', 0, 'test'),
(2, 'hipposaver', 0, 'this is a test calendar'),
(3, 'this is my calendar', 0, 'this is my calendar'),
(4, 'my calendar', 0, 'this is my calendar');

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
  `CalendarId` int(11) NOT NULL,
  `EventName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`EventID`, `Date`, `HourStart`, `HourFinish`, `Info`, `CalendarId`, `EventName`) VALUES
(1, '2021-11-11', '01:01:01', '02:01:01', 'My info', 2, 'My event name'),
(2, '2021-12-11', '01:01:01', '02:01:01', 'My info1', 2, 'My event name 2'),
(3, '2021-12-10', '01:01:01', '02:01:01', 'test', 2, 'test'),
(4, '2021-12-10', '01:01:01', '02:01:01', 'testing', 2, 'asdasdasd'),
(5, '2021-12-10', '01:01:01', '02:01:01', 'testing', 3, 'dfgdfg4r'),
(6, '2021-12-10', '01:01:01', '02:01:01', 'testingaagain', 2, 'My event name'),
(7, '2021-12-10', '01:01:01', '02:01:01', 'testingasdasdasd', 3, 'asdasd'),
(8, '2021-07-14', '01:15:01', '02:01:01', 'This is a test event', 4, 'This is my event!');

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
  `SecurityA` varchar(255) NOT NULL,
  `SessionID` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`UserID`, `Username`, `Email`, `Password`, `First Name`, `Last Name`, `Bio`, `PictureID`, `SecurityQ`, `SecurityA`, `SessionID`) VALUES
(1, 'hipposaver', 'hipposaver@hotmail.com', 'test', 'Matt', 'Pollock', 'Hi this is a test account', 12345, 'Test', 'Test', 'JkL00NVMaaz3wr3z'),
(2, 'not hipposaver', 'nothipposaver@hotmail.com', 'test', 'Matt', 'Pollock', 'Hi this is a test account1', 12345, 'Test', 'Test', ''),
(3, 'mike', 'mike@mike.com', 'mike', 'mike', 'mike', 'hi im mike', 235, 'test', 'test1', ''),
(4, 'michael', 'mike@mise.whatever', 'asdsad', 'test', 'test', 'this is a test acc', 3434, 'test', 'test1', ''),
(5, 'michael1', 'mike@mise.whatever1', 'asdsad1', 'test1', 'test1', 'this is a test acc1', 34341, 'test1', 'test11', '');

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
  MODIFY `AdminCalendarID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `adminevent`
--
ALTER TABLE `adminevent`
  MODIFY `AdminEventID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `authedcalendar`
--
ALTER TABLE `authedcalendar`
  MODIFY `AuthedCalendarID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `authedevent`
--
ALTER TABLE `authedevent`
  MODIFY `AuthedEventID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `calendar`
--
ALTER TABLE `calendar`
  MODIFY `CalendarID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `EventID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
