-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 10, 2019 lúc 06:08 PM
-- Phiên bản máy phục vụ: 10.1.36-MariaDB
-- Phiên bản PHP: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `hochieuqua`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `m_bai_giang`
--

CREATE TABLE `m_bai_giang` (
  `id` int(11) NOT NULL,
  `teacher` smallint(3) DEFAULT NULL,
  `course` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `thematic` smallint(5) NOT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `alias` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `description` tinytext COLLATE utf8_unicode_ci,
  `content` mediumtext COLLATE utf8_unicode_ci,
  `link_video` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort` tinyint(2) NOT NULL,
  `keywords` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` smallint(5) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `trial` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `m_bai_giang`
--

INSERT INTO `m_bai_giang` (`id`, `teacher`, `course`, `thematic`, `name`, `alias`, `description`, `content`, `link_video`, `image`, `sort`, `keywords`, `user_id`, `status`, `created_at`, `updated_at`, `trial`) VALUES
(1, 1, 'HHQ40', 2, 'Dãy số tự nhiên', 'day-so-tu-nhien', '<p>B&agrave;i học nằm trong khối kiến thức to&aacute;n lớp 4, thuộc kh&oacute;a học to&aacute;n lớp 4 học kỳ 1</p>', '<p>B&agrave;i học nằm trong khối kiến thức to&aacute;n lớp 4, thuộc kh&oacute;a học to&aacute;n lớp 4 học kỳ 1</p>', 'https://www.youtube.com/embed/84c0rUgtBzA', NULL, 0, 'Bài học nằm trong khối kiến thức toán lớp 4, thuộc khóa học toán lớp 4 học kỳ 1', 13, 0, '2019-03-22 15:12:22', '2019-01-21 15:20:36', 1),
(2, 2, 'HHQ50', 9, 'Khái niệm, tính chất cơ bản của phân số', 'khai-niem,-tinh-chat-co-ban-cua-phan-so', '<p>Kh&aacute;i niệm, t&iacute;nh chất cơ bản của ph&acirc;n số</p>', '<p>Kh&aacute;i niệm, t&iacute;nh chất cơ bản của ph&acirc;n số</p>', 'https://www.youtube.com/embed/ZnOAK04tJhc', NULL, 11, 'Khái niệm, tính chất cơ bản của phân số', 13, 1, '2019-03-26 14:48:06', '2019-03-26 14:48:06', 1),
(3, 1, 'HHQ50', 9, 'So sánh phân số', 'so-sanh-phan-so', '<p>So s&aacute;nh ph&acirc;n số</p>', '<p>So s&aacute;nh ph&acirc;n số</p>', 'https://www.youtube.com/embed/84c0rUgtBzA', NULL, 12, 'So sánh phân số', 13, 1, '2019-03-22 15:17:51', '2019-03-22 15:17:51', 1),
(4, 1, 'HHQ50', 9, 'Tìm một số khi biết một số phần của nó', 'tim-mot-so-khi-biet-mot-so-phan-cua-no', '<p>T&igrave;m một số khi biết một số phần của n&oacute;</p>', '<p>T&igrave;m một số khi biết một số phần của n&oacute;</p>', 'https://www.youtube.com/embed/84c0rUgtBzA', NULL, 13, 'Tìm một số khi biết một số phần của nó', 13, 1, '2019-02-28 15:08:51', '2019-02-28 15:08:51', 0),
(5, 1, 'HHQ50', 9, 'Tính thuận tiện với phân số', 'tinh-thuan-tien-voi-phan-so', '<p>T&iacute;nh thuận tiện với ph&acirc;n số</p>', '<p>T&iacute;nh thuận tiện với ph&acirc;n số</p>', 'https://www.youtube.com/embed/84c0rUgtBzA', NULL, 14, 'Tính thuận tiện với phân số', 13, 1, '2019-02-28 15:08:59', '2019-02-28 15:08:59', 0),
(6, 1, 'HHQ50', 9, 'Tính thuận tiện với phân số', 'tinh-thuan-tien-voi-phan-so', '<p>T&iacute;nh thuận tiện với ph&acirc;n số</p>', '<p>T&iacute;nh thuận tiện với ph&acirc;n số</p>', 'https://www.youtube.com/embed/84c0rUgtBzA', NULL, 0, 'Tính thuận tiện với phân số', 13, 0, '2019-02-21 14:11:14', '2019-02-13 04:28:37', 0),
(7, 1, 'HHQ51', 15, 'Tìm số trung bình cộng', 'tim-so-trung-binh-cong', '<p>T&igrave;m số trung b&igrave;nh cộng</p>', '<p>T&igrave;m số trung b&igrave;nh cộng</p>', 'https://www.youtube.com/embed/84c0rUgtBzA', NULL, 0, 'Tìm số trung bình cộng', 13, 1, '2019-02-21 14:11:14', '2019-01-21 15:42:54', 0),
(8, 1, 'HHQ50', 10, 'Tỉ lệ thuận', 'ti-le-thuan', '<p>Tỉ lệ thuận</p>', '<p>Tỉ lệ thuận</p>', 'https://www.youtube.com/embed/84c0rUgtBzA', NULL, 0, 'Tỉ lệ thuận', 13, 1, '2019-02-21 14:11:14', '2019-01-21 15:51:58', 0),
(9, 1, 'HHQ50', 10, 'Tỉ lệ nghịch', 'ti-le-nghich', '<p>Tỉ lệ nghịch</p>', '<p>Tỉ lệ nghịch</p>', 'https://www.youtube.com/embed/84c0rUgtBzA', NULL, 0, 'Tỉ lệ nghịch', 13, 1, '2019-02-21 14:11:14', '2019-01-21 15:52:13', 0),
(10, 1, 'HHQ50', 11, 'Khái niệm, đọc, viết số thập phân', 'khai-niem,-doc,-viet-so-thap-phan', '<p>Kh&aacute;i niệm, đọc, viết số thập ph&acirc;n</p>', '<p>Kh&aacute;i niệm, đọc, viết số thập ph&acirc;n</p>', 'https://www.youtube.com/embed/84c0rUgtBzA', NULL, 0, 'Khái niệm, đọc, viết số thập phân', 13, 1, '2019-02-21 14:11:14', '2019-01-21 15:53:46', 0),
(11, 1, 'HHQ50', 12, 'Tìm tỉ số phần trăm của 2 số', 'tim-ti-so-phan-tram-cua-2-so', '<p>T&igrave;m tỉ số phần trăm của 2 số</p>', '<p>T&igrave;m tỉ số phần trăm của 2 số</p>', 'https://www.youtube.com/embed/84c0rUgtBzA', NULL, 0, 'Tìm tỉ số phần trăm của 2 số', 13, 1, '2019-02-21 14:11:14', '2019-01-21 15:54:25', 0),
(12, 1, 'HHQ50', 13, 'Hình tam giác', 'hinh-tam-giac', '<p>H&igrave;nh tam gi&aacute;c</p>', '<p>H&igrave;nh tam gi&aacute;c</p>', 'https://www.youtube.com/embed/84c0rUgtBzA', NULL, 0, 'Hình tam giác', 13, 1, '2019-02-21 14:11:14', '2019-01-21 15:54:51', 0),
(13, 1, 'HHQ50', 14, 'Số đo thời gian', 'so-do-thoi-gian', '<p>Số đo thời gian</p>', '<p>Số đo thời gian</p>', 'https://www.youtube.com/embed/84c0rUgtBzA', NULL, 0, 'Số đo thời gian', 13, 1, '2019-02-21 14:11:14', '2019-01-21 15:55:18', 0),
(14, 1, 'HHQ40', 1, 'VinFast Klara lội nước gần 1 mét và cái kết', 'vinfast-klara-loi-nuoc-gan-1-met-va-cai-ket', '<p>test</p>', NULL, 'https://www.youtube.com/embed/ZnOAK04tJhc', 'public/uploads/images/201902/oaSrGZLPWq.png', 0, 'testg', 13, 1, '2019-02-27 14:51:52', '2019-02-27 14:51:52', 0),
(15, 1, 'HHQ51', 3, 'tesst', 'tesst', NULL, NULL, 'https://www.youtube.com/embed/ZnOAK04tJhc', NULL, 0, NULL, 13, 0, '2019-03-14 13:08:27', '2019-03-14 13:08:27', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `m_cau_dap_an`
--

CREATE TABLE `m_cau_dap_an` (
  `id` int(11) NOT NULL,
  `stt` smallint(2) NOT NULL,
  `quesstion_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alias` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `result` tinyint(1) NOT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `m_cau_dap_an`
--

INSERT INTO `m_cau_dap_an` (`id`, `stt`, `quesstion_id`, `name`, `alias`, `value`, `result`, `image`, `created_at`, `updated_at`) VALUES
(105, 1, 33, '14', '', '', 1, '', '2019-03-05 13:32:31', '2019-03-05 13:32:31'),
(106, 2, 33, '15', '', '', 0, '', '2019-03-05 13:32:31', '2019-03-05 13:32:31'),
(107, 3, 33, '13', '', '', 0, '', '2019-03-05 13:32:31', '2019-03-05 13:32:31'),
(108, 4, 33, '16', '', '', 0, '', '2019-03-05 13:32:31', '2019-03-05 13:32:31'),
(109, 1, 34, '6', '', '', 1, '', '2019-03-05 13:32:31', '2019-03-05 13:32:31'),
(110, 2, 34, '7', '', '', 0, '', '2019-03-05 13:32:31', '2019-03-05 13:32:31'),
(111, 3, 34, '8', '', '', 0, '', '2019-03-05 13:32:31', '2019-03-05 13:32:31'),
(112, 4, 34, '14', '', '', 0, '', '2019-03-05 13:32:31', '2019-03-05 13:32:31'),
(113, 1, 35, '15', '', '', 0, '', '2019-03-05 13:32:31', '2019-03-05 13:32:31'),
(114, 2, 35, '16', '', '', 0, '', '2019-03-05 13:32:31', '2019-03-05 13:32:31'),
(115, 3, 35, '13', '', '', 3, '', '2019-03-05 13:32:31', '2019-03-05 13:32:31'),
(116, 4, 35, '10', '', '', 0, '', '2019-03-05 13:32:31', '2019-03-05 13:32:31'),
(117, 1, 36, '14', '', '', 1, '', '2019-03-05 13:33:26', '2019-03-05 13:33:26'),
(118, 2, 36, '15', '', '', 0, '', '2019-03-05 13:33:26', '2019-03-05 13:33:26'),
(119, 3, 36, '13', '', '', 0, '', '2019-03-05 13:33:26', '2019-03-05 13:33:26'),
(120, 4, 36, '16', '', '', 0, '', '2019-03-05 13:33:26', '2019-03-05 13:33:26'),
(121, 1, 37, '6', '', '', 1, '', '2019-03-05 13:33:26', '2019-03-05 13:33:26'),
(122, 2, 37, '7', '', '', 0, '', '2019-03-05 13:33:26', '2019-03-05 13:33:26'),
(123, 3, 37, '8', '', '', 0, '', '2019-03-05 13:33:26', '2019-03-05 13:33:26'),
(124, 4, 37, '14', '', '', 0, '', '2019-03-05 13:33:26', '2019-03-05 13:33:26'),
(125, 1, 38, '15', '', '', 0, '', '2019-03-05 13:33:26', '2019-03-05 13:33:26'),
(126, 2, 38, '16', '', '', 0, '', '2019-03-05 13:33:26', '2019-03-05 13:33:26'),
(127, 3, 38, '13', '', '', 3, '', '2019-03-05 13:33:26', '2019-03-05 13:33:26'),
(128, 4, 38, '10', '', '', 0, '', '2019-03-05 13:33:26', '2019-03-05 13:33:26'),
(129, 1, 39, '14', '', '', 1, '', '2019-03-05 13:33:41', '2019-03-05 13:33:41'),
(130, 2, 39, '15', '', '', 0, '', '2019-03-05 13:33:41', '2019-03-05 13:33:41'),
(131, 3, 39, '13', '', '', 0, '', '2019-03-05 13:33:41', '2019-03-05 13:33:41'),
(132, 4, 39, '16', '', '', 0, '', '2019-03-05 13:33:41', '2019-03-05 13:33:41'),
(133, 1, 40, '6', '', '', 1, '', '2019-03-05 13:33:41', '2019-03-05 13:33:41'),
(134, 2, 40, '7', '', '', 0, '', '2019-03-05 13:33:41', '2019-03-05 13:33:41'),
(135, 3, 40, '8', '', '', 0, '', '2019-03-05 13:33:41', '2019-03-05 13:33:41'),
(136, 4, 40, '14', '', '', 0, '', '2019-03-05 13:33:41', '2019-03-05 13:33:41'),
(137, 1, 41, '15', '', '', 0, '', '2019-03-05 13:33:41', '2019-03-05 13:33:41'),
(138, 2, 41, '16', '', '', 0, '', '2019-03-05 13:33:41', '2019-03-05 13:33:41'),
(139, 3, 41, '13', '', '', 3, '', '2019-03-05 13:33:41', '2019-03-05 13:33:41'),
(140, 4, 41, '10', '', '', 0, '', '2019-03-05 13:33:41', '2019-03-05 13:33:41'),
(141, 1, 42, '14', '', '', 1, '', '2019-03-05 13:36:25', '2019-03-05 13:36:25'),
(142, 2, 42, '15', '', '', 0, '', '2019-03-05 13:36:25', '2019-03-05 13:36:25'),
(143, 3, 42, '13', '', '', 0, '', '2019-03-05 13:36:25', '2019-03-05 13:36:25'),
(144, 4, 42, '16', '', '', 0, '', '2019-03-05 13:36:25', '2019-03-05 13:36:25'),
(145, 1, 43, '6', '', '', 1, '', '2019-03-05 13:36:25', '2019-03-05 13:36:25'),
(146, 2, 43, '7', '', '', 0, '', '2019-03-05 13:36:25', '2019-03-05 13:36:25'),
(147, 3, 43, '8', '', '', 0, '', '2019-03-05 13:36:25', '2019-03-05 13:36:25'),
(148, 4, 43, '14', '', '', 0, '', '2019-03-05 13:36:25', '2019-03-05 13:36:25'),
(149, 1, 44, '15', '', '', 0, '', '2019-03-05 13:36:25', '2019-03-05 13:36:25'),
(150, 2, 44, '16', '', '', 0, '', '2019-03-05 13:36:25', '2019-03-05 13:36:25'),
(151, 3, 44, '13', '', '', 3, '', '2019-03-05 13:36:25', '2019-03-05 13:36:25'),
(152, 4, 44, '10', '', '', 0, '', '2019-03-05 13:36:25', '2019-03-05 13:36:25'),
(153, 1, 45, '20', '', '', 1, '', '2019-03-05 13:39:32', '2019-03-05 13:39:32'),
(154, 2, 45, '21', '', '', 0, '', '2019-03-05 13:39:32', '2019-03-05 13:39:32'),
(155, 3, 45, '22', '', '', 0, '', '2019-03-05 13:39:32', '2019-03-05 13:39:32'),
(156, 4, 45, '19', '', '', 0, '', '2019-03-05 13:39:32', '2019-03-05 13:39:32'),
(157, 1, 46, '12', '', '', 1, '', '2019-03-05 13:39:32', '2019-03-05 13:39:32'),
(158, 2, 46, '11', '', '', 0, '', '2019-03-05 13:39:32', '2019-03-05 13:39:32'),
(159, 3, 46, '13', '', '', 0, '', '2019-03-05 13:39:32', '2019-03-05 13:39:32'),
(160, 4, 46, '8', '', '', 0, '', '2019-03-05 13:39:32', '2019-03-05 13:39:32'),
(161, 1, 47, '10', '', '', 0, '', '2019-03-05 13:39:32', '2019-03-05 13:39:32'),
(162, 2, 47, '9', '', '', 0, '', '2019-03-05 13:39:32', '2019-03-05 13:39:32'),
(163, 3, 47, '5', '', '', 3, '', '2019-03-05 13:39:32', '2019-03-05 13:39:32'),
(164, 4, 47, '6', '', '', 0, '', '2019-03-05 13:39:32', '2019-03-05 13:39:32'),
(165, 1, 48, '20', '', '', 1, '', '2019-03-05 13:40:03', '2019-03-05 13:40:03'),
(166, 2, 48, '21', '', '', 0, '', '2019-03-05 13:40:03', '2019-03-05 13:40:03'),
(167, 3, 48, '22', '', '', 0, '', '2019-03-05 13:40:03', '2019-03-05 13:40:03'),
(168, 4, 48, '19', '', '', 0, '', '2019-03-05 13:40:03', '2019-03-05 13:40:03'),
(169, 1, 49, '12', '', '', 1, '', '2019-03-05 13:40:03', '2019-03-05 13:40:03'),
(170, 2, 49, '11', '', '', 0, '', '2019-03-05 13:40:03', '2019-03-05 13:40:03'),
(171, 3, 49, '13', '', '', 0, '', '2019-03-05 13:40:03', '2019-03-05 13:40:03'),
(172, 4, 49, '8', '', '', 0, '', '2019-03-05 13:40:03', '2019-03-05 13:40:03'),
(173, 1, 50, '10', '', '', 0, '', '2019-03-05 13:40:03', '2019-03-05 13:40:03'),
(174, 2, 50, '9', '', '', 0, '', '2019-03-05 13:40:03', '2019-03-05 13:40:03'),
(175, 3, 50, '5', '', '', 3, '', '2019-03-05 13:40:04', '2019-03-05 13:40:04'),
(176, 4, 50, '6', '', '', 0, '', '2019-03-05 13:40:04', '2019-03-05 13:40:04'),
(177, 1, 51, '49', '', '', 0, '', '2019-03-05 13:45:56', '2019-03-05 13:45:56'),
(178, 2, 51, '36', '', '', 2, '', '2019-03-05 13:45:56', '2019-03-05 13:45:56'),
(179, 3, 51, '13', '', '', 0, '', '2019-03-05 13:45:56', '2019-03-05 13:45:56'),
(180, 4, 51, '40', '', '', 0, '', '2019-03-05 13:45:56', '2019-03-05 13:45:56'),
(181, 1, 52, '0', '', '', 0, '', '2019-03-05 13:45:56', '2019-03-05 13:45:56'),
(182, 2, 52, '4', '', '', 0, '', '2019-03-05 13:45:56', '2019-03-05 13:45:56'),
(183, 3, 52, '1', '', '', 0, '', '2019-03-05 13:45:56', '2019-03-05 13:45:56'),
(184, 4, 52, '2', '', '', 4, '', '2019-03-05 13:45:56', '2019-03-05 13:45:56'),
(185, 1, 53, '4', '', '', 0, '', '2019-03-05 13:45:56', '2019-03-05 13:45:56'),
(186, 2, 53, '8', '', '', 2, '', '2019-03-05 13:45:56', '2019-03-05 13:45:56'),
(187, 3, 53, '6', '', '', 0, '', '2019-03-05 13:45:56', '2019-03-05 13:45:56'),
(188, 4, 53, '7', '', '', 0, '', '2019-03-05 13:45:56', '2019-03-05 13:45:56'),
(189, 1, 54, '49', '', '', 0, '', '2019-03-05 13:46:46', '2019-03-05 13:46:46'),
(190, 2, 54, '36', '', '', 2, '', '2019-03-05 13:46:46', '2019-03-05 13:46:46'),
(191, 3, 54, '13', '', '', 0, '', '2019-03-05 13:46:46', '2019-03-05 13:46:46'),
(192, 4, 54, '40', '', '', 0, '', '2019-03-05 13:46:46', '2019-03-05 13:46:46'),
(193, 1, 55, '0', '', '', 0, '', '2019-03-05 13:46:46', '2019-03-05 13:46:46'),
(194, 2, 55, '4', '', '', 0, '', '2019-03-05 13:46:46', '2019-03-05 13:46:46'),
(195, 3, 55, '1', '', '', 0, '', '2019-03-05 13:46:46', '2019-03-05 13:46:46'),
(196, 4, 55, '2', '', '', 4, '', '2019-03-05 13:46:46', '2019-03-05 13:46:46'),
(197, 1, 56, '4', '', '', 0, '', '2019-03-05 13:46:46', '2019-03-05 13:46:46'),
(198, 2, 56, '8', '', '', 2, '', '2019-03-05 13:46:46', '2019-03-05 13:46:46'),
(199, 3, 56, '6', '', '', 0, '', '2019-03-05 13:46:46', '2019-03-05 13:46:46'),
(200, 4, 56, '7', '', '', 0, '', '2019-03-05 13:46:46', '2019-03-05 13:46:46'),
(201, 1, 57, '49', '', '', 0, '', '2019-03-05 14:34:15', '2019-03-05 14:34:15'),
(202, 2, 57, '36', '', '', 2, '', '2019-03-05 14:34:15', '2019-03-05 14:34:15'),
(203, 3, 57, '13', '', '', 0, '', '2019-03-05 14:34:15', '2019-03-05 14:34:15'),
(204, 4, 57, '40', '', '', 0, '', '2019-03-05 14:34:15', '2019-03-05 14:34:15'),
(205, 1, 58, '0', '', '', 0, '', '2019-03-05 14:34:15', '2019-03-05 14:34:15'),
(206, 2, 58, '4', '', '', 0, '', '2019-03-05 14:34:15', '2019-03-05 14:34:15'),
(207, 3, 58, '1', '', '', 0, '', '2019-03-05 14:34:15', '2019-03-05 14:34:15'),
(208, 4, 58, '2', '', '', 4, '', '2019-03-05 14:34:15', '2019-03-05 14:34:15'),
(209, 1, 59, '4', '', '', 0, '', '2019-03-05 14:34:15', '2019-03-05 14:34:15'),
(210, 2, 59, '8', '', '', 2, '', '2019-03-05 14:34:15', '2019-03-05 14:34:15'),
(211, 3, 59, '6', '', '', 0, '', '2019-03-05 14:34:15', '2019-03-05 14:34:15'),
(212, 4, 59, '7', '', '', 0, '', '2019-03-05 14:34:15', '2019-03-05 14:34:15'),
(213, 1, 61, '1', '', '', 1, '', '2019-03-14 15:34:54', '2019-03-14 15:34:54'),
(214, 2, 61, '2', '', '', 0, '', '2019-03-14 15:34:54', '2019-03-14 15:34:54'),
(215, 3, 61, '3', '', '', 0, '', '2019-03-14 15:34:54', '2019-03-14 15:34:54'),
(216, 4, 61, '4', '', '', 0, '', '2019-03-14 15:34:54', '2019-03-14 15:34:54'),
(217, 1, 62, '7', '', '', 1, '', '2019-03-14 15:36:12', '2019-03-14 15:36:12'),
(218, 2, 62, '6', '', '', 0, '', '2019-03-14 15:36:12', '2019-03-14 15:36:12'),
(219, 3, 62, '5', '', '', 0, '', '2019-03-14 15:36:12', '2019-03-14 15:36:12'),
(220, 4, 62, '9', '', '', 0, '', '2019-03-14 15:36:12', '2019-03-14 15:36:12');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `m_cau_hoi`
--

CREATE TABLE `m_cau_hoi` (
  `id` int(11) NOT NULL,
  `type` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `used` tinyint(1) NOT NULL,
  `course` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `thematic` int(5) NOT NULL,
  `lesson` int(11) DEFAULT NULL,
  `name` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `alias` tinytext COLLATE utf8_unicode_ci,
  `image` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `level` smallint(2) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `answer` tinyint(2) DEFAULT NULL,
  `user_id` int(5) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `m_cau_hoi`
--

INSERT INTO `m_cau_hoi` (`id`, `type`, `used`, `course`, `thematic`, `lesson`, `name`, `alias`, `image`, `level`, `status`, `answer`, `user_id`, `created_at`, `updated_at`) VALUES
(33, 'radio', 0, 'HHQ50', 9, 2, 'Chọn đáp án đúng 10 + 4', '', '', 1, 1, 1, 13, '2019-03-14 15:50:08', '2019-03-05 13:32:31'),
(34, 'radio', 0, 'HHQ50', 9, 2, 'Chọn đáp án đúng 10 - 4', '', '', 1, 1, 1, 13, '2019-03-14 15:50:08', '2019-03-05 13:32:31'),
(35, 'radio', 0, 'HHQ50', 9, 2, 'Chọn đáp án đúng 10 + 4 - 1', '', '', 1, 1, 3, 13, '2019-03-14 15:50:08', '2019-03-05 13:32:31'),
(36, 'radio', 1, 'HHQ50', 9, NULL, 'Chọn đáp án đúng 10 + 4', '', '', 1, 1, 1, 13, '2019-03-14 15:50:08', '2019-03-05 13:33:26'),
(37, 'radio', 1, 'HHQ50', 9, NULL, 'Chọn đáp án đúng 10 - 4', '', '', 1, 1, 1, 13, '2019-03-14 15:50:08', '2019-03-05 13:33:26'),
(38, 'radio', 1, 'HHQ50', 9, NULL, 'Chọn đáp án đúng 10 + 4 - 1', '', '', 1, 1, 3, 13, '2019-03-14 15:50:08', '2019-03-05 13:33:26'),
(39, 'radio', 1, 'HHQ51', 3, NULL, 'Chọn đáp án đúng 10 + 4', '', '', 1, 1, 1, 13, '2019-03-14 15:50:08', '2019-03-05 13:33:41'),
(40, 'radio', 1, 'HHQ51', 3, NULL, 'Chọn đáp án đúng 10 - 4', '', '', 1, 1, 1, 13, '2019-03-14 15:50:08', '2019-03-05 13:33:41'),
(41, 'radio', 1, 'HHQ51', 3, NULL, 'Chọn đáp án đúng 10 + 4 - 1', '', '', 1, 1, 3, 13, '2019-03-14 15:50:08', '2019-03-05 13:33:41'),
(42, 'radio', 1, 'HHQ50', 9, NULL, 'Chọn đáp án đúng 10 + 4 = ?', '', '', 2, 1, 1, 13, '2019-03-14 15:50:08', '2019-03-05 13:36:25'),
(43, 'radio', 1, 'HHQ50', 9, NULL, 'Chọn đáp án đúng 10 - 4 = ?', '', '', 2, 1, 1, 13, '2019-03-14 15:50:08', '2019-03-05 13:36:25'),
(44, 'radio', 1, 'HHQ50', 9, NULL, 'Chọn đáp án đúng 10 + 4 - 1 = ?', '', '', 2, 1, 3, 13, '2019-03-14 15:50:08', '2019-03-14 13:18:53'),
(45, 'radio', 1, 'HHQ50', 9, NULL, '10 + 10 = ?', '', '', 3, 1, 1, 13, '2019-03-14 15:50:08', '2019-03-05 13:39:32'),
(46, 'radio', 1, 'HHQ50', 9, NULL, 'An có 10 cái kẹo, chị An cho thêm 2 cái, hỏi An có tất cả bao nhiêu cái kẹo', '', '', 3, 1, 1, 13, '2019-03-14 15:50:08', '2019-03-05 13:39:32'),
(47, 'radio', 1, 'HHQ50', 9, NULL, 'Mít có 10 cái kẹo. Mít chia cho em một nửa, hỏi Mít còn bao nhiêu cái kẹo', '', '', 3, 1, 3, 13, '2019-03-14 15:50:08', '2019-03-05 13:39:32'),
(48, 'radio', 0, 'HHQ50', 9, 2, '10 + 10 = ?', '', '', 2, 1, 1, 13, '2019-03-14 15:50:08', '2019-03-05 13:40:03'),
(49, 'radio', 0, 'HHQ50', 9, 2, 'An có 10 cái kẹo, chị An cho thêm 2 cái, hỏi An có tất cả bao nhiêu cái kẹo', '', '', 3, 1, 1, 13, '2019-03-14 15:50:08', '2019-03-05 13:40:03'),
(50, 'radio', 0, 'HHQ50', 9, 2, 'Mít có 10 cái kẹo. Mít chia cho em một nửa, hỏi Mít còn bao nhiêu cái kẹo', '', '', 4, 1, 3, 13, '2019-03-14 15:50:08', '2019-03-05 13:40:03'),
(51, 'radio', 1, 'HHQ50', 9, 0, 'Làm phép tính 9 x 4 = ?', '', '', 4, 1, 2, 13, '2019-03-14 15:50:08', '2019-03-05 13:45:56'),
(52, 'radio', 1, 'HHQ50', 9, 0, 'Còn lại bao nhiêu cái kẹo khi chia 10 cái cho 4 bạn, mỗi bạn 2 cái kẹo', '', '', 4, 1, 4, 13, '2019-03-14 15:50:08', '2019-03-05 13:45:56'),
(53, 'radio', 1, 'HHQ50', 9, 0, 'Bạn Mít được 4 bạn cùng bàn mỗi người cho 2 cái kẹo, hỏi bạn Mít có bao nhiêu cái', '', '', 4, 1, 2, 13, '2019-03-14 15:50:08', '2019-03-05 13:45:56'),
(54, 'radio', 0, 'HHQ50', 9, 2, 'Làm phép tính 9 x 4 = ?', '', '', 4, 1, 2, 13, '2019-03-14 15:50:08', '2019-03-05 13:46:46'),
(55, 'radio', 0, 'HHQ50', 9, 2, 'Còn lại bao nhiêu cái kẹo khi chia 10 cái cho 4 bạn, mỗi bạn 2 cái kẹo', '', '', 4, 1, 4, 13, '2019-03-14 15:50:08', '2019-03-05 13:46:46'),
(56, 'radio', 0, 'HHQ50', 9, 2, 'Bạn Mít được 4 bạn cùng bàn mỗi người cho 2 cái kẹo, hỏi bạn Mít có bao nhiêu cái', '', '', 4, 1, 2, 13, '2019-03-14 15:50:08', '2019-03-05 13:46:46'),
(57, 'radio', 0, 'HHQ50', 9, 3, 'Làm phép tính 9 x 4 = ?', '', '', 1, 1, 2, 13, '2019-03-14 15:50:08', '2019-03-14 13:06:16'),
(58, 'radio', 0, 'HHQ50', 9, 3, 'Còn lại bao nhiêu cái kẹo khi chia 10 cái cho 4 bạn, mỗi bạn 2 cái kẹo', '', '', 1, 1, 4, 13, '2019-03-14 15:50:08', '2019-03-05 14:34:15'),
(59, 'radio', 0, 'HHQ50', 9, 3, 'Bạn Mít được 4 bạn cùng bàn mỗi người cho 2 cái kẹo, hỏi bạn Mít có bao nhiêu cái', '', '', 1, 1, 2, 13, '2019-03-14 15:50:08', '2019-03-05 14:34:15'),
(61, 'radio', 1, 'HHQ51', 15, NULL, 'tesst', 'tesst', NULL, 1, 1, 1, 13, '2019-03-14 15:50:08', '2019-03-14 15:34:54'),
(62, 'radio', 0, 'HHQ40', 1, NULL, '10 - 3 = ?', '10-3-=-+', NULL, 1, 1, 1, 13, '2019-03-14 15:50:08', '2019-03-14 15:36:12');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `m_chuyen_de`
--

CREATE TABLE `m_chuyen_de` (
  `id` int(11) NOT NULL,
  `course` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `class` smallint(2) NOT NULL,
  `subject` smallint(2) NOT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `alias` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `keywords` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `onpost` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `sort` tinyint(2) DEFAULT NULL,
  `user_id` int(5) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `week` smallint(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `m_chuyen_de`
--

INSERT INTO `m_chuyen_de` (`id`, `course`, `class`, `subject`, `name`, `alias`, `description`, `keywords`, `image`, `onpost`, `status`, `sort`, `user_id`, `created_at`, `updated_at`, `week`) VALUES
(1, 'HHQ40', 4, 1, 'Từ và động từ 1', 'tu-va-dong-tu-1', '<p>test</p>', NULL, NULL, 0, 1, NULL, 13, '2019-01-10 05:42:07', '2019-01-10 05:41:50', NULL),
(2, 'HHQ40', 4, 2, 'Số tự nhiên', 'so-tu-nhien', NULL, 'a', NULL, 0, 1, NULL, 13, '2019-01-10 05:35:30', '2019-01-10 05:35:30', NULL),
(3, 'HHQ51', 5, 2, 'Phân số', 'phan-so', NULL, NULL, NULL, 0, 1, 1, 13, '2019-02-28 15:00:52', '2019-02-28 15:00:52', NULL),
(4, 'HHQ51', 5, 2, 'Tỉ lệ', 'ti-le', NULL, NULL, NULL, 0, 1, 2, 13, '2019-04-02 13:20:37', '2019-04-02 13:20:37', 2),
(5, 'HHQ51', 5, 2, 'Số thập phân', 'so-thap-phan', NULL, NULL, NULL, 0, 1, 3, 13, '2019-04-02 13:20:30', '2019-04-02 13:20:30', 3),
(6, 'HHQ51', 5, 2, 'Tỉ số phần trăm', 'ti-so-phan-tram', NULL, NULL, NULL, 0, 1, 4, 13, '2019-04-02 13:20:17', '2019-04-02 13:20:17', 4),
(7, 'HHQ51', 5, 2, 'Hình học', 'hinh-hoc', NULL, NULL, NULL, 0, 1, 5, 13, '2019-04-02 13:20:10', '2019-04-02 13:20:10', 5),
(8, 'HHQ51', 5, 2, 'Chuyển động', 'chuyen-dong', NULL, NULL, NULL, 0, 1, 6, 13, '2019-04-02 13:19:56', '2019-04-02 13:19:56', 6),
(9, 'HHQ50', 5, 2, 'Phân số', 'phan-so', NULL, NULL, NULL, 0, 1, 1, 13, '2019-04-02 13:19:12', '2019-04-02 13:19:12', 1),
(10, 'HHQ50', 5, 2, 'Tỉ lệ', 'ti-le', NULL, NULL, NULL, 0, 1, 2, 13, '2019-04-02 13:19:21', '2019-04-02 13:19:21', 2),
(11, 'HHQ50', 5, 2, 'Số thập phân', 'so-thap-phan', NULL, NULL, NULL, 0, 1, 3, 13, '2019-04-02 13:19:27', '2019-04-02 13:19:27', 3),
(12, 'HHQ50', 5, 2, 'Tỉ số phần trăm', 'ti-so-phan-tram', NULL, NULL, NULL, 0, 1, 4, 13, '2019-04-02 13:19:33', '2019-04-02 13:19:33', 4),
(13, 'HHQ50', 5, 2, 'Hình học', 'hinh-hoc', NULL, NULL, NULL, 0, 1, 5, 13, '2019-04-02 13:19:38', '2019-04-02 13:19:38', 5),
(14, 'HHQ50', 5, 2, 'Chuyển động', 'chuyen-dong', NULL, NULL, NULL, 0, 1, 4, 13, '2019-04-02 13:19:43', '2019-04-02 13:19:43', 6),
(15, 'HHQ51', 5, 2, 'Ôn tập về giải toán', '0n-tap-ve-giai-toan', '<p>&Ocirc;n tập về giải to&aacute;n</p>', NULL, NULL, 0, 1, 7, 13, '2019-04-02 13:19:48', '2019-04-02 13:19:48', 7);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `m_exam`
--

CREATE TABLE `m_exam` (
  `id` smallint(2) NOT NULL,
  `type` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `alias` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `image` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `work_time` smallint(3) DEFAULT NULL,
  `number_quesstion` smallint(2) NOT NULL,
  `lv1` smallint(2) NOT NULL,
  `lv2` smallint(2) NOT NULL,
  `lv3` smallint(2) NOT NULL,
  `lv4` smallint(2) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `user_id` int(5) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `from_week` int(2) DEFAULT NULL,
  `to_week` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `m_exam`
--

INSERT INTO `m_exam` (`id`, `type`, `name`, `alias`, `description`, `image`, `work_time`, `number_quesstion`, `lv1`, `lv2`, `lv3`, `lv4`, `status`, `user_id`, `created_at`, `updated_at`, `from_week`, `to_week`) VALUES
(1, 'TUAN', 'Thi tuần', 'thi-tuan', NULL, NULL, 15, 10, 4, 3, 2, 1, 1, 13, '2019-02-13 05:46:33', '2019-02-13 05:46:33', NULL, NULL),
(2, 'HK10', 'Thi giữa học kỳ 1', '', NULL, '', 10, 6, 2, 2, 1, 1, 1, 13, '2019-04-10 14:44:48', '2019-04-10 14:44:48', 1, 10),
(3, 'HK11', 'Thi học kỳ 1', '', NULL, '', 30, 10, 4, 3, 2, 1, 1, 13, '2019-04-10 14:45:02', '2019-04-10 14:45:02', 1, 18),
(4, 'HK20', 'Thi giữa học kỳ 2', '', NULL, '', 30, 10, 4, 3, 2, 1, 1, 13, '2019-04-10 14:45:14', '2019-04-10 14:45:14', 19, 28),
(5, 'QUIZ', 'Luyện tập quiz theo bài học', 'luyen-tap-quiz-theo-bai-hoc', NULL, NULL, 10, 5, 2, 1, 1, 1, 1, 13, '2019-03-05 07:45:40', '2019-03-05 07:45:40', NULL, NULL),
(6, 'HK21', 'Thi học kỳ 2', '', NULL, '', 30, 10, 4, 3, 2, 1, 1, 13, '2019-04-10 14:45:29', '2019-04-10 14:45:29', 19, 35);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `m_giao_vien`
--

CREATE TABLE `m_giao_vien` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `avata` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `m_giao_vien`
--

INSERT INTO `m_giao_vien` (`id`, `user_id`, `name`, `email`, `phone`, `description`, `status`, `avata`, `created_at`, `updated_at`) VALUES
(1, 13, 'Đặng Thế Hiếu', 'dangthehieu80@gmail.com', '097852148', '<p>Người truyền cảm hứng to&aacute;n học cho h&agrave;ng ngh&igrave;n học sinh tr&ecirc;n cả nước, gi&uacute;p tr&ecirc;n 2000 học sinh tr&ecirc;n cả nước luyện thi v&agrave; đỗ v&agrave;o c&aacute;c trường chuy&ecirc;n chất lượng cao trong c&aacute;c k&igrave; thi tuyển sinh Trung học cơ sở v&agrave; Trung học phổ th&ocirc;ng.</p>', 1, 'public/uploads/images/201903/bsyXGO10mo.jpg', '2019-03-29 13:50:46', '2019-03-29 13:50:46'),
(2, 13, 'Nguyễn Thị Hợi', 'congdantoancau2018@gmail.com', '097852149654', NULL, 1, 'public/uploads/images/201903/gIfxovPmFk.jpg', '2019-03-29 13:50:41', '2019-03-29 13:50:41'),
(3, 13, 'Binh Minh', 'chienhn@vitduct.com.vn', '097852149654', '<p>tét</p>', 1, 'public/uploads/images/201903/ooIZ3RXQWd.jpg', '2019-03-29 13:50:35', '2019-03-29 13:50:35');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `m_ket_qua_quiz`
--

CREATE TABLE `m_ket_qua_quiz` (
  `id` int(11) NOT NULL,
  `type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `result` tinyint(3) DEFAULT NULL,
  `description` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` tinytext COLLATE utf8_unicode_ci,
  `course` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thematic` int(5) DEFAULT NULL,
  `lesson` int(5) DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `kq` smallint(2) DEFAULT '0',
  `total` smallint(2) DEFAULT '0',
  `success` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `week` int(2) DEFAULT NULL,
  `periods` int(2) DEFAULT NULL,
  `subject` int(2) DEFAULT NULL,
  `token` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `m_ket_qua_quiz`
--

INSERT INTO `m_ket_qua_quiz` (`id`, `type`, `user_id`, `result`, `description`, `comment`, `course`, `thematic`, `lesson`, `status`, `kq`, `total`, `success`, `created_at`, `updated_at`, `week`, `periods`, `subject`, `token`) VALUES
(97, 'QUIZ', 17, 0, '', 'QUIZ', 'HHQ50', 9, 3, 1, 2, 2, 1, '2019-03-05 14:54:42', '2019-03-05 14:54:51', 0, NULL, NULL, NULL),
(99, 'QUIZ', 17, 0, '', 'QUIZ', 'HHQ50', 9, 3, 1, 1, 2, 0, '2019-03-05 15:01:35', '2019-03-05 15:01:51', 0, NULL, NULL, NULL),
(100, 'QUIZ', 17, 0, '', 'QUIZ', 'HHQ50', 9, 2, 1, 2, 5, 0, '2019-03-05 15:06:14', '2019-03-05 15:06:26', 0, NULL, NULL, NULL),
(105, 'CHUYENDE', 17, 0, '', 'CHUYENDE', 'HHQ50', 9, 0, 1, 1, 1, 1, '2019-03-08 14:22:14', '2019-03-08 14:22:20', 0, NULL, NULL, NULL),
(108, 'QUIZ', 18, 0, '', 'QUIZ', 'HHQ50', 9, 2, 1, 0, 5, 0, '2019-03-11 09:13:55', '2019-03-11 09:14:07', 0, NULL, NULL, NULL),
(114, 'QUIZ', 19, 0, '', 'QUIZ', 'HHQ50', 9, 2, 1, 4, 5, 1, '2019-03-12 01:45:03', '2019-03-12 01:45:22', 0, NULL, NULL, NULL),
(121, 'QUIZ', 19, 0, '', 'QUIZ', 'HHQ50', 9, 3, 0, 0, 2, 0, '2019-03-12 02:52:20', '2019-03-12 02:52:20', 0, NULL, NULL, NULL),
(123, 'QUIZ', 19, 0, '', 'QUIZ', 'HHQ50', 9, 2, 0, 0, 5, 0, '2019-03-12 02:54:37', '2019-03-12 02:54:37', 0, NULL, NULL, NULL),
(127, 'QUIZ', 20, 0, '', 'QUIZ', 'HHQ50', 9, 2, 1, 4, 5, 1, '2019-03-14 15:50:13', '2019-03-14 15:50:33', 0, NULL, NULL, NULL),
(135, 'QUIZ', 20, 0, '', 'QUIZ', 'HHQ50', 9, 2, 1, 4, 5, 1, '2019-03-14 15:59:04', '2019-03-14 15:59:14', 0, NULL, NULL, NULL),
(140, 'QUIZ', 20, 0, '', 'QUIZ', 'HHQ50', 9, 3, 0, 0, 2, 0, '2019-04-01 13:19:16', '2019-04-01 13:19:16', 0, NULL, NULL, NULL),
(142, 'QUIZ', 22, 0, '', 'QUIZ', 'HHQ50', 9, 2, 0, 0, 5, 0, '2019-04-01 23:42:02', '2019-04-01 23:42:02', 0, NULL, NULL, NULL),
(177, 'QUIZ', 20, 0, '', 'QUIZ', 'HHQ50', 9, 2, 1, 4, 5, 1, '2019-04-02 15:54:05', '2019-04-02 15:54:22', 0, 0, 2, NULL),
(196, 'QUIZ', 20, 0, '', 'QUIZ', 'HHQ50', 9, 2, 0, 0, 5, 0, '2019-04-02 23:40:09', '2019-04-02 23:40:09', 0, 0, 2, 'O'),
(197, 'QUIZ', 20, 0, '', 'QUIZ', 'HHQ50', 9, 2, 0, 0, 5, 0, '2019-04-02 23:42:02', '2019-04-02 23:42:02', 0, 0, 2, 'K4Nyq82bgP'),
(198, 'QUIZ', 20, 0, '', 'QUIZ', 'HHQ50', 9, 2, 1, 0, 5, 0, '2019-04-02 23:42:28', '2019-04-02 23:59:41', 0, 0, 2, '6HT4OwBpjG'),
(204, 'QUIZ', 20, 0, '', 'QUIZ', 'HHQ50', 9, 2, 0, 0, 5, 0, '2019-04-03 00:21:41', '2019-04-03 00:21:41', 0, 0, 2, '1iAm9DcSG0'),
(205, 'TUAN', 20, 0, '', 'TUAN', 'HHQ50', 0, 0, 1, 2, 9, 0, '2019-04-03 00:23:17', '2019-04-03 00:38:21', 1, 0, 2, '9yAF7hIMtdaoHnr'),
(207, 'TUAN', 20, 0, '', 'TUAN', 'HHQ50', 0, 0, 1, 1, 9, 0, '2019-04-03 00:38:56', '2019-04-03 00:39:10', 1, 0, 2, 'R3ta0m1xoe4VK5I'),
(208, 'QUIZ', 13, 0, '', 'QUIZ', 'HHQ50', 9, 2, 0, 0, 5, 0, '2019-04-03 02:50:20', '2019-04-03 02:50:20', 0, 0, 2, 'lIXAsP9mNC'),
(209, 'TUAN', 13, 0, '', 'TUAN', 'HHQ50', 0, 0, 1, 2, 9, 0, '2019-04-03 02:50:41', '2019-04-03 03:14:10', 1, 0, 2, 'Y6NnvI7tCk18g2E'),
(210, 'TUAN', 13, 0, '', 'TUAN', 'HHQ50', 0, 0, 1, 1, 9, 0, '2019-04-03 03:20:03', '2019-04-03 03:21:56', 1, 0, 2, 'rwfXkJeLnjCNib2'),
(211, 'TUAN', 13, 0, '', 'TUAN', 'HHQ50', 0, 0, 1, 9, 9, 1, '2019-04-03 03:38:16', '2019-04-03 05:37:18', 1, 0, 2, 'PypGers8O4jFXBaoEAJQ'),
(212, 'QUIZ', 13, 0, '', 'QUIZ', 'HHQ50', 9, 2, 1, 1, 5, 0, '2019-04-03 07:10:20', '2019-04-03 07:10:30', 0, 0, 2, 'fu5IWUPpOveDtFZkmNnx'),
(213, 'QUIZ', 13, 0, '', 'QUIZ', 'HHQ50', 9, 2, 1, 5, 5, 1, '2019-04-03 08:19:39', '2019-04-03 08:22:49', 0, 0, 2, 'qvNF52AlUyg1YPZoSpVO'),
(214, 'TUAN', 13, 0, '', 'TUAN', 'HHQ50', 0, 0, 1, 2, 9, 0, '2019-04-03 08:23:06', '2019-04-03 08:23:18', 1, 0, 2, 'zn2qYpohmbUBN9ePawGA'),
(216, 'HK10', 20, 0, '', 'HK10', 'HHQ50', 0, 0, 1, 4, 4, 1, '2019-04-10 15:29:10', '2019-04-10 15:47:01', 0, 10, 0, 'hzutLkqWPJi24HRTbCVO'),
(218, 'HK11', 20, 0, '', 'HK11', 'HHQ50', 0, 0, 1, 3, 3, 1, '2019-04-10 16:05:50', '2019-04-10 16:06:05', 0, 11, 0, '6n1Jyo3CL2DYRirztXlI');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `m_ket_qua_quiz_question`
--

CREATE TABLE `m_ket_qua_quiz_question` (
  `id` int(11) NOT NULL,
  `quiz_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `answer` tinyint(2) DEFAULT NULL,
  `comment` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `result` tinyint(1) NOT NULL,
  `answer_time` float DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `m_ket_qua_quiz_question`
--

INSERT INTO `m_ket_qua_quiz_question` (`id`, `quiz_id`, `question_id`, `answer`, `comment`, `result`, `answer_time`, `created_at`, `updated_at`) VALUES
(397, 97, 57, 2, '', 2, 0, '2019-03-05 14:54:51', '2019-03-05 14:54:51'),
(398, 97, 58, 4, '', 4, 0, '2019-03-05 14:54:51', '2019-03-05 14:54:51'),
(401, 99, 57, 2, '', 2, 0, '2019-03-05 15:01:50', '2019-03-05 15:01:50'),
(402, 99, 58, 2, '', 4, 0, '2019-03-05 15:01:50', '2019-03-05 15:01:50'),
(403, 100, 33, 4, '', 1, 0, '2019-03-05 15:06:26', '2019-03-05 15:06:26'),
(404, 100, 35, 4, '', 3, 0, '2019-03-05 15:06:26', '2019-03-05 15:06:26'),
(405, 100, 48, 3, '', 1, 0, '2019-03-05 15:06:26', '2019-03-05 15:06:26'),
(406, 100, 49, 1, '', 1, 0, '2019-03-05 15:06:26', '2019-03-05 15:06:26'),
(407, 100, 54, 2, '', 2, 0, '2019-03-05 15:06:26', '2019-03-05 15:06:26'),
(410, 105, 51, 2, '', 2, 0, '2019-03-08 14:22:20', '2019-03-08 14:22:20'),
(411, 108, 34, 2, '', 1, 0, '2019-03-11 09:14:07', '2019-03-11 09:14:07'),
(412, 108, 35, 2, '', 3, 0, '2019-03-11 09:14:07', '2019-03-11 09:14:07'),
(413, 108, 48, 2, '', 1, 0, '2019-03-11 09:14:07', '2019-03-11 09:14:07'),
(414, 108, 49, 2, '', 1, 0, '2019-03-11 09:14:07', '2019-03-11 09:14:07'),
(415, 108, 55, 1, '', 4, 0, '2019-03-11 09:14:07', '2019-03-11 09:14:07'),
(441, 114, 34, 2, '', 1, 0, '2019-03-12 01:45:22', '2019-03-12 01:45:22'),
(442, 114, 33, 1, '', 1, 0, '2019-03-12 01:45:22', '2019-03-12 01:45:22'),
(443, 114, 48, 1, '', 1, 0, '2019-03-12 01:45:22', '2019-03-12 01:45:22'),
(444, 114, 49, 1, '', 1, 0, '2019-03-12 01:45:22', '2019-03-12 01:45:22'),
(445, 114, 55, 4, '', 4, 0, '2019-03-12 01:45:22', '2019-03-12 01:45:22'),
(464, 121, 59, 0, '', 2, 0, '2019-03-12 02:52:20', '2019-03-12 02:52:20'),
(465, 121, 58, 0, '', 4, 0, '2019-03-12 02:52:20', '2019-03-12 02:52:20'),
(471, 123, 34, 0, '', 1, 0, '2019-03-12 02:54:37', '2019-03-12 02:54:37'),
(472, 123, 33, 0, '', 1, 0, '2019-03-12 02:54:37', '2019-03-12 02:54:37'),
(473, 123, 48, 0, '', 1, 0, '2019-03-12 02:54:37', '2019-03-12 02:54:37'),
(474, 123, 49, 0, '', 1, 0, '2019-03-12 02:54:37', '2019-03-12 02:54:37'),
(475, 123, 55, 0, '', 4, 0, '2019-03-12 02:54:37', '2019-03-12 02:54:37'),
(481, 127, 35, 3, '', 3, 0, '2019-03-14 15:50:33', '2019-03-14 15:50:33'),
(482, 127, 34, 1, '', 1, 0, '2019-03-14 15:50:33', '2019-03-14 15:50:33'),
(483, 127, 48, 1, '', 1, 0, '2019-03-14 15:50:33', '2019-03-14 15:50:33'),
(484, 127, 49, 4, '', 1, 0, '2019-03-14 15:50:33', '2019-03-14 15:50:33'),
(485, 127, 54, 2, '', 2, 0, '2019-03-14 15:50:33', '2019-03-14 15:50:33'),
(521, 135, 33, 1, '', 1, 0, '2019-03-14 15:59:14', '2019-03-14 15:59:14'),
(522, 135, 34, 1, '', 1, 0, '2019-03-14 15:59:14', '2019-03-14 15:59:14'),
(523, 135, 48, 2, '', 1, 0, '2019-03-14 15:59:14', '2019-03-14 15:59:14'),
(524, 135, 49, 1, '', 1, 0, '2019-03-14 15:59:14', '2019-03-14 15:59:14'),
(525, 135, 56, 2, '', 2, 0, '2019-03-14 15:59:14', '2019-03-14 15:59:14'),
(546, 140, 58, 0, '', 4, 0, '2019-04-01 13:19:16', '2019-04-01 13:19:16'),
(547, 140, 57, 0, '', 2, 0, '2019-04-01 13:19:16', '2019-04-01 13:19:16'),
(553, 142, 33, 0, '', 1, 0, '2019-04-01 23:42:02', '2019-04-01 23:42:02'),
(554, 142, 35, 0, '', 3, 0, '2019-04-01 23:42:02', '2019-04-01 23:42:02'),
(555, 142, 48, 0, '', 1, 0, '2019-04-01 23:42:02', '2019-04-01 23:42:02'),
(556, 142, 49, 0, '', 1, 0, '2019-04-01 23:42:02', '2019-04-01 23:42:02'),
(557, 142, 55, 0, '', 4, 0, '2019-04-01 23:42:02', '2019-04-01 23:42:02'),
(825, 177, 35, 2, '', 3, 0, '2019-04-02 15:54:22', '2019-04-02 15:54:22'),
(826, 177, 34, 1, '', 1, 0, '2019-04-02 15:54:22', '2019-04-02 15:54:22'),
(827, 177, 48, 1, '', 1, 0, '2019-04-02 15:54:22', '2019-04-02 15:54:22'),
(828, 177, 49, 1, '', 1, 0, '2019-04-02 15:54:22', '2019-04-02 15:54:22'),
(829, 177, 54, 2, '', 2, 0, '2019-04-02 15:54:22', '2019-04-02 15:54:22'),
(899, 187, 34, 0, '', 1, 0, '2019-04-02 22:30:16', '2019-04-02 22:30:16'),
(900, 187, 33, 0, '', 1, 0, '2019-04-02 22:30:16', '2019-04-02 22:30:16'),
(901, 187, 48, 0, '', 1, 0, '2019-04-02 22:30:16', '2019-04-02 22:30:16'),
(902, 187, 49, 0, '', 1, 0, '2019-04-02 22:30:16', '2019-04-02 22:30:16'),
(903, 187, 55, 0, '', 4, 0, '2019-04-02 22:30:16', '2019-04-02 22:30:16'),
(904, 188, 34, 0, '', 1, 0, '2019-04-02 22:30:42', '2019-04-02 22:30:42'),
(905, 188, 35, 0, '', 3, 0, '2019-04-02 22:30:42', '2019-04-02 22:30:42'),
(906, 188, 48, 0, '', 1, 0, '2019-04-02 22:30:42', '2019-04-02 22:30:42'),
(907, 188, 49, 0, '', 1, 0, '2019-04-02 22:30:42', '2019-04-02 22:30:42'),
(908, 188, 50, 0, '', 3, 0, '2019-04-02 22:30:42', '2019-04-02 22:30:42'),
(909, 189, 33, 0, '', 1, 0, '2019-04-02 22:30:44', '2019-04-02 22:30:44'),
(910, 189, 35, 0, '', 3, 0, '2019-04-02 22:30:44', '2019-04-02 22:30:44'),
(911, 189, 48, 0, '', 1, 0, '2019-04-02 22:30:44', '2019-04-02 22:30:44'),
(912, 189, 49, 0, '', 1, 0, '2019-04-02 22:30:44', '2019-04-02 22:30:44'),
(913, 189, 50, 0, '', 3, 0, '2019-04-02 22:30:44', '2019-04-02 22:30:44'),
(919, 191, 35, 0, '', 3, 0, '2019-04-02 22:50:08', '2019-04-02 22:50:08'),
(920, 191, 34, 0, '', 1, 0, '2019-04-02 22:50:08', '2019-04-02 22:50:08'),
(921, 191, 48, 0, '', 1, 0, '2019-04-02 22:50:08', '2019-04-02 22:50:08'),
(922, 191, 49, 0, '', 1, 0, '2019-04-02 22:50:08', '2019-04-02 22:50:08'),
(923, 191, 55, 0, '', 4, 0, '2019-04-02 22:50:08', '2019-04-02 22:50:08'),
(929, 193, 34, 0, '', 1, 0, '2019-04-02 22:50:19', '2019-04-02 22:50:19'),
(930, 193, 35, 0, '', 3, 0, '2019-04-02 22:50:19', '2019-04-02 22:50:19'),
(931, 193, 48, 0, '', 1, 0, '2019-04-02 22:50:19', '2019-04-02 22:50:19'),
(932, 193, 49, 0, '', 1, 0, '2019-04-02 22:50:19', '2019-04-02 22:50:19'),
(933, 193, 54, 0, '', 2, 0, '2019-04-02 22:50:19', '2019-04-02 22:50:19'),
(939, 195, 34, 0, '', 1, 0, '2019-04-02 22:50:29', '2019-04-02 22:50:29'),
(940, 195, 33, 0, '', 1, 0, '2019-04-02 22:50:29', '2019-04-02 22:50:29'),
(941, 195, 48, 0, '', 1, 0, '2019-04-02 22:50:29', '2019-04-02 22:50:29'),
(942, 195, 49, 0, '', 1, 0, '2019-04-02 22:50:29', '2019-04-02 22:50:29'),
(943, 195, 54, 0, '', 2, 0, '2019-04-02 22:50:29', '2019-04-02 22:50:29'),
(944, 196, 34, 0, '', 1, 0, '2019-04-02 23:40:09', '2019-04-02 23:40:09'),
(945, 196, 33, 0, '', 1, 0, '2019-04-02 23:40:09', '2019-04-02 23:40:09'),
(946, 196, 48, 0, '', 1, 0, '2019-04-02 23:40:09', '2019-04-02 23:40:09'),
(947, 196, 49, 0, '', 1, 0, '2019-04-02 23:40:09', '2019-04-02 23:40:09'),
(948, 196, 50, 0, '', 3, 0, '2019-04-02 23:40:09', '2019-04-02 23:40:09'),
(949, 197, 35, 0, '', 3, 0, '2019-04-02 23:42:02', '2019-04-02 23:42:02'),
(950, 197, 34, 0, '', 1, 0, '2019-04-02 23:42:02', '2019-04-02 23:42:02'),
(951, 197, 48, 0, '', 1, 0, '2019-04-02 23:42:02', '2019-04-02 23:42:02'),
(952, 197, 49, 0, '', 1, 0, '2019-04-02 23:42:02', '2019-04-02 23:42:02'),
(953, 197, 50, 0, '', 3, 0, '2019-04-02 23:42:02', '2019-04-02 23:42:02'),
(954, 198, 35, 2, '', 3, 0, '2019-04-02 23:59:41', '2019-04-02 23:59:41'),
(955, 198, 34, 99, '', 1, 0, '2019-04-02 23:59:41', '2019-04-02 23:59:41'),
(956, 198, 48, 99, '', 1, 0, '2019-04-02 23:59:41', '2019-04-02 23:59:41'),
(957, 198, 49, 99, '', 1, 0, '2019-04-02 23:59:41', '2019-04-02 23:59:41'),
(958, 198, 54, 1, '', 2, 0, '2019-04-02 23:59:41', '2019-04-02 23:59:41'),
(959, 199, 35, 0, '', 3, 0, '2019-04-02 23:44:14', '2019-04-02 23:44:14'),
(960, 199, 34, 0, '', 1, 0, '2019-04-02 23:44:14', '2019-04-02 23:44:14'),
(961, 199, 48, 0, '', 1, 0, '2019-04-02 23:44:14', '2019-04-02 23:44:14'),
(962, 199, 49, 0, '', 1, 0, '2019-04-02 23:44:14', '2019-04-02 23:44:14'),
(963, 199, 55, 0, '', 4, 0, '2019-04-02 23:44:14', '2019-04-02 23:44:14'),
(964, 200, 34, 0, '', 1, 0, '2019-04-02 23:44:31', '2019-04-02 23:44:31'),
(965, 200, 35, 0, '', 3, 0, '2019-04-02 23:44:31', '2019-04-02 23:44:31'),
(966, 200, 48, 0, '', 1, 0, '2019-04-02 23:44:31', '2019-04-02 23:44:31'),
(967, 200, 49, 0, '', 1, 0, '2019-04-02 23:44:31', '2019-04-02 23:44:31'),
(968, 200, 55, 0, '', 4, 0, '2019-04-02 23:44:31', '2019-04-02 23:44:31'),
(969, 204, 34, 0, '', 1, 0, '2019-04-03 00:21:41', '2019-04-03 00:21:41'),
(970, 204, 33, 0, '', 1, 0, '2019-04-03 00:21:41', '2019-04-03 00:21:41'),
(971, 204, 48, 0, '', 1, 0, '2019-04-03 00:21:41', '2019-04-03 00:21:41'),
(972, 204, 49, 0, '', 1, 0, '2019-04-03 00:21:41', '2019-04-03 00:21:41'),
(973, 204, 55, 0, '', 4, 0, '2019-04-03 00:21:41', '2019-04-03 00:21:41'),
(974, 205, 37, 2, '', 1, 0, '2019-04-03 00:38:21', '2019-04-03 00:23:17'),
(975, 205, 38, 2, '', 3, 0, '2019-04-03 00:38:21', '2019-04-03 00:23:17'),
(976, 205, 36, 1, '', 1, 0, '2019-04-03 00:38:21', '2019-04-03 00:23:17'),
(977, 205, 43, 2, '', 1, 0, '2019-04-03 00:38:21', '2019-04-03 00:23:17'),
(978, 205, 42, 2, '', 1, 0, '2019-04-03 00:38:21', '2019-04-03 00:23:17'),
(979, 205, 44, 2, '', 3, 0, '2019-04-03 00:38:21', '2019-04-03 00:23:17'),
(980, 205, 45, 2, '', 1, 0, '2019-04-03 00:38:21', '2019-04-03 00:23:17'),
(981, 205, 47, 3, '', 3, 0, '2019-04-03 00:38:21', '2019-04-03 00:23:17'),
(982, 205, 53, 1, '', 2, 0, '2019-04-03 00:36:22', '2019-04-03 00:23:17'),
(983, 207, 37, 2, '', 1, 0, '2019-04-03 00:39:10', '2019-04-03 00:39:10'),
(984, 207, 36, 3, '', 1, 0, '2019-04-03 00:39:10', '2019-04-03 00:39:10'),
(985, 207, 38, 2, '', 3, 0, '2019-04-03 00:39:10', '2019-04-03 00:39:10'),
(986, 207, 42, 2, '', 1, 0, '2019-04-03 00:39:10', '2019-04-03 00:39:10'),
(987, 207, 44, 2, '', 3, 0, '2019-04-03 00:39:10', '2019-04-03 00:39:10'),
(988, 207, 43, 2, '', 1, 0, '2019-04-03 00:39:10', '2019-04-03 00:39:10'),
(989, 207, 47, 3, '', 3, 0, '2019-04-03 00:39:10', '2019-04-03 00:39:10'),
(990, 207, 45, 3, '', 1, 0, '2019-04-03 00:39:10', '2019-04-03 00:39:10'),
(991, 207, 51, 1, '', 2, 0, '2019-04-03 00:39:10', '2019-04-03 00:39:10'),
(992, 208, 33, 0, '', 1, 0, '2019-04-03 02:50:20', '2019-04-03 02:50:20'),
(993, 208, 35, 0, '', 3, 0, '2019-04-03 02:50:20', '2019-04-03 02:50:20'),
(994, 208, 48, 0, '', 1, 0, '2019-04-03 02:50:20', '2019-04-03 02:50:20'),
(995, 208, 49, 0, '', 1, 0, '2019-04-03 02:50:20', '2019-04-03 02:50:20'),
(996, 208, 55, 0, '', 4, 0, '2019-04-03 02:50:20', '2019-04-03 02:50:20'),
(997, 209, 37, 2, '', 1, 0, '2019-04-03 03:14:09', '2019-04-03 03:14:09'),
(998, 209, 36, 4, '', 1, 0, '2019-04-03 03:14:09', '2019-04-03 03:14:09'),
(999, 209, 38, 2, '', 3, 0, '2019-04-03 03:14:09', '2019-04-03 03:14:09'),
(1000, 209, 42, 2, '', 1, 0, '2019-04-03 03:14:09', '2019-04-03 03:14:09'),
(1001, 209, 43, 2, '', 1, 0, '2019-04-03 03:14:09', '2019-04-03 03:14:09'),
(1002, 209, 44, 2, '', 3, 0, '2019-04-03 03:14:09', '2019-04-03 03:14:09'),
(1003, 209, 46, 1, '', 1, 0, '2019-04-03 03:14:09', '2019-04-03 03:14:09'),
(1004, 209, 47, 3, '', 3, 0, '2019-04-03 03:14:09', '2019-04-03 03:14:09'),
(1005, 209, 51, 1, '', 2, 0, '2019-04-03 03:14:09', '2019-04-03 03:14:09'),
(1006, 210, 38, 2, '', 3, 0, '2019-04-03 03:21:56', '2019-04-03 03:21:56'),
(1007, 210, 36, 3, '', 1, 0, '2019-04-03 03:21:56', '2019-04-03 03:21:56'),
(1008, 210, 37, 2, '', 1, 0, '2019-04-03 03:21:56', '2019-04-03 03:21:56'),
(1009, 210, 43, 2, '', 1, 0, '2019-04-03 03:21:56', '2019-04-03 03:21:56'),
(1010, 210, 42, 3, '', 1, 0, '2019-04-03 03:21:56', '2019-04-03 03:21:56'),
(1011, 210, 44, 2, '', 3, 0, '2019-04-03 03:21:56', '2019-04-03 03:21:56'),
(1012, 210, 46, 1, '', 1, 0, '2019-04-03 03:21:56', '2019-04-03 03:21:56'),
(1013, 210, 45, 2, '', 1, 0, '2019-04-03 03:21:56', '2019-04-03 03:21:56'),
(1014, 210, 53, 4, '', 2, 0, '2019-04-03 03:21:56', '2019-04-03 03:21:56'),
(1015, 211, 36, 1, '', 1, 0, '2019-04-03 05:37:18', '2019-04-03 05:37:18'),
(1016, 211, 38, 3, '', 3, 0, '2019-04-03 05:37:18', '2019-04-03 05:37:18'),
(1017, 211, 37, 1, '', 1, 0, '2019-04-03 05:37:18', '2019-04-03 05:37:18'),
(1018, 211, 42, 1, '', 1, 0, '2019-04-03 05:37:18', '2019-04-03 05:37:18'),
(1019, 211, 43, 1, '', 1, 0, '2019-04-03 05:37:18', '2019-04-03 05:37:18'),
(1020, 211, 44, 3, '', 3, 0, '2019-04-03 05:37:18', '2019-04-03 05:37:18'),
(1021, 211, 46, 1, '', 1, 0, '2019-04-03 05:37:18', '2019-04-03 05:37:18'),
(1022, 211, 45, 1, '', 1, 0, '2019-04-03 05:37:18', '2019-04-03 05:37:18'),
(1023, 211, 53, 2, '', 2, 0, '2019-04-03 05:37:18', '2019-04-03 05:37:18'),
(1024, 212, 35, 2, '', 3, 0, '2019-04-03 07:10:30', '2019-04-03 07:10:30'),
(1025, 212, 34, 2, '', 1, 0, '2019-04-03 07:10:30', '2019-04-03 07:10:30'),
(1026, 212, 48, 1, '', 1, 0, '2019-04-03 07:10:30', '2019-04-03 07:10:30'),
(1027, 212, 49, 2, '', 1, 0, '2019-04-03 07:10:30', '2019-04-03 07:10:30'),
(1028, 212, 55, 1, '', 4, 0, '2019-04-03 07:10:30', '2019-04-03 07:10:30'),
(1029, 213, 33, 1, '', 1, 0, '2019-04-03 08:22:49', '2019-04-03 08:22:49'),
(1030, 213, 35, 3, '', 3, 0, '2019-04-03 08:22:49', '2019-04-03 08:22:49'),
(1031, 213, 48, 1, '', 1, 0, '2019-04-03 08:22:49', '2019-04-03 08:22:49'),
(1032, 213, 49, 1, '', 1, 0, '2019-04-03 08:22:49', '2019-04-03 08:22:49'),
(1033, 213, 50, 3, '', 3, 0, '2019-04-03 08:22:49', '2019-04-03 08:22:49'),
(1034, 214, 38, 3, '', 3, 0, '2019-04-03 08:23:18', '2019-04-03 08:23:18'),
(1035, 214, 37, 3, '', 1, 0, '2019-04-03 08:23:18', '2019-04-03 08:23:18'),
(1036, 214, 36, 3, '', 1, 0, '2019-04-03 08:23:18', '2019-04-03 08:23:18'),
(1037, 214, 43, 3, '', 1, 0, '2019-04-03 08:23:18', '2019-04-03 08:23:18'),
(1038, 214, 44, 3, '', 3, 0, '2019-04-03 08:23:18', '2019-04-03 08:23:18'),
(1039, 214, 42, 3, '', 1, 0, '2019-04-03 08:23:18', '2019-04-03 08:23:18'),
(1040, 214, 45, 2, '', 1, 0, '2019-04-03 08:23:18', '2019-04-03 08:23:18'),
(1041, 214, 47, 2, '', 3, 0, '2019-04-03 08:23:18', '2019-04-03 08:23:18'),
(1042, 214, 52, 1, '', 4, 0, '2019-04-03 08:23:18', '2019-04-03 08:23:18'),
(1043, 216, 37, 1, '', 1, 0, '2019-04-10 15:47:01', '2019-04-10 15:47:01'),
(1044, 216, 38, 3, '', 3, 0, '2019-04-10 15:47:01', '2019-04-10 15:47:01'),
(1045, 216, 43, 1, '', 1, 0, '2019-04-10 15:47:01', '2019-04-10 15:47:01'),
(1046, 216, 42, 1, '', 1, 0, '2019-04-10 15:47:01', '2019-04-10 15:47:01'),
(1053, 218, 36, 1, '', 1, 0, '2019-04-10 16:06:05', '2019-04-10 16:06:05'),
(1054, 218, 37, 1, '', 1, 0, '2019-04-10 16:06:05', '2019-04-10 16:06:05'),
(1055, 218, 38, 3, '', 3, 0, '2019-04-10 16:06:05', '2019-04-10 16:06:05');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `m_khoahoc_monhoc`
--

CREATE TABLE `m_khoahoc_monhoc` (
  `id` int(5) NOT NULL,
  `course` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `subject` smallint(2) NOT NULL,
  `alias` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `onpost` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `user_id` int(5) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `m_khoahoc_monhoc`
--

INSERT INTO `m_khoahoc_monhoc` (`id`, `course`, `subject`, `alias`, `image`, `onpost`, `status`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'HHQ40', 1, '', NULL, 0, 1, 13, '2019-01-09 10:51:00', '2019-01-09 10:51:00'),
(2, 'HHQ40', 2, '', NULL, 0, 1, 13, '2019-01-10 02:49:55', '2019-01-10 02:49:55'),
(10, 'HHQ51', 1, '', NULL, 0, 1, 13, '2019-01-10 05:45:33', '2019-01-10 05:45:33'),
(11, 'HHQ50', 2, '', NULL, 0, 1, 13, '2019-01-10 06:54:27', '2019-01-10 06:54:27'),
(12, 'HHQ51', 2, '', NULL, 0, 1, 13, '2019-01-21 15:15:01', '2019-01-21 15:15:01'),
(13, 'HHQ41', 1, '', 'public/uploads/images/201903/c8g1AYLgjY.png', 0, 1, 13, '2019-03-11 02:24:18', '2019-03-11 02:24:18');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `m_khoa_hoc`
--

CREATE TABLE `m_khoa_hoc` (
  `id` int(3) NOT NULL,
  `code` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `course` tinyint(1) NOT NULL,
  `class` smallint(2) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `full_name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alias` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `image` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `onpost` tinyint(1) DEFAULT '0',
  `unit_price` mediumint(7) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `user_id` int(5) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `m_khoa_hoc`
--

INSERT INTO `m_khoa_hoc` (`id`, `code`, `course`, `class`, `name`, `full_name`, `alias`, `description`, `image`, `onpost`, `unit_price`, `status`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'HHQ50', 0, 5, 'Cơ bản', 'Lớp 5 - Cơ bản', 'co-ban', '<p>Kh&oacute;a học gi&uacute;p học sinh chinh phục được khối kiến thức <strong>Cơ bản</strong>&nbsp;của m&ocirc;n <strong>To&aacute;n </strong>v&agrave; <strong>Tiếng Việt lớp 4.</strong></p>', 'public/uploads/images/201903/chjwu2tKzm.jpg', 0, 500000, 1, 13, '2019-03-29 13:52:01', '2019-03-29 13:52:01'),
(4, 'HHQ51', 1, 5, 'Nâng cao', 'Lớp 5 - Nâng cao', 'nang-cao', '<p>Kh&oacute;a học gi&uacute;p học sinh chinh phục được khối kiến thức <strong>N&acirc;ng cao</strong>&nbsp;của m&ocirc;n <strong>To&aacute;n </strong>v&agrave; <strong>Tiếng Việt lớp 5.</strong></p>', 'public/uploads/images/201903/uqWBSI2iEE.jpg', 0, 0, 1, 13, '2019-03-29 13:51:56', '2019-03-29 13:51:56'),
(5, 'HHQ40', 0, 4, 'Cơ bản', 'Lớp 4 - Cơ bản', 'co-ban', '<p>Kh&oacute;a học gi&uacute;p học sinh chinh phục được khối kiến thức <strong>Cơ bản</strong>&nbsp;của m&ocirc;n <strong>To&aacute;n </strong>v&agrave; <strong>Tiếng Việt lớp 4.</strong></p>', 'public/uploads/images/201903/rFqwYVe90V.jpg', 0, 0, 1, 13, '2019-03-29 13:51:50', '2019-03-29 13:51:50'),
(6, 'HHQ41', 1, 4, 'Nâng cao', 'Lớp 4 - Nâng cao', 'nang-cao', '<p>Kh&oacute;a học gi&uacute;p học sinh chinh phục được khối kiến thức <strong>N&acirc;ng cao</strong>&nbsp;của m&ocirc;n <strong>To&aacute;n </strong>v&agrave; <strong>Tiếng Việt lớp 4.</strong></p>', 'public/uploads/images/201903/boAtkdoz7B.jpg', 0, 0, 1, 13, '2019-03-29 13:51:43', '2019-03-29 13:51:43');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `m_lop_hoc`
--

CREATE TABLE `m_lop_hoc` (
  `id` int(11) NOT NULL,
  `code` char(4) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `note` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `m_lop_hoc`
--

INSERT INTO `m_lop_hoc` (`id`, `code`, `name`, `note`) VALUES
(1, 'LO01', 'Lớp 1', NULL),
(2, 'LO02', 'Lớp 2', NULL),
(3, 'LO03', 'Lớp 3', NULL),
(4, 'LO04', 'Lớp 4', NULL),
(5, 'LO05', 'Lớp 5', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `m_mon_hoc`
--

CREATE TABLE `m_mon_hoc` (
  `id` int(11) NOT NULL,
  `class` smallint(2) NOT NULL,
  `course` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `alias` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `image` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `onpost` tinyint(1) DEFAULT '0',
  `sort` smallint(2) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `user_id` int(5) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `m_mon_hoc`
--

INSERT INTO `m_mon_hoc` (`id`, `class`, `course`, `name`, `alias`, `description`, `image`, `onpost`, `sort`, `status`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 0, '0', 'Tiếng Việt', 'tieng-viet', '<p>test</p>', 'public/uploads/images/201903/a67qNoCiL9.png', 0, 0, 1, 13, '2019-03-29 13:51:10', '2019-03-29 13:51:10'),
(2, 0, '0', 'Toán học', 'toan-hoc', NULL, 'public/uploads/images/201903/np0SFjoBna.png', 0, 0, 1, 13, '2019-03-29 13:51:04', '2019-03-29 13:51:04');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `m_template_quiz`
--

CREATE TABLE `m_template_quiz` (
  `quiz_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `answer` varchar(191) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `m_week`
--

CREATE TABLE `m_week` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `HK10` int(2) DEFAULT NULL,
  `HK11` int(2) DEFAULT NULL,
  `HK20` int(2) DEFAULT NULL,
  `HK21` int(2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `m_week`
--

INSERT INTO `m_week` (`id`, `name`, `HK10`, `HK11`, `HK20`, `HK21`, `created_at`, `updated_at`) VALUES
(1, 'Tuần 1', 1, 0, NULL, NULL, '2019-04-10 13:09:29', '2019-04-10 13:09:29'),
(2, 'Tuần 2', 0, 0, NULL, NULL, '2019-04-10 13:09:29', '2019-04-10 13:09:29'),
(3, 'Tuần 3', 0, 0, NULL, NULL, '2019-04-10 13:09:29', '2019-04-10 13:09:29'),
(4, 'Tuần 4', 0, 0, NULL, NULL, '2019-04-10 13:09:29', '2019-04-10 13:09:29'),
(5, 'Tuần 5', 0, 0, NULL, NULL, '2019-04-10 13:09:29', '2019-04-10 13:09:29'),
(6, 'Tuần 6', 0, 0, NULL, NULL, '2019-04-10 13:09:29', '2019-04-10 13:09:29'),
(7, 'Tuần 7', 0, 0, NULL, NULL, '2019-04-10 13:09:29', '2019-04-10 13:09:29'),
(8, 'Tuần 8', 0, 0, NULL, NULL, '2019-04-10 13:09:29', '2019-04-10 13:09:29'),
(9, 'Tuần 9', 0, 0, NULL, NULL, '2019-04-10 13:09:29', '2019-04-10 13:09:29'),
(10, 'Tuần 10', 0, 0, NULL, NULL, '2019-04-10 13:09:29', '2019-04-10 13:09:29'),
(11, 'Tuần 11', 0, 0, NULL, NULL, '2019-04-10 13:09:29', '2019-04-10 13:09:29'),
(12, 'Tuần 12', 0, 0, NULL, NULL, '2019-04-10 13:09:29', '2019-04-10 13:09:29'),
(13, 'Tuần 13', 0, 0, NULL, NULL, '2019-04-10 13:09:29', '2019-04-10 13:09:29'),
(14, 'Tuần 14', 0, 0, NULL, NULL, '2019-04-10 13:09:29', '2019-04-10 13:09:29'),
(15, 'Tuần 15', 0, 0, NULL, NULL, '2019-04-10 13:09:29', '2019-04-10 13:09:29'),
(16, 'Tuần 16', 0, 0, NULL, NULL, '2019-04-10 13:09:29', '2019-04-10 13:09:29'),
(17, 'Tuần 17', 0, 1, NULL, NULL, '2019-04-10 13:09:29', '2019-04-10 13:09:29'),
(18, 'Tuần 18', 0, 0, NULL, NULL, '2019-04-10 13:09:29', '2019-04-10 13:09:29'),
(19, 'Tuần 19', 0, 0, NULL, NULL, '2019-04-10 13:09:29', '2019-04-10 13:09:29'),
(20, 'Tuần 20', 0, 0, NULL, NULL, '2019-04-10 13:09:29', '2019-04-10 13:09:29'),
(21, 'Tuần 21', 0, 0, NULL, NULL, '2019-04-10 13:09:29', '2019-04-10 13:09:29'),
(22, 'Tuần 22', 0, 0, NULL, NULL, '2019-04-10 13:09:29', '2019-04-10 13:09:29'),
(23, 'Tuần 23', 0, 0, NULL, NULL, '2019-04-10 13:09:29', '2019-04-10 13:09:29'),
(24, 'Tuần 24', 0, 0, NULL, NULL, '2019-04-10 13:09:29', '2019-04-10 13:09:29'),
(25, 'Tuần 25', 0, 0, NULL, NULL, '2019-04-10 13:09:29', '2019-04-10 13:09:29'),
(26, 'Tuần 26', 0, 0, NULL, NULL, '2019-04-10 13:09:29', '2019-04-10 13:09:29'),
(27, 'Tuần 27', 0, 0, NULL, NULL, '2019-04-10 13:09:29', '2019-04-10 13:09:29'),
(28, 'Tuần 28', 0, 0, NULL, NULL, '2019-04-10 13:09:29', '2019-04-10 13:09:29'),
(29, 'Tuần 29', 0, 0, NULL, NULL, '2019-04-10 13:09:29', '2019-04-10 13:09:29'),
(30, 'Tuần 30', 0, 0, NULL, NULL, '2019-04-10 13:09:29', '2019-04-10 13:09:29'),
(31, 'Tuần 31', 0, 0, NULL, NULL, '2019-04-10 13:09:29', '2019-04-10 13:09:29'),
(32, 'Tuần 32', 0, 0, NULL, NULL, '2019-04-10 13:09:29', '2019-04-10 13:09:29'),
(33, 'Tuần 33', 0, 0, NULL, NULL, '2019-04-10 13:09:29', '2019-04-10 13:09:29'),
(34, 'Tuần 34', 0, 0, NULL, NULL, '2019-04-10 13:09:29', '2019-04-10 13:09:29'),
(35, 'Tuần 35', 0, 0, NULL, NULL, '2019-04-10 13:09:29', '2019-04-10 13:09:29');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `id` tinyint(2) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'manager', NULL, '2019-01-21 15:12:41', '0000-00-00 00:00:00'),
(2, 'employe', NULL, '2019-01-21 15:12:47', '0000-00-00 00:00:00'),
(3, 'guest', NULL, '2019-01-21 15:12:51', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `role_user`
--

CREATE TABLE `role_user` (
  `id` tinyint(5) NOT NULL,
  `role_id` tinyint(2) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `role_user`
--

INSERT INTO `role_user` (`id`, `role_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 13, '2019-01-21 15:13:26', '0000-00-00 00:00:00'),
(4, 3, 18, '2019-03-11 08:32:50', '2019-03-11 08:32:50'),
(5, 3, 19, '2019-03-12 00:31:09', '2019-03-12 00:31:09'),
(6, 3, 20, '2019-03-12 13:08:03', '2019-03-12 13:08:03'),
(7, 3, 21, '2019-03-12 13:12:19', '2019-03-12 13:12:19'),
(8, 3, 22, '2019-03-12 13:47:08', '2019-03-12 13:47:08');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `temp_answer`
--

CREATE TABLE `temp_answer` (
  `id` bigint(20) NOT NULL,
  `question_id` int(11) NOT NULL,
  `stt` tinyint(2) NOT NULL,
  `answer` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `result` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `temp_questions`
--

CREATE TABLE `temp_questions` (
  `id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `user_id` int(10) NOT NULL,
  `thematic` smallint(5) NOT NULL,
  `question` text COLLATE utf8_unicode_ci NOT NULL,
  `stt` int(3) DEFAULT NULL,
  `answer` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `result` tinyint(2) NOT NULL,
  `used` tinyint(2) NOT NULL,
  `level` smallint(2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `provider` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `provider_id` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `nick_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avata` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sologan` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `teacher` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `provider`, `provider_id`, `remember_token`, `status`, `nick_name`, `phone`, `avata`, `sologan`, `teacher`, `created_at`, `updated_at`) VALUES
(13, 'minhnb', 'minhnb.it@gmail.com', '$2y$10$j.DBpGEVvmJnjVfz7WhC1eq81efPWM3gkpZQ4QFfMZq1e/m/SGsfq', NULL, NULL, '4IuoE7L7FcYY3Vktsm3uuYnDNb5qBUYVbYinyTDDuUryxODyQw9WQ5wIqT60', 1, NULL, NULL, NULL, NULL, 0, '2019-01-08 03:57:04', '2019-01-08 03:57:04'),
(18, 'Vinmart Siêu thị', 'vinmartsupermarket@gmail.com', '$2y$10$asrD8IGz53W9jivAXozkfugQ.Ki1F6WeGhjG.6GIX/kNqZkEMwNaW', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0, '2019-03-11 08:32:49', '2019-03-21 15:16:51'),
(19, 'Hiếu Đặng', 'congdantoancau2018@gmail.com', '$2y$10$nECOGOJZktuoLky1TnLk2uIoVv/RbxCB44Gy3bZNsPQbAOnz9VtXq', NULL, NULL, NULL, 1, NULL, '097852149654', 'public/uploads/images/201903/gIfxovPmFk.jpg', NULL, 1, '2019-03-12 00:31:08', '2019-03-29 13:50:41'),
(20, 'Mit Xinh', 'lantrinh.mit@gmail.com', '$2y$10$G3ElB5WRjB8snY01n2/23.kV7muLdB5LGNgegVcRtxrmIpu3xE1mK', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0, '2019-03-12 13:08:03', '2019-03-12 13:08:03'),
(21, 'Vietpeace Travel', 'cafe.vinguyenchat@gmail.com', '$2y$10$3b57UqXYpVxUCmGFwo/TL.H5BWs8Bo.EdLMpyJYbO5caN6HrEqpvu', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0, '2019-03-12 13:12:19', '2019-03-12 13:12:19'),
(22, 'Medi Food', 'dev.20170918@gmail.com', '$2y$10$xf8GlMwPriUApmbfT1i0.ORV1jzNSMRhw5vgHGzXElmIEBZr.ZO3a', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0, '2019-03-12 13:47:08', '2019-03-12 13:47:08');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_course`
--

CREATE TABLE `user_course` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `course` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `begin_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `status` smallint(2) NOT NULL DEFAULT '0',
  `user_create` int(5) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user_course`
--

INSERT INTO `user_course` (`id`, `user_id`, `course`, `begin_date`, `end_date`, `status`, `user_create`, `created_at`, `updated_at`) VALUES
(4, 18, 'HHQ50', '2019-03-11 00:00:00', '9999-01-01 00:00:00', 0, 18, '2019-03-11 08:46:39', '2019-03-11 08:46:39'),
(5, 18, 'HHQ51', '2019-03-11 00:00:00', '9999-01-01 00:00:00', 0, 18, '2019-03-11 08:52:21', '2019-03-11 08:52:21'),
(6, 19, 'HHQ50', '2019-03-12 00:00:00', '9999-01-01 00:00:00', 0, 19, '2019-03-12 00:31:16', '2019-03-12 00:31:16'),
(7, 21, 'HHQ50', '2019-03-12 00:00:00', '9999-01-01 00:00:00', 1, 21, '2019-03-22 15:23:32', '2019-03-22 15:23:32'),
(9, 21, 'HHQ41', '2019-03-12 00:00:00', '9999-01-01 00:00:00', 0, 21, '2019-03-12 13:46:34', '2019-03-12 13:46:34'),
(10, 21, 'HHQ40', '2019-03-12 00:00:00', '9999-01-01 00:00:00', 0, 21, '2019-03-12 13:47:11', '2019-03-12 13:47:11'),
(11, 22, 'HHQ50', '2019-03-12 00:00:00', '9999-01-01 00:00:00', 0, 22, '2019-03-12 13:56:50', '2019-03-12 13:56:50'),
(12, 20, 'HHQ50', '2019-03-14 00:00:00', '9999-01-01 00:00:00', 0, 20, '2019-03-28 14:03:32', '2019-03-28 14:03:32'),
(13, 20, 'HHQ40', '2019-03-28 00:00:00', '9999-01-01 00:00:00', 0, 20, '2019-03-28 14:01:25', '2019-03-28 14:01:25'),
(14, 20, 'HHQ41', '2019-03-28 00:00:00', '9999-01-01 00:00:00', 0, 20, '2019-03-28 14:01:30', '2019-03-28 14:01:30'),
(15, 20, 'HHQ51', '2019-03-28 00:00:00', '9999-01-01 00:00:00', 0, 20, '2019-03-28 14:01:36', '2019-03-28 14:01:36'),
(16, 13, 'HHQ50', '2019-04-03 00:00:00', '9999-01-01 00:00:00', 0, 13, '2019-04-03 02:50:16', '2019-04-03 02:50:16');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `w_job_send_email`
--

CREATE TABLE `w_job_send_email` (
  `id` int(11) NOT NULL,
  `type` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `quiz_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `w_job_send_email`
--

INSERT INTO `w_job_send_email` (`id`, `type`, `quiz_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'QUIZ', 213, 0, '2019-04-03 08:22:49', '2019-04-03 08:22:49'),
(2, 'TUAN', 214, 0, '2019-04-03 08:23:18', '2019-04-03 08:23:18'),
(3, 'HK10', 216, 0, '2019-04-10 15:36:52', '2019-04-10 15:36:52'),
(4, 'HK10', 216, 0, '2019-04-10 15:39:06', '2019-04-10 15:39:06'),
(5, 'HK10', 216, 0, '2019-04-10 15:40:58', '2019-04-10 15:40:58'),
(6, 'HK10', 216, 0, '2019-04-10 15:47:01', '2019-04-10 15:47:01'),
(7, 'HK11', 218, 0, '2019-04-10 16:06:05', '2019-04-10 16:06:05');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `w_logs`
--

CREATE TABLE `w_logs` (
  `id` int(11) NOT NULL,
  `code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `w_logs`
--

INSERT INTO `w_logs` (`id`, `code`, `message`, `created_at`, `updated_at`) VALUES
(1, 'RUN', 'Auto run send email', '2019-04-04 00:08:45', '2019-04-04 00:08:45'),
(2, 'RUN', 'Auto run send email', '2019-04-04 00:08:51', '2019-04-04 00:08:51'),
(3, 'RUN', 'Auto run send email', '2019-04-04 00:09:19', '2019-04-04 00:09:19'),
(4, 'RUN', 'Auto run send email', '2019-04-04 00:09:33', '2019-04-04 00:09:33');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `z_category`
--

CREATE TABLE `z_category` (
  `id` int(11) NOT NULL,
  `parent` int(5) NOT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `alias` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `z_news`
--

CREATE TABLE `z_news` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `alias` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cate_id` mediumint(5) NOT NULL,
  `tags` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `z_news`
--

INSERT INTO `z_news` (`id`, `user_id`, `name`, `alias`, `description`, `content`, `image`, `cate_id`, `tags`, `status`, `created_at`, `updated_at`) VALUES
(2, 13, 'Bộ GD công bố chương trình bộ môn giáo dục phổ thông mới', 'bo-gd-cong-bo-chuong-trinh-bo-mon-giao-duc-pho-thong-moi', '<p>Chiều 27/12, Bộ Gi&aacute;o dục đ&atilde; ch&iacute;nh thức c&ocirc;ng bố số m&ocirc;n học của chương tr&igrave;nh gi&aacute;o dục phổ th&ocirc;ng mới gồm tất cả c&aacute;c cấp tiểu học, THCS, THPT, trong đ&oacute; đối với học sinh THPT ngo&agrave;i 5 m&ocirc;n bắt buộc, học sinh THPT phải chọn tối thiểu 5 m&ocirc;n kh&aacute;c của nh&oacute;m m&ocirc;n được lựa chọn.</p>', '<p><strong>Cấp Tiểu học:</strong></p>\r\n\r\n<ul>\r\n	<li>C&aacute;c m&ocirc;n học bắt buộc: Tiếng Việt, To&aacute;n, Ngoại ngữ 1, Gi&aacute;o dục lối sống, Đạo đức, Tự nhi&ecirc;n v&agrave; X&atilde; hội, Lịch sử v&agrave; Địa l&yacute;, Khoa học, Tin học v&agrave; C&ocirc;ng nghệ, Gi&aacute;o dục thể chất, Nghệ thuật.</li>\r\n	<li>C&aacute;c m&ocirc;n học tự chọn: Tiếng d&acirc;n tộc thiểu số v&agrave; Ngoại ngữ 1 (đối với lớp 1 v&agrave; 2).</li>\r\n	<li>M&ocirc;n học mới: Tin học v&agrave; C&ocirc;ng nghệ.</li>\r\n</ul>\r\n\r\n<p><strong>Cấp THCS:&nbsp;</strong></p>\r\n\r\n<ul>\r\n	<li>&nbsp;C&aacute;c m&ocirc;n học bắt buộc: Ngữ văn, To&aacute;n, Ngoại ngữ 1, Gi&aacute;o dục c&ocirc;ng d&acirc;n, Khoa học tự nhi&ecirc;n, Lịch sử v&agrave; Địa l&yacute;, C&ocirc;ng nghệ, Gi&aacute;o dục thể chất, Nghệ thuật, Tin học (trở th&agrave;nh bắt buộc, kh&aacute;c với trước đ&acirc;y l&agrave; tự chọn)</li>\r\n	<li>&nbsp;C&aacute;c m&ocirc;n học tự chọn: Tiếng d&acirc;n tộc thiểu số, ngoại ngữ 2.</li>\r\n</ul>\r\n\r\n<p><strong>Cấp THPT:</strong></p>\r\n\r\n<ul>\r\n	<li>C&aacute;c m&ocirc;n học bắt buộc: Ngữ văn, To&aacute;n, ngoại ngữ 1, Gi&aacute;o dục thể chất, Gi&aacute;o dục quốc ph&ograve;ng v&agrave; an ninh.</li>\r\n	<li>C&aacute;c m&ocirc;n học lựa chọn: theo nh&oacute;m Khoa học x&atilde; hội (gồm c&aacute;c m&ocirc;n: Gi&aacute;o dục kinh tế v&agrave; ph&aacute;p luật, Lịch sử, Địa l&yacute;), nh&oacute;m Khoa học tự nhi&ecirc;n (gồm c&aacute;c m&ocirc;n: Vật l&yacute;, H&oacute;a học, Sinh học), nh&oacute;m C&ocirc;ng nghệ v&agrave; nghệ thuật (gồm c&aacute;c m&ocirc;n: C&ocirc;ng nghệ, Tin học, Nghệ thuật).</li>\r\n	<li>&nbsp;C&aacute;c m&ocirc;n học tự chọn: Tiếng d&acirc;n tộc thiểu số, Ngoại ngữ 2.</li>\r\n</ul>\r\n\r\n<p>Ngo&agrave;i 5 m&ocirc;n bắt buộc, học sinh THPT phải chọn tối thiểu 5 m&ocirc;n kh&aacute;c của nh&oacute;m m&ocirc;n được lựa chọn.</p>\r\n\r\n<p><strong>Lộ tr&igrave;nh thực hiện:</strong></p>\r\n\r\n<p>Bộ GD-ĐT thực hiện lộ tr&igrave;nh &aacute;p dụng Chương tr&igrave;nh Gi&aacute;o dục phổ th&ocirc;ng mới như sau:</p>\r\n\r\n<ul>\r\n	<li>Năm học 2020-2021 đối với lớp 1;</li>\r\n	<li>Năm học 2021-2022 đối với lớp 2 v&agrave; lớp 6;</li>\r\n	<li>Năm học 2022-2023 đối với lớp 3, lớp 7 v&agrave; lớp 10;</li>\r\n	<li>Năm học 2023-2024 đối với lớp 4, lớp 8 v&agrave; lớp 11;</li>\r\n	<li>Năm học 2024-2025 đối với lớp 5, lớp 9 v&agrave; lớp 12.</li>\r\n</ul>', 'public/uploads/images/201903/V3Oegj3Dn5.jpg', 1, 'Sách giáo khoa', 1, '2019-03-30 05:09:30', '2019-03-30 05:09:30');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `z_post`
--

CREATE TABLE `z_post` (
  `id` int(11) NOT NULL,
  `parent` int(11) NOT NULL,
  `course` int(2) NOT NULL,
  `thematic` int(5) NOT NULL,
  `lesson` int(5) NOT NULL,
  `title` tinytext COLLATE utf8_unicode_ci,
  `content` text COLLATE utf8_unicode_ci,
  `keyword` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `z_slider`
--

CREATE TABLE `z_slider` (
  `id` int(3) NOT NULL,
  `sort` smallint(2) NOT NULL,
  `name1` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name2` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alias` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link` text COLLATE utf8_unicode_ci,
  `image` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `user_id` int(6) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `z_slider`
--

INSERT INTO `z_slider` (`id`, `sort`, `name1`, `name2`, `alias`, `link`, `image`, `status`, `user_id`, `updated_at`, `created_at`) VALUES
(1, 1, 'test', 'test', 'test', 'https://youtu.be/xCfTGhmDsHg', 'public/uploads/slider/hbgJ6lTxJe.jpg', 1, 13, '2019-03-15 15:55:23', '2019-03-15 15:26:58'),
(2, 2, 'test', 'tết', 'test', 'https://youtu.be/1mS1QM7igDg', 'public/uploads/slider/fcF5tgrL1j.jpg', 1, 13, '2019-03-15 15:57:03', '2019-03-15 15:57:03');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `m_bai_giang`
--
ALTER TABLE `m_bai_giang`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `m_cau_dap_an`
--
ALTER TABLE `m_cau_dap_an`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `m_cau_hoi`
--
ALTER TABLE `m_cau_hoi`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `m_chuyen_de`
--
ALTER TABLE `m_chuyen_de`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `m_exam`
--
ALTER TABLE `m_exam`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `m_giao_vien`
--
ALTER TABLE `m_giao_vien`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `m_ket_qua_quiz`
--
ALTER TABLE `m_ket_qua_quiz`
  ADD PRIMARY KEY (`id`),
  ADD KEY `token` (`token`(20));

--
-- Chỉ mục cho bảng `m_ket_qua_quiz_question`
--
ALTER TABLE `m_ket_qua_quiz_question`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `m_khoahoc_monhoc`
--
ALTER TABLE `m_khoahoc_monhoc`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `course` (`course`,`subject`);

--
-- Chỉ mục cho bảng `m_khoa_hoc`
--
ALTER TABLE `m_khoa_hoc`
  ADD KEY `id` (`id`);

--
-- Chỉ mục cho bảng `m_lop_hoc`
--
ALTER TABLE `m_lop_hoc`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `m_mon_hoc`
--
ALTER TABLE `m_mon_hoc`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `m_week`
--
ALTER TABLE `m_week`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `temp_answer`
--
ALTER TABLE `temp_answer`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `temp_questions`
--
ALTER TABLE `temp_questions`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Chỉ mục cho bảng `user_course`
--
ALTER TABLE `user_course`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `w_job_send_email`
--
ALTER TABLE `w_job_send_email`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `w_logs`
--
ALTER TABLE `w_logs`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `z_category`
--
ALTER TABLE `z_category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `z_news`
--
ALTER TABLE `z_news`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `z_post`
--
ALTER TABLE `z_post`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `z_slider`
--
ALTER TABLE `z_slider`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `m_bai_giang`
--
ALTER TABLE `m_bai_giang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `m_cau_dap_an`
--
ALTER TABLE `m_cau_dap_an`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=221;

--
-- AUTO_INCREMENT cho bảng `m_cau_hoi`
--
ALTER TABLE `m_cau_hoi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT cho bảng `m_chuyen_de`
--
ALTER TABLE `m_chuyen_de`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `m_exam`
--
ALTER TABLE `m_exam`
  MODIFY `id` smallint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `m_giao_vien`
--
ALTER TABLE `m_giao_vien`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `m_ket_qua_quiz`
--
ALTER TABLE `m_ket_qua_quiz`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=219;

--
-- AUTO_INCREMENT cho bảng `m_ket_qua_quiz_question`
--
ALTER TABLE `m_ket_qua_quiz_question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1056;

--
-- AUTO_INCREMENT cho bảng `m_khoahoc_monhoc`
--
ALTER TABLE `m_khoahoc_monhoc`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `m_khoa_hoc`
--
ALTER TABLE `m_khoa_hoc`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `m_lop_hoc`
--
ALTER TABLE `m_lop_hoc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `m_mon_hoc`
--
ALTER TABLE `m_mon_hoc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `m_week`
--
ALTER TABLE `m_week`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT cho bảng `roles`
--
ALTER TABLE `roles`
  MODIFY `id` tinyint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `role_user`
--
ALTER TABLE `role_user`
  MODIFY `id` tinyint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `temp_answer`
--
ALTER TABLE `temp_answer`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `temp_questions`
--
ALTER TABLE `temp_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT cho bảng `user_course`
--
ALTER TABLE `user_course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `w_job_send_email`
--
ALTER TABLE `w_job_send_email`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `w_logs`
--
ALTER TABLE `w_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `z_category`
--
ALTER TABLE `z_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `z_news`
--
ALTER TABLE `z_news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `z_post`
--
ALTER TABLE `z_post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `z_slider`
--
ALTER TABLE `z_slider`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
