-- (C) Abhishek Kumar, Licensed under GNU GPL v3
-- This file creates the database and structure.
-- phpMyAdmin SQL Dump
-- version 2.10.1
-- http://www.phpmyadmin.net
-- 
-- Host: localhost
-- Generation Time: Aug 24, 2007 at 11:12 AM
-- Server version: 5.0.37
-- PHP Version: 5.2.2

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
  `candidate_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `vote_count` int(11) NOT NULL default '0',
  PRIMARY KEY  (`candidate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



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
-- Table structure for table `bits_groups`
-- 

CREATE TABLE `bits_groups` (
  `group_id` int(11) NOT NULL default '0',
  `name` varchar(255) NOT NULL default 'user',
  `privilege` int(11) NOT NULL,
  PRIMARY KEY  (`group_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


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
-- Table structure for table `bits_posts`
-- 

CREATE TABLE `bits_posts` (
  `post_id` int(11) NOT NULL,
  `es_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY  (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


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


INSERT INTO `bits_users` (`username`, `name`, `password`, `group_id`, `vote_status`, `login_status`) VALUES 
('Abhishek', 'Abhishek', 'ad41181dc8a159b6d2fede6bb7f6d3a8', 2, 0, 0);

INSERT INTO `bits_groups` (`group_id`, `name`, `privilege`) VALUES 
(1, 'user', 1),
(2, 'Administrators', 3);

INSERT INTO `bits_election`.`bits_electionsets` (
`es_id` ,
`name` ,
`description` 
)
VALUES (
'2', 'BITS Campus Election', 'Council of Students Affair'
);
