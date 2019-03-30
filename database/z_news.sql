-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th3 30, 2019 lúc 06:33 AM
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

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `z_news`
--
ALTER TABLE `z_news`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `z_news`
--
ALTER TABLE `z_news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
