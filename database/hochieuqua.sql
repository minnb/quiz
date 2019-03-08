-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th3 08, 2019 lúc 03:44 PM
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
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `m_bai_giang`
--

INSERT INTO `m_bai_giang` (`id`, `teacher`, `course`, `thematic`, `name`, `alias`, `description`, `content`, `link_video`, `image`, `sort`, `keywords`, `user_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'HHQ40', 2, 'Dãy số tự nhiên', 'day-so-tu-nhien', '<p>B&agrave;i học nằm trong khối kiến thức to&aacute;n lớp 4, thuộc kh&oacute;a học to&aacute;n lớp 4 học kỳ 1</p>', '<p>B&agrave;i học nằm trong khối kiến thức to&aacute;n lớp 4, thuộc kh&oacute;a học to&aacute;n lớp 4 học kỳ 1</p>', 'https://www.youtube.com/embed/84c0rUgtBzA', NULL, 0, 'Bài học nằm trong khối kiến thức toán lớp 4, thuộc khóa học toán lớp 4 học kỳ 1', 13, 0, '2019-02-21 14:11:14', '2019-01-21 15:20:36'),
(2, 2, 'HHQ50', 9, 'Khái niệm, tính chất cơ bản của phân số', 'khai-niem,-tinh-chat-co-ban-cua-phan-so', '<p>Kh&aacute;i niệm, t&iacute;nh chất cơ bản của ph&acirc;n số</p>', '<p>Kh&aacute;i niệm, t&iacute;nh chất cơ bản của ph&acirc;n số</p>', 'https://www.youtube.com/embed/84c0rUgtBzA', NULL, 11, 'Khái niệm, tính chất cơ bản của phân số', 13, 1, '2019-02-28 15:08:28', '2019-02-28 15:08:28'),
(3, 1, 'HHQ50', 9, 'So sánh phân số', 'so-sanh-phan-so', '<p>So s&aacute;nh ph&acirc;n số</p>', '<p>So s&aacute;nh ph&acirc;n số</p>', 'https://www.youtube.com/embed/84c0rUgtBzA', NULL, 12, 'So sánh phân số', 13, 1, '2019-02-28 15:08:42', '2019-02-28 15:08:42'),
(4, 1, 'HHQ50', 9, 'Tìm một số khi biết một số phần của nó', 'tim-mot-so-khi-biet-mot-so-phan-cua-no', '<p>T&igrave;m một số khi biết một số phần của n&oacute;</p>', '<p>T&igrave;m một số khi biết một số phần của n&oacute;</p>', 'https://www.youtube.com/embed/84c0rUgtBzA', NULL, 13, 'Tìm một số khi biết một số phần của nó', 13, 1, '2019-02-28 15:08:51', '2019-02-28 15:08:51'),
(5, 1, 'HHQ50', 9, 'Tính thuận tiện với phân số', 'tinh-thuan-tien-voi-phan-so', '<p>T&iacute;nh thuận tiện với ph&acirc;n số</p>', '<p>T&iacute;nh thuận tiện với ph&acirc;n số</p>', 'https://www.youtube.com/embed/84c0rUgtBzA', NULL, 14, 'Tính thuận tiện với phân số', 13, 1, '2019-02-28 15:08:59', '2019-02-28 15:08:59'),
(6, 1, 'HHQ50', 9, 'Tính thuận tiện với phân số', 'tinh-thuan-tien-voi-phan-so', '<p>T&iacute;nh thuận tiện với ph&acirc;n số</p>', '<p>T&iacute;nh thuận tiện với ph&acirc;n số</p>', 'https://www.youtube.com/embed/84c0rUgtBzA', NULL, 0, 'Tính thuận tiện với phân số', 13, 0, '2019-02-21 14:11:14', '2019-02-13 04:28:37'),
(7, 1, 'HHQ51', 15, 'Tìm số trung bình cộng', 'tim-so-trung-binh-cong', '<p>T&igrave;m số trung b&igrave;nh cộng</p>', '<p>T&igrave;m số trung b&igrave;nh cộng</p>', 'https://www.youtube.com/embed/84c0rUgtBzA', NULL, 0, 'Tìm số trung bình cộng', 13, 1, '2019-02-21 14:11:14', '2019-01-21 15:42:54'),
(8, 1, 'HHQ50', 10, 'Tỉ lệ thuận', 'ti-le-thuan', '<p>Tỉ lệ thuận</p>', '<p>Tỉ lệ thuận</p>', 'https://www.youtube.com/embed/84c0rUgtBzA', NULL, 0, 'Tỉ lệ thuận', 13, 1, '2019-02-21 14:11:14', '2019-01-21 15:51:58'),
(9, 1, 'HHQ50', 10, 'Tỉ lệ nghịch', 'ti-le-nghich', '<p>Tỉ lệ nghịch</p>', '<p>Tỉ lệ nghịch</p>', 'https://www.youtube.com/embed/84c0rUgtBzA', NULL, 0, 'Tỉ lệ nghịch', 13, 1, '2019-02-21 14:11:14', '2019-01-21 15:52:13'),
(10, 1, 'HHQ50', 11, 'Khái niệm, đọc, viết số thập phân', 'khai-niem,-doc,-viet-so-thap-phan', '<p>Kh&aacute;i niệm, đọc, viết số thập ph&acirc;n</p>', '<p>Kh&aacute;i niệm, đọc, viết số thập ph&acirc;n</p>', 'https://www.youtube.com/embed/84c0rUgtBzA', NULL, 0, 'Khái niệm, đọc, viết số thập phân', 13, 1, '2019-02-21 14:11:14', '2019-01-21 15:53:46'),
(11, 1, 'HHQ50', 12, 'Tìm tỉ số phần trăm của 2 số', 'tim-ti-so-phan-tram-cua-2-so', '<p>T&igrave;m tỉ số phần trăm của 2 số</p>', '<p>T&igrave;m tỉ số phần trăm của 2 số</p>', 'https://www.youtube.com/embed/84c0rUgtBzA', NULL, 0, 'Tìm tỉ số phần trăm của 2 số', 13, 1, '2019-02-21 14:11:14', '2019-01-21 15:54:25'),
(12, 1, 'HHQ50', 13, 'Hình tam giác', 'hinh-tam-giac', '<p>H&igrave;nh tam gi&aacute;c</p>', '<p>H&igrave;nh tam gi&aacute;c</p>', 'https://www.youtube.com/embed/84c0rUgtBzA', NULL, 0, 'Hình tam giác', 13, 1, '2019-02-21 14:11:14', '2019-01-21 15:54:51'),
(13, 1, 'HHQ50', 14, 'Số đo thời gian', 'so-do-thoi-gian', '<p>Số đo thời gian</p>', '<p>Số đo thời gian</p>', 'https://www.youtube.com/embed/84c0rUgtBzA', NULL, 0, 'Số đo thời gian', 13, 1, '2019-02-21 14:11:14', '2019-01-21 15:55:18'),
(14, 1, 'HHQ40', 1, 'VinFast Klara lội nước gần 1 mét và cái kết', 'vinfast-klara-loi-nuoc-gan-1-met-va-cai-ket', '<p>test</p>', NULL, 'https://www.youtube.com/embed/ZnOAK04tJhc', 'public/uploads/images/201902/oaSrGZLPWq.png', 0, 'testg', 13, 1, '2019-02-27 14:51:52', '2019-02-27 14:51:52');

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
(212, 4, 59, '7', '', '', 0, '', '2019-03-05 14:34:15', '2019-03-05 14:34:15');

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
(33, 'radio', 0, 'HHQ50', 9, 2, 'Chọn đáp án đúng 10 + 4', '', '', 1, 1, 1, 13, '2019-03-05 13:32:31', '2019-03-05 13:32:31'),
(34, 'radio', 0, 'HHQ50', 9, 2, 'Chọn đáp án đúng 10 - 4', '', '', 1, 1, 1, 13, '2019-03-05 13:32:31', '2019-03-05 13:32:31'),
(35, 'radio', 0, 'HHQ50', 9, 2, 'Chọn đáp án đúng 10 + 4 - 1', '', '', 1, 1, 3, 13, '2019-03-05 13:32:31', '2019-03-05 13:32:31'),
(36, 'radio', 1, 'HHQ50', 9, NULL, 'Chọn đáp án đúng 10 + 4', '', '', 1, 1, 1, 13, '2019-03-05 13:33:26', '2019-03-05 13:33:26'),
(37, 'radio', 1, 'HHQ50', 9, NULL, 'Chọn đáp án đúng 10 - 4', '', '', 1, 1, 1, 13, '2019-03-05 13:33:26', '2019-03-05 13:33:26'),
(38, 'radio', 1, 'HHQ50', 9, NULL, 'Chọn đáp án đúng 10 + 4 - 1', '', '', 1, 1, 3, 13, '2019-03-05 13:33:26', '2019-03-05 13:33:26'),
(39, 'radio', 1, 'HHQ51', 3, NULL, 'Chọn đáp án đúng 10 + 4', '', '', 1, 1, 1, 13, '2019-03-05 13:33:41', '2019-03-05 13:33:41'),
(40, 'radio', 1, 'HHQ51', 3, NULL, 'Chọn đáp án đúng 10 - 4', '', '', 1, 1, 1, 13, '2019-03-05 13:33:41', '2019-03-05 13:33:41'),
(41, 'radio', 1, 'HHQ51', 3, NULL, 'Chọn đáp án đúng 10 + 4 - 1', '', '', 1, 1, 3, 13, '2019-03-05 13:33:41', '2019-03-05 13:33:41'),
(42, 'radio', 1, 'HHQ50', 9, NULL, 'Chọn đáp án đúng 10 + 4 = ?', '', '', 2, 1, 1, 13, '2019-03-05 13:36:25', '2019-03-05 13:36:25'),
(43, 'radio', 1, 'HHQ50', 9, NULL, 'Chọn đáp án đúng 10 - 4 = ?', '', '', 2, 1, 1, 13, '2019-03-05 13:36:25', '2019-03-05 13:36:25'),
(44, 'radio', 1, 'HHQ50', 9, NULL, 'Chọn đáp án đúng 10 + 4 - 1 = ?', '', '', 2, 1, 3, 13, '2019-03-05 13:36:25', '2019-03-05 13:36:25'),
(45, 'radio', 1, 'HHQ50', 9, NULL, '10 + 10 = ?', '', '', 3, 1, 1, 13, '2019-03-05 13:39:32', '2019-03-05 13:39:32'),
(46, 'radio', 1, 'HHQ50', 9, NULL, 'An có 10 cái kẹo, chị An cho thêm 2 cái, hỏi An có tất cả bao nhiêu cái kẹo', '', '', 3, 1, 1, 13, '2019-03-05 13:39:32', '2019-03-05 13:39:32'),
(47, 'radio', 1, 'HHQ50', 9, NULL, 'Mít có 10 cái kẹo. Mít chia cho em một nửa, hỏi Mít còn bao nhiêu cái kẹo', '', '', 3, 1, 3, 13, '2019-03-05 13:39:32', '2019-03-05 13:39:32'),
(48, 'radio', 0, 'HHQ50', 9, 2, '10 + 10 = ?', '', '', 2, 1, 1, 13, '2019-03-05 13:40:03', '2019-03-05 13:40:03'),
(49, 'radio', 0, 'HHQ50', 9, 2, 'An có 10 cái kẹo, chị An cho thêm 2 cái, hỏi An có tất cả bao nhiêu cái kẹo', '', '', 3, 1, 1, 13, '2019-03-05 13:40:03', '2019-03-05 13:40:03'),
(50, 'radio', 0, 'HHQ50', 9, 2, 'Mít có 10 cái kẹo. Mít chia cho em một nửa, hỏi Mít còn bao nhiêu cái kẹo', '', '', 4, 1, 3, 13, '2019-03-05 13:40:03', '2019-03-05 13:40:03'),
(51, 'radio', 1, 'HHQ50', 9, 0, 'Làm phép tính 9 x 4 = ?', '', '', 4, 1, 2, 13, '2019-03-05 13:45:56', '2019-03-05 13:45:56'),
(52, 'radio', 1, 'HHQ50', 9, 0, 'Còn lại bao nhiêu cái kẹo khi chia 10 cái cho 4 bạn, mỗi bạn 2 cái kẹo', '', '', 4, 1, 4, 13, '2019-03-05 13:45:56', '2019-03-05 13:45:56'),
(53, 'radio', 1, 'HHQ50', 9, 0, 'Bạn Mít được 4 bạn cùng bàn mỗi người cho 2 cái kẹo, hỏi bạn Mít có bao nhiêu cái', '', '', 4, 1, 2, 13, '2019-03-05 13:45:56', '2019-03-05 13:45:56'),
(54, 'radio', 0, 'HHQ50', 9, 2, 'Làm phép tính 9 x 4 = ?', '', '', 4, 1, 2, 13, '2019-03-05 13:46:46', '2019-03-05 13:46:46'),
(55, 'radio', 0, 'HHQ50', 9, 2, 'Còn lại bao nhiêu cái kẹo khi chia 10 cái cho 4 bạn, mỗi bạn 2 cái kẹo', '', '', 4, 1, 4, 13, '2019-03-05 13:46:46', '2019-03-05 13:46:46'),
(56, 'radio', 0, 'HHQ50', 9, 2, 'Bạn Mít được 4 bạn cùng bàn mỗi người cho 2 cái kẹo, hỏi bạn Mít có bao nhiêu cái', '', '', 4, 1, 2, 13, '2019-03-05 13:46:46', '2019-03-05 13:46:46'),
(57, 'radio', 0, 'HHQ50', 9, 3, 'Làm phép tính 9 x 4 = ?', '', '', 1, 1, 2, 13, '2019-03-05 14:34:15', '2019-03-05 14:34:15'),
(58, 'radio', 0, 'HHQ50', 9, 3, 'Còn lại bao nhiêu cái kẹo khi chia 10 cái cho 4 bạn, mỗi bạn 2 cái kẹo', '', '', 1, 1, 4, 13, '2019-03-05 14:34:15', '2019-03-05 14:34:15'),
(59, 'radio', 0, 'HHQ50', 9, 3, 'Bạn Mít được 4 bạn cùng bàn mỗi người cho 2 cái kẹo, hỏi bạn Mít có bao nhiêu cái', '', '', 1, 1, 2, 13, '2019-03-05 14:34:15', '2019-03-05 14:34:15');

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
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `m_chuyen_de`
--

INSERT INTO `m_chuyen_de` (`id`, `course`, `class`, `subject`, `name`, `alias`, `description`, `keywords`, `image`, `onpost`, `status`, `sort`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'HHQ40', 4, 1, 'Từ và động từ 1', 'tu-va-dong-tu-1', '<p>test</p>', NULL, NULL, 0, 1, NULL, 13, '2019-01-10 05:42:07', '2019-01-10 05:41:50'),
(2, 'HHQ40', 4, 2, 'Số tự nhiên', 'so-tu-nhien', NULL, 'a', NULL, 0, 1, NULL, 13, '2019-01-10 05:35:30', '2019-01-10 05:35:30'),
(3, 'HHQ51', 5, 2, 'Phân số', 'phan-so', NULL, NULL, NULL, 0, 1, 1, 13, '2019-02-28 15:00:52', '2019-02-28 15:00:52'),
(4, 'HHQ51', 5, 2, 'Tỉ lệ', 'ti-le', NULL, NULL, NULL, 0, 1, 2, 13, '2019-02-28 15:01:00', '2019-02-28 15:01:00'),
(5, 'HHQ51', 5, 2, 'Số thập phân', 'so-thap-phan', NULL, NULL, NULL, 0, 1, 3, 13, '2019-02-28 15:01:08', '2019-02-28 15:01:08'),
(6, 'HHQ51', 5, 2, 'Tỉ số phần trăm', 'ti-so-phan-tram', NULL, NULL, NULL, 0, 1, 4, 13, '2019-02-28 15:01:15', '2019-02-28 15:01:15'),
(7, 'HHQ51', 5, 2, 'Hình học', 'hinh-hoc', NULL, NULL, NULL, 0, 1, 5, 13, '2019-02-28 15:01:22', '2019-02-28 15:01:22'),
(8, 'HHQ51', 5, 2, 'Chuyển động', 'chuyen-dong', NULL, NULL, NULL, 0, 1, 6, 13, '2019-02-28 15:01:28', '2019-02-28 15:01:28'),
(9, 'HHQ50', 5, 2, 'Phân số', 'phan-so', NULL, NULL, NULL, 0, 1, 1, 13, '2019-02-28 15:01:57', '2019-02-28 15:01:57'),
(10, 'HHQ50', 5, 2, 'Tỉ lệ', 'ti-le', NULL, NULL, NULL, 0, 1, 2, 13, '2019-02-28 15:02:09', '2019-02-28 15:02:09'),
(11, 'HHQ50', 5, 2, 'Số thập phân', 'so-thap-phan', NULL, NULL, NULL, 0, 1, 3, 13, '2019-02-28 15:02:04', '2019-02-28 15:02:04'),
(12, 'HHQ50', 5, 2, 'Tỉ số phần trăm', 'ti-so-phan-tram', NULL, NULL, NULL, 0, 1, 4, 13, '2019-02-28 15:02:16', '2019-02-28 15:02:16'),
(13, 'HHQ50', 5, 2, 'Hình học', 'hinh-hoc', NULL, NULL, NULL, 0, 1, 5, 13, '2019-02-28 15:02:22', '2019-02-28 15:02:22'),
(14, 'HHQ50', 5, 2, 'Chuyển động', 'chuyen-dong', NULL, NULL, NULL, 0, 1, 4, 13, '2019-02-28 15:00:21', '2019-02-28 15:00:21'),
(15, 'HHQ51', 5, 2, 'Ôn tập về giải toán', '0n-tap-ve-giai-toan', '<p>&Ocirc;n tập về giải to&aacute;n</p>', NULL, NULL, 0, 1, 7, 13, '2019-02-28 15:01:45', '2019-02-28 15:01:45');

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
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `m_exam`
--

INSERT INTO `m_exam` (`id`, `type`, `name`, `alias`, `description`, `image`, `work_time`, `number_quesstion`, `lv1`, `lv2`, `lv3`, `lv4`, `status`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'TUAN', 'Thi tuần', 'thi-tuan', NULL, NULL, 15, 10, 4, 3, 2, 1, 1, 13, '2019-02-13 05:46:33', '2019-02-13 05:46:33'),
(2, 'CHUYENDE', 'Thi theo chuyên đề', 'thi-theo-chuyen-de', '<p>Luyện tập trả lời c&acirc;u hỏi nhanh sau khi học xong b&agrave;i giảng.</p>', NULL, 5, 5, 2, 1, 1, 1, 1, 13, '2019-02-13 05:43:35', '2019-02-13 05:43:35'),
(3, 'HOCKY1', 'HOCKY1', 'hocky1', NULL, NULL, 30, 10, 4, 3, 2, 1, 1, 13, '2019-02-28 15:12:40', '2019-02-28 15:12:40'),
(4, 'HOCKY2', 'HOCKY2', 'hocky2', NULL, NULL, 30, 10, 4, 3, 2, 1, 1, 13, '2019-02-28 15:13:03', '2019-02-28 15:13:03'),
(5, 'QUIZ', 'Luyện tập quiz theo bài học', 'luyen-tap-quiz-theo-bai-hoc', NULL, NULL, 10, 5, 2, 1, 1, 1, 1, 13, '2019-03-05 07:45:40', '2019-03-05 07:45:40');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `m_giao_vien`
--

CREATE TABLE `m_giao_vien` (
  `id` int(11) NOT NULL,
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

INSERT INTO `m_giao_vien` (`id`, `name`, `email`, `phone`, `description`, `status`, `avata`, `created_at`, `updated_at`) VALUES
(1, 'Đặng Thế Hiếu', 'dangthehieu80@gmail.com', '097852148', '<p>Người truyền cảm hứng to&aacute;n học cho h&agrave;ng ngh&igrave;n học sinh tr&ecirc;n cả nước, gi&uacute;p tr&ecirc;n 2000 học sinh tr&ecirc;n cả nước luyện thi v&agrave; đỗ v&agrave;o c&aacute;c trường chuy&ecirc;n chất lượng cao trong c&aacute;c k&igrave; thi tuyển sinh Trung học cơ sở v&agrave; Trung học phổ th&ocirc;ng.</p>', 1, 'public/uploads/images/201902/gBWRqet1ki.jpg', '2019-02-27 15:06:22', '2019-02-27 15:06:22'),
(2, 'Nguyễn Thị Hợi', 'congdantoancau2018@gmail.com', '097852149654', NULL, 1, 'public/uploads/images/201902/qBg202nAkV.jpg', '2019-02-27 15:04:03', '2019-02-27 15:04:03');

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
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `m_ket_qua_quiz`
--

INSERT INTO `m_ket_qua_quiz` (`id`, `type`, `user_id`, `result`, `description`, `comment`, `course`, `thematic`, `lesson`, `status`, `kq`, `total`, `success`, `created_at`, `updated_at`) VALUES
(97, 'QUIZ', 17, 0, '', 'QUIZ', 'HHQ50', 9, 3, 1, 2, 2, 1, '2019-03-05 14:54:42', '2019-03-05 14:54:51'),
(99, 'QUIZ', 17, 0, '', 'QUIZ', 'HHQ50', 9, 3, 1, 1, 2, 0, '2019-03-05 15:01:35', '2019-03-05 15:01:51'),
(100, 'QUIZ', 17, 0, '', 'QUIZ', 'HHQ50', 9, 2, 1, 2, 5, 0, '2019-03-05 15:06:14', '2019-03-05 15:06:26'),
(105, 'CHUYENDE', 17, 0, '', 'CHUYENDE', 'HHQ50', 9, 0, 1, 1, 1, 1, '2019-03-08 14:22:14', '2019-03-08 14:22:20');

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
(410, 105, 51, 2, '', 2, 0, '2019-03-08 14:22:20', '2019-03-08 14:22:20');

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
(12, 'HHQ51', 2, '', NULL, 0, 1, 13, '2019-01-21 15:15:01', '2019-01-21 15:15:01');

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
  `description` varchar(199) COLLATE utf8_unicode_ci DEFAULT NULL,
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
(1, 'HHQ50', 0, 5, 'Cơ bản', 'Lớp 5 - Cơ bản ', 'co-ban', '<p>test</p>', NULL, 0, 500000, 1, 13, '2019-02-27 15:44:25', '2019-01-08 16:15:17'),
(4, 'HHQ51', 1, 5, 'Nâng cao', 'Lớp 5 - Nâng cao ', 'nang-cao', NULL, NULL, 0, 0, 1, 13, '2019-02-27 15:43:50', '2019-01-08 16:42:41'),
(5, 'HHQ40', 0, 4, 'Cơ bản', 'Lớp 4 - Cơ bản ', 'co-ban', NULL, NULL, 0, 0, 1, 13, '2019-02-27 15:44:06', '2019-01-08 16:51:15');

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
(1, 0, '0', 'Tiếng Việt', 'tieng-viet', '<p>test</p>', 'public/uploads/images/201901/LPZjXGptYG.png', 0, 0, 1, 13, '2019-01-09 09:56:07', '2019-01-09 09:56:07'),
(2, 0, '0', 'Toán học', 'toan-hoc', NULL, NULL, 0, 0, 1, 13, '2019-01-10 02:49:36', '2019-01-10 02:49:36');

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
(2, 3, 15, '2019-01-30 14:14:44', '0000-00-00 00:00:00'),
(3, 2, 17, '2019-01-30 14:29:28', '2019-01-30 14:23:11');

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `provider`, `provider_id`, `remember_token`, `status`, `created_at`, `updated_at`) VALUES
(13, 'minhnb', 'minhnb.it@gmail.com', '$2y$10$j.DBpGEVvmJnjVfz7WhC1eq81efPWM3gkpZQ4QFfMZq1e/m/SGsfq', NULL, NULL, '4IuoE7L7FcYY3Vktsm3uuYnDNb5qBUYVbYinyTDDuUryxODyQw9WQ5wIqT60', 1, '2019-01-08 03:57:04', '2019-01-08 03:57:04'),
(15, 'Binh Minh', 'congdantoancau2018@gmail.com', '$2y$10$qT/oM3UE2a.YP.pQfjCCb.Z8G0VSLfVuhtFSv6/kpNP9R29tRhPCa', NULL, NULL, NULL, 1, '2019-01-30 14:06:55', '2019-01-30 14:06:55'),
(17, 'Nguyễn Văn Nam', 'lop4@gmail.com', '$2y$10$j.DBpGEVvmJnjVfz7WhC1eq81efPWM3gkpZQ4QFfMZq1e/m/SGsfq', NULL, NULL, NULL, 1, '2019-01-30 14:23:11', '2019-01-30 14:29:28');

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
  `status` tinyint(1) NOT NULL,
  `user_create` int(5) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user_course`
--

INSERT INTO `user_course` (`id`, `user_id`, `course`, `begin_date`, `end_date`, `status`, `user_create`, `created_at`, `updated_at`) VALUES
(1, 17, 'HHQ50', '2019-01-01 00:00:00', '2019-09-30 00:00:00', 1, 0, '2019-02-13 03:07:56', '0000-00-00 00:00:00');

--
-- Chỉ mục cho các bảng đã đổ
--

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
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `m_bai_giang`
--
ALTER TABLE `m_bai_giang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `m_cau_dap_an`
--
ALTER TABLE `m_cau_dap_an`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=213;

--
-- AUTO_INCREMENT cho bảng `m_cau_hoi`
--
ALTER TABLE `m_cau_hoi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT cho bảng `m_chuyen_de`
--
ALTER TABLE `m_chuyen_de`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `m_exam`
--
ALTER TABLE `m_exam`
  MODIFY `id` smallint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `m_giao_vien`
--
ALTER TABLE `m_giao_vien`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `m_ket_qua_quiz`
--
ALTER TABLE `m_ket_qua_quiz`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT cho bảng `m_ket_qua_quiz_question`
--
ALTER TABLE `m_ket_qua_quiz_question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=411;

--
-- AUTO_INCREMENT cho bảng `m_khoahoc_monhoc`
--
ALTER TABLE `m_khoahoc_monhoc`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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
-- AUTO_INCREMENT cho bảng `roles`
--
ALTER TABLE `roles`
  MODIFY `id` tinyint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `role_user`
--
ALTER TABLE `role_user`
  MODIFY `id` tinyint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT cho bảng `user_course`
--
ALTER TABLE `user_course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
