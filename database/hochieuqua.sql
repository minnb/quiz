-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th1 08, 2019 lúc 05:52 PM
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
-- Cấu trúc bảng cho bảng `m_cau_dap_an`
--

CREATE TABLE `m_cau_dap_an` (
  `id` int(11) NOT NULL,
  `stt` smallint(2) NOT NULL,
  `quession_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alias` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `result` tinyint(1) NOT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `m_cau_hoi`
--

CREATE TABLE `m_cau_hoi` (
  `id` int(11) NOT NULL,
  `sourse` smallint(2) NOT NULL,
  `subject` smallint(2) NOT NULL,
  `thematic` int(5) NOT NULL,
  `name` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `alias` tinytext COLLATE utf8_unicode_ci,
  `image` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `level` smallint(2) NOT NULL,
  `type` smallint(2) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `user_id` int(5) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `m_chuyen_de`
--

CREATE TABLE `m_chuyen_de` (
  `id` int(11) NOT NULL,
  `course` smallint(2) NOT NULL,
  `class` smallint(2) NOT NULL,
  `subject` smallint(2) NOT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `alias` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `image` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `onpost` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `user_id` int(5) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `m_exam`
--

CREATE TABLE `m_exam` (
  `id` int(11) NOT NULL,
  `type` smallint(2) NOT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `alias` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `image` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `work_time` smallint(3) DEFAULT NULL,
  `number_quession` smallint(2) NOT NULL,
  `lv1` smallint(2) NOT NULL,
  `lv2` smallint(2) NOT NULL,
  `lv3` smallint(2) NOT NULL,
  `lv4` smallint(2) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `user_id` int(5) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
  `status` tinyint(1) DEFAULT '1',
  `user_id` int(5) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `m_khoa_hoc`
--

INSERT INTO `m_khoa_hoc` (`id`, `code`, `course`, `class`, `name`, `alias`, `description`, `image`, `onpost`, `status`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'HHQ50', 0, 5, 'Cơ bản', 'co-ban', '<p>test</p>', NULL, 0, 1, 13, '2019-01-08 16:25:25', '2019-01-08 16:15:17'),
(4, 'HHQ51', 1, 5, 'Nâng cao', 'nang-cao', NULL, NULL, 0, 1, 13, '2019-01-08 16:42:41', '2019-01-08 16:42:41'),
(5, 'HHQ40', 0, 4, 'Cơ bản', 'co-ban', NULL, NULL, 0, 1, 13, '2019-01-08 16:51:15', '2019-01-08 16:51:15');

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
  `course` smallint(2) NOT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `image` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `onpost` tinyint(1) DEFAULT '0',
  `sort` smallint(2) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `user_id` int(5) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
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
(1, 'administrator', NULL, '2019-01-08 03:40:58', '0000-00-00 00:00:00'),
(2, 'user_hocvien', NULL, '2019-01-08 03:41:41', '0000-00-00 00:00:00'),
(3, 'user_khach', NULL, '2019-01-08 03:42:04', '0000-00-00 00:00:00');

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `provider`, `provider_id`, `remember_token`, `created_at`, `updated_at`) VALUES
(13, 'minhnb', 'minhnb.it@gmail.com', '$2y$10$j.DBpGEVvmJnjVfz7WhC1eq81efPWM3gkpZQ4QFfMZq1e/m/SGsfq', NULL, NULL, '2G0Awsvp2y1slrGFeBlNHGZgCC0Tr0kxmGrwMOYbr0Y9YlQUzMITD5L5d9Cy', '2019-01-08 03:57:04', '2019-01-08 03:57:04');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
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
-- Chỉ mục cho bảng `m_khoa_hoc`
--
ALTER TABLE `m_khoa_hoc`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `m_cau_dap_an`
--
ALTER TABLE `m_cau_dap_an`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `m_cau_hoi`
--
ALTER TABLE `m_cau_hoi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `m_chuyen_de`
--
ALTER TABLE `m_chuyen_de`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `m_khoa_hoc`
--
ALTER TABLE `m_khoa_hoc`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `m_lop_hoc`
--
ALTER TABLE `m_lop_hoc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `m_mon_hoc`
--
ALTER TABLE `m_mon_hoc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `roles`
--
ALTER TABLE `roles`
  MODIFY `id` tinyint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `role_user`
--
ALTER TABLE `role_user`
  MODIFY `id` tinyint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
