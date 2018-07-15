-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 10, 2017 at 05:48 AM
-- Server version: 5.7.19
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `node_js_chat`
--

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
CREATE TABLE IF NOT EXISTS `messages` (
  `mess_id` int(11) NOT NULL AUTO_INCREMENT,
  `mess_from` int(11) DEFAULT NULL,
  `mess_to` int(11) DEFAULT NULL,
  `mess_txt` varchar(20000) DEFAULT NULL,
  `mess_time` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`mess_id`),
  KEY `mess_from` (`mess_from`),
  KEY `mess_to` (`mess_to`)
) ENGINE=MyISAM AUTO_INCREMENT=245 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`mess_id`, `mess_from`, `mess_to`, `mess_txt`, `mess_time`) VALUES
(77, 2, 1, 'Nur sanga ye dala dwosa', '2017-10-27 05:51:58'),
(75, 2, 1, 'da sa masala', '2017-10-27 05:26:53'),
(76, 1, 2, 'Sahe da kana, ma sa weli di sa ! ! ! ', '2017-10-27 05:35:37'),
(74, 1, 4, 'good mateee ! ', '2017-10-27 05:04:25'),
(73, 4, 1, 'kha hagha khu ma na bekhi her wo ! ', '2017-10-27 05:04:16'),
(72, 1, 4, 'hagha marha Faisal abrar sir che rakarhy wo ! ', '2017-10-27 05:04:02'),
(71, 4, 1, 'da sa she assignment yaar ! ', '2017-10-27 05:03:45'),
(70, 1, 4, 'Alaka ta hagha assignment karhy dy , geology wala', '2017-10-27 05:02:37'),
(68, 1, 2, 'Khair dy ji', '2017-10-27 05:01:44'),
(69, 1, 2, 'Alaka tata sa masla da hu', '2017-10-27 05:02:06'),
(67, 3, 2, 'kwana werkwa, i am empassidor ! ', '2017-10-27 05:01:26'),
(66, 2, 1, 'Hahah, nur senga ye !  ', '2017-10-27 04:58:28'),
(65, 1, 2, 'virgin rawala cherta che chumba ye kam', '2017-10-27 04:58:13'),
(64, 1, 2, 'Chaqarh shy na waham ji', '2017-10-27 04:58:02'),
(63, 2, 1, 'ALaka na drbani waham ka tayar ye', '2017-10-27 04:56:47'),
(62, 1, 2, 'Hase ghend nesy marh, kwana wrkawa za zamtalaqa', '2017-10-27 04:55:12'),
(61, 1, 2, 'da sa chat app ao chat app marh', '2017-10-27 04:52:13'),
(60, 1, 4, 'Great to hear that mate', '2017-10-27 04:46:36'),
(59, 1, 2, 'Alaka ta hagha chat application complete ko kana ', '2017-10-27 03:55:30'),
(58, 2, 1, 'So what the good should i do ! ', '2017-10-26 19:15:14'),
(57, 2, 3, 'good off man, get the good outta here ', '2017-10-26 19:14:55'),
(56, 1, 2, 'I am all good thanks buddy, soooo', '2017-10-26 19:08:14'),
(55, 1, 4, 'I am good too thanks', '2017-10-26 19:05:58'),
(54, 4, 3, 'Kwana wrkawa za dala dwaosa ', '2017-10-26 19:05:27'),
(53, 4, 1, 'Everything is good Alhamdulillah, you say ! ', '2017-10-26 19:05:17'),
(52, 3, 4, 'Kuni jawad wrkawa kana', '2017-10-26 19:04:03'),
(51, 3, 2, 'Yes chaataaa whasupppp ! ', '2017-10-26 19:03:49'),
(50, 1, 4, 'I am good thanks noman , whats going on hmmmm', '2017-10-26 19:03:23'),
(49, 2, 1, 'Nothing special you say, whassup ', '2017-10-26 19:02:02'),
(48, 1, 2, 'Hey Irfan , What is going on buddy ! ', '2017-10-26 19:01:29'),
(47, 4, 1, 'Heyy buddy how are you', '2017-10-08 00:15:17'),
(46, 3, 4, 'Noman khan Jana sanga ye ', '2017-10-05 08:17:53'),
(45, 2, 3, 'Hey Adnan', '2017-10-04 00:41:00'),
(44, 1, 2, 'Hi Nadeem', '2017-10-02 01:17:22'),
(78, 1, 2, 'What is going on i am checkig time', 'On Fri Oct 27 2017 at 4:00 PM'),
(79, 1, 4, 'Alaka sanga chal dy saba razai kana hmmm', 'On Fri Oct 27 2017 at 4:14 PM'),
(80, 2, 3, 'Modagoodaaaa I am a dude , moda fucckaaa ', 'On Fri Oct 27 2017 at 4:15 PM'),
(81, 1, 2, 'Alaka waya kana', 'On Fri Oct 27 2017 at 11:46 AM'),
(82, 2, 1, 'What the good is this yaaar ! ', 'On Fri Oct 27 2017 at 11:48 AM'),
(83, 1, 2, 'I dont know yaar, I am kinda confused, its working weried ! ', 'On Fri Oct 27 2017 at 11:49 AM'),
(84, 2, 1, 'Oh, man everything was fine, this is just I was opening it twice ! lol', 'On Fri Oct 27 2017 at 11:49 AM'),
(85, 4, 1, 'Ao yaar zrha me kegi drbasham Insha ALlah', 'On Fri Oct 27 2017 at 11:51 AM'),
(86, 1, 4, 'Sahe da rasha yaar, dui khu ase gase jorhai marha', 'On Fri Oct 27 2017 at 11:52 AM'),
(87, 4, 1, 'Sok gase jorhai hahaha', 'On Fri Oct 27 2017 at 11:52 AM'),
(88, 1, 4, 'da chaaataaa dali na di, da du khbara kum kana hahaha', 'On Fri Oct 27 2017 at 11:52 AM'),
(89, 4, 1, 'hahah maghya marhaaa ', 'On Fri Oct 27 2017 at 11:53 AM'),
(90, 1, 4, 'ao marha pregdawa', 'On Fri Oct 27 2017 at 11:53 AM'),
(91, 1, 4, 'good it , kha nur waya kana', 'On Fri Oct 27 2017 at 11:53 AM'),
(92, 1, 4, 'snga chal rwan dy line di set dy kana', 'On Fri Oct 27 2017 at 11:53 AM'),
(93, 4, 1, 'da sa line rora, hahaah ta khu mana da janako dukan jorh karhy dy ', 'On Fri Oct 27 2017 at 11:54 AM'),
(94, 1, 4, 'haha, ao nu da janako dukan khu ye , haghe k khu sa shak neshta ! ', 'On Fri Oct 27 2017 at 11:54 AM'),
(95, 4, 1, 'hahah wali ma khu chata sa weli na di ror ', 'On Fri Oct 27 2017 at 11:54 AM'),
(96, 4, 1, 'da pa ma bandi sa sabut ka kana', 'On Fri Oct 27 2017 at 11:54 AM'),
(97, 4, 1, 'bia ba e za umanam', 'On Fri Oct 27 2017 at 11:54 AM'),
(98, 4, 1, 'che ao yar waqi da khabara theek da', 'On Fri Oct 27 2017 at 11:55 AM'),
(99, 4, 1, 'hehehehehe ', 'On Fri Oct 27 2017 at 11:55 AM'),
(100, 3, 4, 'Hey dude its working fine now ,see...', 'On Fri Oct 27 2017 at 12:26 PM'),
(101, 4, 3, 'yeah i know Mate, because the length of either  my messages or your messages are less than 13', 'On Fri Oct 27 2017 at 12:27 PM'),
(102, 3, 2, 'Hey Mate how are you doing ! ', 'On Fri Oct 27 2017 at 12:28 PM'),
(103, 4, 1, 'Ao drzam wali sa o sa ', 'On Fri Oct 27 2017 at 2:38 PM'),
(104, 1, 4, 'Na na marha bus hase tapos me kao ji ', 'On Fri Oct 27 2017 at 2:45 PM'),
(105, 4, 1, '  		  var GET_CLICKED_USER_MESS = \"SELECT mess_txt,mess_time,mess_to FROM (select mess_to as user_id,mess_txt,mess_time,mess_id,mess_to from messages where mess_from = +data.active+ AND mess_to=+data.clicked+ UNION select mess_to as user_id,mess_txt,mess_time,mess_id,mess_to from messages where mess_from = +data.clicked+ AND mess_to=+data.active+) sq join users on users.id = sq.user_id ORDER BY mess_id ASC\";   ---- Da Query wali kar na kai yaar :(\n', 'On Fri Oct 27 2017 at 2:46 PM'),
(106, 3, 4, 'Ohk Go f yourself', 'On Fri Oct 27 2017 at 02:50 PM'),
(107, 1, 2, 'Whatsupp mate', 'On Fri Oct 27 2017 at 03:04 PM'),
(108, 2, 1, 'Nothing special you say', 'On Fri Oct 27 2017 at 03:06 PM'),
(109, 1, 2, 'Ummhmmm leave it then', 'On Fri Oct 27 2017 at 03:06 PM'),
(110, 2, 1, 'Yeah thats true brother', 'On Fri Oct 27 2017 at 03:13 PM'),
(111, 1, 2, 'Yeah man, its just a shit you know', 'On Fri Oct 27 2017 at 03:15 PM'),
(112, 2, 1, 'yeah yeah yeah why not', 'On Fri Oct 27 2017 at 03:23 PM'),
(113, 1, 2, 'So, whats the problem now ', 'On Fri Oct 27 2017 at 03:24 PM'),
(114, 2, 1, 'The problem i am facing now is , that i dont know how to update the user chat', 'On Fri Oct 27 2017 at 03:24 PM'),
(115, 1, 2, 'Ummhmmmm yeah its also a big problem', 'On Fri Oct 27 2017 at 03:26 PM'),
(116, 2, 1, 'yeah i know, so can you solve it or not ', 'On Fri Oct 27 2017 at 03:27 PM'),
(117, 1, 2, 'I am just trying my best buddy ! ', 'On Fri Oct 27 2017 at 03:28 PM'),
(118, 2, 1, 'Great\nsolve every problem', 'On Fri Oct 27 2017 at 03:28 PM'),
(119, 1, 2, 'Yes I will try my best Irfan Khan', 'On Fri Oct 27 2017 at 03:34 PM'),
(120, 2, 1, 'Great to hear that Nadeem', 'On Fri Oct 27 2017 at 03:34 PM'),
(121, 1, 2, 'Yeah Man thank you so much', 'On Fri Oct 27 2017 at 03:56 PM'),
(122, 2, 1, 'You are welcome buddy ! ', 'On Fri Oct 27 2017 at 03:56 PM'),
(123, 1, 2, 'so what are you doing nadeem khan', 'On Fri Oct 27 2017 at 03:56 PM'),
(124, 2, 3, 'I am good adnan what about you hmmm', 'On Fri Oct 27 2017 at 03:57 PM'),
(125, 3, 2, 'Thanks I am fine too mate ', 'On Fri Oct 27 2017 at 03:58 PM'),
(126, 1, 2, 'hehehe this is nadeem', 'On Fri Oct 27 2017 at 04:02 PM'),
(127, 2, 1, 'good offf what should i do', 'On Fri Oct 27 2017 at 04:02 PM'),
(128, 2, 1, 'Finally it worked for me mate', 'On Fri Oct 27 2017 at 05:46 PM'),
(129, 1, 2, 'Yeah man , it is working great', 'On Fri Oct 27 2017 at 05:46 PM'),
(130, 2, 1, 'Thats good , finally your hardwork paid off', 'On Fri Oct 27 2017 at 06:54 PM'),
(131, 1, 2, 'Yeah mate, finally it happened ! lol', 'On Fri Oct 27 2017 at 06:55 PM'),
(132, 2, 1, 'heheheeh thats great my brother', 'On Fri Oct 27 2017 at 06:55 PM'),
(133, 1, 2, 'hmmmmmmmmmmmmmm I know that mate', 'On Fri Oct 27 2017 at 07:06 PM'),
(134, 2, 1, 'Thats good that at least you know something ', 'On Fri Oct 27 2017 at 07:33 PM'),
(135, 1, 2, 'Yeah I always do buddy ! ', 'On Fri Oct 27 2017 at 07:34 PM'),
(136, 2, 1, 'good offfff, dont disturb me ass hole i am working', 'On Fri Oct 27 2017 at 07:34 PM'),
(137, 1, 4, 'I dont know yaar, i dont even know what the good are you doing', 'On Fri Oct 27 2017 at 07:35 PM'),
(138, 4, 1, 'nu khula sala chengy zamtalqa haha', 'On Fri Oct 27 2017 at 07:36 PM'),
(139, 1, 2, 'Shut your mouth mate ! ', 'On Fri Oct 27 2017 at 08:13 PM'),
(140, 2, 1, 'I dont even care what you say', 'On Fri Oct 27 2017 at 08:13 PM'),
(141, 3, 2, 'Alaka chaata mata paki message kawa kana', 'On Fri Oct 27 2017 at 08:15 PM'),
(142, 2, 3, 'za marha langda har zy ta rasedaly ye', 'On Fri Oct 27 2017 at 08:15 PM'),
(143, 1, 4, 'Za pa nia dy tor kwania', 'On Fri Oct 27 2017 at 08:15 PM'),
(144, 4, 1, 'hahahah wali alaka', 'On Fri Oct 27 2017 at 08:15 PM'),
(145, 1, 4, 'Alaka noman , nur kha ye kana', 'On Fri Oct 27 2017 at 08:17 PM'),
(146, 4, 1, 'Ao shukar dy alhamdulillah ! ', 'On Fri Oct 27 2017 at 08:17 PM'),
(147, 2, 3, 'Pa nia dy hahahah\n', 'On Fri Oct 27 2017 at 08:18 PM'),
(148, 3, 2, 'sa hahaha, da khandal ywazi tala drzi ssa', 'On Fri Oct 27 2017 at 08:18 PM'),
(149, 1, 3, 'Adnan khana senga ye ', NULL),
(150, 1, 5, 'Khalid Jamila senga ye', NULL),
(151, 1, 3, 'Wali der busy shwy ye kasa', 'On Fri Oct 27 2017 at 08:22 PM'),
(152, 3, 1, 'haha , na marha busy khu na yum wali khair sha', 'On Fri Oct 27 2017 at 08:23 PM'),
(153, 1, 3, 'haha, ma v ka busy shwy ye sarhea , sa k nan saba kam zai ta warasedy', 'On Fri Oct 27 2017 at 08:23 PM'),
(154, 3, 1, 'yara bus la prata u nu ta waya senga chal dy Nadeem', 'On Fri Oct 27 2017 at 08:24 PM'),
(155, 1, 3, 'Shukar dy Allah fazal dy', 'On Fri Oct 27 2017 at 08:24 PM'),
(156, 1, 2, 'Yeah yeah whatever', 'On Fri Oct 27 2017 at 08:38 PM'),
(157, 2, 1, 'What whatever', 'On Fri Oct 27 2017 at 08:46 PM'),
(158, 1, 2, 'Da khu pa dwanrha tarafa awaz kai', 'On Fri Oct 27 2017 at 08:46 PM'),
(159, 2, 1, 'ao kana yaar', 'On Fri Oct 27 2017 at 08:47 PM'),
(160, 1, 2, 'ws dy sara sa k', 'On Fri Oct 27 2017 at 08:47 PM'),
(161, 2, 1, 'naheeeeeeeeeeeeeee', 'On Fri Oct 27 2017 at 08:48 PM'),
(162, 1, 2, 'what the f man ', 'On Fri Oct 27 2017 at 08:48 PM'),
(163, 2, 1, 'hehehe its awesome', 'On Fri Oct 27 2017 at 09:17 PM'),
(164, 1, 2, 'I know it is awesome, but i dont like the sound to be played on sent as well', 'On Fri Oct 27 2017 at 09:19 PM'),
(165, 2, 1, 'yes, let me try it now', 'On Fri Oct 27 2017 at 09:52 PM'),
(166, 1, 2, 'i think its not playing now', 'On Fri Oct 27 2017 at 09:52 PM'),
(167, 2, 1, 'I dont know yaar', 'On Fri Oct 27 2017 at 09:55 PM'),
(168, 1, 2, 'hmmmmm\nWhats wrong with it', 'On Fri Oct 27 2017 at 09:55 PM'),
(169, 2, 1, 'I dont know yaar', 'On Fri Oct 27 2017 at 12:02 PM'),
(170, 1, 2, 'Hmmmmm, good it ', 'On Fri Oct 27 2017 at 12:03 PM'),
(171, 1, 2, 'Sooooo, whasssup', 'On Fri Oct 27 2017 at 12:04 PM'),
(172, 3, 1, 'Za kha da marha ao hagha paper di sa wakrhal', 'On Fri Oct 27 2017 at 12:06 PM'),
(173, 1, 3, 'Da kam papaer alaka', 'On Fri Oct 27 2017 at 12:06 PM'),
(174, 3, 1, 'haghe faisal abrar da haghe ', 'On Fri Oct 27 2017 at 12:07 PM'),
(175, 1, 3, 'he he he he hagha khu mana bekhi hera wa', 'On Fri Oct 27 2017 at 12:07 PM'),
(176, 1, 4, 'za kha da nu awre che kha ye nu', 'On Fri Oct 27 2017 at 12:10 PM'),
(177, 2, 1, 'Kwana wrkawa za pa nia di', 'On Fri Oct 27 2017 at 12:12 PM'),
(178, 1, 2, 'ghwal ma khura ', 'On Fri Oct 27 2017 at 12:12 PM'),
(179, 2, 1, 'Na marha gap na elawa drta wem', 'On Fri Oct 27 2017 at 12:15 PM'),
(180, 3, 1, 'Ws ba sta padi k call kegi gor kha', 'On Fri Oct 27 2017 at 12:17 PM'),
(181, 1, 3, 'AO bilkul yaaar, sahe shu kana, was ba sta padi k hum call kegi', 'On Fri Oct 27 2017 at 12:18 PM'),
(182, 1, 3, 'kana gura zma padi k ba awaz na kai ws', 'On Fri Oct 27 2017 at 12:18 PM'),
(183, 1, 2, 'Ws ba awaz sahe kai kha gora', 'On Fri Oct 27 2017 at 12:23 PM'),
(184, 2, 1, 'Was ye hum wanako yaar da wali', 'On Fri Oct 27 2017 at 12:24 PM'),
(185, 2, 1, 'Sa owm yara nu shy confusing dy', 'On Fri Oct 27 2017 at 12:25 PM'),
(186, 1, 2, 'ao kana yaar da sa lanja shwa', 'On Fri Oct 27 2017 at 12:25 PM'),
(187, 2, 1, 'Nadeem khana ws shy sahe shu kha', 'On Fri Oct 27 2017 at 12:28 PM'),
(188, 1, 2, 'Ao yar zabrdst , ws ye kar wako kana', 'On Fri Oct 27 2017 at 12:28 PM'),
(189, 4, 1, 'Ws ye kar wako kana', 'On Fri Oct 27 2017 at 12:29 PM'),
(190, 1, 4, 'ao kana yaar, ws sahe shu kana', 'On Fri Oct 27 2017 at 12:29 PM'),
(191, 5, 1, 'Khair dy ji khpal waya', 'On Fri Oct 27 2017 at 12:34 PM'),
(192, 1, 5, 'Shukar dy, Alaka da Angry Bird khu rabandi yaw guzar chumba ka zalima ', 'On Fri Oct 27 2017 at 12:34 PM'),
(193, 5, 1, 'There was a very small mistake in my time', 'On Fri Oct 27 2017 at 12:38 PM'),
(194, 1, 5, 'THat was the minor mistake on my end ', 'On Fri Oct 27 2017 at 10:41 PM'),
(195, 5, 1, 'Yeah that is true yaar', 'On Fri Oct 27 2017 at 10:41 PM'),
(196, 1, 5, 'so what are you doing now', 'On Fri Oct 27 2017 at 10:42 PM'),
(197, 5, 1, 'Bus hase nast yum nu umar bahadar sara', 'On Fri Oct 27 2017 at 10:43 PM'),
(198, 1, 5, 'kha kha sahe da za', 'On Fri Oct 27 2017 at 10:43 PM'),
(199, 2, 1, 'Was theek shu kana talaq maal', 'On Fri Oct 27 2017 at 10:57 PM'),
(200, 1, 2, 'hahaha ao kana awaz hum kai', 'On Fri Oct 27 2017 at 10:58 PM'),
(201, 1, 2, 'Ws sahe dy ', 'On Fri Oct 27 2017 at 11:13 PM'),
(202, 1, 2, 'ao sahe dy zma khyal dy kar kai kana', 'On Fri Oct 27 2017 at 11:14 PM'),
(203, 2, 1, 'Na yar sahe kar ws hum na kai khbr ye ', 'On Fri Oct 27 2017 at 11:14 PM'),
(204, 5, 1, 'hmmmmmm za kha da nu yaar', 'On Fri Oct 27 2017 at 11:51 PM'),
(205, 1, 5, 'ao nu ta ba nur sa owe', 'On Fri Oct 27 2017 at 11:51 PM'),
(206, 5, 1, 'Marha bus ka za ghwal makhura sarhea -_-', 'On Fri Oct 27 2017 at 11:54 PM'),
(207, 1, 2, 'Za bus dy yaar, bia ba gap olagwa', 'On Fri Oct 27 2017 at 11:55 PM'),
(208, 1, 2, 'da Allah pa aman', 'On Fri Oct 27 2017 at 11:55 PM'),
(209, 2, 1, 'sahe da Allah Hafiz', 'On Fri Oct 27 2017 at 11:56 PM'),
(210, 1, 2, 'Good Morning mate', 'On Sat Oct 28 2017 at 09:50 AM'),
(211, 2, 1, 'Alaka pakhair', 'On Wed Nov 01 2017 at 04:54 PM'),
(212, 1, 2, 'Pakhair pakhair senga ye ', 'On Wed Nov 01 2017 at 04:54 PM'),
(213, 2, 1, 'Shukar dy khpal haal waya', 'On Wed Nov 01 2017 at 04:54 PM'),
(214, 1, 2, 'Alhamdulillah kha barabar, charta orak ye year hadu pata di na lagi', 'On Wed Nov 01 2017 at 04:55 PM'),
(215, 2, 1, 'yara, za khu dalta yum , khu bus exams k busy shwy yum nu', 'On Wed Nov 01 2017 at 04:55 PM'),
(216, 1, 2, 'exams khu zmung hum di marha, zma khu nan 2 papers o khbr ye yarr ! =D', 'On Wed Nov 01 2017 at 04:58 PM'),
(217, 2, 1, 'kha da sa sa ', 'On Wed Nov 01 2017 at 04:58 PM'),
(218, 1, 2, 'calculus and Data mining', 'On Wed Nov 01 2017 at 04:58 PM'),
(219, 1, 2, 'what is going on nadeem', 'On Sat Nov 04 2017 at 09:17 PM'),
(220, 2, 1, 'Alaka shekha ta na qalaregi kana ', 'On Sat Nov 04 2017 at 09:18 PM'),
(221, 1, 2, 'da sa na, safa khabara kwa', 'On Sat Nov 04 2017 at 09:18 PM'),
(222, 1, 2, 'kuni , dala, begherata', 'On Sat Nov 04 2017 at 09:19 PM'),
(223, 2, 1, 'alaka khula sama khwazawa gwary', 'On Sat Nov 04 2017 at 09:19 PM'),
(224, 1, 2, 'za marha\nta ba sa e ', 'On Sat Nov 04 2017 at 09:25 PM'),
(225, 2, 1, 'good, whats wrong with you', 'On Sat Nov 04 2017 at 09:26 PM'),
(226, 1, 2, 'nothing mate, just go f urself', 'On Sat Nov 04 2017 at 09:26 PM'),
(227, 2, 1, 'good off mate', 'On Sat Nov 04 2017 at 09:35 PM'),
(228, 1, 2, 'what the f, why are you swearing the whole time ', 'On Sat Nov 04 2017 at 09:35 PM'),
(229, 1, 4, 'Oda ye gwary ku', 'On Sat Nov 04 2017 at 11:01 PM'),
(230, 4, 1, 'na wali oda khu na yum wali', 'On Sat Nov 04 2017 at 11:01 PM'),
(231, 1, 4, 'kha ma we ka oda shwe ye sarhea', 'On Sat Nov 04 2017 at 11:01 PM'),
(232, 2, 1, 'alaka sanga cha dy', 'On Sat Nov 04 2017 at 11:02 PM'),
(233, 4, 1, 'na marha da khu la wakhti dy', 'On Sat Nov 04 2017 at 11:02 PM'),
(234, 1, 4, 'ao da khu da', 'On Sat Nov 04 2017 at 11:02 PM'),
(235, 1, 2, 'za marha ghenda', 'On Sat Nov 04 2017 at 11:02 PM'),
(236, 2, 1, 'Salamuna senga ye alaka', 'On Sun Nov 05 2017 at 10:11 AM'),
(237, 1, 2, 'khair dy shukar dy khpal haal waya', 'On Sun Nov 05 2017 at 10:11 AM'),
(238, 2, 1, 'Hey bro! how are you doing ', 'On Tue Nov 07 2017 at 12:39 PM'),
(239, 1, 2, 'Hey thanks mate, i am goog what about you ', 'On Tue Nov 07 2017 at 12:39 PM'),
(240, 2, 1, 'i am good too thanks mate', 'On Tue Nov 07 2017 at 12:39 PM'),
(241, 1, 2, 'Hey there, how are you ! ', 'On Tue Nov 07 2017 at 03:36 PM'),
(242, 2, 1, 'Hey Nadeem , I am good how are you doing', 'On Tue Nov 07 2017 at 03:37 PM'),
(243, 1, 2, 'I am good too thanks, its working great', 'On Tue Nov 07 2017 at 03:37 PM'),
(244, 1, 5, 'Khula ma chenga chenga kwa ', 'On Tue Nov 07 2017 at 10:10 PM');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(2000) NOT NULL,
  `useremail` varchar(2000) NOT NULL,
  `userpass` varchar(2000) NOT NULL,
  `user_session` int(200) NOT NULL,
  `user_picture` varchar(2000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `useremail`, `userpass`, `user_session`, `user_picture`) VALUES
(1, 'Nadeem Ahmad', 'ahmad.nadim2012@yahoo.com', 'nadykhan', 1, 'default'),
(2, 'Irfan Khan', 'irfan@khan.com', 'irfan22', 0, 'default'),
(3, 'Adnan Khan', 'adnan@khan.com', 'adnan22', 0, 'default'),
(4, 'Noman Sarwar', 'noman@sarwar.com', 'nomi33', 0, 'default'),
(5, 'Khalid Jamil', 'khalid@jamil.com', 'jamil44', 0, 'default'),
(6, 'Faisal Abrar', 'abrar@faisal.com', 'faisal22', 1, 'default'),
(7, 'Gul Zada', 'gul@zada.com', 'gul22', 1, 'default'),
(8, 'Shahab Khan', 'shahab@khan.com', 'shahab22', 0, 'default'),
(10, 'waachpai', 'khan@kha.com', 'nady', 1, 'default');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
