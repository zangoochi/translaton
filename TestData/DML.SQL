-- phpMyAdmin SQL Dump
-- version 4.0.6deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 22, 2014 at 08:30 PM
-- Server version: 5.5.35-0ubuntu0.13.10.2
-- PHP Version: 5.5.3-1ubuntu2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `LanguageDB`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(1, 'Administrator'),
(2, 'Grader'),
(3, 'Importer');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_5f412f9a` (`group_id`),
  KEY `auth_group_permissions_83d7f98b` (`permission_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=126 ;

--
-- Dumping data for table `auth_group_permissions`
--

INSERT INTO `auth_group_permissions` (`id`, `group_id`, `permission_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 1, 8),
(9, 1, 9),
(10, 1, 10),
(11, 1, 11),
(12, 1, 12),
(13, 1, 13),
(14, 1, 14),
(15, 1, 15),
(16, 1, 16),
(17, 1, 17),
(18, 1, 18),
(19, 1, 19),
(20, 1, 20),
(21, 1, 21),
(22, 1, 22),
(23, 1, 23),
(24, 1, 24),
(25, 1, 25),
(26, 1, 26),
(27, 1, 27),
(28, 1, 28),
(29, 1, 29),
(30, 1, 30),
(31, 1, 31),
(32, 1, 32),
(33, 1, 33),
(34, 1, 34),
(35, 1, 35),
(36, 1, 36),
(37, 1, 37),
(38, 1, 38),
(39, 1, 39),
(40, 1, 40),
(41, 1, 41),
(42, 1, 42),
(43, 1, 43),
(44, 1, 44),
(45, 1, 45),
(46, 1, 46),
(47, 1, 47),
(48, 1, 48),
(49, 1, 49),
(50, 1, 50),
(51, 1, 51),
(52, 1, 52),
(53, 1, 53),
(54, 1, 54),
(55, 1, 55),
(56, 1, 56),
(57, 1, 57),
(61, 1, 61),
(62, 1, 62),
(63, 1, 63),
(64, 2, 13),
(65, 2, 14),
(66, 2, 19),
(67, 2, 20),
(68, 2, 21),
(69, 2, 22),
(70, 2, 23),
(71, 2, 25),
(72, 2, 26),
(73, 2, 28),
(74, 2, 29),
(75, 2, 30),
(76, 2, 31),
(77, 2, 32),
(78, 2, 33),
(79, 2, 34),
(80, 2, 35),
(81, 2, 36),
(82, 2, 37),
(83, 2, 38),
(84, 2, 39),
(85, 2, 40),
(86, 2, 41),
(87, 2, 42),
(88, 2, 43),
(89, 2, 44),
(90, 2, 46),
(91, 2, 47),
(92, 2, 48),
(93, 2, 49),
(94, 2, 50),
(95, 2, 51),
(96, 2, 52),
(97, 2, 53),
(98, 2, 54),
(99, 2, 55),
(100, 2, 56),
(101, 2, 57),
(105, 2, 61),
(106, 2, 62),
(125, 3, 31),
(107, 3, 32),
(108, 3, 34),
(109, 3, 35),
(110, 3, 37),
(111, 3, 38),
(112, 3, 40),
(113, 3, 41),
(114, 3, 43),
(115, 3, 44),
(116, 3, 46),
(117, 3, 49),
(118, 3, 50),
(119, 3, 52),
(120, 3, 53),
(121, 3, 55),
(122, 3, 56),
(123, 3, 61),
(124, 3, 62);

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_37ef4eb4` (`content_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=67 ;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add permission', 2, 'add_permission'),
(5, 'Can change permission', 2, 'change_permission'),
(6, 'Can delete permission', 2, 'delete_permission'),
(7, 'Can add group', 3, 'add_group'),
(8, 'Can change group', 3, 'change_group'),
(9, 'Can delete group', 3, 'delete_group'),
(10, 'Can add user', 4, 'add_user'),
(11, 'Can change user', 4, 'change_user'),
(12, 'Can delete user', 4, 'delete_user'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session'),
(19, 'Can add language pair', 7, 'add_languagepair'),
(20, 'Can change language pair', 7, 'change_languagepair'),
(21, 'Can delete language pair', 7, 'delete_languagepair'),
(22, 'Can add language', 8, 'add_language'),
(23, 'Can change language', 8, 'change_language'),
(24, 'Can delete language', 8, 'delete_language'),
(25, 'Can add error code', 9, 'add_errorcode'),
(26, 'Can change error code', 9, 'change_errorcode'),
(27, 'Can delete error code', 9, 'delete_errorcode'),
(28, 'Can add error', 10, 'add_error'),
(29, 'Can change error', 10, 'change_error'),
(30, 'Can delete error', 10, 'delete_error'),
(31, 'Can add source text', 11, 'add_sourcetext'),
(32, 'Can change source text', 11, 'change_sourcetext'),
(33, 'Can delete source text', 11, 'delete_sourcetext'),
(34, 'Can add source review queue', 12, 'add_sourcereviewqueue'),
(35, 'Can change source review queue', 12, 'change_sourcereviewqueue'),
(36, 'Can delete source review queue', 12, 'delete_sourcereviewqueue'),
(37, 'Can add source discrepancy queue', 13, 'add_sourcediscrepancyqueue'),
(38, 'Can change source discrepancy queue', 13, 'change_sourcediscrepancyqueue'),
(39, 'Can delete source discrepancy queue', 13, 'delete_sourcediscrepancyqueue'),
(40, 'Can add target text', 14, 'add_targettext'),
(41, 'Can change target text', 14, 'change_targettext'),
(42, 'Can delete target text', 14, 'delete_targettext'),
(43, 'Can add exam', 15, 'add_exam'),
(44, 'Can change exam', 15, 'change_exam'),
(45, 'Can delete exam', 15, 'delete_exam'),
(46, 'Can add grader queue', 16, 'add_graderqueue'),
(47, 'Can change grader queue', 16, 'change_graderqueue'),
(48, 'Can delete grader queue', 16, 'delete_graderqueue'),
(49, 'Can add target review queue', 17, 'add_targetreviewqueue'),
(50, 'Can change target review queue', 17, 'change_targetreviewqueue'),
(51, 'Can delete target review queue', 17, 'delete_targetreviewqueue'),
(52, 'Can add target input queue', 18, 'add_targetinputqueue'),
(53, 'Can change target input queue', 18, 'change_targetinputqueue'),
(54, 'Can delete target input queue', 18, 'delete_targetinputqueue'),
(55, 'Can add discrepancy', 19, 'add_discrepancy'),
(56, 'Can change discrepancy', 19, 'change_discrepancy'),
(57, 'Can delete discrepancy', 19, 'delete_discrepancy'),
(61, 'Can add record', 21, 'add_record'),
(62, 'Can change record', 21, 'change_record'),
(63, 'Can delete record', 21, 'delete_record'),
(64, 'Can add error json', 22, 'add_errorjson'),
(65, 'Can change error json', 22, 'change_errorjson'),
(66, 'Can delete error json', 22, 'delete_errorjson');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=32 ;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$12000$Z4mCQalcJ8bK$hiJKo275RMA0HXXpFY7iCgHBpZVa/nXnU9d6O57BAZs=', '2014-03-22 02:24:03', 1, 'sirk', '', '', 'kcofojoh@kent.edu', 1, 1, '2014-03-13 21:00:46'),
(2, 'password', '2014-03-07 00:00:00', 1, 'admin', '', '', '', 1, 1, '2014-03-01 00:00:00'),
(3, 'pbkdf2_sha256$12000$tZaxwIpXwwXS$SxXJwGGAZXaMwNkX1HLCQ2ZkmuZo8jxqX8DeJqlmsBU=', '2014-03-14 05:32:25', 0, 'drago', 'ivan', 'drago', '', 0, 1, '2014-03-14 05:32:25'),
(4, 'pbkdf2_sha256$12000$0NeWosE4TeFZ$KgIFYFjuuxV015oUYXerecWH6WOzacn/cyr9qLIiVHQ=', '2014-03-14 05:42:33', 0, 'alice', 'alice', '', '', 0, 1, '2014-03-14 05:42:33'),
(5, 'pbkdf2_sha256$12000$Day45O4ztfWf$DaUhFNDsNcjOXEMV7ZZNfLHMxkgCz6JIVXfXeRXZij0=', '2014-03-14 05:42:42', 0, 'bill', 'bill', '', '', 0, 1, '2014-03-14 05:42:42'),
(6, 'pbkdf2_sha256$12000$4Fjbb9ZTAUfA$8dDMMaP554/rjOnTukMjQShX89ZSAwm1JlVOa33YrxE=', '2014-03-14 05:42:50', 0, 'charles', '', '', '', 0, 1, '2014-03-14 05:42:50'),
(7, 'pbkdf2_sha256$12000$1NbRZ5VTWsUI$3Cq0WYGWvrqC1x42C46BCtBFWiLBFXUnK/5dLyYWKIY=', '2014-03-14 05:43:35', 0, 'ali', 'ali', 'baba', '', 0, 1, '2014-03-14 05:43:35'),
(9, 'pbkdf2_sha256$12000$pT8cS56jLYbE$oDvAhjN4bFmEyDRmtVDlT7xvGhKIe89MVszmOOsXrcg=', '2014-03-14 05:46:08', 0, 'lee', '', '', '', 0, 1, '2014-03-14 05:46:08'),
(10, 'pbkdf2_sha256$12000$UHufaRV7tqP6$SXPGjXHINYB1MkbwRvvrTl2RHgJpP+Gm41KNEaIwoJg=', '2014-03-14 05:47:58', 0, 'edward', '', '', '', 0, 1, '2014-03-14 05:47:58'),
(11, 'pbkdf2_sha256$12000$XAvS3GJLqSFc$z/mhEQt8q9566vp1q28/6R2v/XAc7x/+NGG254fRHks=', '2014-03-14 05:48:19', 0, 'frank', '', '', '', 0, 1, '2014-03-14 05:48:19'),
(12, 'pbkdf2_sha256$12000$IEBSfGRGs9CL$oBhvqpEuu1Hp0bpNoS2bmqr+zbEoEzkVxZwRY/gWyu0=', '2014-03-14 05:48:33', 0, 'grace', '', '', '', 0, 1, '2014-03-14 05:48:33'),
(13, 'pbkdf2_sha256$12000$kG9l994MbeZE$0nl/RlIL0iRoyadZKzwZ/j4IIBp9oMgF+1kLziDJjTc=', '2014-03-14 05:48:51', 0, 'henry', '', '', '', 0, 1, '2014-03-14 05:48:51'),
(14, 'pbkdf2_sha256$12000$HkyKSavbAGwe$8rDNR1BzAf9Mrq9Th0TnPtfy1ocDU3aMJ9ljeMWQTAA=', '2014-03-14 05:49:11', 0, 'ivana', 'ivana', '', '', 0, 1, '2014-03-14 05:49:11'),
(15, 'pbkdf2_sha256$12000$c9ZEmbbdHx8v$xIEBZVVXqyJeafzkDGYS9IrnXhauNKGnRpqUXvQquT4=', '2014-03-14 05:49:26', 0, 'john', '', '', '', 0, 1, '2014-03-14 05:49:26'),
(16, 'pbkdf2_sha256$12000$i8J8ocjmmB2q$t3a+dTFcEI1l1L/Lbagd+XhRQRq8VdaoJD4iF9vuwiE=', '2014-03-14 05:50:15', 0, 'kurt', '', '', '', 0, 1, '2014-03-14 05:50:15'),
(17, 'pbkdf2_sha256$12000$tmIL8Tam0mo0$gslX+jRCnhgWvwdgA+0p5t7u6/l/Ir1yUx2Jy7JvAKo=', '2014-03-14 05:50:38', 0, 'ming', 'ming', '', '', 0, 1, '2014-03-14 05:50:38'),
(18, 'pbkdf2_sha256$12000$HQdaDOiHgYzD$lyR0YhxzqSH29mxmg1fw7qaCGJZfS2aW0I1sCMG7BYA=', '2014-03-14 05:51:03', 0, 'nancy', '', '', '', 0, 1, '2014-03-14 05:51:03'),
(19, 'pbkdf2_sha256$12000$94Wx9X7Qq7Ai$o8ydJaJbh+GWPVlMJ5qGwOqgS0OmWCgf7D1vjFyfiy8=', '2014-03-14 05:51:20', 0, 'oscar', '', '', '', 0, 1, '2014-03-14 05:51:20'),
(20, 'pbkdf2_sha256$12000$YoeuZdaOHqik$XKqR32GAd/IH19pjxWSlQ7YkOcnCvWqMz4NkWNnH2Ng=', '2014-03-14 05:51:30', 0, 'penny', '', '', '', 0, 1, '2014-03-14 05:51:30'),
(21, 'pbkdf2_sha256$12000$R6Zy7hDiK1vP$buEewco1VuotN74e8ndYdhAXOFtZWmYdWQtKn9lImgM=', '2014-03-14 05:51:57', 0, 'quinn', '', '', '', 0, 1, '2014-03-14 05:51:57'),
(22, 'pbkdf2_sha256$12000$wtbu2fYr8ff6$YYv+NM722deMiDFiBEqEn9dcJEbGQs1pFc+FNP8r2Kw=', '2014-03-14 05:52:06', 0, 'romeo', '', '', '', 0, 1, '2014-03-14 05:52:06'),
(23, 'pbkdf2_sha256$12000$jxIS67vf1hz8$J8Czwr7TAC0mcFcW1d4LHY0WinjVFHp7A3xR3hKDhXA=', '2014-03-14 05:53:49', 0, 'sandra', '', '', '', 0, 1, '2014-03-14 05:53:49'),
(24, 'pbkdf2_sha256$12000$da9GgopGgYO5$xLxU52b5ygvUu8DXfjQYR6bGznAfUJlRQmlVAopKGZA=', '2014-03-14 05:54:43', 0, 'trip', '', '', '', 0, 1, '2014-03-14 05:54:43'),
(25, 'pbkdf2_sha256$12000$VYi774zwdILa$/0uz8I516q7yF1i1oqze7gh/htcuv9co2GOnty8bgQg=', '2014-03-14 05:54:58', 0, 'ulysses', '', '', '', 0, 1, '2014-03-14 05:54:58'),
(26, 'pbkdf2_sha256$12000$9yqFMSQCodpP$FbYfG19ym6AuA780JRUaWDACQwRFjw5sCJDbk96udL4=', '2014-03-14 05:55:10', 0, 'victor', '', '', '', 0, 1, '2014-03-14 05:55:10'),
(27, 'pbkdf2_sha256$12000$YcJzNmoE0r0W$/wGoYkEiXgBt42cbeTsiJ0/sh/wneDBmsosq/Z2JeoI=', '2014-03-14 05:55:25', 0, 'walter', '', '', '', 0, 1, '2014-03-14 05:55:25'),
(28, 'pbkdf2_sha256$12000$VaC4o2VAX3q1$fb8DTLBQU0ezt5CADbEj0bUOS6CYNLHSU+zg8TqbNKM=', '2014-03-14 05:56:02', 0, 'xavier', '', '', '', 0, 1, '2014-03-14 05:56:02'),
(29, 'pbkdf2_sha256$12000$uQxRF7w4dHPM$4YqS12Po/Km1QOgMKZGMNvt5Pnf7eSTIv48ppDMJ43Q=', '2014-03-14 05:56:09', 0, 'ye', 'ye', '', '', 0, 1, '2014-03-14 05:56:09'),
(30, 'pbkdf2_sha256$12000$5lRwONjxpwE1$FG2PByRIObVOSX6zjiqqILesdcwoek3fk8GpvwvtNYc=', '2014-03-14 05:56:40', 0, 'zhao', 'zhao', '', '', 0, 1, '2014-03-14 05:56:40'),
(31, 'pbkdf2_sha256$12000$CStBCW7NOztc$dtBhZpiIm2HvqU/XIF6PrGEy7cs7PJ5OTu1fWE2Z7is=', '2014-03-14 06:00:15', 0, 'pedro', 'pedro', '', '', 0, 1, '2014-03-14 06:00:15');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_6340c63c` (`user_id`),
  KEY `auth_user_groups_5f412f9a` (`group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=41 ;

--
-- Dumping data for table `auth_user_groups`
--

INSERT INTO `auth_user_groups` (`id`, `user_id`, `group_id`) VALUES
(7, 1, 1),
(14, 3, 2),
(15, 3, 3),
(8, 4, 3),
(9, 5, 3),
(12, 7, 2),
(13, 7, 3),
(18, 9, 2),
(19, 9, 3),
(16, 14, 2),
(17, 14, 3),
(20, 17, 2),
(21, 17, 3),
(22, 19, 2),
(23, 19, 3),
(26, 22, 2),
(27, 22, 3),
(28, 23, 2),
(29, 23, 3),
(30, 25, 3),
(31, 26, 2),
(32, 26, 3),
(33, 27, 2),
(34, 27, 3),
(35, 28, 2),
(36, 28, 3),
(37, 29, 2),
(38, 29, 3),
(39, 30, 2),
(40, 30, 3),
(24, 31, 2),
(25, 31, 3);

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_6340c63c` (`user_id`),
  KEY `auth_user_user_permissions_83d7f98b` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_6340c63c` (`user_id`),
  KEY `django_admin_log_37ef4eb4` (`content_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=120 ;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `user_id`, `content_type_id`, `object_id`, `object_repr`, `action_flag`, `change_message`) VALUES
(1, '2014-03-14 05:32:26', 1, 4, '3', 'drago', 1, ''),
(2, '2014-03-14 05:36:03', 1, 3, '1', 'Administrator', 1, ''),
(3, '2014-03-14 05:39:05', 1, 3, '2', 'Grader', 1, ''),
(4, '2014-03-14 05:41:40', 1, 3, '3', 'Importer', 1, ''),
(5, '2014-03-14 05:42:33', 1, 4, '4', 'alice', 1, ''),
(6, '2014-03-14 05:42:42', 1, 4, '5', 'bill', 1, ''),
(7, '2014-03-14 05:42:50', 1, 4, '6', 'charles', 1, ''),
(8, '2014-03-14 05:43:35', 1, 4, '7', 'ali', 1, ''),
(9, '2014-03-14 05:43:59', 1, 4, '8', 'pancho', 1, ''),
(10, '2014-03-14 05:46:08', 1, 4, '9', 'Lee', 1, ''),
(11, '2014-03-14 05:46:56', 1, 4, '8', 'pancho', 3, ''),
(12, '2014-03-14 05:47:27', 1, 4, '9', 'lee', 2, 'Changed username.'),
(13, '2014-03-14 05:47:58', 1, 4, '10', 'edward', 1, ''),
(14, '2014-03-14 05:48:19', 1, 4, '11', 'frank', 1, ''),
(15, '2014-03-14 05:48:33', 1, 4, '12', 'grace', 1, ''),
(16, '2014-03-14 05:48:51', 1, 4, '13', 'henry', 1, ''),
(17, '2014-03-14 05:49:11', 1, 4, '14', 'ivana', 1, ''),
(18, '2014-03-14 05:49:26', 1, 4, '15', 'john', 1, ''),
(19, '2014-03-14 05:50:15', 1, 4, '16', 'kurt', 1, ''),
(20, '2014-03-14 05:50:38', 1, 4, '17', 'ming', 1, ''),
(21, '2014-03-14 05:51:03', 1, 4, '18', 'nancy', 1, ''),
(22, '2014-03-14 05:51:20', 1, 4, '19', 'oscar', 1, ''),
(23, '2014-03-14 05:51:30', 1, 4, '20', 'penny', 1, ''),
(24, '2014-03-14 05:51:58', 1, 4, '21', 'quinn', 1, ''),
(25, '2014-03-14 05:52:06', 1, 4, '22', 'romeo', 1, ''),
(26, '2014-03-14 05:53:49', 1, 4, '23', 'sandra', 1, ''),
(27, '2014-03-14 05:54:43', 1, 4, '24', 'trip', 1, ''),
(28, '2014-03-14 05:54:58', 1, 4, '25', 'ulysses', 1, ''),
(29, '2014-03-14 05:55:10', 1, 4, '26', 'victor', 1, ''),
(30, '2014-03-14 05:55:25', 1, 4, '27', 'walter', 1, ''),
(31, '2014-03-14 05:56:02', 1, 4, '28', 'xavier', 1, ''),
(32, '2014-03-14 05:56:09', 1, 4, '29', 'ye', 1, ''),
(33, '2014-03-14 05:56:40', 1, 4, '30', 'zhao', 1, ''),
(34, '2014-03-14 05:57:51', 1, 4, '7', 'ali', 2, 'Changed first_name, last_name and groups.'),
(35, '2014-03-14 05:58:33', 1, 4, '3', 'drago', 2, 'Changed first_name, last_name and groups.'),
(36, '2014-03-14 05:59:15', 1, 4, '17', 'ming', 2, 'Changed first_name and groups.'),
(37, '2014-03-14 05:59:40', 1, 4, '14', 'ivana', 2, 'Changed first_name and groups.'),
(38, '2014-03-14 06:00:15', 1, 4, '31', 'pedro', 1, ''),
(39, '2014-03-14 06:00:42', 1, 4, '31', 'pedro', 2, 'Changed first_name and groups.'),
(40, '2014-03-14 06:00:57', 1, 4, '31', 'pedro', 2, 'No fields changed.'),
(41, '2014-03-14 06:01:19', 1, 4, '1', 'sirk', 2, 'Changed groups.'),
(42, '2014-03-14 06:01:51', 1, 4, '4', 'alice', 2, 'Changed first_name and groups.'),
(43, '2014-03-14 06:02:37', 1, 4, '5', 'bill', 2, 'Changed first_name and groups.'),
(44, '2014-03-14 06:03:30', 1, 4, '29', 'ye', 2, 'Changed first_name and groups.'),
(45, '2014-03-14 06:03:52', 1, 4, '30', 'zhao', 2, 'Changed first_name and groups.'),
(46, '2014-03-14 06:04:47', 1, 7, '1', 'ali --- ara', 1, ''),
(47, '2014-03-14 06:05:00', 1, 7, '2', 'ali --- eng', 1, ''),
(48, '2014-03-14 06:05:11', 1, 7, '3', 'drago --- rus', 1, ''),
(49, '2014-03-14 06:05:24', 1, 7, '4', 'drago --- eng', 1, ''),
(50, '2014-03-14 06:05:32', 1, 7, '5', 'ivana --- rus', 1, ''),
(51, '2014-03-14 06:05:42', 1, 7, '6', 'ivana --- eng', 1, ''),
(52, '2014-03-14 06:06:07', 1, 7, '7', 'ye --- chi', 1, ''),
(53, '2014-03-14 06:06:21', 1, 7, '8', 'ye --- eng', 1, ''),
(54, '2014-03-14 06:06:31', 1, 7, '9', 'zhao --- chi', 1, ''),
(55, '2014-03-14 06:06:41', 1, 7, '10', 'zhao --- eng', 1, ''),
(56, '2014-03-14 06:06:51', 1, 7, '11', 'pedro --- spa', 1, ''),
(57, '2014-03-14 06:07:01', 1, 7, '12', 'pedro --- eng', 1, ''),
(58, '2014-03-14 06:07:21', 1, 7, '13', 'oscar --- spa', 1, ''),
(59, '2014-03-14 06:07:30', 1, 7, '14', 'oscar --- eng', 1, ''),
(60, '2014-03-14 06:07:39', 1, 7, '15', 'oscar --- por', 1, ''),
(61, '2014-03-14 06:07:52', 1, 7, '16', 'alice --- eng', 1, ''),
(62, '2014-03-14 06:07:58', 1, 7, '17', 'bill --- eng', 1, ''),
(63, '2014-03-14 06:08:09', 1, 7, '18', 'charles --- eng', 1, ''),
(64, '2014-03-14 06:08:21', 1, 7, '19', 'edward --- eng', 1, ''),
(65, '2014-03-14 06:08:41', 1, 7, '20', 'frank --- eng', 1, ''),
(66, '2014-03-14 06:08:50', 1, 7, '21', 'grace --- eng', 1, ''),
(67, '2014-03-14 06:09:05', 1, 7, '22', 'henry --- eng', 1, ''),
(68, '2014-03-14 06:09:14', 1, 7, '23', 'henry --- fre', 1, ''),
(69, '2014-03-14 06:09:32', 1, 7, '24', 'lee --- chi', 1, ''),
(70, '2014-03-14 06:09:38', 1, 7, '25', 'lee --- eng', 1, ''),
(71, '2014-03-14 06:09:51', 1, 7, '26', 'romeo --- eng', 1, ''),
(72, '2014-03-14 06:10:01', 1, 7, '27', 'romeo --- ita', 1, ''),
(73, '2014-03-14 06:10:12', 1, 7, '28', 'romeo --- spa', 1, ''),
(74, '2014-03-14 06:10:23', 1, 7, '29', 'sandra --- eng', 1, ''),
(75, '2014-03-14 06:10:34', 1, 7, '30', 'trip --- eng', 1, ''),
(76, '2014-03-14 06:10:45', 1, 7, '31', 'ulysses --- eng', 1, ''),
(77, '2014-03-14 06:11:24', 1, 7, '32', 'walter --- eng', 1, ''),
(78, '2014-03-14 06:11:36', 1, 7, '33', 'walter --- ger', 1, ''),
(79, '2014-03-14 06:11:44', 1, 7, '34', 'henry --- fre', 1, ''),
(80, '2014-03-14 06:11:54', 1, 7, '35', 'xavier --- eng', 1, ''),
(81, '2014-03-14 06:12:19', 1, 7, '36', 'xavier --- fre', 1, ''),
(82, '2014-03-14 06:12:30', 1, 7, '37', 'penny --- eng', 1, ''),
(83, '2014-03-14 06:15:35', 1, 15, '1', 'EXAM # 11111', 1, ''),
(84, '2014-03-14 06:17:34', 1, 15, '2', 'EXAM # 22222', 1, ''),
(85, '2014-03-14 06:19:18', 1, 15, '3', 'EXAM # 33333', 1, ''),
(86, '2014-03-14 06:20:24', 1, 15, '4', 'EXAM # 44444', 1, ''),
(87, '2014-03-14 06:22:07', 1, 19, '1', 'Discrepancy object', 1, ''),
(88, '2014-03-14 06:22:29', 1, 19, '1', 'Discrepancy object', 2, 'Changed text.'),
(89, '2014-03-14 06:22:58', 1, 19, '2', 'Discrepancy object', 1, ''),
(90, '2014-03-14 06:23:25', 1, 19, '3', 'Discrepancy object', 1, ''),
(91, '2014-03-14 06:24:10', 1, 19, '4', 'Discrepancy object', 1, ''),
(92, '2014-03-14 06:24:44', 1, 16, '1', 'GraderQueue object', 1, ''),
(93, '2014-03-14 06:24:51', 1, 16, '2', 'GraderQueue object', 1, ''),
(94, '2014-03-14 06:24:55', 1, 16, '3', 'GraderQueue object', 1, ''),
(95, '2014-03-14 06:24:59', 1, 16, '4', 'GraderQueue object', 1, ''),
(96, '2014-03-14 06:27:47', 1, 13, '1', 'sourceDiscrepancyQueue object', 1, ''),
(97, '2014-03-14 06:29:50', 1, 13, '2', 'sourceDiscrepancyQueue object', 1, ''),
(98, '2014-03-14 06:30:38', 1, 17, '1', 'TargetReviewQueue object', 1, ''),
(99, '2014-03-14 06:31:07', 1, 17, '2', 'TargetReviewQueue object', 1, ''),
(100, '2014-03-14 06:31:26', 1, 17, '3', 'TargetReviewQueue object', 1, ''),
(101, '2014-03-14 06:31:48', 1, 17, '4', 'TargetReviewQueue object', 1, ''),
(102, '2014-03-14 06:32:28', 1, 4, '7', 'ali', 2, 'Changed groups.'),
(103, '2014-03-14 06:32:41', 1, 4, '3', 'drago', 2, 'Changed groups.'),
(104, '2014-03-14 06:32:55', 1, 4, '14', 'ivana', 2, 'Changed groups.'),
(105, '2014-03-14 06:33:13', 1, 4, '9', 'lee', 2, 'Changed groups.'),
(106, '2014-03-14 06:33:31', 1, 4, '17', 'ming', 2, 'Changed groups.'),
(107, '2014-03-14 06:33:45', 1, 4, '19', 'oscar', 2, 'Changed groups.'),
(108, '2014-03-14 06:33:55', 1, 4, '31', 'pedro', 2, 'Changed groups.'),
(109, '2014-03-14 06:34:20', 1, 4, '22', 'romeo', 2, 'Changed groups.'),
(110, '2014-03-14 06:34:51', 1, 4, '23', 'sandra', 2, 'Changed groups.'),
(111, '2014-03-14 06:35:06', 1, 4, '25', 'ulysses', 2, 'Changed groups.'),
(112, '2014-03-14 06:35:20', 1, 4, '26', 'victor', 2, 'Changed groups.'),
(113, '2014-03-14 06:35:34', 1, 4, '27', 'walter', 2, 'Changed groups.'),
(114, '2014-03-14 06:35:56', 1, 4, '28', 'xavier', 2, 'Changed groups.'),
(115, '2014-03-14 06:36:12', 1, 4, '29', 'ye', 2, 'Changed groups.'),
(116, '2014-03-14 06:36:26', 1, 4, '30', 'zhao', 2, 'Changed groups.'),
(117, '2014-03-14 06:37:22', 1, 7, '38', 'sandra --- ara', 1, ''),
(118, '2014-03-21 21:43:48', 1, 4, '1', 'sirk', 2, 'Changed password.'),
(119, '2014-03-21 21:44:10', 1, 4, '1', 'sirk', 2, 'Changed password.');

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `name`, `app_label`, `model`) VALUES
(1, 'log entry', 'admin', 'logentry'),
(2, 'permission', 'auth', 'permission'),
(3, 'group', 'auth', 'group'),
(4, 'user', 'auth', 'user'),
(5, 'content type', 'contenttypes', 'contenttype'),
(6, 'session', 'sessions', 'session'),
(7, 'language pair', 'userprofile', 'languagepair'),
(8, 'language', 'texts', 'language'),
(9, 'error code', 'texts', 'errorcode'),
(10, 'error', 'texts', 'error'),
(11, 'source text', 'texts', 'sourcetext'),
(12, 'source review queue', 'texts', 'sourcereviewqueue'),
(13, 'source discrepancy queue', 'texts', 'sourcediscrepancyqueue'),
(14, 'target text', 'texts', 'targettext'),
(15, 'exam', 'texts', 'exam'),
(16, 'grader queue', 'texts', 'graderqueue'),
(17, 'target review queue', 'texts', 'targetreviewqueue'),
(18, 'target input queue', 'texts', 'targetinputqueue'),
(19, 'discrepancy', 'texts', 'discrepancy'),
(21, 'record', 'records', 'record'),
(22, 'error json', 'texts', 'errorjson');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_b7b81f0c` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('5glaqqkm4z7gwx0t1hzf34objer5xd0r', 'NzViZmMwODJlOGNhMjI5ODY5ODVjZmJhM2EzYmVmYzI5NDczYjUyNjp7fQ==', '2014-04-04 22:57:17'),
('7owai1iwqaps0vepi76161nl2f5vwje7', 'Mzc3ZDJhYTZmZTUxOWM4YTFkMzNhYjlkOTJkMzM4ZWExZDljOGEyMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=', '2014-04-05 02:24:03');

-- --------------------------------------------------------

--
-- Table structure for table `records_record`
--

CREATE TABLE IF NOT EXISTS `records_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year` smallint(5) unsigned NOT NULL,
  `source_language` varchar(4) NOT NULL,
  `target_language` varchar(4) NOT NULL,
  `exam_number` smallint(5) unsigned NOT NULL,
  `second_passage` varchar(2) NOT NULL,
  `a_passage_markings` varchar(3) NOT NULL,
  `second_passage_markings` varchar(3) NOT NULL,
  `grader_one` smallint(5) unsigned NOT NULL,
  `grader_two` smallint(5) unsigned NOT NULL,
  `target_text_a` longtext NOT NULL,
  `target_text_b_c` longtext NOT NULL,
  `grader_stop_a` varchar(3) NOT NULL,
  `grader_stop_b_c` varchar(3) NOT NULL,
  `incomplete_a` varchar(3) NOT NULL,
  `incomplete_b_c` varchar(3) NOT NULL,
  `global_quality_pts` smallint(5) unsigned NOT NULL,
  `exam_reviewed_a` varchar(3) NOT NULL,
  `exam_appealed_b_c` varchar(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `texts_discrepancy`
--

CREATE TABLE IF NOT EXISTS `texts_discrepancy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text_id` int(11) NOT NULL,
  `modifiedText` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  `numTimesVerified` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `texts_discrepancy_377be151` (`text_id`),
  KEY `texts_discrepancy_6340c63c` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `texts_discrepancy`
--

INSERT INTO `texts_discrepancy` (`id`, `text_id`, `modifiedText`, `user_id`, `numTimesVerified`) VALUES
(1, 2, 'test data', 14, 0),
(2, 3, 'test test test', 31, 0),
(3, 5, 'test data', 7, 0),
(4, 8, 'test data', 17, 0);

-- --------------------------------------------------------

--
-- Table structure for table `texts_error`
--

CREATE TABLE IF NOT EXISTS `texts_error` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_id` int(11) NOT NULL,
  `passageLetter` varchar(1) NOT NULL,
  `errorCode_id` int(11) NOT NULL,
  `pointsDeducted` smallint(5) unsigned NOT NULL,
  `sourcePhrase` varchar(255) NOT NULL,
  `targetPhrase` varchar(255) NOT NULL,
  `comment` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `texts_error_57ed41d1` (`exam_id`),
  KEY `texts_error_06b3d53d` (`errorCode_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `texts_error`
--

INSERT INTO `texts_error` (`id`, `exam_id`, `passageLetter`, `errorCode_id`, `pointsDeducted`, `sourcePhrase`, `targetPhrase`, `comment`) VALUES
(1, 1, 'A', 19, 2, 'globalization', 'глобализации', 'spelling error!'),
(2, 1, 'A', 2, 4, 'benign market forces actually prevent predatory governments', 'для доброжелательные правительства', 'cant read'),
(3, 1, 'A', 16, 3, 'And does globalization, by definition, have to be the nemesis of national government?', 'И разве глобализация , по определению, должны быть возмездием национального правительства ?', 'test grammar error'),
(4, 1, 'A', 18, 1, 'a world.', 'чем ,', 'missing period.');

-- --------------------------------------------------------

--
-- Table structure for table `texts_errorcode`
--

CREATE TABLE IF NOT EXISTS `texts_errorcode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `errorCode` varchar(3) NOT NULL,
  `displayName` varchar(250) NOT NULL,
  `displayColor` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `texts_errorcode`
--

INSERT INTO `texts_errorcode` (`id`, `errorCode`, `displayName`, `displayColor`) VALUES
(1, 'UNF', 'Unfinished', 'Red'),
(2, 'Ill', 'Illegible', 'OrangeRed'),
(3, 'OTH', 'Other', 'Orange'),
(4, 'MT', 'Mistranslation into target language', 'FireBrick'),
(5, 'MU', 'Misunderstanding of source text', 'LightCoral'),
(6, 'A', 'Addition', 'Magenta'),
(7, 'O', 'Ommission', 'Maroon'),
(8, 'T', 'Terminology, word choice', 'MediumVioletRed'),
(9, 'R', 'Register', 'Orchid'),
(10, 'F', 'Too freely translated', 'PaleVioletRed'),
(11, 'L', 'Too literal, word-for-word translation', 'Pink'),
(12, 'FC', 'False cognate', 'Plum'),
(13, 'IND', 'Indecision, gave more than one option', 'Purple'),
(14, 'I', 'Inconsistency', 'Salmon'),
(15, 'AMB', 'Ambiguity', 'Tomato'),
(16, 'G', 'Grammar', 'Blue'),
(17, 'SY', 'Syntax(phrase/clause/sentence structure)', 'LightBlue'),
(18, 'P', 'Punctuation', 'Navy'),
(19, 'SP', 'Spelling', 'Green'),
(20, 'D', 'Accents, other diacritical marks', 'RoyalBlue'),
(21, 'C', 'Case(upper/lower)', 'SpringGreen'),
(22, 'WF', 'Word form', 'YellowGreen'),
(23, 'U', 'Usage', 'Chartreuse'),
(24, 'ST', 'Style', 'Lime');

-- --------------------------------------------------------

--
-- Table structure for table `texts_errorjson`
--

CREATE TABLE IF NOT EXISTS `texts_errorjson` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_id` int(11) NOT NULL,
  `targetJSON1` longtext NOT NULL,
  `sourceJSON1` longtext NOT NULL,
  `targetJSON2` longtext NOT NULL,
  `sourceJSON2` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `texts_errorjson_57ed41d1` (`exam_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `texts_exam`
--

CREATE TABLE IF NOT EXISTS `texts_exam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `examNumber` varchar(5) NOT NULL,
  `secondPassage` varchar(1) NOT NULL,
  `aPassageMarkings` tinyint(1) NOT NULL,
  `secondPassageMarkings` tinyint(1) NOT NULL,
  `grader1` smallint(5) unsigned NOT NULL,
  `grader2` smallint(5) unsigned NOT NULL,
  `grader3` smallint(5) unsigned NOT NULL,
  `grader4` smallint(5) unsigned NOT NULL,
  `sourceText1_id` int(11) NOT NULL,
  `sourceText2_id` int(11) NOT NULL,
  `targetText1_id` int(11) DEFAULT NULL,
  `targetText2_id` int(11) DEFAULT NULL,
  `language_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `texts_exam_709378a4` (`sourceText1_id`),
  KEY `texts_exam_e82bc764` (`sourceText2_id`),
  KEY `texts_exam_c46536f7` (`targetText1_id`),
  KEY `texts_exam_87f8173f` (`targetText2_id`),
  KEY `texts_exam_784efa61` (`language_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `texts_exam`
--

INSERT INTO `texts_exam` (`id`, `examNumber`, `secondPassage`, `aPassageMarkings`, `secondPassageMarkings`, `grader1`, `grader2`, `grader3`, `grader4`, `sourceText1_id`, `sourceText2_id`, `targetText1_id`, `targetText2_id`, `language_id`) VALUES
(1, '11111', 'B', 0, 0, 36, 38, 36, 37, 1, 2, 1, 2, 14),
(2, '22222', 'C', 0, 0, 20, 18, 18, 19, 4, 6, 3, 4, 15),
(3, '33333', 'B', 0, 0, 16, 19, 17, 17, 7, 8, 5, 6, 1),
(4, '44444', 'B', 0, 0, 10, 15, 12, 13, 10, 11, 7, 8, 11);

-- --------------------------------------------------------

--
-- Table structure for table `texts_graderqueue`
--

CREATE TABLE IF NOT EXISTS `texts_graderqueue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `texts_graderqueue_57ed41d1` (`exam_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `texts_graderqueue`
--

INSERT INTO `texts_graderqueue` (`id`, `exam_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `texts_highlightedhtml`
--

CREATE TABLE IF NOT EXISTS `texts_highlightedhtml` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_id` int(11) NOT NULL,
  `targetHTML1` longtext NOT NULL,
  `sourceHTML1` longtext NOT NULL,
  `targetHTML2` longtext NOT NULL,
  `sourceHTML2` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `texts_highlightedhtml_57ed41d1` (`exam_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `texts_language`
--

CREATE TABLE IF NOT EXISTS `texts_language` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(3) NOT NULL,
  `displayName` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `texts_language`
--

INSERT INTO `texts_language` (`id`, `language`, `displayName`) VALUES
(1, 'ara', 'Arabic'),
(2, 'chi', 'Chinese'),
(3, 'dut', 'Dutch'),
(4, 'eng', 'English'),
(5, 'fin', 'Finnish'),
(6, 'fre', 'French'),
(7, 'ger', 'German'),
(8, 'hrv', 'Croation'),
(9, 'hun', 'Hungarian'),
(10, 'ita', 'Italian'),
(11, 'jpn', 'Japanese'),
(12, 'pol', 'Polish'),
(13, 'por', 'Portuguese'),
(14, 'rus', 'Russian'),
(15, 'spa', 'Spanish');

-- --------------------------------------------------------

--
-- Table structure for table `texts_sourcediscrepancyqueue`
--

CREATE TABLE IF NOT EXISTS `texts_sourcediscrepancyqueue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `importer1_id` int(11) NOT NULL,
  `importer2_id` int(11) NOT NULL,
  `needsToReview_id` int(11) DEFAULT NULL,
  `originalSource_id` int(11) NOT NULL,
  `sourceLanguage_id` int(11) NOT NULL,
  `targetLanguage_id` int(11) NOT NULL,
  `year` smallint(5) unsigned NOT NULL,
  `setNumber` smallint(5) unsigned NOT NULL,
  `passageLetter` varchar(1) NOT NULL,
  `versionNumber` smallint(5) unsigned NOT NULL,
  `text` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `originalSource_id` (`originalSource_id`),
  KEY `texts_sourcediscrepancyqueue_ee481db5` (`importer1_id`),
  KEY `texts_sourcediscrepancyqueue_9845a96d` (`importer2_id`),
  KEY `texts_sourcediscrepancyqueue_df3423b3` (`needsToReview_id`),
  KEY `texts_sourcediscrepancyqueue_42bfcc0a` (`sourceLanguage_id`),
  KEY `texts_sourcediscrepancyqueue_7419cdfb` (`targetLanguage_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `texts_sourcediscrepancyqueue`
--

INSERT INTO `texts_sourcediscrepancyqueue` (`id`, `importer1_id`, `importer2_id`, `needsToReview_id`, `originalSource_id`, `sourceLanguage_id`, `targetLanguage_id`, `year`, `setNumber`, `passageLetter`, `versionNumber`, `text`) VALUES
(1, 4, 5, 3, 2, 4, 14, 2009, 1, 'B', 1, 'Test text goes here'),
(2, 9, 17, 29, 10, 11, 4, 2012, 1, 'A', 1, 'There will be source discrepancies here.');

-- --------------------------------------------------------

--
-- Table structure for table `texts_sourcereviewqueue`
--

CREATE TABLE IF NOT EXISTS `texts_sourcereviewqueue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `source_id` (`source_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `texts_sourcereviewqueue`
--

INSERT INTO `texts_sourcereviewqueue` (`id`, `source_id`) VALUES
(1, 13);

-- --------------------------------------------------------

--
-- Table structure for table `texts_sourcetext`
--

CREATE TABLE IF NOT EXISTS `texts_sourcetext` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sourceLanguage_id` int(11) NOT NULL,
  `targetLanguage_id` int(11) NOT NULL,
  `year` smallint(5) unsigned NOT NULL,
  `setNumber` smallint(5) unsigned NOT NULL,
  `passageLetter` varchar(1) NOT NULL,
  `versionNumber` smallint(5) unsigned NOT NULL,
  `text` longtext NOT NULL,
  `importer1_id` int(11) NOT NULL,
  `importer2_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `texts_sourcetext_42bfcc0a` (`sourceLanguage_id`),
  KEY `texts_sourcetext_7419cdfb` (`targetLanguage_id`),
  KEY `texts_sourcetext_ee481db5` (`importer1_id`),
  KEY `texts_sourcetext_9845a96d` (`importer2_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `texts_sourcetext`
--

INSERT INTO `texts_sourcetext` (`id`, `sourceLanguage_id`, `targetLanguage_id`, `year`, `setNumber`, `passageLetter`, `versionNumber`, `text`, `importer1_id`, `importer2_id`) VALUES
(1, 4, 14, 2009, 1, 'A', 1, 'A SPECTER is haunting the world''s governments-the specter of globalization. Some argue that predatory market forces make it impossible for benevolent governments to shield their populations from the beasts of prey that lurk beyond their borders. Others counter that benign market forces actually prevent predatory governments from fleecing their citizens. Although the two sides see different villains, they draw one common conclusion: omnipotent markets mean impotent politicians. Indeed, this formula has become one of the clichés of our age. But is it true that governments have become weaker and less relevant than ever before? And does globalization, by definition, have to be the nemesis of national government?\r\nGlobalization is a journey. But it is a journey toward an unreachable destination-"the globalized world." A "globalized" economy could be defined as one in which neither distance nor national borders impede economic transactions. This would be a world where the costs of transport and communications were zero and the barriers created by differing national jurisdictions had vanished. Needless to say, we do not live in anything even close to such a world. And since many of the things we transport (including ourselves) are physical, we never will.\r\nThis globalizing journey is not a new one. Over the past five centuries, technological change has progressively reduced the barriers to international integration. Transatlantic communication, for example, has evolved from sail power to steam, to the telegraph, the telephone, commercial aircraft, and now to the Internet. Yet states have become neither weaker nor less important during this odyssey. On the contrary, in the countries with the most advanced and internationally integrated economies, governments'' ability to tax and redistribute incomes, regulate the economy, and monitor the activity of their citizens has increased beyond all recognition. This has been especially true over the past century.\r\nThe question that remains, however, is whether today''s form of globalization is likely to have a different impact from that of the past. Indeed, it may well, for numerous factors distinguish today''s globalizing journey from past ones and could produce a different outcome. These distinctions include more rapid communications, market liberalization, and global integration of the production of goods and services. Yet contrary to one common assumption, the modern form of globalization will not spell the end of the modern nation-state.\r\n', 2, NULL),
(2, 4, 14, 2009, 1, 'B', 1, 'Today we are confronted by events which cast a shadow over\r\nhumankind and the United Nation''s vision of peace. The humanitarian\r\ncrisis in Sudan continues. As relief efforts proceed, our thoughts are with\r\nthe refugees of Dafur. We urge the Government of Sudan to do everything\r\nin its power to bring this tragedy to an end.\r\nWe think of those whose lives have been devastated by the destructive\r\nfury of hurricanes in the Caribbean and on the US Atlantic coast. We\r\nextend to them our deepest sympathies for the loss of lives, property and\r\npossessions. The perpetrators of the slaughter of the innocents in Russia\r\ngave a new dimension to wickedness.\r\nThey defeated their own cause through the ruthless and indiscriminate\r\nshedding Of the blood Of children. Nothing can justify what they did. The\r\nUN must be united against such infamy.\r\nLet us express our sympathy and solidarity with the ordinary people of Iraq\r\ncaught in that country''s terrible cycle of violence. Let this forum give\r\nthem our full and unreserved support in the struggle for genuine\r\ndemocratic Government, and the regaining of their national sovereignty.\r\nMay their hopes for a peaceful future and lasting stability find fulfillment.\r\nWe feel for the families of the people killed by terrorists outside the\r\nAustralian Embassy in Jakarta. We want them to know that their pain is\r\nshared in this family of nations.\r\nThe plea from Fiji is for the UN member countries to strengthen their joint\r\nresolve to oppose political terror everywhere. This is a critical time in\r\nhistory; the UN is called to mobilize all its experience, its skills and its\r\npowers to create concord among nations. That was its founding principle.\r\nIt Is the principle that must continue to drive and sustain the United\r\nNations.\r\nFiji, as always, is committed to the maintenance of peace and security, and\r\nto a world free of weapons Of mass destruction and terrorism.\r\nWe want an end to ozone-depleting pollution and the elimination of other\r\nhazards to the environment.\r\n', 2, NULL),
(3, 4, 14, 2009, 1, 'C', 1, 'Many jurisdictions have been setting up implementation schemes designed to provide technical guidance to allow the general legal framework for electronic authentication to work in practice. Such schemes may include (1) national and international standards for electronic authentication products and services; (2) regulatory schemes for the supervision, accreditation, and certification of particular authentication products and services; and (3) guidelines, best practices, and similar documentation for the operation of electronic authentication systems. Such schemes may be set forth in national legislation, international or regional regulatory principles, guidelines drafted by commercial or policy organizations, or other initiatives.\r\n\r\nWhen one looks more closely at such schemes, a number of trends emerge:\r\n\r\nInformation about them is often difficult to come by.\r\nThe majority of countries with laws on electronic authentication have not yet developed detailed standards, although a number are working on them.\r\nIn those countries where accreditation or certification schemes for electronic authentication exist, the vast majority at least purport to be "voluntary". On the other hand, many laws require the use of accredited Certification Service Providers ("CSPs") in transactions with the government, which can have a powerful effect in forcing a particular standard or accreditation procedure on the market.\r\nWhile almost all the laws give basic legal effect to electronic signatures independent of the technology used, very often the most important legal effects are only recognized when the certificate is issued by a service provider that is accredited or certified in some way, or that meets certain standards.\r\nA number of countries are currently struggling with the issue of whether to establish a supervisory body for all authentication products and services.\r\nMany countries also require CSPs to register in some way before starting their activities.\r\nIn countries where standards are adopted or in the process of being adopted, it is often difficult to ascertain the extent to which they are truly international in nature.\r\nIt seems that the evolving definition of "accreditation," "certification," and "standardization" in the context of electronic authentication is a flexible one, which should be implemented in national systems in a way which furthers truly international and interoperable electronic commerce.', 2, NULL),
(4, 15, 4, 2010, 1, 'A', 1, 'Hay muchas variaciones de los pasajes de Lorem Ipsum disponibles, pero la mayoría sufrió alteraciones en alguna manera, ya sea porque se le agregó humor, o palabras aleatorias que no parecen ni un poco creíbles. Si vas a utilizar un pasaje de Lorem Ipsum, necesitás estar seguro de que no hay nada avergonzante escondido en el medio del texto. Todos los generadores de Lorem Ipsum que se encuentran en Internet tienden a repetir trozos predefinidos cuando sea necesario, haciendo a este el único generador verdadero (válido) en la Internet. Usa un diccionario de mas de 200 palabras provenientes del latín, combinadas con estructuras muy útiles de sentencias, para generar texto de Lorem Ipsum que parezca razonable. Este Lorem Ipsum generado siempre estará libre de repeticiones, humor agregado o palabras no características del lenguaje, etc', 2, NULL),
(5, 15, 4, 2010, 1, 'B', 1, 'De los sos ojos tan fuertemientre llorando\r\ntornava la cabeça e estávalos catando,\r\nvio puertas abiertas e uços sin cañados,\r\nalcándaras vazías, sin pielles e sin mantos\r\ne sin falcones e sin adtores mudados.\r\nSospiró mio Çid, ca mucho avié grandes cuidados,\r\nfabló mio Çid bien e tan mesurado,\r\n-Grado a ti, Señor, Padre que estás en alto,\r\nesto me an buelto mios enemigos malos.-\r\nAllí piensan de aguijar, allí sueltan las riendas,\r\na la exida de Bivar ovieron la corneja diestra\r\ne entrando a Burgos oviéronla siniestra.\r\nMeçió mio Çid los ombros e engrameó la tiesta,\r\n-¡Albriçia, Álbar Fáñez, ca echados somos de tierra!-\r\nMio Çid Ruy Díaz por Burgos entrava,\r\nen su conpaña sessaenta pendones, exiénlo ver mugieres e varones, \r\nburgeses e burgesas por las finiestras son,\r\nplorando de los ojos, tanto avién el dolor,\r\nde las sus bocas todos dizían una razón,\r\n-¡Dios, qué buen vassallo, si oviesse buen señor!-\r\nConbidarle ien de grado, mas ninguno non osava,\r\nel rey don Alfonso tanto avié la grand saña,\r\nantes de la noche, en Burgos d''él entró su carta\r\ncon grand recabdo e fuertemientre sellada,\r\nque a mio Çid Ruy Díaz que nadi nol'' diessen posada.\r\n', 2, NULL),
(6, 15, 4, 2010, 1, 'C', 1, 'Hace mucho tiempo, en el gran océano que baña las costas del Perú no había peces. Había corales, esponjas, medusas, caracoles y otros animales, pero ningún pez nadaba en las azules aguas de dicho océano. Éstos habitaban únicamente los ríos, lagos y torrentes del Perú, pero eran tan pocos que no los pescaban.\r\nUn día estos peces emigraron hacia el océano, y allí se multiplicaron. He aquí cómo ocurrió:\r\nEn esa época vivía en el Perú un joven príncipe, hermoso y gallardo. Era muy poderoso y conocía artes de magia. Alcanzaba un gesto suyo para que colinas y montañas se aplanasen y transformasen en prados verdes y fértiles llanuras; sumergía una caña en un río, y en el mismo instante las aguas aumentaban, desbordaban y regaban los campos de cultivo; pronunciaba unas fórmulas mágicas, y al momento quedaban desecados los pantanos y lagunas fangosas, cuyas cuencas se transformaban en fructíferas plantaciones de plátanos.\r\nEste príncipe se llamaba Coniyara, y como era un hombre justo al que le gustaba hacer el bien, a menudo se disfrazaba de mendigo para mezclarse con la gente pobre y enterarse de sus necesidades y anhelos. Muchas veces acompañó a los pastores de llamas que recorrían los escabrosos senderos de los Andes. Entraba en las cabañas miserables y veía cómo se molía con esfuerzo el maíz conseguido con dedicación en las laderas rocosas.\r\nNadie reconocía a este príncipe, cuando se disfrazaba de mendigo.\r\nHabitaba en aquellos tiempos esas tierras una princesa llamada Cavillaca, que rechazaba obstinadamente a todos los pretendientes que se le presentaban. Un día la hermosa princesa penetró en un bosque, se sentó a la sombra de un árbol y empezó a tejer una estera multicolor. En ese momento se posó sobre una de las ramas del árbol un pajarito de plumaje azul. Era el príncipe Coniyara, que había tomado aquel aspecto para explorar con mayor facilidad sus dominios y las tierras vecinas. Al ver a la princesa, se enamoró de ella, pero recordó que ésta era capaz de rechazarlo, como había hecho con tantos pretendientes. Recurrió entonces a la astucia. Comenzó a gorjear tan melodiosamente con su garganta de pajarito cantor, que la joven dejó a un lado el tejido para escuchar, fascinada por la música de aquella ave.\r\n', 2, NULL),
(7, 1, 4, 2011, 1, 'A', 1, 'وقالت وزارة الصحة الأوكرانية إن الاشتباكات اسفرت أيضا عن جرح نحو 17 آخرين.\r\nوتدخلت قوات الشرطة للفصل بين الجانبين في المدينة ذات الأغلبية من متحدثي الروسية.\r\nوقال ارسيني ياتسينوك رئيس وزراء اوكرانيا المؤقت إن بلاده ضحية لاعتداء روسي بيد أنه أكد أنه مازال يعتقد ان هناك مساحة لحل الازمة عن طريق المفاوضات.\r\nوحذر ياتسينوك أمام مجلس الامن التابع للامم المتحدة من ان معاهدة حظر انتشار الأسلحة النووية في خطر طالما لم يتم التوصل إلى حل للأزمة الأوكرانية الروسية.\r\n', 2, NULL),
(8, 1, 4, 2011, 1, 'B', 1, 'قالت الشرطة البريطانية إنها تخشي من احتمال مقتل 4 أشخاص في حادث تحطم طائرة هيلكوبتر مدنية في جنوب شرق انجلترا.\r\nوتحطمت الطائرة في منطقة غلينغهام النائية في إقليم نورفوك.\r\nوهرعت أجهزة الطوارئ إلى مكان الحادث وفرضت طوقا حول موقع الحادث.\r\nولم تتضح على الفور أسباب الحادث، غير أن شهود عيان أشاروا إلى إن الأحوال الجوية سادها الضباب في المنطقة وقت سقوط الطائرة.\r\nوقالت هيئة خدمات إسعاف الطوارئ في شرق انجلترا إنها استدعيت الساعة 7.45 مساء الخميس وقت وقوع الحادث.\r\nوقالت في بيان إنها أرسلت ثلاث سيارات إسعاف وطبيبين وسيارة للتحرك السريع.\r\nويذكر أن غلينغهام قرية صغيرة في جنوب نورفوك ويسكنها 650 شخصا.\r\n', 2, NULL),
(9, 1, 4, 2011, 1, 'C', 1, 'وذكرت أنها "تأثرت كثيرا بالدعم واللطف الذي لاقته من أناس كثيرين".\r\nوكانت أنجلينا - وهي أم لستة أطفال - قد شرحت مسبقا الأسباب التي دفعتها لإجراء العملية، قائلة إنها تريد تقليل الخطر، بعدما توفيت والدتها بسبب سرطان المبيض عن 56 عاما.\r\nوأوضحت في مقالة بعنوان "خياري الطبي" أن أمها كافحت السرطان لنحو عشر سنوات.\r\nوقد أثنى شريك أنجلينا، براد بيت على خيارها، واصفا عملها بأنه "شجاع جدا".\r\nويقدر الأطباء بأن نجمة هوليوود عرضة للإصابة بسرطان الثدي بنسبة 87 في المئة، وللإصابة بسرطان المبيض بنسبة 50 في المئة، بسبب الجينات الموروثة لديها.\r\n', 2, NULL),
(10, 11, 4, 2012, 1, 'A', 1, '国際交流基金（ジャパンファウンデーション）は、1985年より日本各地において、その地域の特性を活かして、他のモデルとなるような優れた国際文化交流活動を行っている団体に対して、1985年度より「国際交流基金地球市民賞」を授賞しています。 \r\n本賞は創設時には「国際交流基金地域交流振興賞」という名称で始まりましたが、近年地域における国際交流活動が一層活発になっていることから、2004年に賞の名称を「国際交流基金地域交流賞」に、2005年から「国際交流基金地球市民賞」に改めました。)\r\n2013年度は、推薦・応募のあった127団体の中から、下記の3団体に本賞を授賞いたします。受賞団体には正賞（賞状）と副賞200万円が贈られます。', 2, NULL),
(11, 11, 4, 2012, 1, 'B', 1, '日本語が得意でない外国人の方が病院にかかるとき、神奈川県下の医療機関と提携して、医療通訳者の派遣を行っている。外国出身の医療通訳者の方々も母国語と日本語を活かして地域社会に貢献。また、全国の地方自治体や国際交流協会が主催する医療通訳研修に講師を派遣して医療通訳者の育成を推進し、多くの外国人が医療通訳を利用できるようなインフラ整備にも貢献している。', 2, NULL),
(12, 11, 4, 2012, 1, 'C', 1, '日本への観光客の増加や2020年のオリンピック・パラリンピック開催により、さまざまな場面で多言語対応のニーズが高まっている。とくに、医療や介護など専門性の高い分野は急務という状況下で、いちはやく医療通訳の派遣や養成に取り組んでいることを高く評価。今後、日本の社会が抱える問題の解決策のひとつを提示している。', 2, NULL),
(13, 4, 15, 2014, 1, 'B', 1, 'some test text', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `texts_targetinputqueue`
--

CREATE TABLE IF NOT EXISTS `texts_targetinputqueue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_id` int(11) NOT NULL,
  `targetTextNumber` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `texts_targetinputqueue_57ed41d1` (`exam_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `texts_targetreviewqueue`
--

CREATE TABLE IF NOT EXISTS `texts_targetreviewqueue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_id` int(11) NOT NULL,
  `targetText_id` int(11) NOT NULL,
  `nextReviewer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `targetText_id` (`targetText_id`),
  KEY `texts_targetreviewqueue_57ed41d1` (`exam_id`),
  KEY `texts_targetreviewqueue_1cd4adde` (`nextReviewer_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `texts_targetreviewqueue`
--

INSERT INTO `texts_targetreviewqueue` (`id`, `exam_id`, `targetText_id`, `nextReviewer_id`) VALUES
(1, 1, 2, 3),
(2, 2, 3, 19),
(3, 3, 6, 7),
(4, 4, 7, 30);

-- --------------------------------------------------------

--
-- Table structure for table `texts_targettext`
--

CREATE TABLE IF NOT EXISTS `texts_targettext` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` longtext NOT NULL,
  `language_id` int(11) NOT NULL,
  `g1ErrorScore` smallint(5) unsigned DEFAULT NULL,
  `g2ErrorScore` smallint(5) unsigned DEFAULT NULL,
  `g3ErrorScore` smallint(5) unsigned DEFAULT NULL,
  `g4ErrorScore` smallint(5) unsigned DEFAULT NULL,
  `errorStop` tinyint(1) NOT NULL,
  `notGraded` tinyint(1) NOT NULL,
  `incomplete` tinyint(1) NOT NULL,
  `qualityPoints` smallint(5) unsigned DEFAULT NULL,
  `passageReviewed` tinyint(1) NOT NULL,
  `pdfURI` varchar(255) NOT NULL,
  `importer1_id` int(11) NOT NULL,
  `importer2_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `texts_targettext_784efa61` (`language_id`),
  KEY `texts_targettext_ee481db5` (`importer1_id`),
  KEY `texts_targettext_9845a96d` (`importer2_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `texts_targettext`
--

INSERT INTO `texts_targettext` (`id`, `text`, `language_id`, `g1ErrorScore`, `g2ErrorScore`, `g3ErrorScore`, `g4ErrorScore`, `errorStop`, `notGraded`, `incomplete`, `qualityPoints`, `passageReviewed`, `pdfURI`, `importer1_id`, `importer2_id`) VALUES
(1, 'Призрак бродит в мире правительствам - призрак глобализации. Некоторые утверждают, что хищные рыночные силы делают невозможным для доброжелательные правительства , чтобы оградить своих граждан от хищных зверей , которые скрываются за пределами их границ . Другие возражают, что доброкачественные рыночные силы фактически предотвратить хищных правительства от обирают своих граждан . Хотя обе стороны увидеть различные злодеев , они рисуют одну общую вывод: всемогущие рынки означают бессильные политиков . В самом деле, эта формула стала одним из клише нашего времени. Но это правда, что правительства стали слабее и менее актуальна, чем когда-либо прежде ? И разве глобализация , по определению, должны быть возмездием национального правительства ?\r\nГлобализация представляет собой путешествие . Но это путешествие к недостижимым местом назначения - « глобализированном мире . " " Глобализированной " экономика может быть определена как тот, в котором ни расстояние , ни национальных границ препятствовать экономические сделки . Это был бы мир , где расходы на транспорт и коммуникации были равны нулю и препятствия, создаваемые разными национальными юрисдикциями исчез. Само собой разумеется, мы не живем ни в чем , даже близко к таком мире . А так как многие из вещей, которые мы перевозках (включая нас самих ) являются физические, мы никогда не будет.\r\nЭто глобализации путешествие не нова. За последние пять веков , технологические изменения постепенно уменьшило барьеры на пути международной интеграции. Трансатлантический связи , например, превратилась из паруса власти в пар , в телеграф, телефон , коммерческих воздушных судов , а теперь к Интернету. Тем не менее, государства стали ни слабее , ни менее важным в этот одиссеи. Напротив, в странах с самой передовой и на международном уровне интегрированных экономик , способность правительств облагать налогом и распространять доходы , регулировать экономику , и контролировать деятельность своих граждан увеличился до неузнаваемости . Это было особенно верно в течение прошлого века .\r\nВопрос, который остается , однако, является ли сегодняшняя форма глобализации , вероятно, окажет различное влияние от , что в прошлое. В самом деле, это вполне может , для многочисленных факторов отличить современном глобализирующемся путешествие из предыдущих катастроф и может привести к другим результатам . Эти различия включают более быстрые коммуникации, либерализации рынка и глобальной интеграции производства товаров и услуг. Тем не менее, в отличие от одного общего предположения , современная форма глобализации не будет означать конец современного национального государства.', 14, NULL, NULL, NULL, NULL, 0, 1, 0, NULL, 0, '11111.pdf', 2, NULL),
(2, 'Сегодня мы сталкиваемся с событиями, которые бросают тень на\r\nчеловечество и видение Объединенных наций мира . гуманитарная\r\nКризис в Судане продолжается. Как усилия по оказанию помощи продолжить, наши мысли с\r\nбеженцы из Dafur . Мы настоятельно призываем правительство Судана сделать все\r\nчто в его силах , чтобы принести эту трагедию к концу.\r\nМы думаем о тех, чьи жизни были опустошены разрушительная\r\nярость ураганов в Карибском бассейне и на Атлантического побережья США . мы\r\nраспространяется на них наши глубочайшие соболезнования в связи с гибелью людей , имущества и\r\nимущество . Виновные в резне невинных в России\r\nдал новое измерение в нечестии .\r\nОни победили свое собственное дело через безжалостный и неизбирательное\r\nпролития крови детей . Ничто не может оправдать то, что они сделали.\r\nООН должны объединиться против такого позора .\r\nВыразим наше сочувствие и солидарность с простыми людьми Ирака\r\nпоймал в ужасном цикла этой страны насилия. Пусть этот форум даст\r\nим наш полный и безоговорочная поддержка в борьбе за подлинный\r\nдемократическое правительство , и восстановление власти своего национального суверенитета .\r\nМожет их надежды на мирное будущее и долгосрочной стабильности реализовать себя .\r\nМы считаем, для семей погибших террористов за пределами\r\nПосольство Австралии в Джакарте. Мы хотим , чтобы они знали , что их боль\r\nподелился в этой семье народов.\r\nПросьба от Фиджи для стран-членов ООН в целях укрепления их соединения\r\nрешить противопоставить политического террора во всем мире. Это критический момент в\r\nистория; ООН призван мобилизовать все свои опыт, свои навыки и его\r\nполномочия по созданию согласия между народами . Это было его основополагающим принципом .\r\nЭто принцип , который должен продолжать управлять и поддерживать Юнайтед\r\nНаций .\r\nФиджи , как всегда, стремится к поддержанию мира и безопасности , и\r\nк миру, свободному от оружия массового уничтожения и терроризма.\r\nМы хотим положить конец загрязнению озоноразрушающих и ликвидации друга\r\nопасности для окружающей среды.', 14, NULL, NULL, NULL, NULL, 0, 1, 0, NULL, 0, '11111.pdf', 2, NULL),
(3, 'There are many variations of passages of Lorem Ipsum available, but the majority suffered alteration in some way, either because you added humor, or randomized words which do not look even slightly believable. If you use a passage of Lorem Ipsum, you need to be sure that there is nothing embarrassing hidden in the middle of the text. All the Lorem Ipsum generators found in Internet tend to repeat predefined chunks as necessary, making this the only true generator (valid) on the Internet. Use a dictionary of over 200 Latin words from, combined with useful sentences structures, to generate Lorem Ipsum text that appears reasonable. The generated Lorem Ipsum is always free from repetition, mood or words not added language features, etc..', 4, NULL, NULL, NULL, NULL, 0, 1, 0, NULL, 1, '22222.pdf', 2, NULL),
(4, 'Long ago, in the great ocean that washes the shores of Peru no fish . There corals, sponges , jellyfish , snails and other animals, but no fish you swam in the blue waters of the ocean. They lived only rivers, lakes and streams of Peru , but they were so few that not fished.\r\nOne day these fish migrated to the ocean, and there multiplied. Here''s how it happened :\r\nI was living in Peru a young prince , beautiful and graceful . It was very powerful and he knew magic arts . Reached a gesture to his hills and mountains aplanasen and transform themselves into green and fertile plains meadows , dipping a reed in a river, and at the same instant the waters increased, overflowing and irrigating the fields ; pronounced magical formulas, and when were dried muddy swamps and lagoons , the basins were transformed into fruitful banana plantations.\r\nThis prince was called Coniyara , and being a right that he liked to do good , often disguised as a beggar to mingle with the poor people and learn about their needs and desires man. Often accompanied the llama herders who roamed the rugged trails of the Andes. Entered the miserable huts and saw how hard- milled corn achieved with dedication on the rocky slopes .\r\nNobody recognized the prince, disguised as a beggar .\r\nDwelt in the land that time a princess named Cavillaca , who obstinately refused all suitors presented to him . One day the beautiful princess entered the woods , sat in the shade of a tree and began to weave a multicolored mat . At that moment he landed on one of the branches of the tree a little bird blue plumage. Coniyara was Prince , who had taken that aspect easier to explore their domains and neighboring lands. Seeing the princess fell in love with her, but he remembered that it was able to reject it , as she had many suitors. Then resorted to cunning . He began to warble so sweetly with his throat singing bird , the girl pushed aside the fabric to listen , fascinated by the music of that bird.', 4, NULL, NULL, NULL, NULL, 0, 1, 0, NULL, 1, '22222.pdf', 2, NULL),
(5, 'The Ukrainian Ministry of Health said the clashes also resulted in the wounding of nearly 17 others. \r\nThe police intervened to separate the two sides in the city with the majority of Russian speakers. \r\nSaid Arseniy Yatsanuk Prime Minister of Ukraine said his country temporary victim of Russian aggression, however, stressed that he still believes that there is space to resolve the crisis through negotiations. \r\nHe warned Yatsanuk in front of the Security Council of the United Nations of the Treaty on the Non Proliferation of Nuclear Weapons in danger as long as is not a solution to the crisis in Russian-Ukrainian.', 4, NULL, NULL, NULL, NULL, 0, 1, 0, NULL, 0, '33333.pdf', 2, NULL),
(6, 'British police said they feared the prospect of killing four people in the crash of a civilian helicopter in southeast England .\r\nThe plane crashed in a remote area Ghlingham in the territory of Norfolk .\r\nAnd emergency services rushed to the scene and cordoned off around the site of the accident .\r\nWas not immediately clear causes of the accident , but witnesses pointed out that the weather was overwhelmed by fog in the area at the time of the crash .\r\nShe said the emergency ambulance services in the East of England it was called at 7:45 Thursday evening, the time of the accident.\r\nShe said in a statement it had sent three ambulances and two doctors and a car to move quickly .\r\nIt is noteworthy that Ghlingham a small village in South Norfolk and is inhabited by 650 people .', 4, NULL, NULL, NULL, NULL, 0, 1, 0, NULL, 0, '33333.pdf', 2, NULL),
(7, 'International Exchange Foundation (Japan Foundation), in various parts of Japan since 1985, for the organization that is taking advantage of the features of the area, is doing the international cultural exchange activities such excellent a model for other, from 1985 "I''ve been awarding the Japan Foundation global Citizenship Award ". \r\nThe award was started under the name "Japan Foundation Regional Exchange Promotion Award" in the founding, but from the fact that international exchange activities in the region is in the more active in recent years, in 2004 the "International Foundation region the name of the award to the AC Award ", I was changed to" International Foundation global Citizenship Award "from 2005. ) \r\nIn fiscal 2013, out of the 127 organizations that had recommendation, application, we will award a prize to the three organizations below. ¥ 2,000,000 prize and Seisho (diploma) will be awarded to winners.', 4, NULL, NULL, NULL, NULL, 0, 1, 0, NULL, 1, '44444.pdf', 2, NULL),
(8, 'When Foreigners Japanese is not good at is applied to the hospital, in partnership with medical institutions in Kanagawa Prefecture, you are doing the dispatch of medical interpreters. Contributing to the community taking advantage of the native language and Japanese people also medical interpreters foreign born. In addition, it also contributed to infrastructure development to promote the training of medical interpreters and dispatched a lecturer in medical interpreter training International Association and local governments across the country, hosted by many foreigners, such as available medical interpreters have.', 4, NULL, NULL, NULL, NULL, 0, 1, 0, NULL, 1, '44444.pdf', 2, NULL),
(9, '', 15, NULL, NULL, NULL, NULL, 0, 1, 0, NULL, 1, '55555.pdf', 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `userprofile_languagepair`
--

CREATE TABLE IF NOT EXISTS `userprofile_languagepair` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userprofile_languagepair_6340c63c` (`user_id`),
  KEY `userprofile_languagepair_784efa61` (`language_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=39 ;

--
-- Dumping data for table `userprofile_languagepair`
--

INSERT INTO `userprofile_languagepair` (`id`, `user_id`, `language_id`) VALUES
(1, 7, 1),
(2, 7, 4),
(3, 3, 14),
(4, 3, 4),
(5, 14, 14),
(6, 14, 4),
(7, 29, 2),
(8, 29, 4),
(9, 30, 2),
(10, 30, 4),
(11, 31, 15),
(12, 31, 4),
(13, 19, 15),
(14, 19, 4),
(15, 19, 13),
(16, 4, 4),
(17, 5, 4),
(18, 6, 4),
(19, 10, 4),
(20, 11, 4),
(21, 12, 4),
(22, 13, 4),
(23, 13, 6),
(24, 9, 2),
(25, 9, 4),
(26, 22, 4),
(27, 22, 10),
(28, 22, 15),
(29, 23, 4),
(30, 24, 4),
(31, 25, 4),
(32, 27, 4),
(33, 27, 7),
(34, 13, 6),
(35, 28, 4),
(36, 28, 6),
(37, 20, 4),
(38, 23, 1);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `group_id_refs_id_f4b32aac` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `permission_id_refs_id_6ba0f519` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `content_type_id_refs_id_d043b34a` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `user_id_refs_id_40c41112` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `group_id_refs_id_274b862c` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `user_id_refs_id_4dc23c39` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `permission_id_refs_id_35d9ac25` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `content_type_id_refs_id_93d2d1f8` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `user_id_refs_id_c0d12874` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `texts_discrepancy`
--
ALTER TABLE `texts_discrepancy`
  ADD CONSTRAINT `text_id_refs_id_6fd089da` FOREIGN KEY (`text_id`) REFERENCES `texts_targettext` (`id`),
  ADD CONSTRAINT `user_id_refs_id_dfc29790` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `texts_error`
--
ALTER TABLE `texts_error`
  ADD CONSTRAINT `errorCode_id_refs_id_bb6d3ff2` FOREIGN KEY (`errorCode_id`) REFERENCES `texts_errorcode` (`id`),
  ADD CONSTRAINT `exam_id_refs_id_e7ad6884` FOREIGN KEY (`exam_id`) REFERENCES `texts_exam` (`id`);

--
-- Constraints for table `texts_errorjson`
--
ALTER TABLE `texts_errorjson`
  ADD CONSTRAINT `exam_id_refs_id_7f9650e9` FOREIGN KEY (`exam_id`) REFERENCES `texts_exam` (`id`);

--
-- Constraints for table `texts_exam`
--
ALTER TABLE `texts_exam`
  ADD CONSTRAINT `targetText2_id_refs_id_fc56f4fe` FOREIGN KEY (`targetText2_id`) REFERENCES `texts_targettext` (`id`),
  ADD CONSTRAINT `language_id_refs_id_09ca21fa` FOREIGN KEY (`language_id`) REFERENCES `texts_language` (`id`),
  ADD CONSTRAINT `sourceText1_id_refs_id_438d23d9` FOREIGN KEY (`sourceText1_id`) REFERENCES `texts_sourcetext` (`id`),
  ADD CONSTRAINT `sourceText2_id_refs_id_438d23d9` FOREIGN KEY (`sourceText2_id`) REFERENCES `texts_sourcetext` (`id`),
  ADD CONSTRAINT `targetText1_id_refs_id_fc56f4fe` FOREIGN KEY (`targetText1_id`) REFERENCES `texts_targettext` (`id`);

--
-- Constraints for table `texts_graderqueue`
--
ALTER TABLE `texts_graderqueue`
  ADD CONSTRAINT `exam_id_refs_id_55e6431a` FOREIGN KEY (`exam_id`) REFERENCES `texts_exam` (`id`);

--
-- Constraints for table `texts_highlightedhtml`
--
ALTER TABLE `texts_highlightedhtml`
  ADD CONSTRAINT `exam_id_refs_id_5b7d7a12` FOREIGN KEY (`exam_id`) REFERENCES `texts_exam` (`id`);

--
-- Constraints for table `texts_sourcediscrepancyqueue`
--
ALTER TABLE `texts_sourcediscrepancyqueue`
  ADD CONSTRAINT `originalSource_id_refs_id_692ad46a` FOREIGN KEY (`originalSource_id`) REFERENCES `texts_sourcetext` (`id`),
  ADD CONSTRAINT `importer1_id_refs_id_9cc5e3c4` FOREIGN KEY (`importer1_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `importer2_id_refs_id_9cc5e3c4` FOREIGN KEY (`importer2_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `needsToReview_id_refs_id_9cc5e3c4` FOREIGN KEY (`needsToReview_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `sourceLanguage_id_refs_id_79bea7b3` FOREIGN KEY (`sourceLanguage_id`) REFERENCES `texts_language` (`id`),
  ADD CONSTRAINT `targetLanguage_id_refs_id_79bea7b3` FOREIGN KEY (`targetLanguage_id`) REFERENCES `texts_language` (`id`);

--
-- Constraints for table `texts_sourcereviewqueue`
--
ALTER TABLE `texts_sourcereviewqueue`
  ADD CONSTRAINT `source_id_refs_id_8566f234` FOREIGN KEY (`source_id`) REFERENCES `texts_sourcetext` (`id`);

--
-- Constraints for table `texts_sourcetext`
--
ALTER TABLE `texts_sourcetext`
  ADD CONSTRAINT `targetLanguage_id_refs_id_65131e74` FOREIGN KEY (`targetLanguage_id`) REFERENCES `texts_language` (`id`),
  ADD CONSTRAINT `importer1_id_refs_id_d5075373` FOREIGN KEY (`importer1_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `importer2_id_refs_id_d5075373` FOREIGN KEY (`importer2_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `sourceLanguage_id_refs_id_65131e74` FOREIGN KEY (`sourceLanguage_id`) REFERENCES `texts_language` (`id`);

--
-- Constraints for table `texts_targetinputqueue`
--
ALTER TABLE `texts_targetinputqueue`
  ADD CONSTRAINT `exam_id_refs_id_35780cd1` FOREIGN KEY (`exam_id`) REFERENCES `texts_exam` (`id`);

--
-- Constraints for table `texts_targetreviewqueue`
--
ALTER TABLE `texts_targetreviewqueue`
  ADD CONSTRAINT `targetText_id_refs_id_ed290101` FOREIGN KEY (`targetText_id`) REFERENCES `texts_targettext` (`id`),
  ADD CONSTRAINT `exam_id_refs_id_93344dfe` FOREIGN KEY (`exam_id`) REFERENCES `texts_exam` (`id`),
  ADD CONSTRAINT `nextReviewer_id_refs_id_c1ae0386` FOREIGN KEY (`nextReviewer_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `texts_targettext`
--
ALTER TABLE `texts_targettext`
  ADD CONSTRAINT `language_id_refs_id_88005ad4` FOREIGN KEY (`language_id`) REFERENCES `texts_language` (`id`),
  ADD CONSTRAINT `importer1_id_refs_id_b9f302a4` FOREIGN KEY (`importer1_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `importer2_id_refs_id_b9f302a4` FOREIGN KEY (`importer2_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `userprofile_languagepair`
--
ALTER TABLE `userprofile_languagepair`
  ADD CONSTRAINT `language_id_refs_id_e4b69511` FOREIGN KEY (`language_id`) REFERENCES `texts_language` (`id`),
  ADD CONSTRAINT `user_id_refs_id_fa73c731` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;