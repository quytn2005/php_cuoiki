-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Dec 24, 2024 at 06:13 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lld`
--

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `id_bill` int(11) NOT NULL,
  `delivery_address` varchar(50) NOT NULL,
  `receiver_phone` varchar(10) NOT NULL,
  `receiver_name` varchar(50) NOT NULL,
  `payment_method` tinyint(1) NOT NULL,
  `point_used` int(11) NOT NULL,
  `total_money` int(11) NOT NULL,
  `total_pay` int(11) NOT NULL,
  `date_pay` date NOT NULL DEFAULT current_timestamp(),
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`id_bill`, `delivery_address`, `receiver_phone`, `receiver_name`, `payment_method`, `point_used`, `total_money`, `total_pay`, `date_pay`, `status`, `id_user`) VALUES
(12, 'Đà Nẵng', '0326166340', 'abccc', 0, 0, 330000, 330000, '2024-10-04', 2, 1),
(13, 'Đà Nẵng', '0326166340', 'á', 0, 0, 4029000, 4029000, '2024-11-12', 2, 1),
(14, 'Quận huế', '0917972558', 'admin', 0, 0, 2020000, 2020000, '2024-11-22', 2, 1),
(15, 'Quận huế', '0917972558', 'admin', 0, 0, 2020000, 2020000, '2024-11-22', 2, 1),
(19, 'Quận huế', '0917972558', 'admin', 0, 0, 629000, 629000, '2024-11-22', 2, 1),
(20, 'Quận huế1', '0326166340', 'quý', 0, 0, 1198000, 1228000, '2024-12-24', 1, 12);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id_category` int(11) NOT NULL,
  `name_category` varchar(50) NOT NULL,
  `img_category` varchar(250) NOT NULL,
  `order` int(2) NOT NULL,
  `parent_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id_category`, `name_category`, `img_category`, `order`, `parent_id`) VALUES
(13, 'Ghế Sofa', './assets/images/moho_website_banner_1920x450_sofa_7e3c1917e2b448389834f838b35f364e.webp', 1, 19),
(14, 'Tủ kệ Tivi', './assets/images/moho_website_banner_1920x450_tu_tv_8bc64be4eb1d4dfeb21e751644569a84.webp', 1, 22),
(16, 'Bàn trà', './assets/images/moho_website_banner_1920x450_ban_sofa_a78d24fd608547b69e17dd85f7b9b616.webp', 2, 15),
(17, 'Bàn sofa', './assets/images/moho_website_banner_1920x450_ban_sofa_a78d24fd608547b69e17dd85f7b9b616.webp', 1, 15),
(20, 'Ghế văn phòng', './assets/images/noi-that-moho-do-noi-that-ghe-van-phong_3bf03cc559fc49d09a242eeab9da9e51.webp', 1, 19),
(21, 'Bàn ăn', './assets/images/moho_website_banner_1920x450_ban_an__1__d362ce0daaa34937936f66a0b95a69b9.webp', 1, 15),
(22, 'Tủ', './assets/images/moho_website_banner_1920x450_tu_giay_5da1d63e24ce4a22adfeb64ecfca4adc.webp', 1, 0),
(23, 'Tủ giày - Tủ trang trí', './assets/images/moho_website_banner_1920x450_tu_giay_5da1d63e24ce4a22adfeb64ecfca4adc.webp', 3, 22),
(24, 'Tủ bếp', './assets/images/pic-moho-kitchen-standard_d4a7633a756941378499deafc0102434.webp', 2, 22),
(25, 'Tủ quần áo', './assets/images/moho_website_banner_1920x450_tu_quan_ao__1__7804169c6a63434ca733d760ab706c28.webp', 4, 22),
(26, 'Tủ & Kệ văn phòng', './assets/images/moho_website_banner_1920x450_tu_ke__1__f6b3667031c2451d84068f718189f593.webp', 5, 22),
(27, 'Đồ trang trí & Decor', './assets/images/moho_website_banner_1920x450_dotrangtri_53ad618b826f4390bde78e0598b14899.webp', 2, 0),
(28, 'Bàn trang điểm', './assets/images/ban-trang-diem-noi-that-moho_1c453eabc26744e99574d130d012a329.webp', 2, 15);

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id_comment` int(11) NOT NULL,
  `comment_content` varchar(150) NOT NULL,
  `accept` tinyint(1) NOT NULL DEFAULT 0,
  `id_product` int(11) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id_comment`, `comment_content`, `accept`, `id_product`, `id_user`) VALUES
(2, 'Test thử comment', 1, 4, 1),
(3, 'Sản phẩm oke lắm', 1, 45, 1),
(4, 'rất tuyệt', 1, 45, 1),
(5, 'Đẹp quá', 1, 4, 1),
(6, 'xinh quá', 1, 4, 1),
(9, 'rat oke', 1, 14, 1),
(12, 'hi', 1, 4, 1),
(19, 'dfgfdg', 1, 4, 1),
(20, 'dsfdsfdsfdsfsdfdsfsfsafdfff', 1, 4, 1),
(21, 'skjdhfsdjkfh', 0, 45, 12);

-- --------------------------------------------------------

--
-- Table structure for table `detailbill`
--

CREATE TABLE `detailbill` (
  `id_detailBill` int(11) NOT NULL,
  `amount_detail` int(11) NOT NULL,
  `size_detail` varchar(10) NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `product_img` varchar(150) NOT NULL,
  `product_price` int(11) NOT NULL,
  `id_bill` int(11) NOT NULL,
  `id_detailProduct` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detailbill`
--

INSERT INTO `detailbill` (`id_detailBill`, `amount_detail`, `size_detail`, `product_name`, `product_img`, `product_price`, `id_bill`, `id_detailProduct`) VALUES
(13, 1, '120x200', 'Ghế Nhựa dẻo chân gỗ', './assets/images/product6.webp', 300000, 12, 10),
(14, 1, '160x60', 'Tủ Kệ Tivi Gỗ Tràm 301', './assets/images/pro_nau_noi_that_moho_tu_ke_tivi_vline_5_e2bdea792fd740efae89933464c62a01_master.jpg', 3999000, 13, 39),
(15, 1, '160x60', 'Ghế Đôn Sofa 601 Màu Xám Đậm', './assets/images/pro_mau_tu_nhien_ghe_don_sofa_vline_6_613d5321857749a18eb5a04daa561634_master.webp', 1990000, 14, 37),
(16, 1, '160x60', 'Ghế Đôn Sofa 601 Màu Xám Đậm', './assets/images/pro_mau_tu_nhien_ghe_don_sofa_vline_6_613d5321857749a18eb5a04daa561634_master.webp', 1990000, 15, 37),
(17, 1, '160x40', 'Bàn  Trà Gỗ Cao Su ', './assets/images/pro_mau_tu_nhien_noi_that_moho_ban_sofa__ban_tra_go_cao_su_milan_601_3_5a7dd5037ac24566bc8fe457b7586de1_master.webp', 599000, 19, 13),
(18, 2, '160x40', 'Bàn  Trà Gỗ Cao Su ', './assets/images/pro_mau_tu_nhien_noi_that_moho_ban_sofa__ban_tra_go_cao_su_milan_601_3_5a7dd5037ac24566bc8fe457b7586de1_master.webp', 599000, 20, 13);

-- --------------------------------------------------------

--
-- Table structure for table `detailproduct`
--

CREATE TABLE `detailproduct` (
  `id_detailProduct` int(11) NOT NULL,
  `inventory` int(11) NOT NULL,
  `sold` int(11) NOT NULL,
  `detail_size` varchar(10) NOT NULL,
  `detail_price` int(11) NOT NULL,
  `id_product` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detailproduct`
--

INSERT INTO `detailproduct` (`id_detailProduct`, `inventory`, `sold`, `detail_size`, `detail_price`, `id_product`) VALUES
(6, 79, 21, '120x40', 850000, 4),
(9, 30, 20, '140x60', 250000, 13),
(10, 21, 3, '120x200', 300000, 12),
(11, 3, 2, '160x40', 599000, 43),
(12, 12, 5, '140x60', 670000, 44),
(13, 96, 4, '160x40', 599000, 45),
(14, 30, 2, '160x40', 1900000, 46),
(15, 33, 2, '120x40', 1490000, 47),
(16, 13, 3, '140x60', 2900000, 42),
(17, 13, 2, '140x60', 2900000, 41),
(18, 12, 3, '140x60', 2650000, 40),
(19, 32, 30, '140x60', 3570000, 39),
(20, 12, 3, '140x60', 3570000, 38),
(21, 2, 2, '140x60', 2150000, 37),
(22, 12, 1, '140x60', 1550000, 36),
(23, 1, 2, '160x60', 1950000, 35),
(24, 13, 2, '160x60', 3700000, 34),
(25, 16, 2, '140x60', 2690000, 33),
(26, 23, 2, '140x60', 1550000, 32),
(27, 13, 2, '140x60', 1550000, 31),
(28, 17, 1, '160x40', 2100000, 30),
(29, 33, 2, '120x40', 1150000, 29),
(30, 4, 1, '160x60', 1900200, 28),
(31, 30, 2, '140x60', 2290000, 24),
(32, 3, 1, '120x40', 1390000, 23),
(33, 39, 2, '120x40', 1290000, 22),
(34, 3, 2, '120x40', 899000, 21),
(35, 3, 2, '180x60', 4490000, 20),
(36, 23, 1, '180x60', 5490000, 19),
(37, 48, 27, '160x60', 1990000, 18),
(38, 23, 3, '140x60', 2190000, 17),
(39, 15, 9, '160x60', 3999000, 16),
(40, 23, 10, '180x60', 4790000, 15),
(41, 1, 2, '160x40', 5490000, 14),
(42, 23, 1, '160x60', 2909000, 11),
(43, 0, 39, '180x40', 699000, 45),
(44, 23, 1, '120x40', 1700000, 46),
(45, 23, 2, '140x60', 1800000, 46),
(46, 60, 20, '140x60', 1690000, 47),
(47, 3, 2, '160x60', 870000, 44),
(48, 12, 2, '180x40', 900000, 44),
(49, 12, 1, '180x60', 4599000, 16),
(50, 2, 1, '160x40', 1700200, 28),
(51, 5, 2, '140x60', 1350000, 29),
(52, 32, 2, '160x60', 1750000, 36),
(53, 13, 2, '120x40', 1250000, 32),
(54, 35, 2, '160x40', 1650000, 32),
(55, 6, 2, '180x60', 4500000, 34),
(56, 42, 12, '160x60', 4170000, 38),
(57, 42, 2, '160x60', 2550000, 37),
(58, 35, 2, '160x60', 2600000, 30),
(59, 31, 2, '140x60', 1750000, 35),
(60, 31, 2, '160x60', 4290000, 15),
(61, 5, 2, '180x40', 4190000, 20),
(62, 12, 2, '140x60', 1490000, 23),
(63, 13, 2, '160x60', 2890000, 24),
(64, 15, 2, '140x60', 1590000, 18),
(65, 16, 2, '160x40', 509000, 43),
(66, 13, 2, '140x60', 499000, 43),
(67, 12, 2, '180x60', 559000, 43),
(68, 12, 1, '160x40', 1550000, 29),
(69, 1, 1, '160x60', 1650000, 29),
(70, 15, 12, '180x40', 1750000, 29),
(71, 12, 1, '160x40', 1790000, 47),
(72, 12, 1, '160x60', 1990000, 47),
(73, 22, 2, '180x40', 2290000, 47),
(74, 12, 2, '160x60', 659000, 45),
(75, 13, 2, '160x60', 3900000, 42),
(76, 2, 1, '180x60', 4900000, 41),
(77, 3, 2, '160x60', 3150000, 40),
(78, 0, 3, '180x60', 4770000, 39),
(79, 1, 1, '160x40', 4170000, 39),
(80, 12, 1, '180x60', 4570000, 38),
(81, 3, 2, '180x60', 2950000, 37),
(82, 12, 1, '140x40', 1590000, 22),
(83, 2, 2, '160x40', 3790000, 20),
(84, 3, 1, '160x60', 2690000, 17),
(85, 12, 2, '180x60', 2990000, 17),
(86, 9, 5, '180x40', 7490000, 14),
(87, 23, 2, '160x60', 6490000, 14),
(88, 12, 1, '140x40', 1050000, 4),
(89, 9, 4, '180x60', 3909000, 11),
(90, 12, 1, '160x40', 600000, 13),
(91, 13, 2, '160x60', 4490000, 19),
(92, 1, 1, '160x40', 899000, 21);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id_product` int(11) NOT NULL,
  `title_product` varchar(50) NOT NULL,
  `img_product` varchar(150) NOT NULL,
  `subTitle_product` varchar(250) NOT NULL,
  `des_product` text NOT NULL,
  `hot_product` tinyint(1) NOT NULL,
  `id_category` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id_product`, `title_product`, `img_product`, `subTitle_product`, `des_product`, `hot_product`, `id_category`) VALUES
(4, 'Ghế Gỗ Chất lượng cao', './assets/images/EUF-058a.jpg', 'test func insert', '123', 123, 16),
(11, 'Bàn Kính nhỏ ', './assets/images/product5.webp', 'bàn nhỏ cho gia đình ', 'bàn nhỏ cho gia đình ', 2, 17),
(12, 'Ghế Nhựa dẻo chân gỗ', './assets/images/product6.webp', 'vô cùng dẻo', 'vô cùng dẻo', 2, NULL),
(13, 'Ghế gỗ đứng', './assets/images/product 2.webp', 'đứng', 'ghế đứng', 1, NULL),
(14, 'Tủ Kệ Tivi Gỗ 702', './assets/images/pro_nau_noi_that_moho_tu_ke_tivi_kolding_1_85628cac95344a59bcf705e71eaf7a36_master.webp', 'Gỗ tràm tự nhiên', 'Bộ sưu tập KOLDING lấy cảm hứng từ công trình kiến trúc ở thành phố cảng Kolding, được biết đến với công trình đầu tiên sử dụng năng lượng ánh sáng tự nhiên thông qua vật liệu kim loại vào năm 2015 của Đan Mạch. Bộ sưu tập KOLDING gồm 2 vật liệu chính là sắt sơn tĩnh điện và gỗ tràm tự nhiên, là lựa chọn phù hợp cho không gian nội thất hiện đại, tối giản và độc đáo.  Thân tủ được làm từ gỗ tràm tự nhiên Với phần thân tủ được hoàn toàn làm từ gỗ tràm, điều này đem lại cảm giác sang trọng và ấm cúng cho phòng khách của bạn mỗi khi gia đình sum họp. Ngoài ra, gỗ tràm có khả năng chống mối mọt tốt, tinh dầu tràm giúp tăng khả năng chống ẩm, nắng nóng từ môi trường đồng thời có mùi hương nhẹ nhàng. ', 1, 14),
(15, 'Tủ Kệ TiVi Gỗ 401', './assets/images/pro_nau_noi_that_moho_tu_ke_tivi_fiji_6_372c1b0a7a5d4624a408804cfb11a123_master.webp', 'Gỗ cao su', 'Tủ Kệ TiVi Gỗ MOHO FIJI sử dụng bằng mây mắt cáo tự nhiên chất lượng cao, chống mối mọt, côn trùng với tính chất dễ sử dụng, bền lâu được làm thủ công từ nghệ nhân và thợ lành nghề giúp tạo cảm giác thoải mái, gần gũi với thiên nhiên góp phần mới mẻ cho nội thất căn phòng của bạn.', 2, 14),
(16, 'Tủ Kệ Tivi Gỗ Tràm 301', './assets/images/pro_nau_noi_that_moho_tu_ke_tivi_vline_5_e2bdea792fd740efae89933464c62a01_master.jpg', 'Gỗ tràm tự nhiên ', 'Gỗ cao su tự nhiên  Sử dụng chất liệu gỗ cao su tự nhiên giúp sản phẩm có khả năng chịu lực tốt và độ bền cao. ', 3, 14),
(17, 'Tủ Kệ Tivi Gỗ 601', './assets/images/pro_mau_tu_nhien_noi_that_moho_tu_ke_tivi_moss_11_890545c0fcfd401e8b41036711daab64_master.webp', 'Tủ có thiết kế góc cạnh nhưng vẫn tối giản và hiện đại', '- Thân tủ: Gỗ công nghiệp PB chuẩn CARB-P2 (*), Sơn phủ UV vân gỗ sồi tự nhiên  - Chân tủ: Gỗ cao su tự nhiên', 1, 14),
(18, 'Ghế Đôn Sofa 601 Màu Xám Đậm', './assets/images/pro_mau_tu_nhien_ghe_don_sofa_vline_6_613d5321857749a18eb5a04daa561634_master.webp', ' Gỗ Cao Su Tự Nhiên', 'Vải Polyester  Ghế Sofa đơn VLINE sử dụng vải bọc polyester giúp chống nhăn, kháng bụi bẩn và nấm mốc, dễ dàng vệ sinh. Ghế có màu xám đậm nâng tầm thẩm mỹ và không gian nội thất phòng khách nhà bạn.  Gỗ cao su tự nhiên  Nội Thất MOHO sử dụng chất liệu gỗ cao su giúp ghế sofa gỗ VLINE có khả năng chịu lực tốt và độ bền cao.', 1, 13),
(19, 'Ghế Sofa Góc  601', './assets/images/pro_mau_tu_nhien_noi_that_moho_ghe_don_sofa_vline_xam_dam_1_011ef07fe6754974a63a03f50b204808_master.webp', 'Gỗ Cao Su Tự Nhiên', 'Màu Xám Đậm', 1, 17),
(20, 'Ghế Sofa  LLD MILAN 902', './assets/images/pro_mau_tu_nhien_noi_that_moho_sofa_milan_902_1_f41caab340e14195b33bcd1c99e87dfa_master.webp', 'Gỗ Cao Su Tự Nhiên', 'Gỗ Cao Su Tự Nhiên', 2, 13),
(21, 'Ghế Văn Phòng Chân Quỳ 701', './assets/images/pro_den_noi_that_moho_ghe_van_phong_chan_quy_1_e2e0f1d592c34753b5c755af1444ecc2_master.webp', 'MOHO CALLOSO ', 'Ghế văn phòng giá rẻ', 1, 20),
(22, 'Ghế Văn Phòng Chân Xoay 701', './assets/images/pro_xam_noi_that_moho_ghe_van_phong_major_1_c42a19b3b8634ec09327363bb4491bfa_master.webp', 'MOHO MAJOR ', 'Ghế văn phòng chân xoay giá rẻ- trung', 2, 20),
(23, 'Ghế Xoay Văn Phòng Tay Gập', './assets/images/pro_trang_noi_that_moho_ghe_van_phong_riga_1_92865499928b49a191bbf2d0e0c91f6f_master.webp', 'MOHO RIGA', 'Ghế Xoay Văn Phòng Tay Gập', 2, 20),
(24, 'Ghế Xoay Văn Phòng Ngả Lưng', './assets/images/pro_den_noi_that_moho_ghe_van_phong_jefe_1_c22b21049a9748aa9ce64503ad45b58b_master.webp', 'MOHO JEFE', 'Ghế Xoay Văn Phòng Ngả Lưng công thái học', 2, 20),
(25, 'HỆ TỦ BẾP LLD KITCHEN ECONOMY', './assets/images/pro_he_tu_bep_noi_that_moho_economy_2_d9698a1977a540e9b67c877f03dc71a8_master.webp', 'Sản phẩm được lắp đặt như hình', 'Giá dự kiến chưa bao gồm đá, kính, thiết bị bếp,...  - Thiết kế miễn phí  - Lắp đặt miễn phí  - Kiểm tra định kỳ miễn phí', 2, 24),
(26, 'HỆ TỦ BẾP KITCHEN STANDARD', './assets/images/pro_he_tu_bep_noi_that_moho_standard_1_b3f64dbbcfef440ba7da2f360c927240_master.webp', 'KITCHEN STANDARD', 'Giá dự kiến chưa bao gồm đá, kính, thiết bị bếp,...  - Thiết kế miễn phí  - Lắp đặt miễn phí  - Kiểm tra định kỳ miễn phí', 2, 24),
(27, 'HỆ TỦ BẾP PREMIUM', './assets/images/pro_he_tu_bep_noi_that_moho_premium_1_3e270c89596547a1a89e2b5156589d5c_master.webp', 'Sản phẩm được lắp đặt như hình', 'Giá dự kiến chưa bao gồm đá, kính, thiết bị bếp,...  - Thiết kế miễn phí  - Lắp đặt miễn phí  - Kiểm tra định kỳ miễn phí', 2, 24),
(28, 'Hộc Tủ 3 Ngăn Lưu Trữ Tài Liệu', './assets/images/pro_trang_noi_that_moho_hoc_tu_luu_tru_11_7cac38416e714e32b8534fd2a8e011d8_master.webp', 'Có khóa', 'Chất liệu: Gỗ công nghiệp PB cao cấp chuẩn CARB-P2 (*), sơn phủ UV  (*) Tiêu chuẩn California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe  Chống thấm, cong vênh, trầy xước, mối mọt.', 1, 26),
(29, 'Kệ Để Sách 3 Tầng LLDWORK 703', './assets/images/pro_trang_noi_that_moho_ke_de_sach_7_85b616ba9a054024b13dcd167096a2b4_master.webp', 'Kệ', 'Chất liệu:  Gỗ công nghiệp PB cao cấp chuẩn CARB-P2 (*)  Khung sắt sơn tĩnh điện chống gỉ, thấm nước.  (*) Tiêu chuẩn California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe  Chống thấm, cong vênh, trầy xước, mối mọt.', 1, 26),
(30, 'Kệ Gỗ – Kệ Sách OSLO 901', './assets/images/pro_mau_tu_nhien_noi_that_moho_tu_ke_sach_oslo_1_b95178561732462186e05fcfb42a8b4a_master.webp', 'Kệ', 'Chất liệu: Gỗ công nghiệp PB chuẩn CARB-P2(*), Sơn phủ UV  (*) Tiêu chuẩn California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe  Chống thấm, cong vênh, trầy xước, mối mọt', 1, 26),
(31, 'Tủ Gỗ Kệ Ngăn VIENNA 201 2 Màu', './assets/images/pro_trang_noi_that_moho_tu_ke_ngan_05_2dddbd16595b4d7a86f94a3044090afb_master.webp', 'Tủ', 'Chất liệu: Gỗ công nghiệp PB chuẩn CARB-P2 (*), Sơn phủ UV  (*) Tiêu chuẩn California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe  Chống thấm, cong vênh, trầy xước, mối mọt', 1, 25),
(32, 'Tủ Quần Áo Gỗ LLD VLINE 601', './assets/images/pro_mau_tu_nhien_tu_quan_ao_vline_601_52cm_04_0dd25291fe3c483cb6b1e206286abaf5_master.webp', 'Tủ', 'Chất liệu: Gỗ công nghiệp PB chuẩn CARB-P2 (*), Sơn phủ UV  (*) Tiêu chuẩn California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe  Chống thấm, cong vênh, trầy xước, mối mọt', 1, 25),
(33, 'Set Tủ Quần Áo Gỗ LLD VIENNA', './assets/images/pro_mau_tu_nhien_noi_that_moho_tu_quan_ao_go_vienna_1_c21db70368a44d37994c498dd17144fb_master.webp', 'Tủ 2 ngăn', 'Chất liệu:  - Thân tủ: Gỗ công nghiệp PB chuẩn CARB-P2 (*), Sơn phủ UV  - Cửa tủ: Gỗ công nghiệp PB chuẩn CARB-P2 (*), Sơn phủ UV  - Tay nắm: Inox cao cấp, chống gỉ sét  - Thanh treo: Hợp kim nhôm, chống gỉ sét', 1, 25),
(34, 'Set Tủ Quần Áo Gỗ nhiều ngăn ', './assets/images/pro_mau_tu_nhien_noi_that_moho_tu_quan_ao_go_3_canh_2_b0e873cfd31e48058b5702db721cb9c4_master.webp', 'tủ', 'Chất liệu:  - Thân tủ: Gỗ công nghiệp PB chuẩn CARB-P2 (*), Sơn phủ UV  - Cửa tủ: Gỗ công nghiệp MDF chuẩn CARB-P2 (*), Sơn phủ UV  - Thanh treo: Hợp kim nhôm, chống gỉ sét  (*) Tiêu chuẩn California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe  Chống thấm, cong vênh, trầy xước, mối mọt', 1, 25),
(35, 'Tủ Giày – Tủ Trang Trí Gỗ ', './assets/images/pro_goi_phoi_trang_noi_that_moho_tu_giay_trang_tri_vienna_201_12_b8c789cd8a4f4061bd8365f377492729_master.webp', ' MOHO VIENNA 201', 'Chất liệu:  - Mặt tủ: Gỗ công nghiệp PB chuẩn CARB-P2 (*), Sơn phủ UV  - Thân tủ: Gỗ công nghiệp MDF chuẩn CARB-P2 (*), Sơn phủ UV  (*) Tiêu chuẩn California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe', 1, 23),
(36, 'Tủ Giày - Tủ Trang Trí Gỗ Tràm', './assets/images/pro_nau_noi_that_moho_tu_giay_vline_601_1_3c16cf25f44b4e8b806ea944f6208851_master.webp', 'MOHO VLINE 601', 'Chất liệu:  - Thân tủ: Gỗ công nghiệp PB chuẩn CARB-P2 (*), Veneer gỗ tràm tự nhiên  - Chân tủ: Gỗ thông tự nhiên  (*) Tiêu chuẩn California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe  Chống thấm, cong vênh, trầy xước, mối mọt', 2, 23),
(37, 'Tủ Giày – Tủ Trang Trí Gỗ ', './assets/images/pro_mau_tu_nhien_noi_that_moho_tu_giay_trang_tri_vienna_204_8_7e15674147ae4ba08031d4c6c1fd828f_master.webp', 'MOHO VIENNA 204', 'Chất liệu:  - Mặt tủ: Gỗ công nghiệp PB chuẩn CARB-P2 (*), Sơn phủ UV  - Thân tủ: Gỗ công nghiệp MDF chuẩn CARB-P2 (*), Sơn phủ UV  (*) Tiêu chuẩn California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe  Chống thấm, cong vênh, trầy xước, mối mọt', 1, 23),
(38, 'Bàn Trang Điểm Gỗ Đa Năng ', './assets/images/pro_nau_noi_that_moho_combo_ban_va_guong_trang_diem_vienna_6_0fc676db143c4193bcc6135dac83e0c0_master.jpg', 'MOHO VIENNA 202 Màu Nâu', 'Chất liệu:   - Thân bàn: Gỗ công nghiệp MFC chuẩn CARB-P2 (*), Sơn phủ UV  - Hộc bàn: Gỗ công nghiệp MFC chuẩn CARB-P2 (*), Sơn phủ UV  - Chân bàn: Gỗ tràm tự nhiên  - Gương: Gỗ công nghiệp MFC, gương cao cấp dễ lau chùi, hạn chế bám bụi và hạn chế được sát thương nếu bị vỡ  (*) Tiêu chuẩn California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe  Chống thấm, cong vênh, trầy xước, mối mọt', 1, 28),
(39, 'Bàn Trang Điểm Gỗ Đa Năng ', './assets/images/pro_mau_tu_nhien_noi_that_moho_combo_ban_va_guong_trang_diem_2_951e4eb74080461aa947ab14bf1a344c_master.webp', 'MOHO VIENNA 202 Màu Tự Nhiên', 'Chất liệu:   - Thân bàn: Gỗ công nghiệp MFC chuẩn CARB-P2 (*), Sơn phủ UV  - Hộc bàn: Gỗ công nghiệp MFC chuẩn CARB-P2 (*), Sơn phủ UV  - Chân bàn: Gỗ cao su tự nhiên  - Gương: Gỗ công nghiệp MFC, gương cao cấp dễ lau chùi, hạn chế bám bụi và hạn chế được sát thương nếu bị vỡ  (*) Tiêu chuẩn California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe  Chống thấm, cong vênh, trầy xước, mối mọt', 2, 28),
(40, 'Bàn Ăn Gỗ Cao Su Tự Nhiên ', './assets/images/pro_mau_tu_nhien_noi_that_moho_ban_an_go_vlne_1_28f0ed08289b49d39640efc9a9b9daab_master.webp', 'MOHO VLINE 601 1m6', 'Chất liệu: Gỗ cao su tự nhiên  Chống thấm, cong vênh, trầy xước, mối mọt', 1, 21),
(41, 'Bàn Ăn Gỗ ', './assets/images/pro_mau_tu_nhien_noi_that_moho_ban_an_go_milan_1m25_2_296dcb2c609f40ea9f3032f515910a46_master.webp', 'MOHO MILAN 901 Màu Gỗ', 'Chất liệu:   - Mặt bàn: Gỗ công nghiệp MDF chuẩn CARB-P2 (*), Veneer gỗ sồi tự nhiên  - Chân bàn: Gỗ cao su tự nhiên  (*) Tiêu chuẩn California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe  Chống thấm, cong vênh, trầy xước, mối mọt', 3, 21),
(42, 'Bàn Gỗ Tự Nhiên Nguyên Khối ', './assets/images/pro_mau_tu_nhien_noi_that_moho_ban_an_go_soi_nguyen_khoi_fyn__3__e33f3948d3b34d309a029d3bf9b41f8f_master.webp', 'MOHO FYN 901', 'Chất liệu: Gỗ sồi tự nhiên nguyên khối  Chống thấm, cong vênh, trầy xước, mối mọt', 3, 21),
(43, ' Bàn Trà Gỗ Cao Su 601', './assets/images/pro_trang_noi_that_moho_ban_sofa_trang_801_01_8c5d8775c21d45d0a6bed8118bb012e4_master.webp', 'MOHO MILAN Trắng', 'Chất liệu:  - Mặt bàn: Gỗ công nghiệp MDF chuẩn CARB-P2 (*), Sơn phủ UV  - Chân bàn: Gỗ cao su tự nhiên  (*) Tiêu chuẩn California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe  Chống thấm, cong vênh, trầy xước, mối mọt', 1, 16),
(44, 'Bàn Trà Tròn Gỗ 402', './assets/images/pro_nau_noi_that_moho_ban_tra_sofa_fiji_6_6bb71364999b4a578cc0eb3ccfeeb358_master.webp', 'MOHO FIJI ', 'Chất liệu:  - Mặt bàn: Gỗ cao su tự nhiên  - Chân bàn: Gỗ cao su tự nhiên  - Ngăn kệ: Mây mắt cáo tự nhiên  (*) Tiêu chuẩn California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe  Chống thấm, cong vênh, trầy xước, mối mọt', 3, 16),
(45, 'Bàn  Trà Gỗ Cao Su ', './assets/images/pro_mau_tu_nhien_noi_that_moho_ban_sofa__ban_tra_go_cao_su_milan_601_3_5a7dd5037ac24566bc8fe457b7586de1_master.webp', 'MOHO MILAN 602', 'Chất liệu:  - Mặt bàn: Gỗ công nghiệp MDF chuẩn CARB-P2 (*), Sơn phủ UV  - Chân bàn: Gỗ cao su tự nhiên  (*) Tiêu chuẩn California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe  Chống thấm, cong vênh, trầy xước, mối mọt', 4, 16),
(46, 'Bàn Sofa  Gỗ  501', './assets/images/pro_mau_tu_nhien_noi_that_moho_ban_sofa_vline_501_1_0bdb9fe421b244b899ddcb7212a2474e_master.webp', 'MOHO VLINE', 'Chất liệu:  - Mặt bàn: Gỗ công nghiệp PB chuẩn CARB-P2 (*), Veneer gỗ sồi tự nhiên  - Chân và khung bàn: gỗ cao su tự nhiên  (*) Tiêu chuẩn California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe  Chống thấm, cong vênh, trầy xước, mối mọt', 1, 17),
(47, 'Bàn Sofa Gỗ  901', './assets/images/pro_mau_tu_nhien_noi_that_moho_ban_tra_sofa_oslo_5_025c05179c0c4b57be0e9b1360dba566_master.webp', 'MOHO OSLO', 'Chất liệu:  - Mặt bàn màu nâu: Gỗ cao su tự nhiên  - Mặt bàn màu tự nhiên: Gỗ công nghiệp MDF chuẩn CARB-P2 (*), Veneer gỗ sồi  - Chân bàn: Gỗ cao su tự nhiên  (*) Tiêu chuẩn California Air Resources Board xuất khẩu Mỹ, đảm bảo gỗ không độc hại, an toàn cho sức khỏe  Chống thấm, cong vênh, trầy xước, mối mọt', 2, 17);

-- --------------------------------------------------------

--
-- Table structure for table `slider`
--

CREATE TABLE `slider` (
  `id_slider` int(11) NOT NULL,
  `slider_img` varchar(150) NOT NULL,
  `slider_link` varchar(50) NOT NULL,
  `slider_title` varchar(50) NOT NULL,
  `slider_subtitle` varchar(50) NOT NULL,
  `description` varchar(500) NOT NULL,
  `order` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `slider`
--

INSERT INTO `slider` (`id_slider`, `slider_img`, `slider_link`, `slider_title`, `slider_subtitle`, `description`, `order`) VALUES
(1, './assets/images/slider 1.webp', 'index.php?quanly=cuahang&id', 'NỘI THẤT CAO CẤP', 'CHÀO MỪNG ĐẾN VỚI CHÚNG TÔI', 'Nội thất VKU là thương hiệu nội thất văn phòng chính hãng hàng đầu Việt Nam, chuyên sản xuất và cung ứng nội thất cho hàng ngàn công ty, văn phòng, cá nhân trên cả nước.\n                Dựa trên ý tưởng cốt lõi: “Like a boss” VKU cam kết giúp khách hàng chọn lựa được những sản phẩm có chất lượng vượt bậc với giá thành hợp lý nhất.\n                Hãy trải nghiệm cảm giác “Như một ông chủ” thực thụ khi sử dụng sản phẩm và dịch vụ chính hãng của chúng tôi', 1),
(5, './assets/images/slider 2.webp', 'index.php?quanly=cuahang&id_category=22', 'KHÔNG GIAN RIÊNG DÀNH CHO BẠN', 'GIÁ CẢ TỐT - CHẤT LƯỢNG CAO', 'Nội thất VKU là thương hiệu nội thất văn phòng chính hãng hàng đầu Việt Nam, chuyên sản xuất và cung ứng nội thất cho hàng ngàn công ty, văn phòng, cá nhân trên cả nước.\n                Dựa trên ý tưởng cốt lõi: “Like a boss” VKU cam kết giúp khách hàng chọn lựa được những sản phẩm có chất lượng vượt bậc với giá thành hợp lý nhất.\n                Hãy trải nghiệm cảm giác “Như một ông chủ” thực thụ khi sử dụng sản phẩm và dịch vụ chính hãng của chúng tôi', 2);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `user_name` varchar(200) NOT NULL,
  `user_phone` varchar(10) NOT NULL,
  `user_address` varchar(50) NOT NULL,
  `user_email` varchar(50) NOT NULL,
  `accountName_user` varchar(50) NOT NULL,
  `user_password` varchar(50) NOT NULL,
  `user_role` int(11) NOT NULL DEFAULT 0,
  `point_available` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `user_name`, `user_phone`, `user_address`, `user_email`, `accountName_user`, `user_password`, `user_role`, `point_available`) VALUES
(1, 'admin', '0931462697', 'Đà Nẵng', 'abc@gmail.com', 'admin', 'admin', 1, 1133306),
(5, 'Anh Quốc', '0917972558', 'Quận huế', 'abc@gmail.com', 'cuoc123', '12345678', 1, 0),
(9, 'abc', '0917972553', 'đa', 'trunghieu1040203@gmail.com', 'hieutran123', '123456', 1, 0),
(10, 'Trần Trung Hiếu', '0585818504', 'd', 'trunghieu1042003@gmail.com', 'abc', 'hieutran2003', 0, 0),
(12, 'Trần Ngọc Quý', '0326166340', 'huế', 'tranngocquy746@gmail.com', 'quý', '12345678', 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`id_bill`),
  ADD KEY `FK_bill_user` (`id_user`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id_category`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id_comment`),
  ADD KEY `FK_comment_product` (`id_product`),
  ADD KEY `FK_comment_user` (`id_user`);

--
-- Indexes for table `detailbill`
--
ALTER TABLE `detailbill`
  ADD PRIMARY KEY (`id_detailBill`),
  ADD KEY `FK_detailBill_detailProduct` (`id_detailProduct`),
  ADD KEY `FK_detailBill_bill` (`id_bill`);

--
-- Indexes for table `detailproduct`
--
ALTER TABLE `detailproduct`
  ADD PRIMARY KEY (`id_detailProduct`),
  ADD KEY `FK_detailProduct_product` (`id_product`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id_product`),
  ADD KEY `FK_product_category` (`id_category`);

--
-- Indexes for table `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`id_slider`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bill`
--
ALTER TABLE `bill`
  MODIFY `id_bill` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id_category` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id_comment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `detailbill`
--
ALTER TABLE `detailbill`
  MODIFY `id_detailBill` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `detailproduct`
--
ALTER TABLE `detailproduct`
  MODIFY `id_detailProduct` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id_product` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `slider`
--
ALTER TABLE `slider`
  MODIFY `id_slider` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `FK_bill_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE;

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `FK_comment_product` FOREIGN KEY (`id_product`) REFERENCES `product` (`id_product`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_comment_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE;

--
-- Constraints for table `detailbill`
--
ALTER TABLE `detailbill`
  ADD CONSTRAINT `FK_detailBill_bill` FOREIGN KEY (`id_bill`) REFERENCES `bill` (`id_bill`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_detailBill_detailProduct` FOREIGN KEY (`id_detailProduct`) REFERENCES `detailproduct` (`id_detailProduct`);

--
-- Constraints for table `detailproduct`
--
ALTER TABLE `detailproduct`
  ADD CONSTRAINT `FK_detailProduct_product` FOREIGN KEY (`id_product`) REFERENCES `product` (`id_product`) ON DELETE CASCADE;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_product_category` FOREIGN KEY (`id_category`) REFERENCES `category` (`id_category`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
