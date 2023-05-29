-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 27, 2023 at 12:32 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `road_assistance_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add assign_service', 7, 'add_assign_service'),
(26, 'Can change assign_service', 7, 'change_assign_service'),
(27, 'Can delete assign_service', 7, 'delete_assign_service'),
(28, 'Can view assign_service', 7, 'view_assign_service'),
(29, 'Can add category', 8, 'add_category'),
(30, 'Can change category', 8, 'change_category'),
(31, 'Can delete category', 8, 'delete_category'),
(32, 'Can view category', 8, 'view_category'),
(33, 'Can add complaints', 9, 'add_complaints'),
(34, 'Can change complaints', 9, 'change_complaints'),
(35, 'Can delete complaints', 9, 'delete_complaints'),
(36, 'Can view complaints', 9, 'view_complaints'),
(37, 'Can add employee', 10, 'add_employee'),
(38, 'Can change employee', 10, 'change_employee'),
(39, 'Can delete employee', 10, 'delete_employee'),
(40, 'Can view employee', 10, 'view_employee'),
(41, 'Can add feedback', 11, 'add_feedback'),
(42, 'Can change feedback', 11, 'change_feedback'),
(43, 'Can delete feedback', 11, 'delete_feedback'),
(44, 'Can view feedback', 11, 'view_feedback'),
(45, 'Can add login', 12, 'add_login'),
(46, 'Can change login', 12, 'change_login'),
(47, 'Can delete login', 12, 'delete_login'),
(48, 'Can view login', 12, 'view_login'),
(49, 'Can add meeting', 13, 'add_meeting'),
(50, 'Can change meeting', 13, 'change_meeting'),
(51, 'Can delete meeting', 13, 'delete_meeting'),
(52, 'Can view meeting', 13, 'view_meeting'),
(53, 'Can add order', 14, 'add_order'),
(54, 'Can change order', 14, 'change_order'),
(55, 'Can delete order', 14, 'delete_order'),
(56, 'Can view order', 14, 'view_order'),
(57, 'Can add product', 15, 'add_product'),
(58, 'Can change product', 15, 'change_product'),
(59, 'Can delete product', 15, 'delete_product'),
(60, 'Can view product', 15, 'view_product'),
(61, 'Can add service_request', 16, 'add_service_request'),
(62, 'Can change service_request', 16, 'change_service_request'),
(63, 'Can delete service_request', 16, 'delete_service_request'),
(64, 'Can view service_request', 16, 'view_service_request'),
(65, 'Can add sub_category', 17, 'add_sub_category'),
(66, 'Can change sub_category', 17, 'change_sub_category'),
(67, 'Can delete sub_category', 17, 'delete_sub_category'),
(68, 'Can view sub_category', 17, 'view_sub_category'),
(69, 'Can add user', 18, 'add_user'),
(70, 'Can change user', 18, 'change_user'),
(71, 'Can delete user', 18, 'delete_user'),
(72, 'Can view user', 18, 'view_user'),
(73, 'Can add district', 19, 'add_district'),
(74, 'Can change district', 19, 'change_district'),
(75, 'Can delete district', 19, 'delete_district'),
(76, 'Can view district', 19, 'view_district'),
(77, 'Can add state', 20, 'add_state'),
(78, 'Can change state', 20, 'change_state'),
(79, 'Can delete state', 20, 'delete_state'),
(80, 'Can view state', 20, 'view_state'),
(81, 'Can add workshop', 21, 'add_workshop'),
(82, 'Can change workshop', 21, 'change_workshop'),
(83, 'Can delete workshop', 21, 'delete_workshop'),
(84, 'Can view workshop', 21, 'view_workshop');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$600000$GXmQW7arM2ictTWSNKM6mH$09zE2Q8qUfQXqW4cyGo1+hYI04ESq9X0gfIqIz7IkQc=', NULL, 1, 'admin', '', '', 'admin@gmail.com', 1, 1, '2023-04-23 10:51:50.253902');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'roadapp', 'assign_service'),
(8, 'roadapp', 'category'),
(9, 'roadapp', 'complaints'),
(19, 'roadapp', 'district'),
(10, 'roadapp', 'employee'),
(11, 'roadapp', 'feedback'),
(12, 'roadapp', 'login'),
(13, 'roadapp', 'meeting'),
(14, 'roadapp', 'order'),
(15, 'roadapp', 'product'),
(16, 'roadapp', 'service_request'),
(20, 'roadapp', 'state'),
(17, 'roadapp', 'sub_category'),
(18, 'roadapp', 'user'),
(21, 'roadapp', 'workshop'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-04-23 08:36:00.413460'),
(2, 'auth', '0001_initial', '2023-04-23 08:36:00.940827'),
(3, 'admin', '0001_initial', '2023-04-23 08:36:01.077368'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-04-23 08:36:01.085448'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-04-23 08:36:01.100922'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-04-23 08:36:01.169644'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-04-23 08:36:01.217612'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-04-23 08:36:01.241600'),
(9, 'auth', '0004_alter_user_username_opts', '2023-04-23 08:36:01.254020'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-04-23 08:36:01.308795'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-04-23 08:36:01.308795'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-04-23 08:36:01.324786'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-04-23 08:36:01.348770'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-04-23 08:36:01.364756'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-04-23 08:36:01.388743'),
(16, 'auth', '0011_update_proxy_permissions', '2023-04-23 08:36:01.404743'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-04-23 08:36:01.420721'),
(18, 'roadapp', '0001_initial', '2023-04-23 08:36:01.654364'),
(19, 'sessions', '0001_initial', '2023-04-23 08:36:01.676499'),
(20, 'roadapp', '0002_district_state', '2023-04-23 10:08:04.120049'),
(21, 'roadapp', '0003_workshop', '2023-04-23 10:44:36.469715'),
(22, 'roadapp', '0004_remove_workshop_area', '2023-04-23 10:46:39.151227'),
(23, 'roadapp', '0005_employee_workshop_login_id', '2023-04-23 11:34:43.656668'),
(24, 'roadapp', '0006_service_request_workshop_login_id', '2023-04-23 12:38:03.467329');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('g360f7qgq72pq7tb5t93uqib1tyhla1o', 'eyJ1bmFtZSI6ImFudTEyMyIsInNsb2dpZCI6M30:1prDXO:esXEoBn7489gZhlrojLgoKnU8Pi-HYM9HEB_N6rXOKc', '2023-05-09 07:56:34.613473');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_assign_service`
--

CREATE TABLE `tbl_assign_service` (
  `assign_service_id` int(11) NOT NULL,
  `service_request_id` int(11) NOT NULL,
  `employee_login_id` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  `service_details` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_assign_service`
--

INSERT INTO `tbl_assign_service` (`assign_service_id`, `service_request_id`, `employee_login_id`, `status`, `service_details`) VALUES
(1, 1, 4, 'Added Payment', 'Break problem with light fogging are fixed'),
(2, 4, 12, 'Added Payment', 'Fixed problem');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `category_id` int(11) NOT NULL,
  `category` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`category_id`, `category`) VALUES
(1, 'Oil and Fluids'),
(2, 'Air Conditioning'),
(3, 'Break Light');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_complaint`
--

CREATE TABLE `tbl_complaint` (
  `complaint_id` int(11) NOT NULL,
  `complaint` varchar(50) NOT NULL,
  `reply` varchar(50) NOT NULL,
  `user_login_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_complaint`
--

INSERT INTO `tbl_complaint` (`complaint_id`, `complaint`, `reply`, `user_login_id`) VALUES
(1, 'Not  good service', 'Okay', 3);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_district`
--

CREATE TABLE `tbl_district` (
  `district_id` int(11) NOT NULL,
  `state_id` int(11) NOT NULL,
  `district` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_district`
--

INSERT INTO `tbl_district` (`district_id`, `state_id`, `district`) VALUES
(1, 32, 'North and Middle Andaman'),
(2, 32, 'South Andaman'),
(3, 32, 'Nicobar'),
(4, 1, 'Adilabad'),
(5, 1, 'Anantapur'),
(6, 1, 'Chittoor'),
(7, 1, 'East Godavari'),
(8, 1, 'Guntur'),
(9, 1, 'Hyderabad'),
(10, 1, 'Kadapa'),
(11, 1, 'Karimnagar'),
(12, 1, 'Khammam'),
(13, 1, 'Krishna'),
(14, 1, 'Kurnool'),
(15, 1, 'Mahbubnagar'),
(16, 1, 'Medak'),
(17, 1, 'Nalgonda'),
(18, 1, 'Nellore'),
(19, 1, 'Nizamabad'),
(20, 1, 'Prakasam'),
(21, 1, 'Rangareddi'),
(22, 1, 'Srikakulam'),
(23, 1, 'Vishakhapatnam'),
(24, 1, 'Vizianagaram'),
(25, 1, 'Warangal'),
(26, 1, 'West Godavari'),
(27, 3, 'Anjaw'),
(28, 3, 'Changlang'),
(29, 3, 'East Kameng'),
(30, 3, 'Lohit'),
(31, 3, 'Lower Subansiri'),
(32, 3, 'Papum Pare'),
(33, 3, 'Tirap'),
(34, 3, 'Dibang Valley'),
(35, 3, 'Upper Subansiri'),
(36, 3, 'West Kameng'),
(37, 2, 'Barpeta'),
(38, 2, 'Bongaigaon'),
(39, 2, 'Cachar'),
(40, 2, 'Darrang'),
(41, 2, 'Dhemaji'),
(42, 2, 'Dhubri'),
(43, 2, 'Dibrugarh'),
(44, 2, 'Goalpara'),
(45, 2, 'Golaghat'),
(46, 2, 'Hailakandi'),
(47, 2, 'Jorhat'),
(48, 2, 'Karbi Anglong'),
(49, 2, 'Karimganj'),
(50, 2, 'Kokrajhar'),
(51, 2, 'Lakhimpur'),
(52, 2, 'Marigaon'),
(53, 2, 'Nagaon'),
(54, 2, 'Nalbari'),
(55, 2, 'North Cachar Hills'),
(56, 2, 'Sibsagar'),
(57, 2, 'Sonitpur'),
(58, 2, 'Tinsukia'),
(59, 4, 'Araria'),
(60, 4, 'Aurangabad'),
(61, 4, 'Banka'),
(62, 4, 'Begusarai'),
(63, 4, 'Bhagalpur'),
(64, 4, 'Bhojpur'),
(65, 4, 'Buxar'),
(66, 4, 'Darbhanga'),
(67, 4, 'Purba Champaran'),
(68, 4, 'Gaya'),
(69, 4, 'Gopalganj'),
(70, 4, 'Jamui'),
(71, 4, 'Jehanabad'),
(72, 4, 'Khagaria'),
(73, 4, 'Kishanganj'),
(74, 4, 'Kaimur'),
(75, 4, 'Katihar'),
(76, 4, 'Lakhisarai'),
(77, 4, 'Madhubani'),
(78, 4, 'Munger'),
(79, 4, 'Madhepura'),
(80, 4, 'Muzaffarpur'),
(81, 4, 'Nalanda'),
(82, 4, 'Nawada'),
(83, 4, 'Patna'),
(84, 4, 'Purnia'),
(85, 4, 'Rohtas'),
(86, 4, 'Saharsa'),
(87, 4, 'Samastipur'),
(88, 4, 'Sheohar'),
(89, 4, 'Sheikhpura'),
(90, 4, 'Saran'),
(91, 4, 'Sitamarhi'),
(92, 4, 'Supaul'),
(93, 4, 'Siwan'),
(94, 4, 'Vaishali'),
(95, 4, 'Pashchim Champaran'),
(96, 36, 'Bastar'),
(97, 36, 'Bilaspur'),
(98, 36, 'Dantewada'),
(99, 36, 'Dhamtari'),
(100, 36, 'Durg'),
(101, 36, 'Jashpur'),
(102, 36, 'Janjgir-Champa'),
(103, 36, 'Korba'),
(104, 36, 'Koriya'),
(105, 36, 'Kanker'),
(106, 36, 'Kawardha'),
(107, 36, 'Mahasamund'),
(108, 36, 'Raigarh'),
(109, 36, 'Rajnandgaon'),
(110, 36, 'Raipur'),
(111, 36, 'Surguja'),
(112, 29, 'Diu'),
(113, 29, 'Daman'),
(114, 25, 'Central Delhi'),
(115, 25, 'East Delhi'),
(116, 25, 'New Delhi'),
(117, 25, 'North Delhi'),
(118, 25, 'North East Delhi'),
(119, 25, 'North West Delhi'),
(120, 25, 'South Delhi'),
(121, 25, 'South West Delhi'),
(122, 25, 'West Delhi'),
(123, 26, 'North Goa'),
(124, 26, 'South Goa'),
(125, 5, 'Ahmedabad'),
(126, 5, 'Amreli District'),
(127, 5, 'Anand'),
(128, 5, 'Banaskantha'),
(129, 5, 'Bharuch'),
(130, 5, 'Bhavnagar'),
(131, 5, 'Dahod'),
(132, 5, 'The Dangs'),
(133, 5, 'Gandhinagar'),
(134, 5, 'Jamnagar'),
(135, 5, 'Junagadh'),
(136, 5, 'Kutch'),
(137, 5, 'Kheda'),
(138, 5, 'Mehsana'),
(139, 5, 'Narmada'),
(140, 5, 'Navsari'),
(141, 5, 'Patan'),
(142, 5, 'Panchmahal'),
(143, 5, 'Porbandar'),
(144, 5, 'Rajkot'),
(145, 5, 'Sabarkantha'),
(146, 5, 'Surendranagar'),
(147, 5, 'Surat'),
(148, 5, 'Vadodara'),
(149, 5, 'Valsad'),
(150, 6, 'Ambala'),
(151, 6, 'Bhiwani'),
(152, 6, 'Faridabad'),
(153, 6, 'Fatehabad'),
(154, 6, 'Gurgaon'),
(155, 6, 'Hissar'),
(156, 6, 'Jhajjar'),
(157, 6, 'Jind'),
(158, 6, 'Karnal'),
(159, 6, 'Kaithal'),
(160, 6, 'Kurukshetra'),
(161, 6, 'Mahendragarh'),
(162, 6, 'Mewat'),
(163, 6, 'Panchkula'),
(164, 6, 'Panipat'),
(165, 6, 'Rewari'),
(166, 6, 'Rohtak'),
(167, 6, 'Sirsa'),
(168, 6, 'Sonepat'),
(169, 6, 'Yamuna Nagar'),
(170, 6, 'Palwal'),
(171, 7, 'Bilaspur'),
(172, 7, 'Chamba'),
(173, 7, 'Hamirpur'),
(174, 7, 'Kangra'),
(175, 7, 'Kinnaur'),
(176, 7, 'Kulu'),
(177, 7, 'Lahaul and Spiti'),
(178, 7, 'Mandi'),
(179, 7, 'Shimla'),
(180, 7, 'Sirmaur'),
(181, 7, 'Solan'),
(182, 7, 'Una'),
(183, 8, 'Anantnag'),
(184, 8, 'Badgam'),
(185, 8, 'Bandipore'),
(186, 8, 'Baramula'),
(187, 8, 'Doda'),
(188, 8, 'Jammu'),
(189, 8, 'Kargil'),
(190, 8, 'Kathua'),
(191, 8, 'Kupwara'),
(192, 8, 'Leh'),
(193, 8, 'Poonch'),
(194, 8, 'Pulwama'),
(195, 8, 'Rajauri'),
(196, 8, 'Srinagar'),
(197, 8, 'Samba'),
(198, 8, 'Udhampur'),
(199, 34, 'Bokaro'),
(200, 34, 'Chatra'),
(201, 34, 'Deoghar'),
(202, 34, 'Dhanbad'),
(203, 34, 'Dumka'),
(204, 34, 'Purba Singhbhum'),
(205, 34, 'Garhwa'),
(206, 34, 'Giridih'),
(207, 34, 'Godda'),
(208, 34, 'Gumla'),
(209, 34, 'Hazaribagh'),
(210, 34, 'Koderma'),
(211, 34, 'Lohardaga'),
(212, 34, 'Pakur'),
(213, 34, 'Palamu'),
(214, 34, 'Ranchi'),
(215, 34, 'Sahibganj'),
(216, 34, 'Seraikela and Kharsawan'),
(217, 34, 'Pashchim Singhbhum'),
(218, 34, 'Ramgarh'),
(219, 9, 'Bidar'),
(220, 9, 'Belgaum'),
(221, 9, 'Bijapur'),
(222, 9, 'Bagalkot'),
(223, 9, 'Bellary'),
(224, 9, 'Bangalore Rural District'),
(225, 9, 'Bangalore Urban District'),
(226, 9, 'Chamarajnagar'),
(227, 9, 'Chikmagalur'),
(228, 9, 'Chitradurga'),
(229, 9, 'Davanagere'),
(230, 9, 'Dharwad'),
(231, 9, 'Dakshina Kannada'),
(232, 9, 'Gadag'),
(233, 9, 'Gulbarga'),
(234, 9, 'Hassan'),
(235, 9, 'Haveri District'),
(236, 9, 'Kodagu'),
(237, 9, 'Kolar'),
(238, 9, 'Koppal'),
(239, 9, 'Mandya'),
(240, 9, 'Mysore'),
(241, 9, 'Raichur'),
(242, 9, 'Shimoga'),
(243, 9, 'Tumkur'),
(244, 9, 'Udupi'),
(245, 9, 'Uttara Kannada'),
(246, 9, 'Ramanagara'),
(247, 9, 'Chikballapur'),
(248, 9, 'Yadagiri'),
(249, 10, 'Alappuzha'),
(250, 10, 'Ernakulam'),
(251, 10, 'Idukki'),
(252, 10, 'Kollam'),
(253, 10, 'Kannur'),
(254, 10, 'Kasaragod'),
(255, 10, 'Kottayam'),
(256, 10, 'Kozhikode'),
(257, 10, 'Malappuram'),
(258, 10, 'Palakkad'),
(259, 10, 'Pathanamthitta'),
(260, 10, 'Thrissur'),
(261, 10, 'Thiruvananthapuram'),
(262, 10, 'Wayanad'),
(263, 11, 'Alirajpur'),
(264, 11, 'Anuppur'),
(265, 11, 'Ashok Nagar'),
(266, 11, 'Balaghat'),
(267, 11, 'Barwani'),
(268, 11, 'Betul'),
(269, 11, 'Bhind'),
(270, 11, 'Bhopal'),
(271, 11, 'Burhanpur'),
(272, 11, 'Chhatarpur'),
(273, 11, 'Chhindwara'),
(274, 11, 'Damoh'),
(275, 11, 'Datia'),
(276, 11, 'Dewas'),
(277, 11, 'Dhar'),
(278, 11, 'Dindori'),
(279, 11, 'Guna'),
(280, 11, 'Gwalior'),
(281, 11, 'Harda'),
(282, 11, 'Hoshangabad'),
(283, 11, 'Indore'),
(284, 11, 'Jabalpur'),
(285, 11, 'Jhabua'),
(286, 11, 'Katni'),
(287, 11, 'Khandwa'),
(288, 11, 'Khargone'),
(289, 11, 'Mandla'),
(290, 11, 'Mandsaur'),
(291, 11, 'Morena'),
(292, 11, 'Narsinghpur'),
(293, 11, 'Neemuch'),
(294, 11, 'Panna'),
(295, 11, 'Rewa'),
(296, 11, 'Rajgarh'),
(297, 11, 'Ratlam'),
(298, 11, 'Raisen'),
(299, 11, 'Sagar'),
(300, 11, 'Satna'),
(301, 11, 'Sehore'),
(302, 11, 'Seoni'),
(303, 11, 'Shahdol'),
(304, 11, 'Shajapur'),
(305, 11, 'Sheopur'),
(306, 11, 'Shivpuri'),
(307, 11, 'Sidhi'),
(308, 11, 'Singrauli'),
(309, 11, 'Tikamgarh'),
(310, 11, 'Ujjain'),
(311, 11, 'Umaria'),
(312, 11, 'Vidisha'),
(313, 12, 'Ahmednagar'),
(314, 12, 'Akola'),
(315, 12, 'Amrawati'),
(316, 12, 'Aurangabad'),
(317, 12, 'Bhandara'),
(318, 12, 'Beed'),
(319, 12, 'Buldhana'),
(320, 12, 'Chandrapur'),
(321, 12, 'Dhule'),
(322, 12, 'Gadchiroli'),
(323, 12, 'Gondiya'),
(324, 12, 'Hingoli'),
(325, 12, 'Jalgaon'),
(326, 12, 'Jalna'),
(327, 12, 'Kolhapur'),
(328, 12, 'Latur'),
(329, 12, 'Mumbai City'),
(330, 12, 'Mumbai suburban'),
(331, 12, 'Nandurbar'),
(332, 12, 'Nanded'),
(333, 12, 'Nagpur'),
(334, 12, 'Nashik'),
(335, 12, 'Osmanabad'),
(336, 12, 'Parbhani'),
(337, 12, 'Pune'),
(338, 12, 'Raigad'),
(339, 12, 'Ratnagiri'),
(340, 12, 'Sindhudurg'),
(341, 12, 'Sangli'),
(342, 12, 'Solapur'),
(343, 12, 'Satara'),
(344, 12, 'Thane'),
(345, 12, 'Wardha'),
(346, 12, 'Washim'),
(347, 12, 'Yavatmal'),
(348, 13, 'Bishnupur'),
(349, 13, 'Churachandpur'),
(350, 13, 'Chandel'),
(351, 13, 'Imphal East'),
(352, 13, 'Senapati'),
(353, 13, 'Tamenglong'),
(354, 13, 'Thoubal'),
(355, 13, 'Ukhrul'),
(356, 13, 'Imphal West'),
(357, 14, 'East Garo Hills'),
(358, 14, 'East Khasi Hills'),
(359, 14, 'Jaintia Hills'),
(360, 14, 'Ri-Bhoi'),
(361, 14, 'South Garo Hills'),
(362, 14, 'West Garo Hills'),
(363, 14, 'West Khasi Hills'),
(364, 15, 'Aizawl'),
(365, 15, 'Champhai'),
(366, 15, 'Kolasib'),
(367, 15, 'Lawngtlai'),
(368, 15, 'Lunglei'),
(369, 15, 'Mamit'),
(370, 15, 'Saiha'),
(371, 15, 'Serchhip'),
(372, 16, 'Dimapur'),
(373, 16, 'Kohima'),
(374, 16, 'Mokokchung'),
(375, 16, 'Mon'),
(376, 16, 'Phek'),
(377, 16, 'Tuensang'),
(378, 16, 'Wokha'),
(379, 16, 'Zunheboto'),
(380, 17, 'Angul'),
(381, 17, 'Boudh'),
(382, 17, 'Bhadrak'),
(383, 17, 'Bolangir'),
(384, 17, 'Bargarh'),
(385, 17, 'Baleswar'),
(386, 17, 'Cuttack'),
(387, 17, 'Debagarh'),
(388, 17, 'Dhenkanal'),
(389, 17, 'Ganjam'),
(390, 17, 'Gajapati'),
(391, 17, 'Jharsuguda'),
(392, 17, 'Jajapur'),
(393, 17, 'Jagatsinghpur'),
(394, 17, 'Khordha'),
(395, 17, 'Kendujhar'),
(396, 17, 'Kalahandi'),
(397, 17, 'Kandhamal'),
(398, 17, 'Koraput'),
(399, 17, 'Kendrapara'),
(400, 17, 'Malkangiri'),
(401, 17, 'Mayurbhanj'),
(402, 17, 'Nabarangpur'),
(403, 17, 'Nuapada'),
(404, 17, 'Nayagarh'),
(405, 17, 'Puri'),
(406, 17, 'Rayagada'),
(407, 17, 'Sambalpur'),
(408, 17, 'Subarnapur'),
(409, 17, 'Sundargarh'),
(410, 27, 'Karaikal'),
(411, 27, 'Mahe'),
(412, 27, 'Puducherry'),
(413, 27, 'Yanam'),
(414, 18, 'Amritsar'),
(415, 18, 'Bathinda'),
(416, 18, 'Firozpur'),
(417, 18, 'Faridkot'),
(418, 18, 'Fatehgarh Sahib'),
(419, 18, 'Gurdaspur'),
(420, 18, 'Hoshiarpur'),
(421, 18, 'Jalandhar'),
(422, 18, 'Kapurthala'),
(423, 18, 'Ludhiana'),
(424, 18, 'Mansa'),
(425, 18, 'Moga'),
(426, 18, 'Mukatsar'),
(427, 18, 'Nawan Shehar'),
(428, 18, 'Patiala'),
(429, 18, 'Rupnagar'),
(430, 18, 'Sangrur'),
(431, 19, 'Ajmer'),
(432, 19, 'Alwar'),
(433, 19, 'Bikaner'),
(434, 19, 'Barmer'),
(435, 19, 'Banswara'),
(436, 19, 'Bharatpur'),
(437, 19, 'Baran'),
(438, 19, 'Bundi'),
(439, 19, 'Bhilwara'),
(440, 19, 'Churu'),
(441, 19, 'Chittorgarh'),
(442, 19, 'Dausa'),
(443, 19, 'Dholpur'),
(444, 19, 'Dungapur'),
(445, 19, 'Ganganagar'),
(446, 19, 'Hanumangarh'),
(447, 19, 'Juhnjhunun'),
(448, 19, 'Jalore'),
(449, 19, 'Jodhpur'),
(450, 19, 'Jaipur'),
(451, 19, 'Jaisalmer'),
(452, 19, 'Jhalawar'),
(453, 19, 'Karauli'),
(454, 19, 'Kota'),
(455, 19, 'Nagaur'),
(456, 19, 'Pali'),
(457, 19, 'Pratapgarh'),
(458, 19, 'Rajsamand'),
(459, 19, 'Sikar'),
(460, 19, 'Sawai Madhopur'),
(461, 19, 'Sirohi'),
(462, 19, 'Tonk'),
(463, 19, 'Udaipur'),
(464, 20, 'East Sikkim'),
(465, 20, 'North Sikkim'),
(466, 20, 'South Sikkim'),
(467, 20, 'West Sikkim'),
(468, 21, 'Ariyalur'),
(469, 21, 'Chennai'),
(470, 21, 'Coimbatore'),
(471, 21, 'Cuddalore'),
(472, 21, 'Dharmapuri'),
(473, 21, 'Dindigul'),
(474, 21, 'Erode'),
(475, 21, 'Kanchipuram'),
(476, 21, 'Kanyakumari'),
(477, 21, 'Karur'),
(478, 21, 'Madurai'),
(479, 21, 'Nagapattinam'),
(480, 21, 'The Nilgiris'),
(481, 21, 'Namakkal'),
(482, 21, 'Perambalur'),
(483, 21, 'Pudukkottai'),
(484, 21, 'Ramanathapuram'),
(485, 21, 'Salem'),
(486, 21, 'Sivagangai'),
(487, 21, 'Tiruppur'),
(488, 21, 'Tiruchirappalli'),
(489, 21, 'Theni'),
(490, 21, 'Tirunelveli'),
(491, 21, 'Thanjavur'),
(492, 21, 'Thoothukudi'),
(493, 21, 'Thiruvallur'),
(494, 21, 'Thiruvarur'),
(495, 21, 'Tiruvannamalai'),
(496, 21, 'Vellore'),
(497, 21, 'Villupuram'),
(498, 22, 'Dhalai'),
(499, 22, 'North Tripura'),
(500, 22, 'South Tripura'),
(501, 22, 'West Tripura'),
(502, 33, 'Almora'),
(503, 33, 'Bageshwar'),
(504, 33, 'Chamoli'),
(505, 33, 'Champawat'),
(506, 33, 'Dehradun'),
(507, 33, 'Haridwar'),
(508, 33, 'Nainital'),
(509, 33, 'Pauri Garhwal'),
(510, 33, 'Pithoragharh'),
(511, 33, 'Rudraprayag'),
(512, 33, 'Tehri Garhwal'),
(513, 33, 'Udham Singh Nagar'),
(514, 33, 'Uttarkashi'),
(515, 23, 'Agra'),
(516, 23, 'Allahabad'),
(517, 23, 'Aligarh'),
(518, 23, 'Ambedkar Nagar'),
(519, 23, 'Auraiya'),
(520, 23, 'Azamgarh'),
(521, 23, 'Barabanki'),
(522, 23, 'Badaun'),
(523, 23, 'Bagpat'),
(524, 23, 'Bahraich'),
(525, 23, 'Bijnor'),
(526, 23, 'Ballia'),
(527, 23, 'Banda'),
(528, 23, 'Balrampur'),
(529, 23, 'Bareilly'),
(530, 23, 'Basti'),
(531, 23, 'Bulandshahr'),
(532, 23, 'Chandauli'),
(533, 23, 'Chitrakoot'),
(534, 23, 'Deoria'),
(535, 23, 'Etah'),
(536, 23, 'Kanshiram Nagar'),
(537, 23, 'Etawah'),
(538, 23, 'Firozabad'),
(539, 23, 'Farrukhabad'),
(540, 23, 'Fatehpur'),
(541, 23, 'Faizabad'),
(542, 23, 'Gautam Buddha Nagar'),
(543, 23, 'Gonda'),
(544, 23, 'Ghazipur'),
(545, 23, 'Gorkakhpur'),
(546, 23, 'Ghaziabad'),
(547, 23, 'Hamirpur'),
(548, 23, 'Hardoi'),
(549, 23, 'Mahamaya Nagar'),
(550, 23, 'Jhansi'),
(551, 23, 'Jalaun'),
(552, 23, 'Jyotiba Phule Nagar'),
(553, 23, 'Jaunpur District'),
(554, 23, 'Kanpur Dehat'),
(555, 23, 'Kannauj'),
(556, 23, 'Kanpur Nagar'),
(557, 23, 'Kaushambi'),
(558, 23, 'Kushinagar'),
(559, 23, 'Lalitpur'),
(560, 23, 'Lakhimpur Kheri'),
(561, 23, 'Lucknow'),
(562, 23, 'Mau'),
(563, 23, 'Meerut'),
(564, 23, 'Maharajganj'),
(565, 23, 'Mahoba'),
(566, 23, 'Mirzapur'),
(567, 23, 'Moradabad'),
(568, 23, 'Mainpuri'),
(569, 23, 'Mathura'),
(570, 23, 'Muzaffarnagar'),
(571, 23, 'Pilibhit'),
(572, 23, 'Pratapgarh'),
(573, 23, 'Rampur'),
(574, 23, 'Rae Bareli'),
(575, 23, 'Saharanpur'),
(576, 23, 'Sitapur'),
(577, 23, 'Shahjahanpur'),
(578, 23, 'Sant Kabir Nagar'),
(579, 23, 'Siddharthnagar'),
(580, 23, 'Sonbhadra'),
(581, 23, 'Sant Ravidas Nagar'),
(582, 23, 'Sultanpur'),
(583, 23, 'Shravasti'),
(584, 23, 'Unnao'),
(585, 23, 'Varanasi'),
(586, 24, 'Birbhum'),
(587, 24, 'Bankura'),
(588, 24, 'Bardhaman'),
(589, 24, 'Darjeeling'),
(590, 24, 'Dakshin Dinajpur'),
(591, 24, 'Hooghly'),
(592, 24, 'Howrah'),
(593, 24, 'Jalpaiguri'),
(594, 24, 'Cooch Behar'),
(595, 24, 'Kolkata'),
(596, 24, 'Malda'),
(597, 24, 'Midnapore'),
(598, 24, 'Murshidabad'),
(599, 24, 'Nadia'),
(600, 24, 'North 24 Parganas'),
(601, 24, 'South 24 Parganas'),
(602, 24, 'Purulia'),
(603, 24, 'Uttar Dinajpur');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_employee`
--

CREATE TABLE `tbl_employee` (
  `employee_id` int(11) NOT NULL,
  `firstename` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `address` longtext NOT NULL,
  `email_id` varchar(50) NOT NULL,
  `joining_date` date NOT NULL,
  `dob` date NOT NULL,
  `gender` varchar(50) NOT NULL,
  `qualification` varchar(50) NOT NULL,
  `phone_number` bigint(20) DEFAULT NULL,
  `photo` varchar(50) NOT NULL,
  `desingnation` varchar(50) NOT NULL,
  `login_id` int(11) NOT NULL,
  `workshop_login_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_employee`
--

INSERT INTO `tbl_employee` (`employee_id`, `firstename`, `lastname`, `address`, `email_id`, `joining_date`, `dob`, `gender`, `qualification`, `phone_number`, `photo`, `desingnation`, `login_id`, `workshop_login_id`) VALUES
(1, 'jithin', 'Tom', 'Jithin Villa', 'jithin@gmail.com', '2023-04-18', '2005-04-12', 'Male', 'Polytechnic', 8754213265, '/media/10..jpg', 'Mechanic', 4, 1),
(2, 'Jinu', 'varghese', 'jinu villa', 'jinu@gmail.com', '2023-04-18', '2005-04-12', 'Male', 'plus two', 9865321245, '/media/7..jpg', 'Junior Mechanic', 5, 1),
(3, 'fsdf', 'fsdf', 'dsf', 'jayakumar@gmail.com', '2023-04-17', '2005-04-18', 'Male', 'Polytechnic', 9865321245, '/media/11..jpg', 'Junior Mechanic', 6, 1),
(4, 'lal', 'Tom', 'Lal Vila', 'lal@gmail.com', '2023-04-26', '2005-04-26', 'Male', 'BTech', 8754213265, '/media/12..jpg', 'Mechanic', 12, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_feedback`
--

CREATE TABLE `tbl_feedback` (
  `feedback_id` int(11) NOT NULL,
  `feedback` varchar(50) NOT NULL,
  `reply` varchar(50) NOT NULL,
  `employee_login_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_feedback`
--

INSERT INTO `tbl_feedback` (`feedback_id`, `feedback`, `reply`, `employee_login_id`) VALUES
(1, 'Work completed', 'fgfhgfgh', 4);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_login`
--

CREATE TABLE `tbl_login` (
  `login_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` longtext DEFAULT NULL,
  `Usertype` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_login`
--

INSERT INTO `tbl_login` (`login_id`, `username`, `password`, `Usertype`, `status`) VALUES
(1, 'soumya', 'soumya', 'Workshop', 'Approved'),
(2, 'jude123', 'jude123', 'Workshop', 'Approved'),
(3, 'anu123', 'anu123', 'User', 'Approved'),
(4, 'jithin123', 'jithin123', 'Worker', 'Approved'),
(5, 'jinu123', 'jinu123', 'Worker', 'Approved'),
(6, 'hhhhhhhh', 'hhhhhhhh', 'Worker', 'Approved'),
(8, 'akhil123', 'akhil123', 'User', 'Approved'),
(9, 'anad123', 'anad123', 'User', 'Approved'),
(10, 'grace123', 'grace123', 'Workshop', 'Approved'),
(11, 'ambadi123', 'ambadi123', 'Workshop', 'Not Approved'),
(12, 'lal123', 'lal123', 'Worker', 'Approved');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_meeting`
--

CREATE TABLE `tbl_meeting` (
  `meeting_id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `Cocunselor_name` varchar(50) NOT NULL,
  `venue` varchar(50) NOT NULL,
  `subject` varchar(50) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order`
--

CREATE TABLE `tbl_order` (
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `amount` decimal(7,2) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  `entry_date` datetime(6) NOT NULL,
  `user_login_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_order`
--

INSERT INTO `tbl_order` (`order_id`, `product_id`, `amount`, `quantity`, `status`, `entry_date`, `user_login_id`) VALUES
(1, 1, '3500.00', 1, 'Delivered', '2023-04-23 20:11:11.412717', 3),
(2, 1, '3500.00', 1, 'Paid', '2023-04-23 20:11:24.179827', 3),
(3, 1, '7000.00', 2, 'Delivered', '2023-04-26 19:05:45.646991', 8),
(4, 2, '693.00', 3, 'Delivered', '2023-04-26 19:07:27.911616', 8),
(5, 2, '231.00', 1, 'Paid', '2023-05-27 15:55:23.728543', 3),
(6, 2, '231.00', 1, 'Paid', '2023-05-27 15:55:51.968273', 3),
(7, 2, '231.00', 1, 'Paid', '2023-05-27 15:57:05.722163', 3);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product`
--

CREATE TABLE `tbl_product` (
  `product_id` int(11) NOT NULL,
  `sub_category_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` longtext NOT NULL,
  `features` longtext NOT NULL,
  `price` decimal(7,2) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `date` datetime(6) NOT NULL,
  `image` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_product`
--

INSERT INTO `tbl_product` (`product_id`, `sub_category_id`, `name`, `description`, `features`, `price`, `quantity`, `date`, `image`) VALUES
(1, 1, 'Shell Helix Ultra 5500411', 'No other motor oil keeps your engine closer to factory clean with 65 % cleaner pistons ', 'Car Compatibility: Maruti : Baleno, Ciaz , S Cross , Vitara Brezza , Celerio Ford: Figo, Fiesta, Fusion, Aspire, Ecosport, ', '3500.00', 115, '2023-04-22 19:52:21.564450', '/media/3..jpg'),
(2, 2, 'UE Premium Radiator Coolant', 'Compatible with all vehicle engine types and does not harm their structure either directly or indirectly ', 'Excellent Heat Absorption: UE Premium Radiator coolant has excellent heat dissipation and absorption propertie', '231.00', 225, '2023-04-22 19:54:33.637093', '/media/4..jpg'),
(3, 1, 'Ultra Synthex 140', 'Black Premium Quality And Highly Efficient Gulf Fully Synthetic Car Engine Oil', 'Black Premium Quality And Highly Efficient Gulf Fully Synthetic Car Engine Oil', '250.00', 231, '2023-04-22 19:56:22.924866', '/media/5..jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_service`
--

CREATE TABLE `tbl_service` (
  `service_request_id` int(11) NOT NULL,
  `type_of_service` varchar(50) NOT NULL,
  `description` longtext NOT NULL,
  `vehicle_brand` varchar(50) NOT NULL,
  `vehicle_no` varchar(50) NOT NULL,
  `date_of_completion` date NOT NULL,
  `status` varchar(50) NOT NULL,
  `user_login_id` int(11) NOT NULL,
  `entry_date` datetime(6) NOT NULL,
  `fee` decimal(15,2) DEFAULT NULL,
  `workshop_login_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_service`
--

INSERT INTO `tbl_service` (`service_request_id`, `type_of_service`, `description`, `vehicle_brand`, `vehicle_no`, `date_of_completion`, `status`, `user_login_id`, `entry_date`, `fee`, `workshop_login_id`) VALUES
(1, 'High Priority', 'Break problem with light fogging', 'Nissan Altima', 'KL 26 M 2499', '2023-04-23', 'Paid', 3, '2023-04-23 18:03:56.874943', '3200.00', 1),
(2, 'High Priority', 'Oil Changing', 'Maruthi Alto', 'KL 05 AD 5846', '2023-04-24', 'Submitted', 3, '2023-04-23 18:08:39.200275', NULL, 1),
(3, 'Low Priority', 'Oil  Filter Chnaging', 'Audi', 'KL 05 A 8596', '2023-04-27', 'Submitted', 3, '2023-04-26 18:02:17.635208', NULL, 1),
(4, 'Low Priority', 'Problem in music system', 'Nissan', 'KL 05 A 8532', '2023-04-27', 'Paid', 8, '2023-04-26 18:13:00.058744', '1230.00', 2),
(5, 'Low Priority', 'cbcvb bc dfgfdg dfgfg', 'Nissan', 'KL 05 A 8523', '2023-04-27', 'Submitted', 8, '2023-04-26 18:13:26.388031', NULL, 10),
(6, 'Low Priority', 'sads dsfdf dssdf', 'Nissan', 'KL 05 A 8521', '2023-04-28', 'Submitted', 8, '2023-04-26 18:25:28.579145', NULL, 1),
(7, 'High Priority', 'gufyrty6rt', 'dsad', 'KL 5 B 6789', '2023-05-29', 'Submitted', 3, '2023-05-27 15:52:21.374438', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_state`
--

CREATE TABLE `tbl_state` (
  `state_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `state` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_state`
--

INSERT INTO `tbl_state` (`state_id`, `country_id`, `state`) VALUES
(10, 105, 'KERALA');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sub_category`
--

CREATE TABLE `tbl_sub_category` (
  `sub_category_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `sub_category` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_sub_category`
--

INSERT INTO `tbl_sub_category` (`sub_category_id`, `category_id`, `sub_category`) VALUES
(1, 1, 'Engine Oil'),
(2, 1, 'COOLANT'),
(3, 1, 'BRAKE FLUID'),
(4, 1, 'TRANSMISSION OIL'),
(5, 1, 'CLEANING AGENTS'),
(6, 1, 'ADDITIVES'),
(7, 1, 'STEERING OIL'),
(8, 1, 'GREASE'),
(9, 2, 'Eaporator'),
(12, 2, 'CONDENSER'),
(13, 2, 'COMPRESSOR');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `user_id` int(11) NOT NULL,
  `login_id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `phone_number` bigint(20) DEFAULT NULL,
  `Email` varchar(50) NOT NULL,
  `Address` longtext NOT NULL,
  `place` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`user_id`, `login_id`, `name`, `phone_number`, `Email`, `Address`, `place`) VALUES
(1, 3, 'Anu', 9865321245, 'anu@gmail.com', 'Anu villa', 'Kottayam'),
(2, 8, 'Akhil', 8754632145, 'akhil@gmail.com', 'Akhil Villa', 'Pathanamthita'),
(3, 9, 'Anad', 9865321245, 'anad@gmila.com', 'anad villa', 'Pathanamthita');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_workshop`
--

CREATE TABLE `tbl_workshop` (
  `workshop_id` int(11) NOT NULL,
  `login_id` int(11) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `ownername` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone_number` bigint(20) DEFAULT NULL,
  `district_id` int(11) NOT NULL,
  `place` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_workshop`
--

INSERT INTO `tbl_workshop` (`workshop_id`, `login_id`, `Name`, `address`, `ownername`, `email`, `phone_number`, `district_id`, `place`) VALUES
(1, 1, 'Soumya Workshop', 'Pathanamthitta, St Peters Jun', 'Jayakumar', 'jayakumar@gmail.com', 9865321245, 259, 'St peters Junction'),
(2, 2, 'jude Workshop', 'Pandalam, Junction', 'Jude', 'jude@gmail.com', 9865321245, 259, 'Pandalam'),
(3, 10, 'Grace Tyres', 'Adoor', 'Thomas', 'thomas@gmail.com', 9865321234, 259, 'Pathanamthita'),
(4, 11, 'Ambadiyil', 'Ambadi Adoor', 'Ambadi', 'ambadi@gmail.com', 9865321231, 259, 'Pathanamthita');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `tbl_assign_service`
--
ALTER TABLE `tbl_assign_service`
  ADD PRIMARY KEY (`assign_service_id`);

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `tbl_complaint`
--
ALTER TABLE `tbl_complaint`
  ADD PRIMARY KEY (`complaint_id`);

--
-- Indexes for table `tbl_district`
--
ALTER TABLE `tbl_district`
  ADD PRIMARY KEY (`district_id`);

--
-- Indexes for table `tbl_employee`
--
ALTER TABLE `tbl_employee`
  ADD PRIMARY KEY (`employee_id`);

--
-- Indexes for table `tbl_feedback`
--
ALTER TABLE `tbl_feedback`
  ADD PRIMARY KEY (`feedback_id`);

--
-- Indexes for table `tbl_login`
--
ALTER TABLE `tbl_login`
  ADD PRIMARY KEY (`login_id`);

--
-- Indexes for table `tbl_meeting`
--
ALTER TABLE `tbl_meeting`
  ADD PRIMARY KEY (`meeting_id`);

--
-- Indexes for table `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `tbl_service`
--
ALTER TABLE `tbl_service`
  ADD PRIMARY KEY (`service_request_id`);

--
-- Indexes for table `tbl_state`
--
ALTER TABLE `tbl_state`
  ADD PRIMARY KEY (`state_id`);

--
-- Indexes for table `tbl_sub_category`
--
ALTER TABLE `tbl_sub_category`
  ADD PRIMARY KEY (`sub_category_id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `tbl_workshop`
--
ALTER TABLE `tbl_workshop`
  ADD PRIMARY KEY (`workshop_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `tbl_assign_service`
--
ALTER TABLE `tbl_assign_service`
  MODIFY `assign_service_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_complaint`
--
ALTER TABLE `tbl_complaint`
  MODIFY `complaint_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_district`
--
ALTER TABLE `tbl_district`
  MODIFY `district_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=604;

--
-- AUTO_INCREMENT for table `tbl_employee`
--
ALTER TABLE `tbl_employee`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_feedback`
--
ALTER TABLE `tbl_feedback`
  MODIFY `feedback_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_login`
--
ALTER TABLE `tbl_login`
  MODIFY `login_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbl_meeting`
--
ALTER TABLE `tbl_meeting`
  MODIFY `meeting_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_service`
--
ALTER TABLE `tbl_service`
  MODIFY `service_request_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_state`
--
ALTER TABLE `tbl_state`
  MODIFY `state_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `tbl_sub_category`
--
ALTER TABLE `tbl_sub_category`
  MODIFY `sub_category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_workshop`
--
ALTER TABLE `tbl_workshop`
  MODIFY `workshop_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
