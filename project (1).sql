-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 15, 2020 at 12:27 PM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `display_fb` ()  select a.name,a.id,b.service, b.food_quality,b.staff_feedback from user_details a, feedback b where a.id = b.id$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `breakfast_votes`
--

CREATE TABLE `breakfast_votes` (
  `food_id` int(11) NOT NULL,
  `votes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `breakfast_votes`
--

INSERT INTO `breakfast_votes` (`food_id`, `votes`) VALUES
(1, 10),
(2, 10),
(3, 6),
(4, 6),
(5, 5),
(6, 5),
(7, 5),
(8, 5),
(9, 7),
(10, 7);

--
-- Triggers `breakfast_votes`
--
DELIMITER $$
CREATE TRIGGER `b_percentage` AFTER UPDATE ON `breakfast_votes` FOR EACH ROW update votes_percentage set percentage = (SELECT b.votes from food_list a, breakfast_votes b where b.food_id=a.food_id and a.food_id=NEW.food_id)/(SELECT sum(votes) from breakfast_votes)*100 where food_id = NEW.food_id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `dinner_votes`
--

CREATE TABLE `dinner_votes` (
  `food_id` int(11) NOT NULL,
  `votes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dinner_votes`
--

INSERT INTO `dinner_votes` (`food_id`, `votes`) VALUES
(31, 5),
(32, 6),
(33, 4),
(34, 3),
(35, 3),
(36, 3),
(37, 0),
(38, 5),
(39, 1),
(40, 0);

--
-- Triggers `dinner_votes`
--
DELIMITER $$
CREATE TRIGGER `D_percentage` AFTER UPDATE ON `dinner_votes` FOR EACH ROW update votes_percentage set percentage = (SELECT b.votes from food_list a, dinner_votes b where b.food_id=a.food_id and a.food_id=NEW.food_id)/(SELECT sum(votes) from dinner_votes)*100 where food_id = NEW.food_id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `service` varchar(255) DEFAULT NULL,
  `food_quality` varchar(255) DEFAULT NULL,
  `staff_feedback` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `service`, `food_quality`, `staff_feedback`) VALUES
(1, 'bad', 'okok', 'friendly'),
(3, 'ver good', 'very nice', 'not friendlr');

-- --------------------------------------------------------

--
-- Table structure for table `food_list`
--

CREATE TABLE `food_list` (
  `food_id` int(11) NOT NULL,
  `food_name` varchar(255) NOT NULL,
  `food_type` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `food_list`
--

INSERT INTO `food_list` (`food_id`, `food_name`, `food_type`) VALUES
(1, 'Dosa', 'B'),
(2, 'Idli', 'B'),
(3, 'Chole Bhature', 'B'),
(4, 'Poha', 'B'),
(5, 'Aloo Paratha', 'B'),
(6, 'Pav Bhaji', 'B'),
(7, 'Upma', 'B'),
(8, 'Bread Jam', 'B'),
(9, 'Lemon Rice', 'B'),
(10, 'Noodles', 'B'),
(11, 'Soyabean', 'L'),
(12, 'Daal Chawal', 'L'),
(13, 'Rice Sambhar', 'L'),
(14, 'Fried Rice', 'L'),
(15, 'Mixed Veg', 'L'),
(16, 'Kadhi Rice', 'L'),
(17, 'Baingan Bharta', 'L'),
(18, 'Lemon Rice', 'L'),
(19, 'Paneer', 'L'),
(20, 'Chole', 'L'),
(21, 'Oreo', 'S'),
(22, 'Bonda', 'S'),
(23, 'Egg Puff', 'S'),
(24, 'Bhel', 'S'),
(25, 'Cake', 'S'),
(26, 'Sandwich', 'S'),
(27, 'Potato Chips', 'S'),
(28, 'Chai', 'S'),
(29, 'Samosa', 'S'),
(30, 'Spring Roll', 'S'),
(31, 'Biriyani', 'D'),
(32, 'Roti Sabzi', 'D'),
(33, 'Rajma Chawal', 'D'),
(34, 'Chicken Gravy', 'D'),
(35, 'Gobi Munchurian', 'D'),
(36, 'Paneer Bhurji', 'D'),
(37, 'Fried Rice', 'D'),
(38, 'Egg Bhurji', 'D'),
(39, 'Chicken Kebab', 'D'),
(40, 'Mixed Veg', 'D');

-- --------------------------------------------------------

--
-- Table structure for table `lunch_votes`
--

CREATE TABLE `lunch_votes` (
  `food_id` int(11) NOT NULL,
  `votes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lunch_votes`
--

INSERT INTO `lunch_votes` (`food_id`, `votes`) VALUES
(11, 3),
(12, 4),
(13, 2),
(14, 3),
(15, 2),
(16, 3),
(17, 3),
(18, 0),
(19, 3),
(20, 3);

--
-- Triggers `lunch_votes`
--
DELIMITER $$
CREATE TRIGGER `L_percentage` AFTER UPDATE ON `lunch_votes` FOR EACH ROW update votes_percentage set percentage = (SELECT b.votes from food_list a, lunch_votes b where b.food_id=a.food_id and a.food_id=NEW.food_id)/(SELECT sum(votes) from lunch_votes)*100 where food_id = NEW.food_id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `snacks_votes`
--

CREATE TABLE `snacks_votes` (
  `food_id` int(11) NOT NULL,
  `votes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `snacks_votes`
--

INSERT INTO `snacks_votes` (`food_id`, `votes`) VALUES
(21, 3),
(22, 4),
(23, 4),
(24, 4),
(25, 3),
(26, 3),
(27, 4),
(28, 3),
(29, 2),
(30, 2);

--
-- Triggers `snacks_votes`
--
DELIMITER $$
CREATE TRIGGER `S_percentage` AFTER UPDATE ON `snacks_votes` FOR EACH ROW update votes_percentage set percentage = (SELECT b.votes from food_list a, snacks_votes b where b.food_id=a.food_id and a.food_id=NEW.food_id)/(SELECT sum(votes) from snacks_votes)*100 where food_id = NEW.food_id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `usn` varchar(10) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `usn`, `username`, `password`) VALUES
(1, '1jt18is096', 'Hema', 'aaaaa'),
(2, '1jt17is086', 'Keerthana', 'aaaaa'),
(3, '1jt17cs063', 'Pooja', 'aaaaa'),
(6, '1jt17ec001', 'Ishan', 'aaaaa\r\n'),
(7, '1jt18is007', 'Peter', 'aaaaa');

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE `user_details` (
  `id` int(11) NOT NULL,
  `student_usn` varchar(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `room_no` varchar(4) NOT NULL,
  `sem` int(1) NOT NULL,
  `branch` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`id`, `student_usn`, `name`, `room_no`, `sem`, `branch`) VALUES
(1, '1jt18is024', 'Hema', '314', 5, 'ISE'),
(2, '1jt17cs086', 'Keerthana', 'G02', 5, 'ISE'),
(3, '1jt17cs063', 'Pooja k Shetty', '107', 5, 'CSE'),
(6, '1jt17ec001', 'Ishan', '205', 1, 'EC'),
(7, '1jt18is007', 'Peter Parker', '112', 2, 'ISE');

-- --------------------------------------------------------

--
-- Table structure for table `votes_percentage`
--

CREATE TABLE `votes_percentage` (
  `food_id` int(11) NOT NULL,
  `percentage` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `votes_percentage`
--

INSERT INTO `votes_percentage` (`food_id`, `percentage`) VALUES
(1, 15.1515),
(2, 15.1515),
(3, 9.09091),
(4, 9.09091),
(5, 7.57576),
(6, 7.57576),
(7, 7.57576),
(8, 7.57576),
(9, 10.6061),
(10, 10.6061),
(11, 11.5385),
(12, 15.3846),
(13, 7.69231),
(14, 11.5385),
(15, 7.69231),
(16, 11.5385),
(17, 11.5385),
(18, 0),
(19, 11.5385),
(20, 11.5385),
(21, 9.375),
(22, 12.5),
(23, 12.5),
(24, 12.5),
(25, 9.375),
(26, 9.375),
(27, 12.5),
(28, 9.375),
(29, 6.25),
(30, 6.25),
(31, 16.6667),
(32, 20),
(33, 13.3333),
(34, 10),
(35, 10),
(36, 10),
(37, 0),
(38, 16.6667),
(39, 3.33333),
(40, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `breakfast_votes`
--
ALTER TABLE `breakfast_votes`
  ADD PRIMARY KEY (`food_id`);

--
-- Indexes for table `dinner_votes`
--
ALTER TABLE `dinner_votes`
  ADD PRIMARY KEY (`food_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `food_list`
--
ALTER TABLE `food_list`
  ADD PRIMARY KEY (`food_id`);

--
-- Indexes for table `lunch_votes`
--
ALTER TABLE `lunch_votes`
  ADD PRIMARY KEY (`food_id`);

--
-- Indexes for table `snacks_votes`
--
ALTER TABLE `snacks_votes`
  ADD PRIMARY KEY (`food_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`,`usn`);

--
-- Indexes for table `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`id`,`student_usn`);

--
-- Indexes for table `votes_percentage`
--
ALTER TABLE `votes_percentage`
  ADD PRIMARY KEY (`food_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `food_list`
--
ALTER TABLE `food_list`
  MODIFY `food_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_details`
--
ALTER TABLE `user_details`
  ADD CONSTRAINT `user_details_ibfk_1` FOREIGN KEY (`id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
