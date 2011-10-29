-- phpMyAdmin SQL Dump
-- version 2.11.0
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 04, 2008 at 02:55 PM
-- Server version: 5.0.45
-- PHP Version: 5.2.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `bits_election`
--
CREATE DATABASE `bits_election` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `bits_election`;

-- --------------------------------------------------------

--
-- Table structure for table `bits_candidates`
--

CREATE TABLE `bits_candidates` (
  `candidate_id` int(11) NOT NULL auto_increment,
  `post_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `vote_count` int(11) NOT NULL default '0',
  PRIMARY KEY  (`candidate_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=193 ;

--
-- Dumping data for table `bits_candidates`
--

INSERT INTO `bits_candidates` (`candidate_id`, `post_id`, `name`, `description`, `vote_count`) VALUES
(1, 25, 'DEEPAK MEHTA', 'Click to select', 0),
(2, 25, 'TANAY AGRAWAL', 'Click to select', 0),
(3, 25, 'P. SREE CHARAN TEJ', 'Click to select', 0),
(4, 25, 'NONE OF THE ABOVE (No Answer)', 'Click to select', 0),
(5, 28, 'ANMOL SHARMA', 'Click to select', 0),
(6, 28, 'NONE OF THE ABOVE (No Answer)', 'Click to select', 0),
(7, 26, 'BISWAS KUMAR SINHA', 'Click to select', 0),
(8, 26, 'ANSHUMAN KHIMKA', 'Click to select', 0),
(9, 26, 'B. KRISHNA MOHAN ', 'Click to select', 0),
(10, 26, 'VINEET P. KAIMAL', 'Click to select', 0),
(11, 26, 'NONE OF THE ABOVE (No Answer)', 'Click to select', 0),
(12, 27, 'N. DILEEP REDDY', 'Click to select', 0),
(13, 27, 'VIKAS JANGRA', 'Click to select', 0),
(14, 27, 'NONE OF THE ABOVE (No Answer)', 'Click to select', 0),
(15, 78, 'VAIBHAV KUMAR SHARMA', 'Click to select', 0),
(16, 78, 'NONE OF THE ABOVE (No Answer)', 'Click to select', 0),
(17, 75, 'MANISH RANJAN', 'Click to select', 0),
(18, 75, 'S. GANESH', 'Click to select', 0),
(19, 75, 'NONE OF THE ABOVE (No Answer)', 'Click to select', 0),
(20, 54, 'EKANSH SAXENA', 'Click to select', 0),
(21, 54, 'T. PAUL DHINAKAR', 'Click to select', 0),
(22, 54, 'NONE OF THE ABOVE (No Answer)', 'Click to select', 0),
(23, 55, 'ARBAB KAUSAR', 'Click to select', 0),
(24, 55, 'RAVIKIRAN K. N. ', 'Click to select', 0),
(25, 55, 'NONE OF THE ABOVE (No Answer)', 'Click to select', 0),
(26, 70, 'TATWAWADI PRANAV VINAY', 'Click to select', 0),
(27, 70, 'G. ANANTH RAGHAV', 'Click to select', 0),
(28, 70, 'RAHUL RANA', 'Click to select', 0),
(29, 70, 'NONE OF THE ABOVE (No Answer)', 'Click to select', 0),
(30, 72, 'CHAVALI VAMSI RAM', 'Click to select', 0),
(31, 72, 'TEJASVA DHYANI', 'Click to select', 0),
(32, 72, 'NONE OF THE ABOVE (No Answer)', 'Click to select', 0),
(33, 71, 'HIMANSHU YADAV', 'Click to select', 0),
(34, 71, 'KOMANDURU V PADMANABHAN', 'Click to select', 0),
(35, 71, 'VEMULA NEELESH', 'Click to select', 0),
(36, 71, 'NONE OF THE ABOVE (No Answer)', 'Click to select', 0),
(37, 29, 'PONDURU VARUN PRASAD', 'Click to select', 0),
(38, 29, 'VINEET KUMAR MITTAL', 'Click to select', 0),
(39, 29, 'AKASH TEKCHANDANI', 'Click to select', 0),
(40, 29, 'AASHISH JAIN KOTHARI', 'Click to select', 0),
(41, 29, 'NONE OF THE ABOVE (No Answer)', 'Click to select', 0),
(42, 35, 'M. SRI NAGA SMRITI', 'Click to select', 0),
(43, 35, 'NONE OF THE ABOVE (No Answer)', 'Click to select', 0),
(44, 34, 'V. SAI SUJAYA', 'Click to select', 0),
(45, 34, 'M. ALEKHYA', 'Click to select', 0),
(46, 34, 'NONE OF THE ABOVE (No Answer)', 'Click to select', 0),
(47, 33, 'SAMHITA BANDHOPADHYAY', 'Click to select', 0),
(48, 33, 'SNEHA NANDAN', 'Click to select', 0),
(49, 33, 'M. RACHANA REDDY', 'Click to select', 0),
(50, 33, 'NONE OF THE ABOVE (No Answer)', 'Click to select', 0),
(51, 36, 'N. MOUNIKA', 'Click to select', 0),
(52, 36, 'PATIL AMRITA ARUN', 'Click to select', 0),
(53, 36, 'MEGHA RASTOGI', 'Click to select', 0),
(54, 36, 'NONE OF THE ABOVE (No Answer)', 'Click to select', 0),
(55, 73, 'DHWANI SHAH ', 'Click to select', 0),
(56, 73, 'NONE OF THE ABOVE (No Answer)', 'Click to select', 0),
(57, 74, 'CHAUDHARI PURVALI VINAY', 'Click to select', 0),
(58, 74, 'SAUMYA SHANKAR DIKSHIT', 'Click to select', 0),
(59, 74, 'NIDHI BHATIA', 'Click to select', 0),
(60, 74, 'SHWETA GOEL', 'Click to select', 0),
(61, 74, 'NONE OF THE ABOVE (No Answer)', 'Click to select', 0),
(62, 37, 'SHOBHNA SHRUTI', 'Click to select', 0),
(63, 37, 'SURBHI VERMA', 'Click to select', 0),
(64, 37, 'ISHA KALRA', 'Click to select', 0),
(65, 37, 'NONE OF THE ABOVE (No Answer)', 'Click to select', 0),
(66, 38, 'PRIYANKA GUPTA', 'Click to select', 0),
(67, 38, 'HARSHITA SHISHODIYA', 'Click to select', 0),
(68, 38, 'NONE OF THE ABOVE (No Answer)', 'Click to select', 0),
(69, 48, 'ANURAG GAUR', 'Click to select', 0),
(70, 48, 'NONE OF THE ABOVE (No Answer)', 'Click to select', 0),
(71, 47, 'SAGAR LALWANI', 'Click to select', 0),
(72, 47, 'PRASANTH K.', 'Click to select', 0),
(73, 47, 'NONE OF THE ABOVE (No Answer)', 'Click to select', 0),
(74, 46, 'V. HARI KIRAN', 'Click to select', 0),
(75, 46, 'NONE OF THE ABOVE (No Answer)', 'Click to select', 0),
(76, 45, 'KOLETI SANDEEP GUPTA', 'Click to select', 0),
(77, 45, 'PRASHANT JULURI', 'Click to select', 0),
(78, 45, 'NONE OF THE ABOVE (No Answer)', 'Click to select', 0),
(79, 21, 'VARUN G. M.', 'Click to select', 0),
(80, 21, 'KANCHAN KUMAR AGRAWAL', 'Click to select', 0),
(81, 21, 'NONE OF THE ABOVE (No Answer)', 'Click to select', 0),
(82, 24, 'S SRINIVASCHAKRAVARTHY P', 'Click to select', 0),
(83, 24, 'NONE OF THE ABOVE (No Answer)', 'Click to select', 0),
(84, 23, 'MADDIREDDY VIJAY BHASKAR REDDY', 'Click to select', 0),
(85, 23, 'NONE OF THE ABOVE (No Answer)', 'Click to select', 0),
(86, 22, 'P. V. SURESH REDDY', 'Click to select', 0),
(87, 22, 'NONE OF THE ABOVE (No Answer)', 'Click to select', 0),
(88, 8, 'S.V.R. KRISHNAVIJAY', 'Click to select', 0),
(89, 8, 'AKASH GUPTA', 'Click to select', 0),
(90, 8, 'RACHIT RANA', 'Click to select', 0),
(91, 8, 'ANAND S.', 'Click to select', 0),
(92, 8, 'NONE OF THE ABOVE (No Answer)', 'Click to select', 0),
(93, 68, 'M. GAUTAM', 'Click to select', 0),
(94, 68, 'SAGI RAJIV NANDAN', 'Click to select', 0),
(95, 68, 'NONE OF THE ABOVE (No Answer)', 'Click to select', 0),
(96, 69, 'SANDEEP SINGH', 'Click to select', 0),
(97, 69, 'AKSHAY GOYAL', 'Click to select', 0),
(98, 69, 'ANJANI KUMAR SINGRODIA', 'Click to select', 0),
(99, 69, 'BHUVAN MOHAN SINGH RAVAL', 'Click to select', 0),
(100, 69, 'N. SRIKANTH ', 'Click to select', 0),
(101, 69, 'V. AVINASH REDDY', 'Click to select', 0),
(103, 5, 'KUNJAN S. GANDHI', 'Click to select', 0),
(104, 5, 'CHAVA SHIVA SHEETHAL VERMA', 'Click to select', 0),
(105, 5, 'DHANANJAY KATOCH  ', 'Click to select', 0),
(106, 5, 'NONE OF THE ABOVE (No Answer)', 'Click to select', 0),
(107, 67, 'SALMAN KHURSHID', 'Click to select', 0),
(108, 67, 'A. BHARATH REDDY', 'Click to select', 0),
(109, 67, 'NONE OF THE ABOVE (No Answer)', 'Click to select', 0),
(110, 4, 'TAIJAS MALPANI  ', 'Click to select', 0),
(111, 4, 'MOHIT YADAV  ', 'Click to select', 0),
(112, 4, 'ANTORIP SAHU  ', 'Click to select', 0),
(113, 4, 'R.BALAKRISHNAN  ', 'Click to select', 0),
(114, 4, 'ABHIMANYU SHEORAN  ', 'Click to select', 0),
(115, 4, 'NONE OF THE ABOVE (No Answer)', 'Click to select', 0),
(116, 66, 'PULKIT GOEL  ', 'Click to select', 0),
(117, 66, 'A . NARASIMHA SWAMY', 'Click to select', 0),
(118, 66, 'NONE OF THE ABOVE (No Answer)', 'Click to select', 0),
(119, 65, 'SIMRANDEEP SINGH BAGGA  ', 'Click to select', 0),
(120, 65, 'JOSHAN CHERIAN ABRAHAM  ', 'Click to select', 0),
(121, 65, 'ADITYA SOOD  ', 'Click to select', 0),
(122, 65, 'KOTHAREDDY RAJASHAKER', 'Click to select', 0),
(123, 65, 'NONE OF THE ABOVE (No Answer)', 'Click to select', 0),
(124, 11, 'ANMOL TIWARY', 'Click to select', 0),
(125, 11, 'VAMSEE PRATEEK G', 'Click to select', 0),
(126, 11, 'NONE OF THE ABOVE (No Answer)', 'Click to select', 0),
(127, 12, 'A.V. MANISH REDDY', 'Click to select', 0),
(128, 12, 'NONE OF THE ABOVE (No Answer)', 'Click to select', 0),
(129, 10, 'DHRUV KUMAR', 'Click to select', 0),
(130, 10, 'NONE OF THE ABOVE (No Answer)', 'Click to select', 0),
(131, 9, 'AMAN JAIN', 'Click to select', 0),
(132, 9, 'NONE OF THE ABOVE (No Answer)', 'Click to select', 0),
(133, 16, 'AKHIL MEHTA', 'Click to select', 0),
(134, 16, 'D. RAVI THEJA', 'Click to select', 0),
(135, 16, 'NONE OF THE ABOVE (No Answer)', 'Click to select', 0),
(136, 15, 'P. VIPIN CHANDRA', 'Click to select', 0),
(137, 15, 'ABHISHEK S. SHAH', 'Click to select', 0),
(138, 15, 'NONE OF THE ABOVE (No Answer)', 'Click to select', 0),
(139, 14, 'NITIN PRAKASH', 'Click to select', 0),
(140, 14, 'M.V.R. ANIRUDH', 'Click to select', 0),
(141, 14, 'NONE OF THE ABOVE (No Answer)', 'Click to select', 0),
(142, 13, 'VINNAKOTA AVINASH', 'Click to select', 0),
(143, 13, 'ABHIR BHOMAVAT', 'Click to select', 0),
(144, 13, 'NONE OF THE ABOVE (No Answer)', 'Click to select', 0),
(145, 81, 'S. MADHU SAI REDDY', 'Click to select', 0),
(146, 81, 'AYUSH SHARAN', 'Click to select', 0),
(147, 81, 'NONE OF THE ABOVE (No Answer)', 'Click to select', 0),
(148, 80, 'VINAY IYER', 'Click to select', 0),
(149, 80, 'RAHUL JAIN', 'Click to select', 0),
(150, 80, 'NONE OF THE ABOVE (No Answer)', 'Click to select', 0),
(151, 79, 'A.S.S.K. CHAITANYA', 'Click to select', 0),
(152, 79, 'MOHIT JAIN', 'Click to select', 0),
(153, 79, 'NONE OF THE ABOVE (No Answer)', 'Click to select', 0),
(154, 82, 'MADHAV KHURANA', 'Click to select', 0),
(155, 82, 'SACHIN AGARWAL', 'Click to select', 0),
(156, 82, 'NAKUL SHARMA', 'Click to select', 0),
(157, 82, 'HEMANTH SINDHANURU', 'Click to select', 0),
(158, 82, 'ANKIT M. HATALKAR', 'Click to select', 0),
(159, 82, 'NONE OF THE ABOVE (No Answer)', 'Click to select', 0),
(160, 19, 'DIPIN S. PILLAI', 'Click to select', 0),
(161, 19, 'ROHIT SALUJA', 'Click to select', 0),
(162, 19, 'NONE OF THE ABOVE (No Answer)', 'Click to select', 0),
(163, 17, 'RAVIKISHORE K.', 'Click to select', 0),
(164, 17, 'RAVI KUMAR AGARWAL', 'Click to select', 0),
(165, 17, 'NONE OF THE ABOVE (No Answer)', 'Click to select', 0),
(166, 18, 'SATYAJIT MAHAVIR PRASAD', 'Click to select', 0),
(167, 18, 'INDERVIR SINGH', 'Click to select', 0),
(168, 18, 'S. HARI PRASAD', 'Click to select', 0),
(169, 18, 'NONE OF THE ABOVE (No Answer)', 'Click to select', 0),
(170, 20, 'PERVEZ GARG', 'Click to select', 0),
(171, 20, 'SUMIT SEN', 'Click to select', 0),
(172, 20, 'NONE OF THE ABOVE (No Answer)', 'Click to select', 0),
(173, 59, 'K GAGAN KUMAR', 'Click to select', 0),
(174, 59, 'SIDDHARTH PATWARI', 'Click to select', 0),
(175, 59, 'K PRITHVI', 'Click to select', 0),
(176, 59, 'NONE OF THE ABOVE (No Answer)', 'Click to select', 0),
(177, 57, 'SOURABH AGRAWAL', 'Click to select', 0),
(178, 57, 'ABHAY EGOOR', 'Click to select', 0),
(179, 57, 'NONE OF THE ABOVE (No Answer)', 'Click to select', 0),
(180, 58, 'ABHINEET PRASAD', 'Click to select', 0),
(181, 58, 'BUDDHARAJU VINAY VARMA', 'Click to select', 0),
(182, 58, 'ABHIMANYU VATSYA', 'Click to select', 0),
(183, 58, 'ANGAD PAL SINGH TIWANA', 'Click to select', 0),
(184, 58, 'SHOUNAK SEN SHARMA', 'Click to select', 0),
(185, 58, 'DIVESH KUMAR', 'Click to select', 0),
(186, 58, 'NONE OF THE ABOVE (No Answer)', 'Click to select', 0),
(187, 60, 'RANJITH REDDY VEMULA', 'Click to select', 0),
(188, 60, 'C VARUN VENKATESH', 'Click to select', 0),
(189, 60, 'NONE OF THE ABOVE (No Answer)', 'Click to select', 0),
(190, 69, 'A. SHRIKANTH', '', 0),
(191, 69, 'KARAN SINGH RAGHUVANSHI', '', 0),
(192, 69, 'MIHIR H. GADA', '', 0),
(193, 69, 'NONE OF THE ABOVE (No Answer)', 'Click to select', 0);

-- --------------------------------------------------------

--
-- Table structure for table `bits_electionsets`
--

CREATE TABLE `bits_electionsets` (
  `es_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY  (`es_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bits_electionsets`
--

INSERT INTO `bits_electionsets` (`es_id`, `name`, `description`) VALUES
(2, 'BITS Campus Election', 'Council of Students Affair'),
(3, 'AH1 Hostel Elections', 'Only for AH1 Students.'),
(4, 'AH2 Hostel Elections', 'Only for AH2 Students.'),
(5, 'AH3 Hostel Elections', 'Only for AH3 Students.'),
(6, 'AH5 Hostel Elections', 'Only for AH5 Students.'),
(7, 'AH7 Hostel Elections', 'Only for AH7 Students.'),
(8, 'AH8 Hostel Elections', 'Only for AH8 Students.'),
(9, 'CH1 Hostel Elections', 'Only for CH1 Students.'),
(10, 'CH3 Hostel Elections', 'Only for CH3 Students.'),
(11, 'CH4 Hostel Elections', 'Only for CH4 Students.'),
(12, 'CH5 Hostel Elections', 'Only for CH5 Students.'),
(14, 'AH4 Hostel Elections', 'Only for AH4 Students.'),
(15, 'AH6 Hostel Elections', 'Only for AH6 Students.'),
(16, 'CH2 Hostel Elections', 'Only for CH2 Students.');

-- --------------------------------------------------------

--
-- Table structure for table `bits_groups`
--

CREATE TABLE `bits_groups` (
  `group_id` int(11) NOT NULL default '0',
  `name` varchar(255) NOT NULL default 'user',
  `privilege` int(11) NOT NULL,
  PRIMARY KEY  (`group_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bits_groups`
--

INSERT INTO `bits_groups` (`group_id`, `name`, `privilege`) VALUES
(1, 'user', 1),
(2, 'Administrators', 3),
(3, 'AH1 Hostel Students', 1),
(4, 'AH2 Hostel Students', 1),
(5, 'AH3 Hostel Students', 1),
(6, 'AH5 Hostel Students', 1),
(7, 'AH7 Hostel Students', 1),
(8, 'AH8 Hostel Students', 1),
(9, 'CH1 Hostel Students', 1),
(10, 'CH3 Hostel Students', 1),
(11, 'CH4 Hostel Students', 1),
(12, 'CH5 Hostel Students', 1),
(14, 'AH4 Hostel Students', 1),
(15, 'AH6 Hostel Students', 1),
(16, 'CH2 Hostel Students', 1);

-- --------------------------------------------------------

--
-- Table structure for table `bits_groups_es`
--

CREATE TABLE `bits_groups_es` (
  `group_id` int(11) NOT NULL,
  `es_id` int(11) NOT NULL,
  `priority` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bits_groups_es`
--

INSERT INTO `bits_groups_es` (`group_id`, `es_id`, `priority`) VALUES
(3, 3, 1),
(3, 2, 2),
(4, 4, 1),
(4, 2, 2),
(5, 5, 1),
(5, 2, 2),
(6, 6, 1),
(6, 2, 2),
(7, 7, 1),
(7, 2, 2),
(8, 8, 1),
(8, 2, 2),
(9, 9, 1),
(9, 2, 2),
(10, 10, 1),
(10, 2, 2),
(11, 11, 1),
(11, 2, 2),
(12, 12, 1),
(12, 2, 2),
(14, 14, 1),
(14, 2, 2),
(15, 15, 1),
(15, 2, 2),
(16, 16, 1),
(16, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `bits_posts`
--

CREATE TABLE `bits_posts` (
  `post_id` int(11) NOT NULL auto_increment,
  `es_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY  (`post_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=83 ;

--
-- Dumping data for table `bits_posts`
--

INSERT INTO `bits_posts` (`post_id`, `es_id`, `name`, `description`) VALUES
(4, 3, 'AH1 Hostel Cultural Representative', ''),
(5, 4, 'AH2 Hostel MNU', ''),
(8, 4, 'AH2 Hostel Cultural Representative', ''),
(9, 5, 'AH3 Hostel MNU', ''),
(10, 5, 'AH3 Hostel Mess Representative', ''),
(11, 5, 'AH3 Hostel Sports Representative', ''),
(12, 5, 'AH3 Hostel Cultural Representative', ''),
(13, 6, 'AH5 Hostel MNU', ''),
(14, 6, 'AH5 Hostel Mess Representative', ''),
(15, 6, 'AH5 Hostel Sports Representative', ''),
(16, 6, 'AH5 Hostel Cultural Representative', ''),
(17, 7, 'AH7 Hostel MNU', ''),
(18, 7, 'AH7 Hostel Mess Representative', ''),
(19, 7, 'AH7 Hostel Sports Representative', ''),
(20, 7, 'AH7 Hostel Cultural Representative', ''),
(21, 8, 'AH8 Hostel MNU', ''),
(22, 8, 'AH8 Hostel Mess Representative', ''),
(23, 8, 'AH8 Hostel Sports Representative', ''),
(24, 8, 'AH8 Hostel Cultural Representative', ''),
(25, 9, 'CH1 Hostel MNU', ''),
(26, 9, 'CH1 Hostel Mess Representative', ''),
(27, 9, 'CH1 Hostel Sports Representative', ''),
(28, 9, 'CH1 Hostel Cultural Representative', ''),
(29, 10, 'CH3 Hostel MNU', ''),
(33, 11, 'CH4 Hostel MNU', ''),
(34, 11, 'CH4 Hostel Mess Representative', ''),
(35, 11, 'CH4 Hostel Sports Representative', ''),
(36, 11, 'CH4 Hostel Cultural Representative', ''),
(37, 12, 'CH5 Hostel MNU', ''),
(38, 12, 'CH5 Hostel Mess Representative', ''),
(45, 14, 'AH4 Hostel MNU', ''),
(46, 14, 'AH4 Hostel Mess Representative', ''),
(47, 14, 'AH4 Hostel Sports Representative', ''),
(48, 14, 'AH4 Hostel Cultural Representative', ''),
(54, 16, 'CH2 Hostel Mess Representative', ''),
(55, 16, 'CH2 Hostel Sports Representative', ''),
(57, 2, 'BITS Goa Campus President', ''),
(58, 2, 'BITS Goa Campus Vice-President', ''),
(59, 2, 'BITS Goa Campus General Secretary', ''),
(60, 2, 'BITS Goa Campus Treasurer', ''),
(65, 3, 'AH1 Hostel MNU', ''),
(66, 3, 'AH1 Hostel Mess Representative', ''),
(67, 3, 'AH1 Hostel Sports Representative', ''),
(68, 4, 'AH2 Hostel Mess Representative', ''),
(69, 4, 'AH2 Hostel Sports Representative', ''),
(70, 10, 'CH3 Hostel Mess Representative', ''),
(71, 10, 'CH3 Hostel Sports Representative', ''),
(72, 10, 'CH3 Hostel Cultural Representative', ''),
(73, 12, 'CH5 Hostel Sports Representative', ''),
(74, 12, 'CH5 Hostel Cultural Representative', ''),
(75, 16, 'CH2 Hostel MNU', ''),
(78, 16, 'CH2 Hostel Cultural Representative', ''),
(79, 15, 'AH6 Hostel MNU', ''),
(80, 15, 'AH6 Hostel Mess Representative', ''),
(81, 15, 'AH6 Hostel Sports Representative', ''),
(82, 15, 'AH6 Hostel Cultural Representative', '');

-- --------------------------------------------------------

--
-- Table structure for table `bits_users`
--

CREATE TABLE `bits_users` (
  `username` varchar(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `password` varchar(100) NOT NULL,
  `group_id` int(11) NOT NULL,
  `vote_status` int(11) NOT NULL default '0',
  `login_status` int(11) NOT NULL default '0',
  PRIMARY KEY  (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='List of users for voting process';

--
-- Dumping data for table `bits_users`
--

INSERT INTO `bits_users` (`username`, `name`, `password`, `group_id`, `vote_status`, `login_status`) VALUES
('Abhishek', 'Abhishek', 'ad41181dc8a159b6d2fede6bb7f6d3a8', 2, 0, 0),
('ABHISHEK2', 'Abhishek', 'ad41181dc8a159b6d2fede6bb7f6d3a8', 15, 0, 0);
