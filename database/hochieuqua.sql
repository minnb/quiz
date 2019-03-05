-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th3 05, 2019 lúc 11:14 AM
-- Phiên bản máy phục vụ: 10.1.32-MariaDB
-- Phiên bản PHP: 7.2.5

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
(1, 1, 6, '9', '', '', 0, '', '2019-02-13 04:47:12', '2019-01-10 15:26:44'),
(2, 2, 6, '11', '', '', 0, '', '2019-02-13 04:47:12', '2019-01-10 15:26:44'),
(3, 3, 6, '10', '', '', 3, '', '2019-02-13 04:47:12', '2019-01-10 15:26:44'),
(4, 4, 6, '15', '', '', 0, '', '2019-02-13 04:47:12', '2019-01-10 15:26:44'),
(5, 1, 8, '0,0834', '', '', 0, '', '2019-02-13 04:55:25', '2019-02-13 04:55:25'),
(6, 2, 8, '0,834', '', '', 0, '', '2019-02-13 04:55:25', '2019-02-13 04:55:25'),
(7, 3, 8, '8,34', '', '', 0, '', '2019-02-13 04:55:25', '2019-02-13 04:55:25'),
(8, 4, 8, '83,4', '', '', 4, '', '2019-02-13 04:55:25', '2019-02-13 04:55:25'),
(9, 1, 9, '47,480', '', '', 0, '', '2019-02-13 05:00:38', '2019-02-13 05:00:38'),
(10, 2, 9, '47,48', '', '', 2, '', '2019-02-13 05:00:38', '2019-02-13 05:00:38'),
(11, 3, 9, '47,0480', '', '', 0, '', '2019-02-13 05:00:38', '2019-02-13 05:00:38'),
(12, 4, 9, '47,048', '', '', 0, '', '2019-02-13 05:00:38', '2019-02-13 05:00:38'),
(13, 1, 10, '13%', '', '', 0, '', '2019-02-13 05:04:09', '2019-02-13 05:04:09'),
(14, 2, 10, '25%', '', '', 0, '', '2019-02-13 05:04:09', '2019-02-13 05:04:09'),
(15, 3, 10, '52%', '', '', 3, '', '2019-02-13 05:04:09', '2019-02-13 05:04:09'),
(16, 4, 10, '20%', '', '', 0, '', '2019-02-13 05:04:09', '2019-02-13 05:04:09'),
(17, 1, 11, '600.000đ', '', '', 0, '', '2019-02-13 05:05:22', '2019-02-13 05:05:22'),
(18, 2, 11, '240.000đ', '', '', 2, '', '2019-02-13 05:05:22', '2019-02-13 05:05:22'),
(19, 3, 11, '240.000đ', '', '', 0, '', '2019-02-13 05:05:22', '2019-02-13 05:05:22'),
(20, 4, 11, '480.000đ', '', '', 0, '', '2019-02-13 05:05:22', '2019-02-13 05:05:22'),
(21, 1, 12, '2/3', '', '', 1, '', '2019-02-13 05:39:22', '2019-02-13 05:39:22'),
(22, 2, 12, '3/6', '', '', 0, '', '2019-02-13 05:39:22', '2019-02-13 05:39:22'),
(23, 3, 12, '6/12', '', '', 0, '', '2019-02-13 05:39:22', '2019-02-13 05:39:22'),
(24, 4, 12, '4/8', '', '', 0, '', '2019-02-13 05:39:22', '2019-02-13 05:39:22'),
(25, 1, 13, '1/2', '', '', 1, '', '2019-02-13 05:40:51', '2019-02-13 05:40:51'),
(26, 2, 13, '7/14', '', '', 0, '', '2019-02-13 05:40:51', '2019-02-13 05:40:51'),
(27, 3, 13, '0,5', '', '', 0, '', '2019-02-13 05:40:51', '2019-02-13 05:40:51'),
(28, 4, 13, '1/14', '', '', 0, '', '2019-02-13 05:40:51', '2019-02-13 05:40:51'),
(53, 1, 20, '14', '', '', 1, '', '2019-03-01 15:39:28', '2019-03-01 15:39:28'),
(54, 2, 20, '15', '', '', 0, '', '2019-03-01 15:39:28', '2019-03-01 15:39:28'),
(55, 3, 20, '13', '', '', 0, '', '2019-03-01 15:39:28', '2019-03-01 15:39:28'),
(56, 4, 20, '16', '', '', 0, '', '2019-03-01 15:39:28', '2019-03-01 15:39:28'),
(57, 1, 21, '44', '', '', 0, '', '2019-03-01 15:39:28', '2019-03-01 15:39:28'),
(58, 2, 21, '34', '', '', 0, '', '2019-03-01 15:39:28', '2019-03-01 15:39:28'),
(59, 3, 21, '40', '', '', 3, '', '2019-03-01 15:39:28', '2019-03-01 15:39:28'),
(60, 4, 21, '41', '', '', 0, '', '2019-03-01 15:39:28', '2019-03-01 15:39:28'),
(61, 1, 22, '5', '', '', 0, '', '2019-03-01 15:39:28', '2019-03-01 15:39:28'),
(62, 2, 22, '6', '', '', 2, '', '2019-03-01 15:39:28', '2019-03-01 15:39:28'),
(63, 3, 22, '7', '', '', 0, '', '2019-03-01 15:39:28', '2019-03-01 15:39:28'),
(64, 4, 22, '8', '', '', 0, '', '2019-03-01 15:39:28', '2019-03-01 15:39:28'),
(65, 1, 23, '14', '', '', 1, '', '2019-03-01 15:52:57', '2019-03-01 15:52:57'),
(66, 2, 23, '15', '', '', 0, '', '2019-03-01 15:52:57', '2019-03-01 15:52:57'),
(67, 3, 23, '13', '', '', 0, '', '2019-03-01 15:52:57', '2019-03-01 15:52:57'),
(68, 4, 23, '16', '', '', 0, '', '2019-03-01 15:52:57', '2019-03-01 15:52:57'),
(69, 1, 24, '14', '', '', 1, '', '2019-03-01 16:05:36', '2019-03-01 16:05:36'),
(70, 2, 24, '15', '', '', 0, '', '2019-03-01 16:05:36', '2019-03-01 16:05:36'),
(71, 3, 24, '13', '', '', 0, '', '2019-03-01 16:05:36', '2019-03-01 16:05:36'),
(72, 4, 24, '16', '', '', 0, '', '2019-03-01 16:05:36', '2019-03-01 16:05:36'),
(73, 1, 25, '6', '', '', 1, '', '2019-03-01 16:05:36', '2019-03-01 16:05:36'),
(74, 2, 25, '7', '', '', 0, '', '2019-03-01 16:05:36', '2019-03-01 16:05:36'),
(75, 3, 25, '8', '', '', 0, '', '2019-03-01 16:05:36', '2019-03-01 16:05:36'),
(76, 4, 25, '14', '', '', 0, '', '2019-03-01 16:05:36', '2019-03-01 16:05:36'),
(77, 1, 26, '15', '', '', 0, '', '2019-03-01 16:05:36', '2019-03-01 16:05:36'),
(78, 2, 26, '16', '', '', 0, '', '2019-03-01 16:05:36', '2019-03-01 16:05:36'),
(79, 3, 26, '13', '', '', 3, '', '2019-03-01 16:05:36', '2019-03-01 16:05:36'),
(80, 4, 26, '10', '', '', 0, '', '2019-03-01 16:05:36', '2019-03-01 16:05:36'),
(81, 1, 27, '14', '', '', 1, '', '2019-03-01 16:08:03', '2019-03-01 16:08:03'),
(82, 2, 27, '15', '', '', 0, '', '2019-03-01 16:08:03', '2019-03-01 16:08:03'),
(83, 3, 27, '13', '', '', 0, '', '2019-03-01 16:08:03', '2019-03-01 16:08:03'),
(84, 4, 27, '16', '', '', 0, '', '2019-03-01 16:08:03', '2019-03-01 16:08:03'),
(85, 1, 28, '6', '', '', 1, '', '2019-03-01 16:08:03', '2019-03-01 16:08:03'),
(86, 2, 28, '7', '', '', 0, '', '2019-03-01 16:08:03', '2019-03-01 16:08:03'),
(87, 3, 28, '8', '', '', 0, '', '2019-03-01 16:08:03', '2019-03-01 16:08:03'),
(88, 4, 28, '14', '', '', 0, '', '2019-03-01 16:08:03', '2019-03-01 16:08:03'),
(89, 1, 29, '15', '', '', 0, '', '2019-03-01 16:08:03', '2019-03-01 16:08:03'),
(90, 2, 29, '16', '', '', 0, '', '2019-03-01 16:08:03', '2019-03-01 16:08:03'),
(91, 3, 29, '13', '', '', 3, '', '2019-03-01 16:08:03', '2019-03-01 16:08:03'),
(92, 4, 29, '10', '', '', 0, '', '2019-03-01 16:08:03', '2019-03-01 16:08:03');

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
(6, 'radio', 1, 'HHQ40', 2, NULL, 'Tính tổng 5 + 5', 'tinh-tong-5-+-5', NULL, 1, 1, 3, 13, '2019-02-14 14:59:16', '2019-02-13 04:47:12'),
(8, 'radio', 1, 'HHQ50', 9, NULL, 'Phân số thập phân 834/10 được viết dưới dạng số thập phân là:', 'phan-so-thap-phan-834-10-duoc-viet-duoi-dang-so-thap-phan-la:', NULL, 1, 1, 4, 13, '2019-02-14 14:58:46', '2019-02-13 04:55:25'),
(9, 'radio', 1, 'HHQ50', 9, NULL, 'Số \"Bốn mươi bảy đơn vị bốn phần mười và tám phần trăm\" viết như sau', 'so-bon-muoi-bay-don-vi-bon-phan-muoi-va-tam-phan-tram-viet-nhu-sau', NULL, 2, 1, 2, 13, '2019-02-14 14:58:58', '2019-02-13 05:00:48'),
(10, 'radio', 1, 'HHQ50', 9, NULL, 'Lớp học có 25 học sinh, trong đó có 13 nữ. Số học sinh nữ chiếm bao nhiêu phần trăm của lớp học đó?', 'lop-hoc-co-25-hoc-sinh,-trong-do-co-13-nu-so-hoc-sinh-nu-chiem-bao-nhieu-phan-tram-cua-lop-hoc-do+', NULL, 4, 1, 3, 13, '2019-02-14 14:59:04', '2019-02-13 05:04:09'),
(11, 'radio', 1, 'HHQ50', 9, NULL, 'Mua 2 quyển vở hết 24.000 đồng. Vậy mua 10 quyển vở như thế hết số tiền là:', 'mua-2-quyen-vo-het-24-000-dong-vay-mua-10-quyen-vo-nhu-the-het-so-tien-la:', NULL, 3, 1, 2, 13, '2019-02-14 14:59:07', '2019-02-13 05:05:22'),
(12, 'radio', 1, 'HHQ50', 9, NULL, 'Kết quả rút gọn của phân số 12/24 là:', 'ket-qua-rut-gon-cua-phan-so-12-24-la:', NULL, 1, 1, 1, 13, '2019-02-14 14:59:10', '2019-02-13 05:39:22'),
(13, 'radio', 1, 'HHQ50', 9, NULL, 'Kết quả rút gọn của phân số 7/14 là:', 'ket-qua-rut-gon-cua-phan-so-7-14-la:', NULL, 1, 1, 1, 13, '2019-02-14 14:59:14', '2019-02-13 05:40:51'),
(20, 'radio', 0, 'HHQ51', 15, NULL, 'Chọn đáp án đúng 10 + 4', '', '', 1, 1, 1, 13, '2019-03-01 15:39:28', '2019-03-01 15:39:28'),
(21, 'radio', 0, 'HHQ51', 15, NULL, 'Chọn đáp án đúng 10 x 4', '', '', 1, 1, 3, 13, '2019-03-01 15:39:28', '2019-03-01 15:39:28'),
(22, 'radio', 0, 'HHQ51', 15, NULL, 'Chọn đáp án đúng 10 - 4', '', '', 1, 1, 2, 13, '2019-03-01 15:39:28', '2019-03-01 15:39:28'),
(23, 'radio', 1, 'HHQ50', 10, NULL, 'Chọn đáp án đúng 10 + 4', '', '', 1, 1, 1, 13, '2019-03-01 15:52:57', '2019-03-01 15:52:57'),
(24, 'radio', 0, 'HHQ51', 8, NULL, 'Chọn đáp án đúng 10 + 4', '', '', 1, 1, 1, 13, '2019-03-01 16:05:36', '2019-03-01 16:05:36'),
(25, 'radio', 0, 'HHQ51', 8, NULL, 'Chọn đáp án đúng 10 - 4', '', '', 1, 1, 1, 13, '2019-03-01 16:05:36', '2019-03-01 16:05:36'),
(26, 'radio', 0, 'HHQ51', 8, NULL, 'Chọn đáp án đúng 10 + 4 - 1', '', '', 1, 1, 3, 13, '2019-03-01 16:05:36', '2019-03-01 16:05:36'),
(27, 'radio', 0, 'HHQ50', 10, NULL, 'Chọn đáp án đúng 10 + 4', '', '', 1, 1, 1, 13, '2019-03-01 16:08:03', '2019-03-01 16:08:03'),
(28, 'radio', 0, 'HHQ50', 10, NULL, 'Chọn đáp án đúng 10 - 4', '', '', 1, 1, 1, 13, '2019-03-01 16:08:03', '2019-03-01 16:08:03'),
(29, 'radio', 0, 'HHQ50', 10, NULL, 'Chọn đáp án đúng 10 + 4 - 1', '', '', 1, 1, 3, 13, '2019-03-01 16:08:03', '2019-03-01 16:08:03');

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
  `success` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `m_ket_qua_quiz`
--

INSERT INTO `m_ket_qua_quiz` (`id`, `type`, `user_id`, `result`, `description`, `comment`, `course`, `thematic`, `lesson`, `status`, `success`, `created_at`, `updated_at`) VALUES
(67, 'CHUYENDE', 17, 0, '', 'CHUYENDE', 'HHQ50', 9, 2, 1, 0, '2019-02-14 15:21:31', '2019-02-19 15:36:22'),
(68, 'CHUYENDE', 17, 0, '', 'CHUYENDE', 'HHQ50', 9, 4, 0, 0, '2019-02-14 15:22:19', '2019-02-14 15:22:19'),
(69, 'CHUYENDE', 17, 0, '', 'CHUYENDE', 'HHQ50', 14, 13, 0, 0, '2019-02-19 16:02:31', '2019-02-19 16:02:31'),
(70, 'CHUYENDE', 17, 0, '', 'CHUYENDE', 'HHQ50', 9, 3, 1, 0, '2019-02-19 16:02:48', '2019-02-19 16:03:02'),
(71, 'CHUYENDE', 17, 0, '', 'CHUYENDE', 'HHQ50', 10, 9, 0, 0, '2019-02-27 16:16:41', '2019-02-27 16:16:41'),
(72, 'CHUYENDE', 17, 0, '', 'CHUYENDE', 'HHQ50', 12, 11, 0, 0, '2019-02-27 16:16:55', '2019-02-27 16:16:55'),
(73, 'CHUYENDE', 17, 0, '', 'CHUYENDE', 'HHQ50', 10, 10, 0, 0, '2019-02-27 16:21:55', '2019-02-27 16:21:55'),
(74, 'CHUYENDE', 17, 0, '', 'CHUYENDE', 'HHQ50', 12, 12, 0, 0, '2019-02-27 16:22:00', '2019-02-27 16:22:00'),
(75, 'CHUYENDE', 17, 0, '', 'CHUYENDE', 'HHQ50', 14, 14, 0, 0, '2019-02-27 16:22:03', '2019-02-27 16:22:03'),
(76, 'CHUYENDE', 17, 0, '', 'CHUYENDE', 'HHQ50', 9, 0, 0, 0, '2019-02-27 16:28:06', '2019-02-27 16:28:06');

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
(303, 67, 8, 2, '', 4, 0, '2019-02-19 15:36:22', '2019-02-19 15:36:22'),
(304, 67, 12, 4, '', 1, 0, '2019-02-19 15:36:22', '2019-02-19 15:36:22'),
(305, 67, 9, 3, '', 2, 0, '2019-02-19 15:36:22', '2019-02-19 15:36:22'),
(306, 67, 11, 2, '', 2, 0, '2019-02-19 15:36:22', '2019-02-19 15:36:22'),
(307, 67, 10, 1, '', 3, 0, '2019-02-19 15:36:22', '2019-02-19 15:36:22'),
(308, 68, 12, 0, '', 1, 0, '2019-02-14 15:22:19', '2019-02-14 15:22:19'),
(309, 68, 13, 0, '', 1, 0, '2019-02-14 15:22:19', '2019-02-14 15:22:19'),
(310, 68, 9, 0, '', 2, 0, '2019-02-14 15:22:19', '2019-02-14 15:22:19'),
(311, 68, 11, 0, '', 2, 0, '2019-02-14 15:22:19', '2019-02-14 15:22:19'),
(312, 68, 10, 0, '', 3, 0, '2019-02-14 15:22:19', '2019-02-14 15:22:19'),
(313, 70, 8, 4, '', 4, 0, '2019-02-19 16:03:02', '2019-02-19 16:03:02'),
(314, 70, 13, 4, '', 1, 0, '2019-02-19 16:03:02', '2019-02-19 16:03:02'),
(315, 70, 9, 3, '', 2, 0, '2019-02-19 16:03:02', '2019-02-19 16:03:02'),
(316, 70, 11, 2, '', 2, 0, '2019-02-19 16:03:02', '2019-02-19 16:03:02'),
(317, 70, 10, 1, '', 3, 0, '2019-02-19 16:03:02', '2019-02-19 16:03:02'),
(318, 76, 12, 0, '', 1, 0, '2019-02-27 16:28:06', '2019-02-27 16:28:06'),
(319, 76, 13, 0, '', 1, 0, '2019-02-27 16:28:06', '2019-02-27 16:28:06'),
(320, 76, 9, 0, '', 2, 0, '2019-02-27 16:28:06', '2019-02-27 16:28:06'),
(321, 76, 11, 0, '', 2, 0, '2019-02-27 16:28:06', '2019-02-27 16:28:06'),
(322, 76, 10, 0, '', 3, 0, '2019-02-27 16:28:06', '2019-02-27 16:28:06');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT cho bảng `m_cau_hoi`
--
ALTER TABLE `m_cau_hoi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT cho bảng `m_ket_qua_quiz_question`
--
ALTER TABLE `m_ket_qua_quiz_question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=323;

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
