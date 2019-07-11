-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th7 04, 2019 lúc 02:15 AM
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
  `trial` tinyint(1) DEFAULT '0',
  `week` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `m_bai_giang`
--

INSERT INTO `m_bai_giang` (`id`, `teacher`, `course`, `thematic`, `name`, `alias`, `description`, `content`, `link_video`, `image`, `sort`, `keywords`, `user_id`, `status`, `created_at`, `updated_at`, `trial`, `week`) VALUES
(1, 1, 'HHQ40', 2, 'Dãy số tự nhiên', 'day-so-tu-nhien', '<p>B&agrave;i học nằm trong khối kiến thức to&aacute;n lớp 4, thuộc kh&oacute;a học to&aacute;n lớp 4 học kỳ 1</p>', '<p>B&agrave;i học nằm trong khối kiến thức to&aacute;n lớp 4, thuộc kh&oacute;a học to&aacute;n lớp 4 học kỳ 1</p>', 'https://www.youtube.com/embed/84c0rUgtBzA', NULL, 0, 'Bài học nằm trong khối kiến thức toán lớp 4, thuộc khóa học toán lớp 4 học kỳ 1', 13, 0, '2019-03-22 15:12:22', '2019-01-21 15:20:36', 1, 0),
(2, 2, 'HHQ50', 9, 'Khái niệm, tính chất cơ bản của phân số', 'khai-niem,-tinh-chat-co-ban-cua-phan-so', '<p>Kh&aacute;i niệm, t&iacute;nh chất cơ bản của ph&acirc;n số</p>', '<p>Kh&aacute;i niệm, t&iacute;nh chất cơ bản của ph&acirc;n số</p>', 'https://www.youtube.com/embed/ZnOAK04tJhc', NULL, 11, 'Khái niệm, tính chất cơ bản của phân số', 13, 1, '2019-07-03 23:41:00', '2019-07-03 23:41:00', 1, 1),
(3, 1, 'HHQ50', 9, 'So sánh phân số', 'so-sanh-phan-so', '<p>So s&aacute;nh ph&acirc;n số</p>', '<p>So s&aacute;nh ph&acirc;n số</p>', 'https://www.youtube.com/embed/84c0rUgtBzA', NULL, 12, 'So sánh phân số', 13, 1, '2019-07-03 23:41:31', '2019-07-03 23:41:31', 1, 2),
(4, 1, 'HHQ50', 9, 'Tìm một số khi biết một số phần của nó', 'tim-mot-so-khi-biet-mot-so-phan-cua-no', '<p>T&igrave;m một số khi biết một số phần của n&oacute;</p>', '<p>T&igrave;m một số khi biết một số phần của n&oacute;</p>', 'https://www.youtube.com/embed/84c0rUgtBzA', NULL, 13, 'Tìm một số khi biết một số phần của nó', 13, 1, '2019-07-03 23:41:38', '2019-07-03 23:41:38', 0, 3),
(5, 1, 'HHQ50', 9, 'Tính thuận tiện với phân số', 'tinh-thuan-tien-voi-phan-so', '<p>T&iacute;nh thuận tiện với ph&acirc;n số</p>', '<p>T&iacute;nh thuận tiện với ph&acirc;n số</p>', 'https://www.youtube.com/embed/84c0rUgtBzA', NULL, 14, 'Tính thuận tiện với phân số', 13, 1, '2019-02-28 15:08:59', '2019-02-28 15:08:59', 0, 0),
(6, 1, 'HHQ50', 9, 'Tính thuận tiện với phân số', 'tinh-thuan-tien-voi-phan-so', '<p>T&iacute;nh thuận tiện với ph&acirc;n số</p>', '<p>T&iacute;nh thuận tiện với ph&acirc;n số</p>', 'https://www.youtube.com/embed/84c0rUgtBzA', NULL, 0, 'Tính thuận tiện với phân số', 13, 0, '2019-02-21 14:11:14', '2019-02-13 04:28:37', 0, 0),
(7, 1, 'HHQ51', 15, 'Tìm số trung bình cộng', 'tim-so-trung-binh-cong', '<p>T&igrave;m số trung b&igrave;nh cộng</p>', '<p>T&igrave;m số trung b&igrave;nh cộng</p>', 'https://www.youtube.com/embed/84c0rUgtBzA', NULL, 0, 'Tìm số trung bình cộng', 13, 1, '2019-02-21 14:11:14', '2019-01-21 15:42:54', 0, 0),
(8, 1, 'HHQ50', 10, 'Tỉ lệ thuận', 'ti-le-thuan', '<p>Tỉ lệ thuận</p>', '<p>Tỉ lệ thuận</p>', 'https://www.youtube.com/embed/84c0rUgtBzA', NULL, 0, 'Tỉ lệ thuận', 13, 1, '2019-02-21 14:11:14', '2019-01-21 15:51:58', 0, 0),
(9, 1, 'HHQ50', 10, 'Tỉ lệ nghịch', 'ti-le-nghich', '<p>Tỉ lệ nghịch</p>', '<p>Tỉ lệ nghịch</p>', 'https://www.youtube.com/embed/84c0rUgtBzA', NULL, 0, 'Tỉ lệ nghịch', 13, 1, '2019-02-21 14:11:14', '2019-01-21 15:52:13', 0, 0),
(10, 1, 'HHQ50', 11, 'Khái niệm, đọc, viết số thập phân', 'khai-niem,-doc,-viet-so-thap-phan', '<p>Kh&aacute;i niệm, đọc, viết số thập ph&acirc;n</p>', '<p>Kh&aacute;i niệm, đọc, viết số thập ph&acirc;n</p>', 'https://www.youtube.com/embed/84c0rUgtBzA', NULL, 0, 'Khái niệm, đọc, viết số thập phân', 13, 1, '2019-02-21 14:11:14', '2019-01-21 15:53:46', 0, 0),
(11, 1, 'HHQ50', 12, 'Tìm tỉ số phần trăm của 2 số', 'tim-ti-so-phan-tram-cua-2-so', '<p>T&igrave;m tỉ số phần trăm của 2 số</p>', '<p>T&igrave;m tỉ số phần trăm của 2 số</p>', 'https://www.youtube.com/embed/84c0rUgtBzA', NULL, 0, 'Tìm tỉ số phần trăm của 2 số', 13, 1, '2019-02-21 14:11:14', '2019-01-21 15:54:25', 0, 0),
(12, 1, 'HHQ50', 13, 'Hình tam giác', 'hinh-tam-giac', '<p>H&igrave;nh tam gi&aacute;c</p>', '<p>H&igrave;nh tam gi&aacute;c</p>', 'https://www.youtube.com/embed/84c0rUgtBzA', NULL, 0, 'Hình tam giác', 13, 1, '2019-02-21 14:11:14', '2019-01-21 15:54:51', 0, 0),
(13, 1, 'HHQ50', 14, 'Số đo thời gian', 'so-do-thoi-gian', '<p>Số đo thời gian</p>', '<p>Số đo thời gian</p>', 'https://www.youtube.com/embed/84c0rUgtBzA', NULL, 0, 'Số đo thời gian', 13, 1, '2019-02-21 14:11:14', '2019-01-21 15:55:18', 0, 0),
(14, 1, 'HHQ40', 1, 'VinFast Klara lội nước gần 1 mét và cái kết', 'vinfast-klara-loi-nuoc-gan-1-met-va-cai-ket', '<p>test</p>', NULL, 'https://www.youtube.com/embed/ZnOAK04tJhc', 'public/uploads/images/201902/oaSrGZLPWq.png', 0, 'testg', 13, 1, '2019-02-27 14:51:52', '2019-02-27 14:51:52', 0, 0),
(15, 1, 'HHQ51', 3, 'tesst', 'tesst', NULL, NULL, 'https://www.youtube.com/embed/ZnOAK04tJhc', NULL, 0, NULL, 13, 0, '2019-03-14 13:08:27', '2019-03-14 13:08:27', 0, 0);

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
  `result` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `m_cau_dap_an`
--

INSERT INTO `m_cau_dap_an` (`id`, `stt`, `quesstion_id`, `name`, `alias`, `value`, `result`, `image`, `created_at`, `updated_at`) VALUES
(1045, 1, 269, 'Số liền sau của 97 là', '', '', '98', '', '2019-06-17 14:08:16', '2019-06-17 14:08:16'),
(1046, 2, 269, 'Số liền sau của 96 là', '', '', '97', '', '2019-06-17 14:08:16', '2019-06-17 14:08:16'),
(1047, 3, 269, 'Số liền sau của 99 là', '', '', '100', '', '2019-06-17 14:08:16', '2019-06-17 14:08:16'),
(1048, 4, 269, 'Số liền sau của 90 là', '', '', '91', '', '2019-06-17 14:08:16', '2019-06-17 14:08:16'),
(1049, 1, 270, '450, 328', '', '', '0', '', '2019-06-17 14:08:16', '2019-06-17 14:08:16'),
(1050, 2, 270, '540, 315', '', '', '2', '', '2019-06-17 14:08:16', '2019-06-17 14:08:16'),
(1051, 3, 270, '444, 900', '', '', '0', '', '2019-06-17 14:08:16', '2019-06-17 14:08:16'),
(1052, 4, 270, '180, 855', '', '', '4', '', '2019-06-17 14:08:16', '2019-06-17 14:08:16'),
(1053, 1, 271, 'Số liền sau của 97 là', '', '', '98', '', '2019-06-17 14:19:06', '2019-06-17 14:19:06'),
(1054, 2, 271, 'Số liền sau của 96 là', '', '', '97', '', '2019-06-17 14:19:06', '2019-06-17 14:19:06'),
(1055, 3, 271, 'Số liền sau của 99 là', '', '', '100', '', '2019-06-17 14:19:06', '2019-06-17 14:19:06'),
(1056, 4, 271, 'Số liền sau của 90 là', '', '', '91', '', '2019-06-17 14:19:06', '2019-06-17 14:19:06'),
(1057, 1, 272, '450, 328', '', '', '0', '', '2019-06-17 14:19:06', '2019-06-17 14:19:06'),
(1058, 2, 272, '540, 315', '', '', '2', '', '2019-06-17 14:19:06', '2019-06-17 14:19:06'),
(1059, 3, 272, '444, 900', '', '', '0', '', '2019-06-17 14:19:06', '2019-06-17 14:19:06'),
(1060, 4, 272, '180, 855', '', '', '4', '', '2019-06-17 14:19:06', '2019-06-17 14:19:06'),
(1061, 1, 273, '5:1 = 4', '', '', '0', '', '2019-06-17 14:19:06', '2019-06-17 14:19:06'),
(1062, 2, 273, '3:3 = 3', '', '', '2', '', '2019-06-17 14:19:06', '2019-06-17 14:19:06'),
(1063, 3, 273, '4:2 = 2', '', '', '0', '', '2019-06-17 14:19:06', '2019-06-17 14:19:06'),
(1064, 4, 273, '1:1 = 1', '', '', '0', '', '2019-06-17 14:19:06', '2019-06-17 14:19:06'),
(1065, 1, 274, 'Số liền sau của 97 là', '', '', '98', '', '2019-06-25 14:56:14', '2019-06-25 14:56:14'),
(1066, 2, 274, 'Số liền sau của 96 là', '', '', '97', '', '2019-06-25 14:56:14', '2019-06-25 14:56:14'),
(1067, 3, 274, 'Số liền sau của 99 là', '', '', '100', '', '2019-06-25 14:56:14', '2019-06-25 14:56:14'),
(1068, 4, 274, 'Số liền sau của 90 là', '', '', '91', '', '2019-06-25 14:56:14', '2019-06-25 14:56:14'),
(1069, 1, 275, '450, 328', '', '', '0', '', '2019-06-25 14:56:14', '2019-06-25 14:56:14'),
(1070, 2, 275, '540, 315', '', '', '2', '', '2019-06-25 14:56:14', '2019-06-25 14:56:14'),
(1071, 3, 275, '444, 900', '', '', '0', '', '2019-06-25 14:56:14', '2019-06-25 14:56:14'),
(1072, 4, 275, '180, 855', '', '', '4', '', '2019-06-25 14:56:14', '2019-06-25 14:56:14'),
(1073, 1, 276, '5:1 = 4', '', '', '0', '', '2019-06-25 14:56:14', '2019-06-25 14:56:14'),
(1074, 2, 276, '3:3 = 3', '', '', '2', '', '2019-06-25 14:56:14', '2019-06-25 14:56:14'),
(1075, 3, 276, '4:2 = 2', '', '', '0', '', '2019-06-25 14:56:14', '2019-06-25 14:56:14'),
(1076, 4, 276, '1:1 = 1', '', '', '0', '', '2019-06-25 14:56:14', '2019-06-25 14:56:14');

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
  `name` text COLLATE utf8_unicode_ci NOT NULL,
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
(269, 'value', 0, 'HHQ50', 9, 2, 'Điền vào chỗ chấm b2', '', '', 3, 1, NULL, 13, '2019-06-17 14:08:16', '2019-06-17 14:08:16'),
(270, 'checkbox', 0, 'HHQ50', 9, 2, 'Các số chia hết cho cả 5 và 9 là? (Đúng ghi Đ – Sai ghi S) b2', '', '', 4, 1, NULL, 13, '2019-06-17 14:08:16', '2019-06-17 14:08:16'),
(271, 'value', 0, 'HHQ50', 9, 3, 'Điền vào chỗ chấm b2', '', '', 1, 1, NULL, 13, '2019-06-17 14:19:06', '2019-06-17 14:19:06'),
(272, 'checkbox', 0, 'HHQ50', 9, 3, 'Các số chia hết cho cả 5 và 9 là? (Đúng ghi Đ – Sai ghi S) b2', '', '', 2, 1, NULL, 13, '2019-06-17 14:19:06', '2019-06-17 14:19:06'),
(273, 'radio', 0, 'HHQ50', 9, 3, 'Chọn đáp án đúng: ', '', '', 3, 1, NULL, 13, '2019-06-17 14:19:06', '2019-06-17 14:19:06'),
(274, 'value', 0, 'HHQ50', 9, 4, 'Điền vào chỗ chấm b2', '', '', 1, 1, NULL, 13, '2019-06-25 14:56:14', '2019-06-25 14:56:14'),
(275, 'checkbox', 0, 'HHQ50', 9, 4, 'Các số chia hết cho cả 5 và 9 là? (Đúng ghi Đ – Sai ghi S) b2', '', '', 2, 1, NULL, 13, '2019-06-25 14:56:14', '2019-06-25 14:56:14'),
(276, 'radio', 0, 'HHQ50', 9, 4, 'Chọn đáp án đúng: ', '', '', 3, 1, NULL, 13, '2019-06-25 14:56:14', '2019-06-25 14:56:14');

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
(6, 'HK21', 'Thi học kỳ 2', '', NULL, '', 30, 10, 4, 3, 2, 1, 1, 13, '2019-04-10 14:45:29', '2019-04-10 14:45:29', 19, 35),
(7, 'CHUYENDE', 'Luyện thi theo chuyên đề', '', NULL, '', 20, 5, 2, 1, 1, 1, 1, 13, '2019-04-16 14:16:15', '2019-04-16 14:16:15', 1, 1);

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
(1, 13, 'Đặng Thế Hiếu', 'dangthehieu80@gmail.com', '097852148', '<p>Người truyền cảm hứng to&aacute;n học cho h&agrave;ng ngh&igrave;n học sinh tr&ecirc;n cả nước, gi&uacute;p tr&ecirc;n 2000 học sinh tr&ecirc;n cả nước luyện thi v&agrave; đỗ v&agrave;o c&aacute;c trường chuy&ecirc;n chất lượng cao trong c&aacute;c k&igrave; thi tuyển sinh Trung học cơ sở v&agrave; Trung học phổ th&ocirc;ng.</p>', 1, 'uploads/images/201903/bsyXGO10mo.jpg', '2019-06-05 21:36:40', '2019-03-29 13:50:46'),
(2, 13, 'Nguyễn Thị Hợi', 'congdantoancau2018@gmail.com', '097852149654', NULL, 1, 'uploads/images/201903/gIfxovPmFk.jpg', '2019-06-05 21:36:44', '2019-03-29 13:50:41'),
(3, 13, 'Binh Minh', 'chienhn@vitduct.com.vn', '097852149654', '<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.</p>', 1, 'uploads/images/201903/ooIZ3RXQWd.jpg', '2019-06-05 21:36:49', '2019-03-29 13:50:35');

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
(280, 'QUIZ', 0, 0, '', 'QUIZ', 'HHQ50', 9, 2, 1, 2, 2, 1, '2019-06-17 14:08:35', '2019-06-17 14:55:40', 0, 0, 2, '85TQedmtRf7Mx4hG2kv3'),
(283, 'QUIZ', 0, 0, '', 'QUIZ', 'HHQ50', 9, 3, 0, 0, 3, 0, '2019-06-17 14:31:51', '2019-06-17 14:31:51', 0, 0, 2, 'WDcthFTeN6PSBY2AV3f9'),
(284, 'QUIZ', 0, 0, '', 'QUIZ', 'HHQ50', 9, 3, 0, 0, 3, 0, '2019-06-17 14:32:24', '2019-06-17 14:32:24', 0, 0, 2, 'i8ZsxyVJ0uYAR7koU9jW'),
(285, 'QUIZ', 0, 0, '', 'QUIZ', 'HHQ50', 9, 3, 0, 0, 3, 0, '2019-06-17 14:35:46', '2019-06-17 14:35:46', 0, 0, 2, 'Lgz1qmTe8sWnk5aNXvib'),
(286, 'QUIZ', 0, 0, '', 'QUIZ', 'HHQ50', 9, 2, 1, 2, 2, 1, '2019-06-17 15:01:02', '2019-06-17 15:02:34', 0, 0, 2, 'cW7Zv0YoLXlAKEMPmVTp'),
(287, 'QUIZ', 0, 0, '', 'QUIZ', 'HHQ50', 9, 3, 1, 3, 3, 1, '2019-06-18 14:29:52', '2019-06-18 15:30:00', 0, 0, 2, 's5pNn1Mm47iIX9cdt0BJ'),
(288, 'QUIZ', 0, 0, '', 'QUIZ', 'HHQ50', 9, 3, 0, 0, 3, 0, '2019-06-18 14:40:34', '2019-06-18 14:40:34', 0, 0, 2, '4ThAyDp8tmKcB0xegYzJ'),
(289, 'QUIZ', 0, 0, '', 'QUIZ', 'HHQ50', 9, 3, 0, 0, 3, 0, '2019-06-18 14:44:48', '2019-06-18 14:44:49', 0, 0, 2, 'TNbPEdMawSsc6zVgyrli'),
(290, 'QUIZ', 0, 0, '', 'QUIZ', 'HHQ50', 9, 3, 0, 0, 3, 0, '2019-06-18 14:48:42', '2019-06-18 14:48:42', 0, 0, 2, 'Wy2asRTLEUB3XulIje8c'),
(291, 'QUIZ', 0, 0, '', 'QUIZ', 'HHQ50', 9, 3, 0, 0, 3, 0, '2019-06-18 14:52:28', '2019-06-18 14:52:28', 0, 0, 2, 'Yvmjk5489BDPK3EQnRLJ'),
(292, 'QUIZ', 0, 0, '', 'QUIZ', 'HHQ50', 9, 3, 0, 0, 3, 0, '2019-06-18 14:55:36', '2019-06-18 14:55:36', 0, 0, 2, 'sKMRnA92rB8uwphbfUJ1'),
(293, 'QUIZ', 0, 0, '', 'QUIZ', 'HHQ50', 9, 3, 0, 0, 3, 0, '2019-06-18 14:57:45', '2019-06-18 14:57:45', 0, 0, 2, 'GSbswXC4nmAEc1aLdgFy'),
(294, 'QUIZ', 0, 0, '', 'QUIZ', 'HHQ50', 9, 3, 0, 0, 3, 0, '2019-06-18 15:20:55', '2019-06-18 15:20:55', 0, 0, 2, 'xqkGMegXPoNUzL7di4tS'),
(295, 'QUIZ', 0, 0, '', 'QUIZ', 'HHQ50', 9, 3, 0, 0, 3, 0, '2019-06-18 15:23:48', '2019-06-18 15:23:48', 0, 0, 2, 'O8RwhVTiy1lurPSxCkms'),
(296, 'QUIZ', 0, 0, '', 'QUIZ', 'HHQ50', 9, 2, 0, 0, 2, 0, '2019-06-18 15:23:59', '2019-06-18 15:23:59', 0, 0, 2, 'SiZrwOgYvPmRkaEu24s1'),
(297, 'QUIZ', 0, 0, '', 'QUIZ', 'HHQ50', 9, 2, 0, 0, 2, 0, '2019-06-18 15:26:29', '2019-06-18 15:26:29', 0, 0, 2, 'oT8Fu2Uyl4cBNYOWwSev'),
(298, 'QUIZ', 0, 0, '', 'QUIZ', 'HHQ50', 9, 2, 0, 0, 2, 0, '2019-06-18 15:30:08', '2019-06-18 15:30:08', 0, 0, 2, 'Hn9hrM7IvYWLl8F5dAyk'),
(299, 'QUIZ', 0, 0, '', 'QUIZ', 'HHQ50', 9, 2, 0, 0, 2, 0, '2019-06-18 15:31:37', '2019-06-18 15:31:37', 0, 0, 2, '3wWq1nohLrtjIJgMmzOu'),
(300, 'QUIZ', 0, 0, '', 'QUIZ', 'HHQ50', 9, 2, 0, 0, 2, 0, '2019-06-18 15:35:07', '2019-06-18 15:35:07', 0, 0, 2, 'Ookps73R2K0nJ9lIZwQX'),
(301, 'QUIZ', 0, 0, '', 'QUIZ', 'HHQ50', 9, 2, 0, 0, 2, 0, '2019-06-18 15:36:19', '2019-06-18 15:36:19', 0, 0, 2, 'gainIQd5ZRYXFET1qkrJ'),
(302, 'QUIZ', 0, 0, '', 'QUIZ', 'HHQ50', 9, 3, 0, 0, 3, 0, '2019-06-18 15:37:15', '2019-06-18 15:37:15', 0, 0, 2, 'WjbymqEpQxSdnkFGA6go'),
(303, 'QUIZ', 0, 0, '', 'QUIZ', 'HHQ50', 9, 3, 0, 0, 3, 0, '2019-06-18 15:37:30', '2019-06-18 15:37:30', 0, 0, 2, '7v6GSK8pogAxsE3fwL1k'),
(304, 'QUIZ', 0, 0, '', 'QUIZ', 'HHQ50', 9, 3, 0, 0, 3, 0, '2019-06-18 15:38:35', '2019-06-18 15:38:36', 0, 0, 2, '0hXlaY9mqpAxjRUWnbQI'),
(305, 'QUIZ', 0, 0, '', 'QUIZ', 'HHQ50', 9, 3, 0, 0, 3, 0, '2019-06-18 15:42:09', '2019-06-18 15:42:09', 0, 0, 2, 'eDWNwFEvSopk6uUn5HZA'),
(306, 'QUIZ', 0, 0, '', 'QUIZ', 'HHQ50', 9, 3, 0, 0, 3, 0, '2019-06-18 15:44:24', '2019-06-18 15:44:24', 0, 0, 2, 'ANHtqjr5LvheEC2P0Boa'),
(307, 'QUIZ', 0, 0, '', 'QUIZ', 'HHQ50', 9, 3, 1, 3, 3, 1, '2019-06-18 15:49:57', '2019-06-18 15:50:05', 0, 0, 2, 'quPbweC5IDUodrxFVp6G'),
(308, 'QUIZ', 0, 0, '', 'QUIZ', 'HHQ50', 9, 3, 0, 0, 3, 0, '2019-06-18 15:50:37', '2019-06-18 15:50:37', 0, 0, 2, 'cS4TfVir1IEz0WOmlAoK'),
(309, 'QUIZ', 0, 0, '', 'QUIZ', 'HHQ50', 9, 3, 1, 3, 3, 1, '2019-06-18 15:52:13', '2019-06-18 15:55:21', 0, 0, 2, 'D9VolyBMGrNcSvQWAzbt'),
(310, 'QUIZ', 0, 0, '', 'QUIZ', 'HHQ50', 9, 3, 1, 2, 3, 0, '2019-06-18 15:56:09', '2019-06-18 15:57:14', 0, 0, 2, 'fLg1tB0OMsaIzH4TJ8wX'),
(311, 'QUIZ', 0, 0, '', 'QUIZ', 'HHQ50', 9, 2, 1, 2, 2, 1, '2019-06-18 23:10:38', '2019-06-18 23:10:51', 0, 0, 2, 'b2iR4pmWVMGTU5u18qf0'),
(312, 'QUIZ', 0, 0, '', 'QUIZ', 'HHQ50', 9, 2, 1, 2, 2, 1, '2019-06-19 14:46:41', '2019-06-19 14:46:56', 0, 0, 2, 'INe3GHnycupxCk4oam2z'),
(313, 'QUIZ', 0, 0, '', 'QUIZ', 'HHQ50', 9, 3, 1, 0, 3, 0, '2019-06-19 14:49:27', '2019-06-26 14:46:17', 0, 0, 2, 'SfMIhEK8neVAUrtJZLBX'),
(314, 'QUIZ', 0, 0, '', 'QUIZ', 'HHQ50', 9, 3, 0, 0, 3, 0, '2019-06-19 14:51:22', '2019-06-19 14:51:22', 0, 0, 2, 'BZS4yXtqHI3xjd7YwGMp'),
(315, 'QUIZ', 0, 0, '', 'QUIZ', 'HHQ50', 9, 3, 0, 0, 3, 0, '2019-06-19 14:52:41', '2019-06-19 14:52:41', 0, 0, 2, 'oVWOgvSzpyALl7exsMTY'),
(316, 'QUIZ', 0, 0, '', 'QUIZ', 'HHQ50', 9, 3, 0, 0, 3, 0, '2019-06-19 14:53:35', '2019-06-19 14:53:35', 0, 0, 2, 'c1U2p9rK8ZlXIzTSOqCL'),
(317, 'QUIZ', 0, 0, '', 'QUIZ', 'HHQ50', 9, 3, 1, 3, 3, 1, '2019-06-19 14:54:58', '2019-06-19 23:48:21', 0, 0, 2, 'Qy24pU18nGWdPeVKAblr'),
(318, 'QUIZ', 0, 0, '', 'QUIZ', 'HHQ50', 9, 2, 1, 2, 2, 1, '2019-06-19 23:42:03', '2019-06-19 23:42:17', 0, 0, 2, 'KF4nAtpUVlCkJy0IfZBH'),
(319, 'QUIZ', 0, 0, '', 'QUIZ', 'HHQ50', 9, 2, 0, 0, 2, 0, '2019-06-19 23:45:17', '2019-06-19 23:45:17', 0, 0, 2, 'oU6DsJuMEQkc35hxXyPL'),
(320, 'QUIZ', 0, 0, '', 'QUIZ', 'HHQ50', 9, 2, 0, 0, 2, 0, '2019-06-19 23:46:14', '2019-06-19 23:46:14', 0, 0, 2, 'myxzKfHFsu6RVcJ9eNtI'),
(321, 'QUIZ', 0, 0, '', 'QUIZ', 'HHQ50', 9, 3, 0, 0, 3, 0, '2019-06-19 23:55:52', '2019-06-19 23:55:52', 0, 0, 2, 'RU9KIotwYqesXvCWzP1M'),
(322, 'QUIZ', 0, 0, '', 'QUIZ', 'HHQ50', 9, 2, 1, 2, 2, 1, '2019-06-26 00:07:24', '2019-06-26 00:07:38', 0, 0, 2, 'W3OdoeKQwHnMjCRPhGak'),
(323, 'QUIZ', 0, 0, '', 'QUIZ', 'HHQ50', 9, 2, 1, 2, 2, 1, '2019-06-26 13:24:40', '2019-06-26 13:24:54', 0, 0, 2, 'I9eEzZJsGVdWSg8qchrP'),
(324, 'QUIZ', 0, 0, '', 'QUIZ', 'HHQ50', 9, 2, 1, 2, 2, 1, '2019-06-26 13:27:17', '2019-06-26 13:27:34', 0, 0, 2, 'UKlVvYN21Je38dbzs0yR'),
(325, 'QUIZ', 0, 0, '', 'QUIZ', 'HHQ50', 9, 2, 0, 0, 2, 0, '2019-06-26 13:29:59', '2019-06-26 13:29:59', 0, 0, 2, 'W2x7Iy5TbrHoZapGOEJY'),
(326, 'QUIZ', 0, 0, '', 'QUIZ', 'HHQ50', 9, 3, 1, 3, 3, 1, '2019-06-26 13:35:59', '2019-06-26 13:36:15', 0, 0, 2, '3mNj7iC8kh6wF5a0dlyU'),
(327, 'QUIZ', 0, 0, '', 'QUIZ', 'HHQ50', 9, 2, 0, 0, 2, 0, '2019-06-26 14:11:16', '2019-06-26 14:11:16', 0, 0, 2, 'db9gqWx63uZQXH4C1yGh'),
(328, 'QUIZ', 13, 0, '', 'QUIZ', 'HHQ50', 9, 2, 1, 0, 2, 0, '2019-06-26 14:12:01', '2019-06-26 15:22:29', 0, 0, 2, 'db9gqWx63uZQXH4CayGh'),
(329, 'QUIZ', 13, 0, '', 'QUIZ', 'HHQ50', 9, 2, 0, 0, 2, 0, '2019-06-26 14:13:24', '2019-06-26 14:13:24', 0, 0, 2, 'db9gqWx63uZQXH4CPyGh'),
(330, 'QUIZ', 32, 0, '', 'QUIZ', 'HHQ50', 9, 2, 1, 2, 2, 1, '2019-06-26 14:20:39', '2019-06-26 14:20:52', 0, 0, 2, 'kOmMDnZCTiEedGj6bsoX'),
(331, 'QUIZ', 32, 0, '', 'QUIZ', 'HHQ50', 9, 2, 0, 0, 2, 0, '2019-06-26 14:43:44', '2019-06-26 14:43:44', 0, 0, 2, 'KvN2Uf7m1McD4hTseRLX'),
(332, 'QUIZ', 32, 0, '', 'QUIZ', 'HHQ50', 9, 2, 1, 1, 2, 0, '2019-06-26 14:46:45', '2019-06-26 14:48:23', 0, 0, 2, 'pYz6gZ1fSvHPyVjurUNs'),
(333, 'QUIZ', 32, 0, '', 'QUIZ', 'HHQ50', 9, 2, 1, 1, 2, 0, '2019-06-26 14:53:24', '2019-06-27 13:36:50', 0, 0, 2, 'cTNVIoQdqSLAwX7KZemH'),
(334, 'QUIZ', 32, 0, '', 'QUIZ', 'HHQ50', 9, 3, 1, 2, 3, 0, '2019-06-26 14:59:59', '2019-06-27 00:17:52', 0, 0, 2, 'tm3oF2lw8jN9kC6Y1WHZ'),
(335, 'QUIZ', 13, 0, '', 'QUIZ', 'HHQ50', 9, 2, 1, 0, 2, 0, '2019-06-26 15:24:13', '2019-06-26 15:25:39', 0, 0, 2, '3AgbTpSY5IUKJB8f2yzP'),
(336, 'QUIZ', 32, 0, '', 'QUIZ', 'HHQ50', 9, 2, 1, 0, 2, 0, '2019-06-27 13:09:13', '2019-06-27 15:28:37', 0, 0, 2, 'nCgFUAceQH6hfXsJuGvY'),
(339, 'QUIZ', 32, 0, '', 'QUIZ', 'HHQ50', 9, 3, 1, 3, 3, 1, '2019-06-27 14:57:47', '2019-06-27 15:28:14', 0, 0, 2, 'wV2pHrq5be3TJWk1vX9g');

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
(1260, 280, 269, 0, '[{\"stt\":1,\"result\":2}]', 0, 0, '2019-06-17 14:55:40', '2019-06-17 14:55:40'),
(1261, 280, 270, 0, '[{\"stt\":1,\"result\":4}]', 0, 0, '2019-06-17 14:55:40', '2019-06-17 14:55:40'),
(1262, 283, 271, 0, '', 0, 0, '2019-06-17 14:31:51', '2019-06-17 14:31:51'),
(1263, 283, 272, 0, '', 0, 0, '2019-06-17 14:31:51', '2019-06-17 14:31:51'),
(1264, 283, 273, 0, '', 0, 0, '2019-06-17 14:31:51', '2019-06-17 14:31:51'),
(1265, 284, 271, 0, '', 0, 0, '2019-06-17 14:32:24', '2019-06-17 14:32:24'),
(1266, 284, 272, 0, '', 0, 0, '2019-06-17 14:32:24', '2019-06-17 14:32:24'),
(1267, 284, 273, 0, '', 0, 0, '2019-06-17 14:32:24', '2019-06-17 14:32:24'),
(1268, 285, 271, 0, '', 0, 0, '2019-06-17 14:35:46', '2019-06-17 14:35:46'),
(1269, 285, 272, 0, '', 0, 0, '2019-06-17 14:35:46', '2019-06-17 14:35:46'),
(1270, 285, 273, 0, '', 0, 0, '2019-06-17 14:35:46', '2019-06-17 14:35:46'),
(1271, 286, 269, 0, '[{\"stt\":1,\"result\":\"98\"},{\"stt\":1,\"result\":\"98\"},{\"stt\":1,\"result\":\"98\"},{\"stt\":1,\"result\":\"98\"}]', 0, 0, '2019-06-17 15:02:34', '2019-06-17 15:02:34'),
(1272, 286, 270, 0, '[{\"stt\":2,\"result\":\"2\"},{\"stt\":2,\"result\":\"2\"},{\"stt\":2,\"result\":\"2\"}]', 0, 0, '2019-06-17 15:02:34', '2019-06-17 15:02:34'),
(1273, 287, 271, 0, '[{\"stt\":1,\"result\":\"77\"},{\"stt\":1,\"result\":\"77\"},{\"stt\":1,\"result\":\"77\"},{\"stt\":1,\"result\":\"77\"}]', 0, 0, '2019-06-18 15:30:00', '2019-06-18 15:30:00'),
(1274, 287, 272, 0, '[{\"stt\":2,\"result\":\"2\"},{\"stt\":2,\"result\":\"2\"}]', 0, 0, '2019-06-18 15:30:00', '2019-06-18 15:30:00'),
(1275, 287, 273, 0, '', 0, 0, '2019-06-18 15:30:00', '2019-06-18 15:30:00'),
(1276, 288, 271, 0, '', 0, 0, '2019-06-18 14:40:34', '2019-06-18 14:40:34'),
(1277, 288, 272, 0, '', 0, 0, '2019-06-18 14:40:34', '2019-06-18 14:40:34'),
(1278, 288, 273, 0, '', 0, 0, '2019-06-18 14:40:34', '2019-06-18 14:40:34'),
(1279, 289, 271, 0, '', 0, 0, '2019-06-18 14:44:49', '2019-06-18 14:44:49'),
(1280, 289, 272, 0, '', 0, 0, '2019-06-18 14:44:49', '2019-06-18 14:44:49'),
(1281, 289, 273, 0, '', 0, 0, '2019-06-18 14:44:49', '2019-06-18 14:44:49'),
(1282, 290, 271, 0, '', 0, 0, '2019-06-18 14:48:42', '2019-06-18 14:48:42'),
(1283, 290, 272, 0, '', 0, 0, '2019-06-18 14:48:42', '2019-06-18 14:48:42'),
(1284, 290, 273, 0, '', 0, 0, '2019-06-18 14:48:42', '2019-06-18 14:48:42'),
(1285, 291, 271, 0, '', 0, 0, '2019-06-18 14:52:28', '2019-06-18 14:52:28'),
(1286, 291, 272, 0, '', 0, 0, '2019-06-18 14:52:28', '2019-06-18 14:52:28'),
(1287, 291, 273, 0, '', 0, 0, '2019-06-18 14:52:28', '2019-06-18 14:52:28'),
(1288, 292, 271, 0, '', 0, 0, '2019-06-18 14:55:36', '2019-06-18 14:55:36'),
(1289, 292, 272, 0, '', 0, 0, '2019-06-18 14:55:36', '2019-06-18 14:55:36'),
(1290, 292, 273, 0, '', 0, 0, '2019-06-18 14:55:36', '2019-06-18 14:55:36'),
(1291, 293, 271, 0, '', 0, 0, '2019-06-18 14:57:45', '2019-06-18 14:57:45'),
(1292, 293, 272, 0, '', 0, 0, '2019-06-18 14:57:45', '2019-06-18 14:57:45'),
(1293, 293, 273, 0, '', 0, 0, '2019-06-18 14:57:45', '2019-06-18 14:57:45'),
(1294, 294, 271, 0, '', 0, 0, '2019-06-18 15:20:55', '2019-06-18 15:20:55'),
(1295, 294, 272, 0, '', 0, 0, '2019-06-18 15:20:55', '2019-06-18 15:20:55'),
(1296, 294, 273, 0, '', 0, 0, '2019-06-18 15:20:55', '2019-06-18 15:20:55'),
(1297, 295, 271, 0, '', 0, 0, '2019-06-18 15:23:48', '2019-06-18 15:23:48'),
(1298, 295, 272, 0, '', 0, 0, '2019-06-18 15:23:48', '2019-06-18 15:23:48'),
(1299, 295, 273, 0, '', 0, 0, '2019-06-18 15:23:48', '2019-06-18 15:23:48'),
(1300, 296, 269, 0, '', 0, 0, '2019-06-18 15:23:59', '2019-06-18 15:23:59'),
(1301, 296, 270, 0, '', 0, 0, '2019-06-18 15:23:59', '2019-06-18 15:23:59'),
(1302, 297, 269, 0, '', 0, 0, '2019-06-18 15:26:29', '2019-06-18 15:26:29'),
(1303, 297, 270, 0, '', 0, 0, '2019-06-18 15:26:29', '2019-06-18 15:26:29'),
(1304, 298, 269, 0, '', 0, 0, '2019-06-18 15:30:08', '2019-06-18 15:30:08'),
(1305, 298, 270, 0, '', 0, 0, '2019-06-18 15:30:08', '2019-06-18 15:30:08'),
(1306, 299, 269, 0, '', 0, 0, '2019-06-18 15:31:37', '2019-06-18 15:31:37'),
(1307, 299, 270, 0, '', 0, 0, '2019-06-18 15:31:37', '2019-06-18 15:31:37'),
(1308, 300, 269, 0, '', 0, 0, '2019-06-18 15:35:07', '2019-06-18 15:35:07'),
(1309, 300, 270, 0, '', 0, 0, '2019-06-18 15:35:07', '2019-06-18 15:35:07'),
(1310, 301, 269, 0, '', 0, 0, '2019-06-18 15:36:19', '2019-06-18 15:36:19'),
(1311, 301, 270, 0, '', 0, 0, '2019-06-18 15:36:19', '2019-06-18 15:36:19'),
(1312, 302, 271, 0, '', 0, 0, '2019-06-18 15:37:15', '2019-06-18 15:37:15'),
(1313, 302, 272, 0, '', 0, 0, '2019-06-18 15:37:15', '2019-06-18 15:37:15'),
(1314, 302, 273, 0, '', 0, 0, '2019-06-18 15:37:15', '2019-06-18 15:37:15'),
(1315, 303, 271, 0, '', 0, 0, '2019-06-18 15:37:30', '2019-06-18 15:37:30'),
(1316, 303, 272, 0, '', 0, 0, '2019-06-18 15:37:30', '2019-06-18 15:37:30'),
(1317, 303, 273, 0, '', 0, 0, '2019-06-18 15:37:30', '2019-06-18 15:37:30'),
(1318, 304, 271, 0, '', 0, 0, '2019-06-18 15:38:35', '2019-06-18 15:38:35'),
(1319, 304, 272, 0, '', 0, 0, '2019-06-18 15:38:35', '2019-06-18 15:38:35'),
(1320, 304, 273, 0, '', 0, 0, '2019-06-18 15:38:36', '2019-06-18 15:38:36'),
(1321, 305, 271, 0, '', 0, 0, '2019-06-18 15:42:09', '2019-06-18 15:42:09'),
(1322, 305, 272, 0, '', 0, 0, '2019-06-18 15:42:09', '2019-06-18 15:42:09'),
(1323, 305, 273, 0, '', 0, 0, '2019-06-18 15:42:09', '2019-06-18 15:42:09'),
(1324, 306, 271, 0, '', 0, 0, '2019-06-18 15:44:24', '2019-06-18 15:44:24'),
(1325, 306, 272, 0, '', 0, 0, '2019-06-18 15:44:24', '2019-06-18 15:44:24'),
(1326, 306, 273, 0, '', 0, 0, '2019-06-18 15:44:24', '2019-06-18 15:44:24'),
(1327, 307, 271, 0, '[]', 0, 0, '2019-06-18 15:50:05', '2019-06-18 15:50:05'),
(1328, 307, 272, 0, '[]', 0, 0, '2019-06-18 15:50:05', '2019-06-18 15:50:05'),
(1329, 307, 273, 0, '', 0, 0, '2019-06-18 15:49:57', '2019-06-18 15:49:57'),
(1330, 308, 271, 0, '', 0, 0, '2019-06-18 15:50:37', '2019-06-18 15:50:37'),
(1331, 308, 272, 0, '', 0, 0, '2019-06-18 15:50:37', '2019-06-18 15:50:37'),
(1332, 308, 273, 0, '', 0, 0, '2019-06-18 15:50:37', '2019-06-18 15:50:37'),
(1333, 309, 271, 0, '[{\"stt\":1,\"result\":\"98\"},{\"stt\":1,\"result\":\"98\"},{\"stt\":1,\"result\":\"98\"},{\"stt\":1,\"result\":\"98\"}]', 0, 0, '2019-06-18 15:55:21', '2019-06-18 15:55:21'),
(1334, 309, 272, 0, '[{\"stt\":1,\"result\":\"0\"},{\"stt\":1,\"result\":\"0\"},{\"stt\":1,\"result\":\"0\"}]', 0, 0, '2019-06-18 15:55:21', '2019-06-18 15:55:21'),
(1335, 309, 273, 0, '', 0, 0, '2019-06-18 15:55:21', '2019-06-18 15:55:21'),
(1336, 310, 271, 0, '[{\"stt\":1,\"result\":\"77\"},{\"stt\":1,\"result\":\"77\"},{\"stt\":1,\"result\":\"77\"},{\"stt\":1,\"result\":\"77\"}]', 0, 0, '2019-06-18 15:57:14', '2019-06-18 15:57:14'),
(1337, 310, 272, 0, '[{\"stt\":1,\"result\":\"0\"},{\"stt\":1,\"result\":\"0\"},{\"stt\":1,\"result\":\"0\"}]', 0, 0, '2019-06-18 15:57:14', '2019-06-18 15:57:14'),
(1338, 310, 273, 2, '', 0, 0, '2019-06-18 15:57:14', '2019-06-18 15:57:14'),
(1339, 311, 269, 0, '[{\"stt\":1,\"result\":\"98\",\"value\":\"97\"},{\"stt\":1,\"result\":\"98\",\"value\":\"97\"},{\"stt\":1,\"result\":\"98\",\"value\":\"97\"},{\"stt\":1,\"result\":\"98\",\"value\":\"97\"}]', 0, 0, '2019-06-18 23:10:51', '2019-06-18 23:10:51'),
(1340, 311, 270, 0, '[{\"stt\":1,\"result\":\"0\",\"value\":1},{\"stt\":1,\"result\":\"0\",\"value\":1}]', 0, 0, '2019-06-18 23:10:51', '2019-06-18 23:10:51'),
(1341, 312, 269, 0, '[{\"stt\":1,\"result\":\"98\",\"value\":\"22\"},{\"stt\":2,\"result\":\"97\",\"value\":\"22\"},{\"stt\":3,\"result\":\"100\",\"value\":\"33\"},{\"stt\":4,\"result\":\"91\",\"value\":\"91\"}]', 0, 0, '2019-06-19 14:46:56', '2019-06-19 14:46:56'),
(1342, 312, 270, 0, '[{\"stt\":1,\"result\":\"0\",\"value\":1},{\"stt\":3,\"result\":\"0\",\"value\":1}]', 0, 0, '2019-06-19 14:46:56', '2019-06-19 14:46:56'),
(1343, 313, 271, 0, '[{\"stt\":1,\"result\":\"98\",\"value\":\"98\"},{\"stt\":2,\"result\":\"97\",\"value\":\"97\"},{\"stt\":3,\"result\":\"100\",\"value\":\"100\"},{\"stt\":4,\"result\":\"91\",\"value\":\"91\"}]', 1, 0, '2019-06-26 14:46:17', '2019-06-26 14:46:17'),
(1344, 313, 272, 0, '[{\"stt\":3,\"result\":\"0\",\"value\":1},{\"stt\":4,\"result\":\"4\",\"value\":1}]', 0, 0, '2019-06-19 14:49:45', '2019-06-19 14:49:45'),
(1345, 313, 273, 0, '', 0, 0, '2019-06-19 14:49:45', '2019-06-19 14:49:45'),
(1346, 314, 271, 0, '', 0, 0, '2019-06-19 14:51:22', '2019-06-19 14:51:22'),
(1347, 314, 272, 0, '', 0, 0, '2019-06-19 14:51:22', '2019-06-19 14:51:22'),
(1348, 314, 273, 0, '', 0, 0, '2019-06-19 14:51:22', '2019-06-19 14:51:22'),
(1349, 315, 271, 0, '', 0, 0, '2019-06-19 14:52:41', '2019-06-19 14:52:41'),
(1350, 315, 272, 0, '', 0, 0, '2019-06-19 14:52:41', '2019-06-19 14:52:41'),
(1351, 315, 273, 0, '', 0, 0, '2019-06-19 14:52:41', '2019-06-19 14:52:41'),
(1352, 316, 271, 0, '', 0, 0, '2019-06-19 14:53:35', '2019-06-19 14:53:35'),
(1353, 316, 272, 0, '', 0, 0, '2019-06-19 14:53:35', '2019-06-19 14:53:35'),
(1354, 316, 273, 0, '', 0, 0, '2019-06-19 14:53:35', '2019-06-19 14:53:35'),
(1355, 317, 271, 0, '[{\"stt\":1,\"result\":\"98\",\"value\":\"3\"},{\"stt\":2,\"result\":\"97\",\"value\":\"3\"},{\"stt\":3,\"result\":\"100\",\"value\":\"3\"},{\"stt\":4,\"result\":\"91\",\"value\":\"3\"}]', 0, 0, '2019-06-19 23:48:21', '2019-06-19 23:48:21'),
(1356, 317, 272, 0, '[{\"stt\":3,\"result\":\"0\",\"value\":1}]', 0, 0, '2019-06-19 23:48:21', '2019-06-19 23:48:21'),
(1357, 317, 273, 0, '[{\"stt\":4,\"result\":\"0\",\"value\":4}]', 0, 0, '2019-06-19 23:48:21', '2019-06-19 23:48:21'),
(1358, 318, 269, 0, '[{\"stt\":1,\"result\":\"98\",\"value\":\"98\"},{\"stt\":2,\"result\":\"97\",\"value\":\"97\"},{\"stt\":3,\"result\":\"100\",\"value\":\"100\"},{\"stt\":4,\"result\":\"91\",\"value\":\"91\"}]', 0, 0, '2019-06-19 23:42:17', '2019-06-19 23:42:17'),
(1359, 318, 270, 0, '[]', 0, 0, '2019-06-19 23:42:17', '2019-06-19 23:42:17'),
(1360, 319, 269, 0, '', 0, 0, '2019-06-19 23:45:17', '2019-06-19 23:45:17'),
(1361, 319, 270, 0, '', 0, 0, '2019-06-19 23:45:17', '2019-06-19 23:45:17'),
(1362, 320, 269, 0, '', 0, 0, '2019-06-19 23:46:14', '2019-06-19 23:46:14'),
(1363, 320, 270, 0, '', 0, 0, '2019-06-19 23:46:14', '2019-06-19 23:46:14'),
(1364, 321, 271, 0, '', 0, 0, '2019-06-19 23:55:52', '2019-06-19 23:55:52'),
(1365, 321, 272, 0, '', 0, 0, '2019-06-19 23:55:52', '2019-06-19 23:55:52'),
(1366, 321, 273, 0, '', 0, 0, '2019-06-19 23:55:52', '2019-06-19 23:55:52'),
(1367, 322, 269, 0, '[{\"stt\":1,\"result\":\"98\",\"value\":\"8\"},{\"stt\":2,\"result\":\"97\",\"value\":\"9\"},{\"stt\":3,\"result\":\"100\",\"value\":\"0\"},{\"stt\":4,\"result\":\"91\",\"value\":\"6\"}]', 0, 0, '2019-06-26 00:07:38', '2019-06-26 00:07:38'),
(1368, 322, 270, 0, '[{\"stt\":2,\"result\":\"2\",\"value\":1},{\"stt\":4,\"result\":\"4\",\"value\":1}]', 0, 0, '2019-06-26 00:07:38', '2019-06-26 00:07:38'),
(1369, 323, 269, 0, '[{\"stt\":1,\"result\":\"98\",\"value\":\"1\"},{\"stt\":2,\"result\":\"97\",\"value\":\"1\"},{\"stt\":3,\"result\":\"100\",\"value\":\"1\"},{\"stt\":4,\"result\":\"91\",\"value\":\"91\"}]', 0, 0, '2019-06-26 13:24:54', '2019-06-26 13:24:54'),
(1370, 323, 270, 0, '[{\"stt\":2,\"result\":\"2\",\"value\":1},{\"stt\":3,\"result\":\"0\",\"value\":1}]', 0, 0, '2019-06-26 13:24:54', '2019-06-26 13:24:54'),
(1371, 324, 269, 0, '[{\"stt\":1,\"result\":\"98\",\"value\":\"88\"},{\"stt\":2,\"result\":\"97\",\"value\":\"88\"},{\"stt\":3,\"result\":\"100\",\"value\":\"100\"},{\"stt\":4,\"result\":\"91\",\"value\":\"91\"}]', 0, 0, '2019-06-26 13:27:34', '2019-06-26 13:27:34'),
(1372, 324, 270, 0, '[{\"stt\":1,\"result\":\"0\",\"value\":1},{\"stt\":2,\"result\":\"2\",\"value\":1},{\"stt\":3,\"result\":\"0\",\"value\":1},{\"stt\":4,\"result\":\"4\",\"value\":1}]', 0, 0, '2019-06-26 13:27:34', '2019-06-26 13:27:34'),
(1373, 325, 269, 0, '', 0, 0, '2019-06-26 13:29:59', '2019-06-26 13:29:59'),
(1374, 325, 270, 0, '', 0, 0, '2019-06-26 13:29:59', '2019-06-26 13:29:59'),
(1375, 326, 271, 0, '[{\"stt\":1,\"result\":\"98\",\"value\":\"98\"},{\"stt\":2,\"result\":\"97\",\"value\":\"97\"},{\"stt\":3,\"result\":\"100\",\"value\":\"100\"},{\"stt\":4,\"result\":\"91\",\"value\":\"91\"}]', 0, 0, '2019-06-26 13:36:15', '2019-06-26 13:36:15'),
(1376, 326, 272, 0, '[{\"stt\":2,\"result\":\"2\",\"value\":1},{\"stt\":3,\"result\":\"0\",\"value\":1}]', 0, 0, '2019-06-26 13:36:15', '2019-06-26 13:36:15'),
(1377, 326, 273, 0, '[{\"stt\":3,\"result\":\"0\",\"value\":3}]', 0, 0, '2019-06-26 13:36:15', '2019-06-26 13:36:15'),
(1378, 327, 269, 0, '', 0, 0, '2019-06-26 14:11:16', '2019-06-26 14:11:16'),
(1379, 327, 270, 0, '', 0, 0, '2019-06-26 14:11:16', '2019-06-26 14:11:16'),
(1380, 328, 269, 0, '[]', 1, 0, '2019-06-26 15:22:29', '2019-06-26 15:22:29'),
(1381, 328, 270, 0, '[]', 1, 0, '2019-06-26 15:22:29', '2019-06-26 15:22:29'),
(1382, 329, 269, 0, '', 0, 0, '2019-06-26 14:13:24', '2019-06-26 14:13:24'),
(1383, 329, 270, 0, '', 0, 0, '2019-06-26 14:13:24', '2019-06-26 14:13:24'),
(1384, 330, 269, 0, '[{\"stt\":1,\"result\":\"98\",\"value\":\"9\"},{\"stt\":2,\"result\":\"97\",\"value\":\"9\"},{\"stt\":3,\"result\":\"100\",\"value\":\"9\"},{\"stt\":4,\"result\":\"91\",\"value\":\"9\"}]', 0, 0, '2019-06-26 14:20:52', '2019-06-26 14:20:52'),
(1385, 330, 270, 0, '[{\"stt\":1,\"result\":\"0\",\"value\":1},{\"stt\":2,\"result\":\"2\",\"value\":1}]', 0, 0, '2019-06-26 14:20:52', '2019-06-26 14:20:52'),
(1386, 331, 269, 0, '', 0, 0, '2019-06-26 14:43:44', '2019-06-26 14:43:44'),
(1387, 331, 270, 0, '', 0, 0, '2019-06-26 14:43:44', '2019-06-26 14:43:44'),
(1388, 332, 269, 0, '[{\"stt\":1,\"result\":\"98\",\"value\":\"98\"},{\"stt\":2,\"result\":\"97\",\"value\":\"97\"},{\"stt\":3,\"result\":\"100\",\"value\":\"100\"},{\"stt\":4,\"result\":\"91\",\"value\":\"91\"}]', 1, 0, '2019-06-26 14:48:23', '2019-06-26 14:48:23'),
(1389, 332, 270, 0, '[{\"stt\":1,\"result\":\"0\",\"value\":1},{\"stt\":4,\"result\":\"4\",\"value\":1}]', 0, 0, '2019-06-26 14:47:00', '2019-06-26 14:47:00'),
(1390, 333, 269, 0, '[{\"stt\":1,\"result\":\"98\",\"value\":\"98\"},{\"stt\":2,\"result\":\"97\",\"value\":\"97\"},{\"stt\":3,\"result\":\"100\",\"value\":\"100\"},{\"stt\":4,\"result\":\"91\",\"value\":\"91\"}]', 1, 0, '2019-06-27 13:36:50', '2019-06-27 13:36:50'),
(1391, 333, 270, 0, '[{\"stt\":2,\"result\":\"2\",\"value\":1},{\"stt\":4,\"result\":\"4\",\"value\":1}]', 0, 0, '2019-06-27 13:29:01', '2019-06-27 13:29:01'),
(1392, 334, 271, 0, '[{\"stt\":1,\"result\":\"98\",\"value\":\"98\"},{\"stt\":2,\"result\":\"97\",\"value\":\"97\"},{\"stt\":3,\"result\":\"100\",\"value\":\"100\"},{\"stt\":4,\"result\":\"91\",\"value\":\"91\"}]', 1, 0, '2019-06-27 00:17:52', '2019-06-27 00:17:52'),
(1393, 334, 272, 0, '[{\"stt\":2,\"result\":\"2\",\"value\":1},{\"stt\":4,\"result\":\"4\",\"value\":1}]', 0, 0, '2019-06-26 15:00:16', '2019-06-26 15:00:16'),
(1394, 334, 273, 0, '[{\"stt\":3,\"result\":\"0\",\"value\":3}]', 1, 0, '2019-06-27 00:17:52', '2019-06-27 00:17:52'),
(1395, 335, 269, 0, '[{\"stt\":1,\"result\":\"98\",\"value\":\"98\"},{\"stt\":2,\"result\":\"97\",\"value\":\"97\"},{\"stt\":3,\"result\":\"100\",\"value\":\"100\"},{\"stt\":4,\"result\":\"91\",\"value\":\"91\"}]', 1, 0, '2019-06-26 15:25:39', '2019-06-26 15:25:39'),
(1396, 335, 270, 0, '[{\"stt\":2,\"result\":\"2\",\"value\":1},{\"stt\":4,\"result\":\"4\",\"value\":1}]', 0, 0, '2019-06-26 15:25:39', '2019-06-26 15:25:39'),
(1397, 336, 269, 0, '[{\"stt\":1,\"result\":\"98\",\"value\":\"\"},{\"stt\":2,\"result\":\"97\",\"value\":\"\"},{\"stt\":3,\"result\":\"100\",\"value\":\"\"},{\"stt\":4,\"result\":\"91\",\"value\":\"\"}]', 0, 0, '2019-06-27 15:28:37', '2019-06-27 15:28:37'),
(1398, 336, 270, 0, '[{\"stt\":1,\"result\":\"0\",\"value\":0},{\"stt\":2,\"result\":\"2\",\"value\":0},{\"stt\":3,\"result\":\"0\",\"value\":0},{\"stt\":4,\"result\":\"4\",\"value\":0}]', 0, 0, '2019-06-27 15:28:37', '2019-06-27 15:28:37'),
(1399, 339, 271, 0, '[{\"stt\":1,\"result\":\"98\",\"value\":\"98\"},{\"stt\":2,\"result\":\"97\",\"value\":\"97\"},{\"stt\":3,\"result\":\"100\",\"value\":\"100\"},{\"stt\":4,\"result\":\"91\",\"value\":\"91\"}]', 1, 0, '2019-06-27 15:28:14', '2019-06-27 15:28:14'),
(1400, 339, 272, 0, '[{\"stt\":1,\"result\":\"0\",\"value\":0},{\"stt\":2,\"result\":\"2\",\"value\":2},{\"stt\":3,\"result\":\"0\",\"value\":0},{\"stt\":4,\"result\":\"4\",\"value\":4}]', 1, 0, '2019-06-27 15:28:14', '2019-06-27 15:28:14'),
(1401, 339, 273, 0, '[{\"stt\":1,\"result\":\"0\",\"value\":0},{\"stt\":2,\"result\":\"2\",\"value\":0},{\"stt\":3,\"result\":\"0\",\"value\":3},{\"stt\":4,\"result\":\"0\",\"value\":0}]', 1, 0, '2019-06-27 15:28:14', '2019-06-27 15:28:14');

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
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_video` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `m_khoa_hoc`
--

INSERT INTO `m_khoa_hoc` (`id`, `code`, `course`, `class`, `name`, `full_name`, `alias`, `description`, `image`, `onpost`, `unit_price`, `status`, `user_id`, `created_at`, `updated_at`, `link_video`) VALUES
(1, 'HHQ50', 0, 5, 'Cơ bản', 'Lớp 5 - Cơ bản', 'co-ban', '<p>Kh&oacute;a học gi&uacute;p học sinh chinh phục được khối kiến thức <strong>Cơ bản</strong>&nbsp;của m&ocirc;n <strong>To&aacute;n </strong>v&agrave; <strong>Tiếng Việt lớp 4.</strong></p>', 'public/uploads/images/201903/chjwu2tKzm.jpg', 0, 500000, 1, 13, '2019-04-24 14:54:38', '2019-03-29 13:52:01', 'https://www.youtube.com/embed/zpOULjyy-n8'),
(4, 'HHQ51', 1, 5, 'Nâng cao', 'Lớp 5 - Nâng cao', 'nang-cao', '<p>Kh&oacute;a học gi&uacute;p học sinh chinh phục được khối kiến thức <strong>N&acirc;ng cao</strong>&nbsp;của m&ocirc;n <strong>To&aacute;n </strong>v&agrave; <strong>Tiếng Việt lớp 5.</strong></p>', 'public/uploads/images/201903/uqWBSI2iEE.jpg', 0, 0, 1, 13, '2019-04-24 14:54:38', '2019-03-29 13:51:56', 'https://www.youtube.com/embed/zpOULjyy-n8'),
(5, 'HHQ40', 0, 4, 'Cơ bản', 'Lớp 4 - Cơ bản', 'co-ban', '<p>Kh&oacute;a học gi&uacute;p học sinh chinh phục được khối kiến thức <strong>Cơ bản</strong>&nbsp;của m&ocirc;n <strong>To&aacute;n </strong>v&agrave; <strong>Tiếng Việt lớp 4.</strong></p>', 'public/uploads/images/201903/rFqwYVe90V.jpg', 0, 0, 1, 13, '2019-04-24 14:54:38', '2019-03-29 13:51:50', 'https://www.youtube.com/embed/zpOULjyy-n8'),
(6, 'HHQ41', 1, 4, 'Nâng cao', 'Lớp 4 - Nâng cao', 'nang-cao', '<p>Kh&oacute;a học gi&uacute;p học sinh chinh phục được khối kiến thức <strong>N&acirc;ng cao</strong>&nbsp;của m&ocirc;n <strong>To&aacute;n </strong>v&agrave; <strong>Tiếng Việt lớp 4.</strong></p>', 'public/uploads/images/201903/boAtkdoz7B.jpg', 0, 0, 1, 13, '2019-04-24 14:54:38', '2019-03-29 13:51:43', 'https://www.youtube.com/embed/zpOULjyy-n8');

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
  `answer` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `level` int(2) DEFAULT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci NOT NULL
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
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `from_date` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `to_date` varchar(5) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `m_week`
--

INSERT INTO `m_week` (`id`, `name`, `HK10`, `HK11`, `HK20`, `HK21`, `created_at`, `updated_at`, `from_date`, `to_date`) VALUES
(1, 'Tuần 1', 1, 0, NULL, NULL, '2019-04-10 13:09:29', '2019-07-03 15:53:14', '08-09', '14-09'),
(2, 'Tuần 2', 0, 0, NULL, NULL, '2019-04-10 13:09:29', '2019-07-03 15:52:07', '15-09', '21-09'),
(3, 'Tuần 3', 0, 0, NULL, NULL, '2019-04-10 13:09:29', '2019-07-03 15:54:19', '22-09', '28-09'),
(4, 'Tuần 4', 0, 0, NULL, NULL, '2019-04-10 13:09:29', '2019-04-10 13:09:29', '', ''),
(5, 'Tuần 5', 0, 0, NULL, NULL, '2019-04-10 13:09:29', '2019-04-10 13:09:29', '', ''),
(6, 'Tuần 6', 0, 0, NULL, NULL, '2019-04-10 13:09:29', '2019-04-10 13:09:29', '', ''),
(7, 'Tuần 7', 0, 0, NULL, NULL, '2019-04-10 13:09:29', '2019-04-10 13:09:29', '', ''),
(8, 'Tuần 8', 0, 0, NULL, NULL, '2019-04-10 13:09:29', '2019-04-10 13:09:29', '', ''),
(9, 'Tuần 9', 0, 0, NULL, NULL, '2019-04-10 13:09:29', '2019-04-10 13:09:29', '', ''),
(10, 'Tuần 10', 0, 0, NULL, NULL, '2019-04-10 13:09:29', '2019-04-10 13:09:29', '', ''),
(11, 'Tuần 11', 0, 0, NULL, NULL, '2019-04-10 13:09:29', '2019-04-10 13:09:29', '', ''),
(12, 'Tuần 12', 0, 0, NULL, NULL, '2019-04-10 13:09:29', '2019-04-10 13:09:29', '', ''),
(13, 'Tuần 13', 0, 0, NULL, NULL, '2019-04-10 13:09:29', '2019-04-10 13:09:29', '', ''),
(14, 'Tuần 14', 0, 0, NULL, NULL, '2019-04-10 13:09:29', '2019-04-10 13:09:29', '', ''),
(15, 'Tuần 15', 0, 0, NULL, NULL, '2019-04-10 13:09:29', '2019-04-10 13:09:29', '', ''),
(16, 'Tuần 16', 0, 0, NULL, NULL, '2019-04-10 13:09:29', '2019-04-10 13:09:29', '', ''),
(17, 'Tuần 17', 0, 1, NULL, NULL, '2019-04-10 13:09:29', '2019-04-10 13:09:29', '', ''),
(18, 'Tuần 18', 0, 0, NULL, NULL, '2019-04-10 13:09:29', '2019-04-10 13:09:29', '', ''),
(19, 'Tuần 19', 0, 0, NULL, NULL, '2019-04-10 13:09:29', '2019-04-10 13:09:29', '', ''),
(20, 'Tuần 20', 0, 0, NULL, NULL, '2019-04-10 13:09:29', '2019-04-10 13:09:29', '', ''),
(21, 'Tuần 21', 0, 0, NULL, NULL, '2019-04-10 13:09:29', '2019-04-10 13:09:29', '', ''),
(22, 'Tuần 22', 0, 0, NULL, NULL, '2019-04-10 13:09:29', '2019-04-10 13:09:29', '', ''),
(23, 'Tuần 23', 0, 0, NULL, NULL, '2019-04-10 13:09:29', '2019-04-10 13:09:29', '', ''),
(24, 'Tuần 24', 0, 0, NULL, NULL, '2019-04-10 13:09:29', '2019-04-10 13:09:29', '', ''),
(25, 'Tuần 25', 0, 0, NULL, NULL, '2019-04-10 13:09:29', '2019-04-10 13:09:29', '', ''),
(26, 'Tuần 26', 0, 0, NULL, NULL, '2019-04-10 13:09:29', '2019-04-10 13:09:29', '', ''),
(27, 'Tuần 27', 0, 0, NULL, NULL, '2019-04-10 13:09:29', '2019-04-10 13:09:29', '', ''),
(28, 'Tuần 28', 0, 0, NULL, NULL, '2019-04-10 13:09:29', '2019-04-10 13:09:29', '', ''),
(29, 'Tuần 29', 0, 0, NULL, NULL, '2019-04-10 13:09:29', '2019-04-10 13:09:29', '', ''),
(30, 'Tuần 30', 0, 0, NULL, NULL, '2019-04-10 13:09:29', '2019-04-10 13:09:29', '', ''),
(31, 'Tuần 31', 0, 0, NULL, NULL, '2019-04-10 13:09:29', '2019-04-10 13:09:29', '', ''),
(32, 'Tuần 32', 0, 0, NULL, NULL, '2019-04-10 13:09:29', '2019-04-10 13:09:29', '', ''),
(33, 'Tuần 33', 0, 0, NULL, NULL, '2019-04-10 13:09:29', '2019-04-10 13:09:29', '', ''),
(34, 'Tuần 34', 0, 0, NULL, NULL, '2019-04-10 13:09:29', '2019-04-10 13:09:29', '', ''),
(35, 'Tuần 35', 0, 0, NULL, NULL, '2019-04-10 13:09:29', '2019-04-10 13:09:29', '', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `m_xep_loai`
--

CREATE TABLE `m_xep_loai` (
  `id` int(11) NOT NULL,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `from_point` float NOT NULL,
  `to_point` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `m_xep_loai`
--

INSERT INTO `m_xep_loai` (`id`, `name`, `description`, `from_point`, `to_point`) VALUES
(1, 'Loại kém', '<p>X&ecirc;́p loại kémh</p>', 0, 5.1),
(2, 'Loại khá', 'Xếp loại khác', 5.1, 7),
(3, 'Loại giỏi', 'Xếp loại giỏi', 7.1, 8.9),
(4, 'Xuất sắc', 'Chúc mừng em đã hoàn thành xuất sắc (khá tốt) các kiến thức', 9, 10);

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
(13, 3, 30, '2019-06-25 14:48:50', '2019-06-12 14:13:16'),
(14, 3, 32, '2019-06-13 13:23:04', '2019-06-13 13:08:43'),
(15, 3, 33, '2019-06-13 13:29:30', '2019-06-13 13:29:30'),
(16, 3, 34, '2019-06-13 13:39:44', '2019-06-13 13:39:44'),
(17, 3, 36, '2019-06-13 15:30:22', '0000-00-00 00:00:00'),
(18, 1, 13, '2019-06-25 14:48:58', '2019-06-13 16:04:52'),
(19, 3, 37, '2019-06-14 13:15:01', '2019-06-14 13:15:01');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `temp_answer`
--

CREATE TABLE `temp_answer` (
  `id` bigint(20) NOT NULL,
  `question_id` int(11) NOT NULL,
  `stt` tinyint(2) NOT NULL,
  `answer` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `result` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `temp_questions`
--

CREATE TABLE `temp_questions` (
  `id` int(11) NOT NULL,
  `style` int(3) NOT NULL,
  `used` tinyint(2) NOT NULL,
  `level` smallint(2) NOT NULL,
  `question_id` int(11) NOT NULL,
  `question` text COLLATE utf8_unicode_ci NOT NULL,
  `stt` tinyint(4) NOT NULL,
  `user_id` int(10) NOT NULL,
  `thematic` smallint(5) NOT NULL,
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
(13, 'minhnb', 'minhnb.it@gmail.com', '$2y$10$j.DBpGEVvmJnjVfz7WhC1eq81efPWM3gkpZQ4QFfMZq1e/m/SGsfq', NULL, NULL, 'mJpN4XCSypxTsmh7oPvPI2PW4KrfhPQzoOdlv1nqYHMVYRuwztrZYOXm262V', 1, NULL, NULL, NULL, NULL, 0, '2019-01-08 03:57:04', '2019-01-08 03:57:04'),
(32, 'Mit Xinh', 'lantrinh.mit@gmail.com', '$2y$10$awx64d71aa7i1MQFN.Zi1e9VK2B1mEpIBWDcmv/YUoHCCPDgX24fq', NULL, NULL, 'ocNonYTA3VS3THC3bo1Qiwe8RdAunxFC5drsPV4Qmg2itYArgVYj38Zlvj0k', 1, NULL, NULL, NULL, NULL, 0, '2019-06-13 13:08:43', '2019-06-13 13:08:43'),
(33, 'Hiếu Đặng', 'congdantoancau2018@gmail.com', '$2y$10$J9vN0lDcoSrYEmrkaRIJrObD9J1v0l/TK6HCdz.CbvcC0NbG.Mt/.', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0, '2019-06-13 13:29:30', '2019-06-13 13:29:30'),
(34, 'Medi Food', 'dev.20170918@gmail.com', '$2y$10$PH6DO012N.s/9eSCg8dhvegvzDJUfC/RJxfR8WCQBQ.xKkIOkGCMO', NULL, NULL, 'OyB4EIlRGa925lVZPoYNAHd9B13aHyMzs82VbDNu0q6uaOADIETlESR2xPhq', 1, NULL, NULL, NULL, NULL, 0, '2019-06-13 13:39:44', '2019-06-13 13:39:44'),
(36, 'aaaaaaaa', 'lop4@gmail.com', '$2y$10$SHzGZhXoozgafiOTQkmgOemZ3DqmAa.CHJ8R4OvpdJuVyKuRBwE2i', NULL, NULL, 'W0UbeCjZidPaUarpHsbPiV4wjcmzOSJ5YMyyoqSU60El7OwljhsEFrF5RXyD', 1, NULL, NULL, NULL, NULL, 0, '2019-06-13 15:25:11', '2019-06-13 15:25:11'),
(37, 'Minh Binh', 'minh.ngbinh@gmail.com', '$2y$10$VBSY8c2PwB77dAiAIFXFOuu.50.ulsuQuro/BQqxi6Gj/VN9AqBaO', NULL, NULL, 'L1GyWmUfwZEDjYuoTSmPP7P9rbWxcDusnrZTYt3kUuUwBIYeZQVgp9Xst5rC', 1, NULL, NULL, NULL, NULL, 0, '2019-06-14 13:15:01', '2019-06-14 13:15:01');

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
(27, 32, 'HHQ50', '2019-07-03 00:00:00', '9999-01-01 00:00:00', 1, 32, '2019-07-03 14:06:52', '2019-07-03 14:06:52'),
(28, 34, 'HHQ41', '2019-07-03 00:00:00', '9999-01-01 00:00:00', 0, 34, '2019-07-03 14:07:58', '2019-07-03 14:07:58'),
(29, 34, 'HHQ50', '2019-07-03 00:00:00', '9999-01-01 00:00:00', 0, 34, '2019-07-03 14:08:04', '2019-07-03 14:08:04');

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
(7, 'HK11', 218, 0, '2019-04-10 16:06:05', '2019-04-10 16:06:05'),
(8, 'HK10', 219, 0, '2019-04-10 22:08:49', '2019-04-10 22:08:49'),
(9, 'HK10', 220, 0, '2019-04-10 22:09:27', '2019-04-10 22:09:27'),
(10, 'HK10', 221, 0, '2019-04-10 22:14:02', '2019-04-10 22:14:02'),
(11, 'HK10', 222, 0, '2019-04-10 22:17:49', '2019-04-10 22:17:49'),
(12, 'HK10', 222, 0, '2019-04-10 22:18:04', '2019-04-10 22:18:04'),
(13, 'HK10', 225, 0, '2019-04-10 22:34:32', '2019-04-10 22:34:32'),
(14, 'HK10', 225, 0, '2019-04-10 22:37:55', '2019-04-10 22:37:55'),
(15, 'TUAN', 226, 0, '2019-04-10 22:39:55', '2019-04-10 22:39:55'),
(16, 'HK10', 225, 0, '2019-04-10 22:58:52', '2019-04-10 22:58:52'),
(17, 'HK10', 242, 1, '2019-04-10 23:14:45', '2019-04-10 23:05:27'),
(18, 'HK10', 243, 1, '2019-04-16 15:37:43', '2019-04-16 14:16:53'),
(19, 'QUIZ', 244, 1, '2019-04-16 15:28:57', '2019-04-16 14:23:12'),
(20, 'QUIZ', 244, 1, '2019-04-16 15:35:57', '2019-04-16 15:20:02'),
(21, 'QUIZ', 249, 0, '2019-06-07 16:27:35', '2019-06-07 16:27:35'),
(22, 'QUIZ', 269, 0, '2019-06-13 14:45:40', '2019-06-13 14:45:40');

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
(2, 13, 'Bộ GD công bố chương trình bộ môn giáo dục phổ thông mới', 'bo-gd-cong-bo-chuong-trinh-bo-mon-giao-duc-pho-thong-moi', '<p>Chiều 27/12, Bộ Gi&aacute;o dục đ&atilde; ch&iacute;nh thức c&ocirc;ng bố số m&ocirc;n học của chương tr&igrave;nh gi&aacute;o dục phổ th&ocirc;ng mới gồm tất cả c&aacute;c cấp tiểu học, THCS, THPT, trong đ&oacute; đối với học sinh THPT ngo&agrave;i 5 m&ocirc;n bắt buộc, học sinh THPT phải chọn tối thiểu 5 m&ocirc;n kh&aacute;c của nh&oacute;m m&ocirc;n được lựa chọn.</p>', '<p><strong>Cấp Tiểu học:</strong></p>\r\n\r\n<ul>\r\n	<li>C&aacute;c m&ocirc;n học bắt buộc: Tiếng Việt, To&aacute;n, Ngoại ngữ 1, Gi&aacute;o dục lối sống, Đạo đức, Tự nhi&ecirc;n v&agrave; X&atilde; hội, Lịch sử v&agrave; Địa l&yacute;, Khoa học, Tin học v&agrave; C&ocirc;ng nghệ, Gi&aacute;o dục thể chất, Nghệ thuật.</li>\r\n	<li>C&aacute;c m&ocirc;n học tự chọn: Tiếng d&acirc;n tộc thiểu số v&agrave; Ngoại ngữ 1 (đối với lớp 1 v&agrave; 2).</li>\r\n	<li>M&ocirc;n học mới: Tin học v&agrave; C&ocirc;ng nghệ.</li>\r\n</ul>\r\n\r\n<p><strong>Cấp THCS:&nbsp;</strong></p>\r\n\r\n<ul>\r\n	<li>&nbsp;C&aacute;c m&ocirc;n học bắt buộc: Ngữ văn, To&aacute;n, Ngoại ngữ 1, Gi&aacute;o dục c&ocirc;ng d&acirc;n, Khoa học tự nhi&ecirc;n, Lịch sử v&agrave; Địa l&yacute;, C&ocirc;ng nghệ, Gi&aacute;o dục thể chất, Nghệ thuật, Tin học (trở th&agrave;nh bắt buộc, kh&aacute;c với trước đ&acirc;y l&agrave; tự chọn)</li>\r\n	<li>&nbsp;C&aacute;c m&ocirc;n học tự chọn: Tiếng d&acirc;n tộc thiểu số, ngoại ngữ 2.</li>\r\n</ul>\r\n\r\n<p><strong>Cấp THPT:</strong></p>\r\n\r\n<ul>\r\n	<li>C&aacute;c m&ocirc;n học bắt buộc: Ngữ văn, To&aacute;n, ngoại ngữ 1, Gi&aacute;o dục thể chất, Gi&aacute;o dục quốc ph&ograve;ng v&agrave; an ninh.</li>\r\n	<li>C&aacute;c m&ocirc;n học lựa chọn: theo nh&oacute;m Khoa học x&atilde; hội (gồm c&aacute;c m&ocirc;n: Gi&aacute;o dục kinh tế v&agrave; ph&aacute;p luật, Lịch sử, Địa l&yacute;), nh&oacute;m Khoa học tự nhi&ecirc;n (gồm c&aacute;c m&ocirc;n: Vật l&yacute;, H&oacute;a học, Sinh học), nh&oacute;m C&ocirc;ng nghệ v&agrave; nghệ thuật (gồm c&aacute;c m&ocirc;n: C&ocirc;ng nghệ, Tin học, Nghệ thuật).</li>\r\n	<li>&nbsp;C&aacute;c m&ocirc;n học tự chọn: Tiếng d&acirc;n tộc thiểu số, Ngoại ngữ 2.</li>\r\n</ul>\r\n\r\n<p>Ngo&agrave;i 5 m&ocirc;n bắt buộc, học sinh THPT phải chọn tối thiểu 5 m&ocirc;n kh&aacute;c của nh&oacute;m m&ocirc;n được lựa chọn.</p>\r\n\r\n<p><strong>Lộ tr&igrave;nh thực hiện:</strong></p>\r\n\r\n<p>Bộ GD-ĐT thực hiện lộ tr&igrave;nh &aacute;p dụng Chương tr&igrave;nh Gi&aacute;o dục phổ th&ocirc;ng mới như sau:</p>\r\n\r\n<ul>\r\n	<li>Năm học 2020-2021 đối với lớp 1;</li>\r\n	<li>Năm học 2021-2022 đối với lớp 2 v&agrave; lớp 6;</li>\r\n	<li>Năm học 2022-2023 đối với lớp 3, lớp 7 v&agrave; lớp 10;</li>\r\n	<li>Năm học 2023-2024 đối với lớp 4, lớp 8 v&agrave; lớp 11;</li>\r\n	<li>Năm học 2024-2025 đối với lớp 5, lớp 9 v&agrave; lớp 12.</li>\r\n</ul>', 'uploads/images/201903/V3Oegj3Dn5.jpg', 1, 'Sách giáo khoa', 1, '2019-06-05 21:37:07', '2019-03-30 05:09:30');

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
-- Cấu trúc bảng cho bảng `z_qa`
--

CREATE TABLE `z_qa` (
  `id` int(11) NOT NULL,
  `name` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `status` tinyint(1) NOT NULL,
  `user_id` int(6) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `alias` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `z_qa`
--

INSERT INTO `z_qa` (`id`, `name`, `content`, `status`, `user_id`, `created_at`, `updated_at`, `alias`) VALUES
(1, 'test gì đây', '<p>học như th&ecirc;́ nào?</p>', 0, 13, '2019-04-24 13:29:24', '2019-04-24 13:29:24', ''),
(2, 'Có sự khác biệt nào giữa các loại tập tin firmware ?', '<h2><a href=\"https://www.anphat.vn/nhung-thac-mac-chung/co-su-khac-biet-nao-giua-cac-loai-tap-tin-firmware?template=1\">C&oacute; sự kh&aacute;c biệt n&agrave;o giữa c&aacute;c loại tập tin firmware ? </a></h2>', 1, 13, '2019-04-24 13:51:17', '2019-04-24 13:51:17', ''),
(3, 'Làm sao phục hồi hay sao lưu những thông số cấu hình ?', '<h2><a href=\"https://www.anphat.vn/nhung-thac-mac-chung/lam-sao-phuc-hoi-hay-sao-luu-nhung-thong-so-cau-hinh?template=1\">L&agrave;m sao phục hồi hay sao lưu những th&ocirc;ng số cấu h&igrave;nh ? </a></h2>', 1, 13, '2019-04-24 13:51:24', '2019-04-24 13:51:24', ''),
(4, 'The rand() function generates a random integer.', '<p>The rand() function generates a random integer.</p>', 1, 13, '2019-04-24 14:25:16', '2019-04-24 14:25:16', '');

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
(1, 1, 'test', 'test', 'test', 'https://youtu.be/xCfTGhmDsHg', 'uploads/slider/hbgJ6lTxJe.jpg', 1, 13, '2019-06-05 21:36:04', '2019-03-15 15:26:58'),
(2, 2, 'test', 'tết', 'test', 'https://youtu.be/1mS1QM7igDg', 'uploads/slider/fcF5tgrL1j.jpg', 1, 13, '2019-06-05 21:36:12', '2019-03-15 15:57:03');

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
-- Chỉ mục cho bảng `m_xep_loai`
--
ALTER TABLE `m_xep_loai`
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
-- Chỉ mục cho bảng `z_qa`
--
ALTER TABLE `z_qa`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1077;

--
-- AUTO_INCREMENT cho bảng `m_cau_hoi`
--
ALTER TABLE `m_cau_hoi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=277;

--
-- AUTO_INCREMENT cho bảng `m_chuyen_de`
--
ALTER TABLE `m_chuyen_de`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `m_exam`
--
ALTER TABLE `m_exam`
  MODIFY `id` smallint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `m_giao_vien`
--
ALTER TABLE `m_giao_vien`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `m_ket_qua_quiz`
--
ALTER TABLE `m_ket_qua_quiz`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=340;

--
-- AUTO_INCREMENT cho bảng `m_ket_qua_quiz_question`
--
ALTER TABLE `m_ket_qua_quiz_question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1402;

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
-- AUTO_INCREMENT cho bảng `m_xep_loai`
--
ALTER TABLE `m_xep_loai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `roles`
--
ALTER TABLE `roles`
  MODIFY `id` tinyint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `role_user`
--
ALTER TABLE `role_user`
  MODIFY `id` tinyint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT cho bảng `user_course`
--
ALTER TABLE `user_course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT cho bảng `w_job_send_email`
--
ALTER TABLE `w_job_send_email`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

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
-- AUTO_INCREMENT cho bảng `z_qa`
--
ALTER TABLE `z_qa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `z_slider`
--
ALTER TABLE `z_slider`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
