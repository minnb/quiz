-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th2 13, 2019 lúc 10:40 AM
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

INSERT INTO `m_bai_giang` (`id`, `course`, `thematic`, `name`, `alias`, `description`, `content`, `link_video`, `image`, `sort`, `keywords`, `user_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'HHQ40', 2, 'Dãy số tự nhiên', 'day-so-tu-nhien', '<p>B&agrave;i học nằm trong khối kiến thức to&aacute;n lớp 4, thuộc kh&oacute;a học to&aacute;n lớp 4 học kỳ 1</p>', '<p>B&agrave;i học nằm trong khối kiến thức to&aacute;n lớp 4, thuộc kh&oacute;a học to&aacute;n lớp 4 học kỳ 1</p>', 'https://youtu.be/xhl65FGIf8o', NULL, 0, 'Bài học nằm trong khối kiến thức toán lớp 4, thuộc khóa học toán lớp 4 học kỳ 1', 13, 0, '2019-01-21 15:20:36', '2019-01-21 15:20:36'),
(2, 'HHQ50', 9, 'Khái niệm, tính chất cơ bản của phân số', 'khai-niem,-tinh-chat-co-ban-cua-phan-so', '<p>Kh&aacute;i niệm, t&iacute;nh chất cơ bản của ph&acirc;n số</p>', '<p>Kh&aacute;i niệm, t&iacute;nh chất cơ bản của ph&acirc;n số</p>', 'https://youtu.be/xhl65FGIf8o', NULL, 0, 'Khái niệm, tính chất cơ bản của phân số', 13, 1, '2019-01-21 15:22:37', '2019-01-21 15:22:37'),
(3, 'HHQ50', 9, 'So sánh phân số', 'so-sanh-phan-so', '<p>So s&aacute;nh ph&acirc;n số</p>', '<p>So s&aacute;nh ph&acirc;n số</p>', 'https://youtu.be/xhl65FGIf8o', NULL, 0, 'So sánh phân số', 13, 1, '2019-01-21 15:23:08', '2019-01-21 15:23:08'),
(4, 'HHQ50', 9, 'Tìm một số khi biết một số phần của nó', 'tim-mot-so-khi-biet-mot-so-phan-cua-no', '<p>T&igrave;m một số khi biết một số phần của n&oacute;</p>', '<p>T&igrave;m một số khi biết một số phần của n&oacute;</p>', 'https://youtu.be/xhl65FGIf8o', NULL, 0, 'Tìm một số khi biết một số phần của nó', 13, 1, '2019-01-21 15:35:12', '2019-01-21 15:35:12'),
(5, 'HHQ50', 9, 'Tính thuận tiện với phân số', 'tinh-thuan-tien-voi-phan-so', '<p>T&iacute;nh thuận tiện với ph&acirc;n số</p>', '<p>T&iacute;nh thuận tiện với ph&acirc;n số</p>', 'https://youtu.be/xhl65FGIf8o', NULL, 0, 'Tính thuận tiện với phân số', 13, 1, '2019-01-21 15:41:04', '2019-01-21 15:41:04'),
(6, 'HHQ50', 9, 'Tính thuận tiện với phân số', 'tinh-thuan-tien-voi-phan-so', '<p>T&iacute;nh thuận tiện với ph&acirc;n số</p>', '<p>T&iacute;nh thuận tiện với ph&acirc;n số</p>', 'https://youtu.be/xhl65FGIf8o', NULL, 0, 'Tính thuận tiện với phân số', 13, 0, '2019-02-13 04:28:37', '2019-02-13 04:28:37'),
(7, 'HHQ51', 15, 'Tìm số trung bình cộng', 'tim-so-trung-binh-cong', '<p>T&igrave;m số trung b&igrave;nh cộng</p>', '<p>T&igrave;m số trung b&igrave;nh cộng</p>', NULL, NULL, 0, 'Tìm số trung bình cộng', 13, 1, '2019-01-21 15:42:54', '2019-01-21 15:42:54'),
(8, 'HHQ50', 10, 'Tỉ lệ thuận', 'ti-le-thuan', '<p>Tỉ lệ thuận</p>', '<p>Tỉ lệ thuận</p>', NULL, NULL, 0, 'Tỉ lệ thuận', 13, 1, '2019-01-21 15:51:58', '2019-01-21 15:51:58'),
(9, 'HHQ50', 10, 'Tỉ lệ nghịch', 'ti-le-nghich', '<p>Tỉ lệ nghịch</p>', '<p>Tỉ lệ nghịch</p>', 'https://youtu.be/xhl65FGIf8o', NULL, 0, 'Tỉ lệ nghịch', 13, 1, '2019-01-21 15:52:13', '2019-01-21 15:52:13'),
(10, 'HHQ50', 11, 'Khái niệm, đọc, viết số thập phân', 'khai-niem,-doc,-viet-so-thap-phan', '<p>Kh&aacute;i niệm, đọc, viết số thập ph&acirc;n</p>', '<p>Kh&aacute;i niệm, đọc, viết số thập ph&acirc;n</p>', 'https://youtu.be/xhl65FGIf8o', NULL, 0, 'Khái niệm, đọc, viết số thập phân', 13, 1, '2019-01-21 15:53:46', '2019-01-21 15:53:46'),
(11, 'HHQ50', 12, 'Tìm tỉ số phần trăm của 2 số', 'tim-ti-so-phan-tram-cua-2-so', '<p>T&igrave;m tỉ số phần trăm của 2 số</p>', '<p>T&igrave;m tỉ số phần trăm của 2 số</p>', 'https://youtu.be/xhl65FGIf8o', NULL, 0, 'Tìm tỉ số phần trăm của 2 số', 13, 1, '2019-01-21 15:54:25', '2019-01-21 15:54:25'),
(12, 'HHQ50', 13, 'Hình tam giác', 'hinh-tam-giac', '<p>H&igrave;nh tam gi&aacute;c</p>', '<p>H&igrave;nh tam gi&aacute;c</p>', 'https://youtu.be/xhl65FGIf8o', NULL, 0, 'Hình tam giác', 13, 1, '2019-01-21 15:54:51', '2019-01-21 15:54:51'),
(13, 'HHQ50', 14, 'Số đo thời gian', 'so-do-thoi-gian', '<p>Số đo thời gian</p>', '<p>Số đo thời gian</p>', 'https://youtu.be/xhl65FGIf8o', NULL, 0, 'Số đo thời gian', 13, 1, '2019-01-21 15:55:18', '2019-01-21 15:55:18');

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
(28, 4, 13, '1/14', '', '', 0, '', '2019-02-13 05:40:51', '2019-02-13 05:40:51');

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
  `name` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `alias` tinytext COLLATE utf8_unicode_ci,
  `image` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `level` smallint(2) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `user_id` int(5) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `m_cau_hoi`
--

INSERT INTO `m_cau_hoi` (`id`, `type`, `used`, `course`, `thematic`, `name`, `alias`, `image`, `level`, `status`, `user_id`, `created_at`, `updated_at`) VALUES
(6, 'radio', 1, 'HHQ40', 2, 'Tính tổng 5 + 5', 'tinh-tong-5-+-5', NULL, 1, 1, 13, '2019-02-13 04:47:12', '2019-02-13 04:47:12'),
(8, 'radio', 1, 'HHQ50', 9, 'Phân số thập phân 834/10 được viết dưới dạng số thập phân là:', 'phan-so-thap-phan-834-10-duoc-viet-duoi-dang-so-thap-phan-la:', NULL, 1, 1, 13, '2019-02-13 04:55:25', '2019-02-13 04:55:25'),
(9, 'radio', 1, 'HHQ50', 9, 'Số \"Bốn mươi bảy đơn vị bốn phần mười và tám phần trăm\" viết như sau', 'so-bon-muoi-bay-don-vi-bon-phan-muoi-va-tam-phan-tram-viet-nhu-sau', NULL, 2, 1, 13, '2019-02-13 05:00:48', '2019-02-13 05:00:48'),
(10, 'radio', 1, 'HHQ50', 9, 'Lớp học có 25 học sinh, trong đó có 13 nữ. Số học sinh nữ chiếm bao nhiêu phần trăm của lớp học đó?', 'lop-hoc-co-25-hoc-sinh,-trong-do-co-13-nu-so-hoc-sinh-nu-chiem-bao-nhieu-phan-tram-cua-lop-hoc-do+', NULL, 4, 1, 13, '2019-02-13 05:04:09', '2019-02-13 05:04:09'),
(11, 'radio', 1, 'HHQ50', 9, 'Mua 2 quyển vở hết 24.000 đồng. Vậy mua 10 quyển vở như thế hết số tiền là:', 'mua-2-quyen-vo-het-24-000-dong-vay-mua-10-quyen-vo-nhu-the-het-so-tien-la:', NULL, 3, 1, 13, '2019-02-13 05:05:22', '2019-02-13 05:05:22'),
(12, 'radio', 1, 'HHQ50', 9, 'Kết quả rút gọn của phân số 12/24 là:', 'ket-qua-rut-gon-cua-phan-so-12-24-la:', NULL, 1, 1, 13, '2019-02-13 05:39:22', '2019-02-13 05:39:22'),
(13, 'radio', 1, 'HHQ50', 9, 'Kết quả rút gọn của phân số 7/14 là:', 'ket-qua-rut-gon-cua-phan-so-7-14-la:', NULL, 1, 1, 13, '2019-02-13 05:40:51', '2019-02-13 05:40:51');

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
  `user_id` int(5) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `m_chuyen_de`
--

INSERT INTO `m_chuyen_de` (`id`, `course`, `class`, `subject`, `name`, `alias`, `description`, `keywords`, `image`, `onpost`, `status`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'HHQ40', 4, 1, 'Từ và động từ 1', 'tu-va-dong-tu-1', '<p>test</p>', NULL, NULL, 0, 1, 13, '2019-01-10 05:42:07', '2019-01-10 05:41:50'),
(2, 'HHQ40', 4, 2, 'Số tự nhiên', 'so-tu-nhien', NULL, 'a', NULL, 0, 1, 13, '2019-01-10 05:35:30', '2019-01-10 05:35:30'),
(3, 'HHQ51', 5, 2, 'Phân số', 'phan-so', NULL, 'phân số', NULL, 0, 1, 13, '2019-01-21 15:15:43', '2019-01-21 15:15:43'),
(4, 'HHQ51', 5, 2, 'Tỉ lệ', 'ti-le', NULL, 'Tỉ lệ', NULL, 0, 1, 13, '2019-01-21 15:15:58', '2019-01-21 15:15:58'),
(5, 'HHQ51', 5, 2, 'Số thập phân', 'so-thap-phan', NULL, 'Số thập phân', NULL, 0, 1, 13, '2019-01-21 15:16:11', '2019-01-21 15:16:11'),
(6, 'HHQ51', 5, 2, 'Tỉ số phần trăm', 'ti-so-phan-tram', NULL, 'Tỉ số phần trăm', NULL, 0, 1, 13, '2019-01-21 15:16:25', '2019-01-21 15:16:25'),
(7, 'HHQ51', 5, 2, 'Hình học', 'hinh-hoc', NULL, 'Hình học', NULL, 0, 1, 13, '2019-01-21 15:16:40', '2019-01-21 15:16:40'),
(8, 'HHQ51', 5, 2, 'Chuyển động', 'chuyen-dong', NULL, 'Chuyển động', NULL, 0, 1, 13, '2019-01-21 15:16:51', '2019-01-21 15:16:51'),
(9, 'HHQ50', 5, 2, 'Phân số', 'phan-so', NULL, 'Phân số', NULL, 0, 1, 13, '2019-01-21 15:18:44', '2019-01-21 15:18:44'),
(10, 'HHQ50', 5, 2, 'Tỉ lệ', 'ti-le', NULL, 'Tỉ lệ', NULL, 0, 1, 13, '2019-01-21 15:19:05', '2019-01-21 15:19:05'),
(11, 'HHQ50', 5, 2, 'Số thập phân', 'so-thap-phan', NULL, 'Số thập phân', NULL, 0, 1, 13, '2019-01-21 15:19:30', '2019-01-21 15:19:30'),
(12, 'HHQ50', 5, 2, 'Tỉ số phần trăm', 'ti-so-phan-tram', NULL, 'Tỉ số phần trăm', NULL, 0, 1, 13, '2019-01-21 15:19:48', '2019-01-21 15:19:48'),
(13, 'HHQ50', 5, 2, 'Hình học', 'hinh-hoc', NULL, 'Hình học', NULL, 0, 1, 13, '2019-01-21 15:19:59', '2019-01-21 15:19:59'),
(14, 'HHQ50', 5, 2, 'Chuyển động', 'chuyen-dong', NULL, 'Chuyển động', NULL, 0, 1, 13, '2019-01-21 15:20:11', '2019-01-21 15:20:11'),
(15, 'HHQ51', 5, 2, 'Ôn tập về giải toán', '0n-tap-ve-giai-toan', '<p>&Ocirc;n tập về giải to&aacute;n</p>', 'Ôn tập về giải toán', NULL, 0, 1, 13, '2019-01-21 15:42:32', '2019-01-21 15:42:32');

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
(2, 'CHUYENDE', 'Thi theo chuyên đề', 'thi-theo-chuyen-de', '<p>Luyện tập trả lời c&acirc;u hỏi nhanh sau khi học xong b&agrave;i giảng.</p>', NULL, 5, 5, 2, 1, 1, 1, 1, 13, '2019-02-13 05:43:35', '2019-02-13 05:43:35');

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
(9, 'CHUYENDE', 17, 0, '', 'CHUYENDE', 'HHQ50', 9, 2, 0, 0, '2019-02-13 09:35:53', '2019-02-13 09:35:53');

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
(13, 9, 12, 0, '', 0, 0, '2019-02-13 09:35:53', '2019-02-13 09:35:53'),
(14, 9, 8, 0, '', 0, 0, '2019-02-13 09:35:53', '2019-02-13 09:35:53'),
(15, 9, 9, 0, '', 0, 0, '2019-02-13 09:35:53', '2019-02-13 09:35:53'),
(16, 9, 11, 0, '', 0, 0, '2019-02-13 09:35:54', '2019-02-13 09:35:54'),
(17, 9, 10, 0, '', 0, 0, '2019-02-13 09:35:54', '2019-02-13 09:35:54');

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

INSERT INTO `m_khoa_hoc` (`id`, `code`, `course`, `class`, `name`, `alias`, `description`, `image`, `onpost`, `unit_price`, `status`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'HHQ50', 0, 5, 'Cơ bản', 'co-ban', '<p>test</p>', NULL, 0, 500000, 1, 13, '2019-02-13 04:24:07', '2019-01-08 16:15:17'),
(4, 'HHQ51', 1, 5, 'Nâng cao', 'nang-cao', NULL, NULL, 0, 0, 1, 13, '2019-02-13 04:16:21', '2019-01-08 16:42:41'),
(5, 'HHQ40', 0, 4, 'Cơ bản', 'co-ban', NULL, NULL, 0, 0, 1, 13, '2019-02-13 04:16:21', '2019-01-08 16:51:15');

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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user_course`
--

INSERT INTO `user_course` (`id`, `user_id`, `course`, `begin_date`, `end_date`, `status`, `created_at`, `updated_at`) VALUES
(1, 17, 'HHQ50', '2019-01-01 00:00:00', '2019-09-30 00:00:00', 1, '2019-02-13 03:07:56', '0000-00-00 00:00:00');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `m_cau_dap_an`
--
ALTER TABLE `m_cau_dap_an`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT cho bảng `m_cau_hoi`
--
ALTER TABLE `m_cau_hoi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `m_chuyen_de`
--
ALTER TABLE `m_chuyen_de`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `m_exam`
--
ALTER TABLE `m_exam`
  MODIFY `id` smallint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `m_ket_qua_quiz`
--
ALTER TABLE `m_ket_qua_quiz`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `m_ket_qua_quiz_question`
--
ALTER TABLE `m_ket_qua_quiz_question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

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
