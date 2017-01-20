-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Янв 20 2017 г., 11:05
-- Версия сервера: 5.5.25
-- Версия PHP: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `agents_db`
--

-- --------------------------------------------------------

--
-- Структура таблицы `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=22 ;

--
-- Дамп данных таблицы `auth_permission`
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
(19, 'Can add Users', 7, 'add_person'),
(20, 'Can change Users', 7, 'change_person'),
(21, 'Can delete Users', 7, 'delete_person');

-- --------------------------------------------------------

--
-- Структура таблицы `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8_bin NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) COLLATE utf8_bin NOT NULL,
  `first_name` varchar(30) COLLATE utf8_bin NOT NULL,
  `last_name` varchar(30) COLLATE utf8_bin NOT NULL,
  `email` varchar(254) COLLATE utf8_bin NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=53 ;

--
-- Дамп данных таблицы `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(44, 'pbkdf2_sha256$24000$YkM842a0nWF0$eaaqdgmMzOqWSYccJuYnt6sKuHiJt8zU5zPWkbDgUeU=', NULL, 1, 'Administrator', '', '', 'nipo777@i.ua', 1, 1, '2017-01-20 08:46:29'),
(45, 'pbkdf2_sha256$24000$v6tRbrAJqbss$RbdiJXV9S3nRdPaB4gesZ5P/xQR3nSuChpKcg9p8hj8=', '2017-01-20 08:47:44', 0, 'phillcoulson', 'Phillip', 'Coulson', 'pk@gmail.com', 0, 1, '2017-01-20 08:47:44'),
(46, 'pbkdf2_sha256$24000$cyWlNyBq5UIT$1Z4JYw7BJc/SEixQpC5Zza1s0jEIemw31YAHh+zqjsc=', '2017-01-20 08:49:07', 0, 'melindamay', 'Melinda', 'May', 'mm@google.com', 0, 1, '2017-01-20 08:49:07'),
(47, 'pbkdf2_sha256$24000$tcIUS3TQj1Lu$uG3nBlQjrUSBydD3JFCPSYM6VkyqDXvg1b4ycyG7y+w=', '2017-01-20 08:50:19', 0, 'javaharlalneru', 'Javaharlal', 'Neru', 'jn@i.ua', 0, 1, '2017-01-20 08:50:19'),
(48, 'pbkdf2_sha256$24000$xO0UhAX3ul22$5iwLL4ex4K5wK78c/774bsYaBWn1GM07TC0NEV4engs=', '2017-01-20 08:52:17', 0, 'leopoldfitz', 'Leopold', 'Fitz', 'lf@i.us', 0, 1, '2017-01-20 08:52:16'),
(49, 'pbkdf2_sha256$24000$6v6WeTOT3VSW$4tO0g2ZSChUo9jQGuYbI0yippRaO/+h/rXhXZUdXKiA=', '2017-01-20 08:53:35', 0, 'jemmasimmons', 'Jemma', 'Simmons', 'js@shield.com', 0, 1, '2017-01-20 08:53:35'),
(50, 'pbkdf2_sha256$24000$bth3VihoN9Qd$py4KLcJRwuS2zOuFoVK7/RuJJdtag2QfMydxauYZops=', '2017-01-20 08:54:50', 0, 'daisyjohnson', 'Daisy', 'Johnson', 'skye@shield.com', 0, 1, '2017-01-20 08:54:49'),
(51, 'pbkdf2_sha256$24000$1YF1zLhewhBY$ZML3UNJgCDE/vv7X0CypXTwCPfNrJR8SQ+eTKk6ateU=', '2017-01-20 08:56:35', 0, 'jamesbond', 'James', 'Bond', 'j-b@gmail.com', 0, 1, '2017-01-20 08:56:35'),
(52, 'pbkdf2_sha256$24000$QFDaGH9ZU3kV$LKQxr15deuhFsH71hT3HrDtLC2K3nd0mXWl7ssf2ijA=', '2017-01-20 08:57:45', 0, 'superagent', 'A', 'Smith', 'superagent@gmail.com', 0, 1, '2017-01-20 08:57:45');

-- --------------------------------------------------------

--
-- Структура таблицы `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext COLLATE utf8_bin,
  `object_repr` varchar(200) COLLATE utf8_bin NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext COLLATE utf8_bin NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8_bin NOT NULL,
  `model` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=8 ;

--
-- Дамп данных таблицы `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'personal', 'person'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Структура таблицы `django_migrations`
--

CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8_bin NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=18 ;

--
-- Дамп данных таблицы `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2017-01-20 08:16:54'),
(2, 'auth', '0001_initial', '2017-01-20 08:16:58'),
(3, 'admin', '0001_initial', '2017-01-20 08:16:59'),
(4, 'admin', '0002_logentry_remove_auto_add', '2017-01-20 08:16:59'),
(5, 'contenttypes', '0002_remove_content_type_name', '2017-01-20 08:17:00'),
(6, 'auth', '0002_alter_permission_name_max_length', '2017-01-20 08:17:00'),
(7, 'auth', '0003_alter_user_email_max_length', '2017-01-20 08:17:00'),
(8, 'auth', '0004_alter_user_username_opts', '2017-01-20 08:17:01'),
(9, 'auth', '0005_alter_user_last_login_null', '2017-01-20 08:17:01'),
(10, 'auth', '0006_require_contenttypes_0002', '2017-01-20 08:17:01'),
(11, 'auth', '0007_alter_validators_add_error_messages', '2017-01-20 08:17:01'),
(12, 'personal', '0001_initial', '2017-01-20 08:17:01'),
(13, 'personal', '0002_auto_20161230_1230', '2017-01-20 08:17:02'),
(14, 'personal', '0003_person_personal_id', '2017-01-20 08:17:02'),
(15, 'personal', '0004_auto_20170101_1912', '2017-01-20 08:17:03'),
(16, 'personal', '0005_auto_20170119_2204', '2017-01-20 08:17:03'),
(17, 'sessions', '0001_initial', '2017-01-20 08:17:03');

-- --------------------------------------------------------

--
-- Структура таблицы `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) COLLATE utf8_bin NOT NULL,
  `session_data` longtext COLLATE utf8_bin NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Структура таблицы `personal_person`
--

CREATE TABLE IF NOT EXISTS `personal_person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `photo` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `personal_id` varchar(20) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=9 ;

--
-- Дамп данных таблицы `personal_person`
--

INSERT INTO `personal_person` (`id`, `address`, `photo`, `user_id`, `personal_id`) VALUES
(1, 'CN, Jelsomino, Radcat st., 25', 'img/PhillipCoulson_105_226/PhillCoulson.jpg', 45, '105_226'),
(2, 'CH, Shweinshwartznoensvertter, Rottenblumenstasse, 1', 'img/MelindaMay_42_5224/may.jpg', 46, '42_5224'),
(3, 'IND, New Delhi, Rajastan av., 123', 'img/JavaharlalNeru_41_1632/3364218_8630b51a.jpeg', 47, '41_1632'),
(4, 'UK, Pibbls-city, McGregor sq., 58', 'img/LeopoldFitz_59_1672/Fitz.jpg', 48, '59_1672'),
(5, 'AZ, Bullshit-City, WTF-pass, 144', 'img/JemmaSimmons_148_6705/skye.jpg', 49, '148_6705'),
(6, 'WP, Frozenmud, Whitewalkers st., 2', 'img/DaisyJohnson_147_381/DaisyJohnson.jpg', 50, '147_381'),
(7, 'UK, Glastonberry, McDougal rd. 563', 'img/JamesBond_77_9391/jb.jpg', 51, '77_9391'),
(8, 'PH, Hydra City, Fury av., 657', 'img/ASmith_517_3373/ASmith.jpg', 52, '517_3373');

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Ограничения внешнего ключа таблицы `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Ограничения внешнего ключа таблицы `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ограничения внешнего ключа таблицы `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ограничения внешнего ключа таблицы `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Ограничения внешнего ключа таблицы `personal_person`
--
ALTER TABLE `personal_person`
  ADD CONSTRAINT `personal_person_user_id_e86486d7_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
