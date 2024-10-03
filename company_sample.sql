-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--

-- Máy chủ: localhost:3307
-- Thời gian đã tạo: Th10 03, 2024 lúc 08:15 AM

-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--

-- Cơ sở dữ liệu: `sample_company`

--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `children`
--

CREATE TABLE `children` (
  `Employee_ID` int(11) NOT NULL,
  `EmployeeName` varchar(50) NOT NULL,
  `ChildrenName` varchar(50) NOT NULL,
  `Gender` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `children`
--

INSERT INTO `children` (`Employee_ID`, `EmployeeName`, `ChildrenName`, `Gender`) VALUES
(1, 'Nguyễn Văn Minh', 'Nguyễn Minh Hoàng', 'Nam'),
(2, 'Lê Doãn Khế', 'Lê Khải Minh', 'Nam'),
(3, 'Trần Thị Mai', 'Trần Mai Lan', 'Nữ'),
(4, 'Phạm Ngọc Huy', 'Phạm Huy Hoàng', 'Nam'),
(5, 'Ngô Văn An', 'Ngô An Thảo', 'Nữ'),
(6, 'Bùi Thị Bích', 'Bùi Bích Thủy', 'Nữ'),
(7, 'Đặng Văn Hòa', 'Đặng Hòa Phát', 'Nam'),
(8, 'Vũ Thị Huệ', 'Vũ Huệ An', 'Nữ'),
(9, 'Lê Hoàng', 'Lê Hoàng Anh', 'Nam'),
(10, 'Nguyễn Tuấn', 'Nguyễn Tuấn Minh', 'Nam'),
(11, 'Phan Thị Thảo', 'Phan Thảo Vy', 'Nữ'),
(12, 'Nguyễn Văn Tâm', 'Nguyễn Tâm Đan', 'Nữ'),
(13, 'Lê Hoàng Hải', 'Lê Hải Nam', 'Nam'),
(14, 'Trần Minh Tâm', 'Trần Tâm Nhi', 'Nữ'),
(15, 'Nguyễn Ngọc Sơn', 'Nguyễn Sơn Tùng', 'Nam'),
(16, 'Ngô Thị Phương', 'Ngô Phương Anh', 'Nữ'),
(17, 'Bùi Văn Khoa', 'Bùi Khoa Nam', 'Nam'),
(18, 'Trần Thị Hương', 'Trần Hương Giang', 'Nữ'),
(19, 'Nguyễn Văn Lợi', 'Nguyễn Lợi Huy', 'Nam'),
(20, 'Phạm Văn Long', 'Phạm Long An', 'Nam');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `contract`
--

CREATE TABLE `contract` (
  `Contract_ID` int(11) NOT NULL,
  `Customer_ID` int(11) NOT NULL,
  `Project_ID` int(11) NOT NULL,
  `ContractDate` date NOT NULL,
  `ContractDue` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `contract`
--

INSERT INTO `contract` (`Contract_ID`, `Customer_ID`, `Project_ID`, `ContractDate`, `ContractDue`) VALUES
(1, 3, 5, '2024-01-15', '2024-06-15'),
(2, 10, 2, '2024-02-20', '2024-07-20'),
(3, 25, 1, '2024-03-05', '2024-08-05'),
(4, 12, 4, '2024-04-10', '2024-09-10'),
(5, 30, 6, '2024-05-15', '2024-10-15'),
(6, 8, 7, '2024-06-20', '2024-11-20'),
(7, 42, 3, '2024-07-25', '2024-12-25'),
(8, 18, 8, '2024-08-30', '2025-01-30');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customer`
--

CREATE TABLE `customer` (
  `Customer_ID` int(11) NOT NULL,
  `CustomerName` varchar(50) DEFAULT NULL,
  `CustomerEmail` varchar(50) DEFAULT NULL,
  `Num_Order` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `customer`
--

INSERT INTO `customer` (`Customer_ID`, `CustomerName`, `CustomerEmail`, `Num_Order`) VALUES
(1, 'Trần Văn Minh', 'minh.tran@gmail.com', 3),
(2, 'Nguyễn Thị Lan', 'lan.nguyen@gmail.com', 2),
(3, 'Phạm Văn Hùng', 'hung.pham@gmail.com', 1),
(4, 'Lê Thị Hương', 'huong.le@gmail.com', 5),
(5, 'Đỗ Văn An', 'an.do@gmail.com', 2),
(6, 'Nguyễn Văn Dũng', 'dung.nguyen@gmail.com', 4),
(7, 'Trần Thị Mai', 'mai.tran@gmail.com', 3),
(8, 'Lê Văn Hải', 'hai.le@gmail.com', 4),
(9, 'Phạm Thị Nhung', 'nhung.pham@gmail.com', 1),
(10, 'Nguyễn Văn Tài', 'tai.nguyen@gmail.com', 2),
(11, 'Trần Thị Bích', 'bich.tran@gmail.com', 4),
(12, 'Lê Văn Phúc', 'phuc.le@gmail.com', 3),
(13, 'Đỗ Thị Kiều', 'kieul.do@gmail.com', 1),
(14, 'Nguyễn Văn Hòa', 'hoa.nguyen@gmail.com', 2),
(15, 'Phạm Văn Tâm', 'tam.pham@gmail.com', 3),
(16, 'Lê Thị Ngọc', 'ngoc.le@gmail.com', 3),
(17, 'Trần Văn Sơn', 'son.tran@gmail.com', 5),
(18, 'Nguyễn Văn Quyết', 'quyet.nguyen@gmail.com', 1),
(19, 'Đỗ Văn Bình', 'binh.do@gmail.com', 4),
(20, 'Lê Thị Nhàn', 'nhan.le@gmail.com', 3),
(21, 'Phạm Văn Thắng', 'thang.pham@gmail.com', 4),
(22, 'Nguyễn Thị Thanh', 'thanh.nguyen@gmail.com', 5),
(23, 'Trần Văn Đạt', 'dat.tran@gmail.com', 2),
(24, 'Lê Thị Phượng', 'phuong.le@gmail.com', 3),
(25, 'Đỗ Văn Khải', 'khai.do@gmail.com', 5),
(26, 'Nguyễn Văn Quang', 'quang.nguyen@gmail.com', 4),
(27, 'Phạm Thị Thúy', 'thuy.pham@gmail.com', 3),
(28, 'Trần Văn Hoàng', 'hoang.tran@gmail.com', 2),
(29, 'Lê Thị Tuyết', 'tuyet.le@gmail.com', 3),
(30, 'Nguyễn Văn Tùng', 'tung.nguyen@gmail.com', 1),
(31, 'Đỗ Văn Khánh', 'khanh.do@gmail.com', 3),
(32, 'Trần Thị Bảo', 'bao.tran@gmail.com', 4),
(33, 'Lê Văn Sơn', 'son.le@gmail.com', 2),
(34, 'Nguyễn Thị Lệ', 'le.nguyen@gmail.com', 3),
(35, 'Phạm Văn Vũ', 'vu.pham@gmail.com', 1),
(36, 'Trần Văn Cường', 'cuong.tran@gmail.com', 4),
(37, 'Lê Thị Tâm', 'tam.le@gmail.com', 5),
(38, 'Đỗ Văn Linh', 'linh.do@gmail.com', 2),
(39, 'Nguyễn Văn Đức', 'duc.nguyen@gmail.com', 1),
(40, 'Trần Thị Mai', 'mai.tran@gmail.com', 3),
(41, 'Phạm Văn Duy', 'duy.pham@gmail.com', 4),
(42, 'Lê Thị Hòa', 'hoa.le@gmail.com', 3),
(43, 'Nguyễn Thị Hà', 'ha.nguyen@gmail.com', 4),
(44, 'Đỗ Văn Thành', 'thanh.do@gmail.com', 5),
(45, 'Trần Văn Nghĩa', 'nghia.tran@gmail.com', 1),
(46, 'Phạm Văn Thế', 'the.pham@gmail.com', 2),
(47, 'Lê Thị Nguyệt', 'nguyet.le@gmail.com', 3),
(48, 'Nguyễn Văn Nhẫn', 'nhan.nguyen@gmail.com', 4),
(49, 'Đỗ Thị Huyền', 'huyen.do@gmail.com', 1),
(50, 'Trần Văn Đăng', 'dang.tran@gmail.com', 3),
(51, 'Phạm Thị Lý', 'ly.pham@gmail.com', 4),
(52, 'Lê Văn Quý', 'quy.le@gmail.com', 2),
(53, 'Nguyễn Thị Hoa', 'hoa.nguyen@gmail.com', 4),
(54, 'Đỗ Văn Sĩ', 'si.do@gmail.com', 1),
(55, 'Trần Văn Thành', 'thanh.tran@gmail.com', 3),
(56, 'Phạm Văn Cường', 'cuong.pham@gmail.com', 5),
(57, 'Lê Thị Lan', 'lan.le@gmail.com', 3),
(58, 'Nguyễn Văn Thịnh', 'thinh.nguyen@gmail.com', 4),
(59, 'Đỗ Thị Duyên', 'duyen.do@gmail.com', 2),
(60, 'Trần Văn Tín', 'tin.tran@gmail.com', 1),
(61, 'Phạm Thị Sương', 'suong.pham@gmail.com', 3),
(62, 'Lê Văn Bình', 'binh.le@gmail.com', 2),
(63, 'Nguyễn Thị Phượng', 'phuong.nguyen@gmail.com', 4),
(64, 'Đỗ Văn Tài', 'tai.do@gmail.com', 3),
(65, 'Trần Văn Kiên', 'kien.tran@gmail.com', 2),
(66, 'Phạm Văn Hiếu', 'hieu.pham@gmail.com', 4),
(67, 'Lê Thị Ngọc', 'ngoc.le@gmail.com', 3),
(68, 'Nguyễn Văn Tuấn', 'tuan.nguyen@gmail.com', 5),
(69, 'Đỗ Thị Thảo', 'thao.do@gmail.com', 1),
(70, 'Trần Văn Quang', 'quang.tran@gmail.com', 4),
(71, 'Phạm Thị Lệ', 'le.pham@gmail.com', 3),
(72, 'Lê Văn Khải', 'khai.le@gmail.com', 5),
(73, 'Nguyễn Thị Vân', 'van.nguyen@gmail.com', 2),
(74, 'Đỗ Văn Sáng', 'sang.do@gmail.com', 3),
(75, 'Trần Văn Tân', 'tan.tran@gmail.com', 4),
(76, 'Phạm Thị Thủy', 'thuy.pham@gmail.com', 2),
(77, 'Lê Văn Bảo', 'bao.le@gmail.com', 5),
(78, 'Nguyễn Văn Tín', 'tin.nguyen@gmail.com', 3),
(79, 'Đỗ Thị Ngân', 'ngan.do@gmail.com', 4),
(80, 'Trần Văn Khoa', 'khoa.tran@gmail.com', 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `department`
--

CREATE TABLE `department` (
  `Department_ID` int(11) NOT NULL,
  `DepartmentName` varchar(20) DEFAULT NULL,
  `Manager_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `department`
--

INSERT INTO `department` (`Department_ID`, `DepartmentName`, `Manager_ID`) VALUES
(1, 'Human Resources', 15),
(2, 'Finance', 40),
(3, 'IT', 22),
(4, 'Sales', 9),
(5, 'Marketing', 30);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `employee`
--

CREATE TABLE `employee` (
  `Employee_ID` int(11) NOT NULL,
  `EmployeeName` varchar(50) DEFAULT NULL,
  `ReportTo` int(11) DEFAULT NULL,
  `StartDate` date NOT NULL,
  `Department_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `employee`
--

INSERT INTO `employee` (`Employee_ID`, `EmployeeName`, `ReportTo`, `StartDate`, `Department_ID`) VALUES
(1, 'Nguyễn Văn Minh', NULL, '2000-05-15', 1),
(2, 'Lê Doãn Khế', 9, '2005-03-01', 2),
(3, 'Trần Thị Mai', 15, '2010-01-20', 5),
(4, 'Phạm Ngọc Huy', 40, '2018-07-18', 2),
(5, 'Ngô Văn An', 22, '2020-11-10', 3),
(6, 'Bùi Thị Bích', 30, '2006-09-21', 4),
(7, 'Đặng Văn Hòa', 9, '2019-08-30', 2),
(8, 'Vũ Thị Huệ', 22, '2003-12-15', 4),
(9, 'Lê Hoàng', 1, '2021-06-05', 1),
(10, 'Nguyễn Tuấn', 15, '2004-04-25', 5),
(11, 'Phan Thị Thảo', 9, '2011-03-10', 1),
(12, 'Nguyễn Văn Tâm', 15, '2015-02-14', 2),
(13, 'Lê Hoàng Hải', 40, '2009-09-29', 4),
(14, 'Trần Minh Tâm', 22, '2012-01-03', 3),
(15, 'Nguyễn Ngọc Sơn', 1, '2020-04-17', 2),
(16, 'Ngô Thị Phương', 9, '2022-10-22', 2),
(17, 'Bùi Văn Khoa', 15, '2016-11-30', 5),
(18, 'Trần Thị Hương', 40, '2017-06-05', 2),
(19, 'Nguyễn Văn Lợi', 22, '2023-03-19', 1),
(20, 'Phạm Văn Long', 30, '2008-07-28', 4),
(21, 'Lê Văn Hậu', 40, '2001-12-11', 2),
(22, 'Trần Minh Quân', 1, '2021-05-16', 3),
(23, 'Nguyễn Thị Thúy', 40, '2000-10-03', 2),
(24, 'Ngô Văn Bảo', 22, '2022-01-25', 1),
(25, 'Bùi Thị Kim', 30, '2014-08-04', 3),
(26, 'Đặng Văn Phúc', 9, '2005-09-09', 2),
(27, 'Vũ Thị Nga', 15, '2020-04-12', 2),
(28, 'Trần Văn Hùng', 40, '2007-11-07', 2),
(29, 'Nguyễn Văn Quốc', 30, '2013-06-18', 1),
(30, 'Phạm Thị Yến', 1, '2019-01-29', 4),
(31, 'Lê Văn Thắng', 9, '2021-10-15', 2),
(32, 'Trần Thị Kim', 15, '2006-02-26', 5),
(33, 'Nguyễn Văn Phúc', 40, '2022-07-21', 4),
(34, 'Ngô Thị Thanh', 22, '2008-03-15', 5),
(35, 'Bùi Văn Tài', 30, '2015-10-11', 4),
(36, 'Đặng Văn Bằng', 9, '2023-04-28', 2),
(37, 'Vũ Thị Tuyết', 15, '2010-12-30', 5),
(38, 'Trần Văn Lâm', 40, '2009-09-15', 4),
(39, 'Nguyễn Thị Thanh', 9, '2018-06-09', 3),
(40, 'Phạm Văn Nam', 1, '2002-08-19', 5),
(41, 'Lê Doãn Minh', 9, '2004-11-01', 2),
(42, 'Trần Thị Hằng', 15, '2011-07-23', 1),
(43, 'Nguyễn Văn Vinh', 40, '2016-05-16', 2),
(44, 'Ngô Thị Hạnh', 22, '2017-03-14', 3),
(45, 'Bùi Văn Khải', 30, '2022-08-04', 3),
(46, 'Đặng Văn Chương', 9, '2013-01-30', 1),
(47, 'Vũ Thị Kim Anh', 15, '2001-09-25', 2),
(48, 'Trần Văn Tuấn', 40, '2020-05-22', 1),
(49, 'Nguyễn Thị Yến', 22, '2003-10-16', 1),
(50, 'Phạm Văn Kiên', 30, '2019-03-02', 3),
(51, 'Âu Dương Hiệp Hào', 1, '2005-10-02', 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `employeecontact`
--

CREATE TABLE `employeecontact` (
  `Employee_ID` int(11) NOT NULL,
  `PhoneNumber` char(10) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `EmployeeAddress` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `employeecontact`
--

INSERT INTO `employeecontact` (`Employee_ID`, `PhoneNumber`, `Email`, `EmployeeAddress`) VALUES
(1, '0912345678', 'minh@gmail.com', 'Hà Nội, Việt Nam'),
(2, '0934567890', 'thu@gmail.com', 'Hải Phòng, Việt Nam'),
(3, '0945678901', 'bao@gmail.com', 'Quảng Ninh, Việt Nam'),
(4, '0966789012', 'lan@gmail.com', 'Nam Định, Việt Nam'),
(5, '0977890123', 'huy@gmail.com', 'Thái Bình, Việt Nam'),
(6, '0988901234', 'tuan@gmail.com', 'Ninh Bình, Việt Nam'),
(7, '0909012345', 'an@gmail.com', 'Hà Giang, Việt Nam'),
(8, '0910123456', 'nhat@gmail.com', 'Lào Cai, Việt Nam'),
(9, '0921234567', 'nhan@gmail.com', 'Vĩnh Phúc, Việt Nam'),
(10, '0932345678', 'phuc@gmail.com', 'Bắc Ninh, Việt Nam'),
(11, '0943456789', 'van@gmail.com', 'Bắc Giang, Việt Nam'),
(12, '0954567890', 'ha@gmail.com', 'Hưng Yên, Việt Nam'),
(13, '0965678901', 'tu@gmail.com', 'Thái Nguyên, Việt Nam'),
(14, '0976789012', 'duong@gmail.com', 'Nghệ An, Việt Nam'),
(15, '0987890123', 'khoa@gmail.com', 'Hà Tĩnh, Việt Nam'),
(16, '0918901234', 'duc@gmail.com', 'Hòa Bình, Việt Nam'),
(17, '0929012345', 'my@gmail.com', 'Điện Biên, Việt Nam'),
(18, '0930123456', 'trang@gmail.com', 'Sơn La, Việt Nam'),
(19, '0941234567', 'linh@gmail.com', 'Lạng Sơn, Việt Nam'),
(20, '0952345678', 'quang@gmail.com', 'Hải Dương, Việt Nam'),
(21, '0963456789', 'hao@gmail.com', 'Vĩnh Long, Việt Nam'),
(22, '0974567890', 'son@gmail.com', 'Hưng Yên, Việt Nam'),
(23, '0985678901', 'tam@gmail.com', 'Nam Định, Việt Nam'),
(24, '0916789012', 'chinh@gmail.com', 'Quảng Ngãi, Việt Nam'),
(25, '0927890123', 'binh@gmail.com', 'Kon Tum, Việt Nam'),
(26, '0938901234', 'mai@gmail.com', 'Ninh Thuận, Việt Nam'),
(27, '0949012345', 'nhung@gmail.com', 'Lâm Đồng, Việt Nam'),
(28, '0950123456', 'quyet@gmail.com', 'Đắk Lắk, Việt Nam'),
(29, '0961234567', 'thao@gmail.com', 'Đắk Nông, Việt Nam'),
(30, '0972345678', 'hien@gmail.com', 'Hà Giang, Việt Nam'),
(31, '0983456789', 'ly@gmail.com', 'Tuyên Quang, Việt Nam'),
(32, '0914567890', 'trieu@gmail.com', 'Hòa Bình, Việt Nam'),
(33, '0925678901', 'phuong@gmail.com', 'Thái Bình, Việt Nam'),
(34, '0936789012', 'tinh@gmail.com', 'Nam Định, Việt Nam'),
(35, '0947890123', 'duy@gmail.com', 'Hà Tĩnh, Việt Nam'),
(36, '0958901234', 'nhat@gmail.com', 'Hải Dương, Việt Nam'),
(37, '0969012345', 'trung@gmail.com', 'Quảng Trị, Việt Nam'),
(38, '0970123456', 'thuy@gmail.com', 'Quảng Ninh, Việt Nam'),
(39, '0981234567', 'khai@gmail.com', 'Bắc Ninh, Việt Nam'),
(40, '0912345671', 'phuc@gmail.com', 'Thái Nguyên, Việt Nam'),
(41, '0923456782', 'van@gmail.com', 'Hà Nội, Việt Nam'),
(42, '0934567893', 'ha@gmail.com', 'Hải Phòng, Việt Nam'),
(43, '0945678904', 'tu@gmail.com', 'Nam Định, Việt Nam'),
(44, '0956789015', 'duong@gmail.com', 'Thái Bình, Việt Nam'),
(45, '0967890126', 'khoa@gmail.com', 'Ninh Bình, Việt Nam'),
(46, '0978901237', 'duc@gmail.com', 'Hà Giang, Việt Nam'),
(47, '0989012348', 'my@gmail.com', 'Lào Cai, Việt Nam'),
(48, '0910123459', 'trang@gmail.com', 'Vĩnh Phúc, Việt Nam'),
(49, '0921234560', 'linh@gmail.com', 'Bắc Giang, Việt Nam'),
(50, '0932345671', 'quang@gmail.com', 'Hưng Yên, Việt Nam'),
(51, '0943456782', 'hao@gmail.com', 'Thái Nguyên, Việt Nam');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `employeehealth`
--

CREATE TABLE `employeehealth` (
  `Employee_ID` int(11) NOT NULL,
  `EmployeeName` varchar(50) NOT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `Height` decimal(5,2) NOT NULL,
  `Weight` decimal(5,2) NOT NULL,
  `Status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `employeehealth`
--

INSERT INTO `employeehealth` (`Employee_ID`, `EmployeeName`, `Gender`, `Height`, `Weight`, `Status`) VALUES
(1, 'Nguyễn Văn Minh', 'Nam', 175.50, 70.00, 'Bình thường'),
(2, 'Lê Doãn Khế', 'Nam', 180.20, 75.50, 'Ốm'),
(3, 'Trần Thị Mai', 'Nữ', 160.30, 55.00, 'Bình thường'),
(4, 'Phạm Ngọc Huy', 'Nam', 170.80, 68.20, 'Bình thường'),
(5, 'Ngô Văn An', 'Nam', 175.00, 72.00, 'Bình thường'),
(6, 'Bùi Thị Bích', 'Nữ', 165.00, 58.00, 'Bình thường'),
(7, 'Đặng Văn Hòa', 'Nam', 178.50, 80.00, 'Bình thường'),
(8, 'Vũ Thị Huệ', 'Nữ', 162.20, 57.00, 'Bình thường'),
(9, 'Lê Hoàng', 'Nam', 182.00, 77.00, 'Bình thường'),
(10, 'Nguyễn Tuấn', 'Nam', 170.00, 70.50, 'Bình thường'),
(11, 'Phan Thị Thảo', 'Nữ', 160.00, 55.50, 'Bình thường'),
(12, 'Nguyễn Văn Tâm', 'Nam', 175.20, 72.00, 'Ốm'),
(13, 'Lê Hoàng Hải', 'Nam', 178.00, 78.50, 'Bình thường'),
(14, 'Trần Minh Tâm', 'Nam', 172.00, 70.00, 'Bình thường'),
(15, 'Nguyễn Ngọc Sơn', 'Nam', 180.50, 75.00, 'Bình thường'),
(16, 'Ngô Thị Phương', 'Nữ', 165.50, 59.00, 'Bình thường'),
(17, 'Bùi Văn Khoa', 'Nam', 177.50, 73.50, 'Bình thường'),
(18, 'Trần Thị Hương', 'Nữ', 160.50, 55.50, 'Bình thường'),
(19, 'Nguyễn Văn Lợi', 'Nam', 175.00, 72.50, 'Bình thường'),
(20, 'Phạm Văn Long', 'Nam', 172.50, 69.00, 'Bình thường'),
(21, 'Lê Văn Hậu', 'Nam', 178.50, 73.50, 'Bình thường'),
(22, 'Trần Minh Quân', 'Nam', 175.00, 70.00, 'Bình thường'),
(23, 'Nguyễn Thị Thúy', 'Nữ', 162.00, 58.00, 'Bình thường'),
(24, 'Ngô Văn Bảo', 'Nam', 172.50, 72.50, 'Bình thường'),
(25, 'Bùi Thị Kim', 'Nữ', 175.80, 74.50, 'Bình thường'),
(26, 'Đặng Văn Phúc', 'Nam', 178.50, 73.50, 'Bình thường'),
(27, 'Vũ Thị Nga', 'Nữ', 162.00, 58.00, 'Bình thường'),
(28, 'Trần Văn Hùng', 'Nam', 172.50, 72.50, 'Ốm'),
(29, 'Nguyễn Văn Quốc', 'Nam', 175.00, 70.00, 'Bình thường'),
(30, 'Phạm Thị Yến', 'Nữ', 160.30, 55.50, 'Bình thường'),
(31, 'Lê Văn Thắng', 'Nam', 177.50, 65.00, 'Bình thường'),
(32, 'Trần Thị Kim', 'Nữ', 165.50, 59.00, 'Bình thường'),
(33, 'Nguyễn Văn Phúc', 'Nam', 178.00, 77.00, 'Ốm'),
(34, 'Ngô Thị Thanh', 'Nữ', 160.50, 57.50, 'Bình thường'),
(35, 'Bùi Văn Tài', 'Nam', 180.20, 76.50, 'Ốm'),
(36, 'Đặng Văn Bằng', 'Nam', 175.50, 74.00, 'Bình thường'),
(37, 'Vũ Thị Tuyết', 'Nữ', 162.50, 58.50, 'Bình thường'),
(38, 'Trần Văn Lâm', 'Nam', 177.00, 71.00, 'Bình thường'),
(39, 'Nguyễn Thị Thanh', 'Nữ', 172.00, 70.50, 'Bình thường'),
(40, 'Phạm Văn Nam', 'Nam', 180.00, 76.00, 'Bình thường'),
(41, 'Lê Doãn Minh', 'Nam', 160.50, 57.50, 'Bình thường'),
(42, 'Trần Thị Hằng', 'Nữ', 175.00, 72.00, 'Bình thường'),
(43, 'Nguyễn Văn Vinh', 'Nam', 180.50, 75.50, 'Bình thường'),
(44, 'Ngô Thị Hạnh', 'Nữ', 178.20, 74.50, 'Bình thường'),
(45, 'Bùi Văn Khải', 'Nam', 165.50, 58.00, 'Bình thường'),
(46, 'Đặng Văn Chương', 'Nam', 175.20, 72.80, 'Bình thường'),
(47, 'Vũ Thị Kim Anh', 'Nữ', 160.20, 56.50, 'Ốm'),
(48, 'Trần Văn Tuấn', 'Nam', 172.80, 70.50, 'Bình thường'),
(49, 'Nguyễn Thị Yến', 'Nữ', 160.50, 57.50, 'Bình thường'),
(50, 'Phạm Văn Kiên', 'Nam', 175.50, 74.00, 'Bình thường'),
(51, 'Âu Dương Hiệp Hào', 'Nam', 190.00, 75.00, 'Bình thường');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `employeeperformance`
--

CREATE TABLE `employeeperformance` (
  `Employee_ID` int(11) NOT NULL,
  `EmployeeName` varchar(50) NOT NULL,
  `Score` double NOT NULL,
  `Comment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `employeeperformance`
--

INSERT INTO `employeeperformance` (`Employee_ID`, `EmployeeName`, `Score`, `Comment`) VALUES
(1, 'Nguyễn Văn Minh', 10, 'Xuất sắc'),
(2, 'Lê Doãn Khế', 9.5, 'Tốt'),
(3, 'Trần Thị Mai', 10, 'Xuất sắc'),
(4, 'Phạm Ngọc Huy', 10, 'Xuất sắc'),
(5, 'Ngô Văn An', 10, 'Xuất sắc'),
(6, 'Bùi Thị Bích', 9, 'Tốt'),
(7, 'Đặng Văn Hòa', 9.5, 'Tốt'),
(8, 'Vũ Thị Huệ', 10, 'Xuất sắc'),
(9, 'Lê Hoàng', 10, 'Xuất sắc'),
(10, 'Nguyễn Tuấn', 10, 'Xuất sắc'),
(11, 'Phan Thị Thảo', 9, 'Tốt'),
(12, 'Nguyễn Văn Tâm', 8.5, 'Cần cải thiện'),
(13, 'Lê Hoàng Hải', 10, 'Xuất sắc'),
(14, 'Trần Minh Tâm', 10, 'Xuất sắc'),
(15, 'Nguyễn Ngọc Sơn', 10, 'Xuất sắc'),
(16, 'Ngô Thị Phương', 9, 'Tốt'),
(17, 'Bùi Văn Khoa', 9.5, 'Tốt'),
(18, 'Trần Thị Hương', 10, 'Xuất sắc'),
(19, 'Nguyễn Văn Lợi', 10, 'Xuất sắc'),
(20, 'Phạm Văn Long', 10, 'Xuất sắc'),
(21, 'Lê Văn Hậu', 10, 'Xuất sắc'),
(22, 'Trần Minh Quân', 10, 'Xuất sắc'),
(23, 'Nguyễn Thị Thúy', 8.5, 'Cần cải thiện'),
(24, 'Ngô Văn Bảo', 10, 'Xuất sắc'),
(25, 'Bùi Thị Kim', 8.5, 'Cần cải thiện'),
(26, 'Đặng Văn Phúc', 10, 'Xuất sắc'),
(27, 'Vũ Thị Nga', 10, 'Xuất sắc'),
(28, 'Trần Văn Hùng', 10, 'Xuất sắc'),
(29, 'Nguyễn Văn Quốc', 9, 'Tốt'),
(30, 'Phạm Thị Yến', 9.5, 'Tốt'),
(31, 'Lê Văn Thắng', 10, 'Xuất sắc'),
(32, 'Trần Thị Kim', 10, 'Xuất sắc'),
(33, 'Nguyễn Văn Phúc', 9, 'Tốt'),
(34, 'Ngô Thị Thanh', 10, 'Xuất sắc'),
(35, 'Bùi Văn Tài', 8.5, 'Cần cải thiện'),
(36, 'Đặng Văn Bằng', 10, 'Xuất sắc'),
(37, 'Vũ Thị Tuyết', 10, 'Xuất sắc'),
(38, 'Trần Văn Lâm', 10, 'Xuất sắc'),
(39, 'Nguyễn Thị Thanh', 9, 'Tốt'),
(40, 'Phạm Văn Nam', 10, 'Xuất sắc'),
(41, 'Lê Doãn Minh', 10, 'Xuất sắc'),
(42, 'Trần Thị Hằng', 8.5, 'Cần cải thiện'),
(43, 'Nguyễn Văn Vinh', 10, 'Xuất sắc'),
(44, 'Ngô Thị Hạnh', 10, 'Xuất sắc'),
(45, 'Bùi Văn Khải', 8.5, 'Cần cải thiện'),
(46, 'Đặng Văn Chương', 10, 'Xuất sắc'),
(47, 'Vũ Thị Kim Anh', 10, 'Xuất sắc'),
(48, 'Trần Văn Tuấn', 10, 'Xuất sắc'),
(49, 'Nguyễn Thị Yến', 9, 'Tốt'),
(50, 'Phạm Văn Kiên', 9.5, 'Tốt'),
(51, 'Âu Dương Hiệp Hào', 10, 'Xuất sắc'),
(1, 'Nguyễn Văn Minh', 10, 'Xuất sắc'),
(2, 'Lê Doãn Khế', 9.5, 'Tốt'),
(3, 'Trần Thị Mai', 10, 'Xuất sắc'),
(4, 'Phạm Ngọc Huy', 10, 'Xuất sắc'),
(5, 'Ngô Văn An', 10, 'Xuất sắc'),
(6, 'Bùi Thị Bích', 9, 'Tốt'),
(7, 'Đặng Văn Hòa', 9.5, 'Tốt'),
(8, 'Vũ Thị Huệ', 10, 'Xuất sắc'),
(9, 'Lê Hoàng', 10, 'Xuất sắc'),
(10, 'Nguyễn Tuấn', 10, 'Xuất sắc'),
(11, 'Phan Thị Thảo', 9, 'Tốt'),
(12, 'Nguyễn Văn Tâm', 8.5, 'Cần cải thiện'),
(13, 'Lê Hoàng Hải', 10, 'Xuất sắc'),
(14, 'Trần Minh Tâm', 10, 'Xuất sắc'),
(15, 'Nguyễn Ngọc Sơn', 10, 'Xuất sắc'),
(16, 'Ngô Thị Phương', 9, 'Tốt'),
(17, 'Bùi Văn Khoa', 9.5, 'Tốt'),
(18, 'Trần Thị Hương', 10, 'Xuất sắc'),
(19, 'Nguyễn Văn Lợi', 10, 'Xuất sắc'),
(20, 'Phạm Văn Long', 10, 'Xuất sắc'),
(21, 'Lê Văn Hậu', 10, 'Xuất sắc'),
(22, 'Trần Minh Quân', 10, 'Xuất sắc'),
(23, 'Nguyễn Thị Thúy', 8.5, 'Cần cải thiện'),
(24, 'Ngô Văn Bảo', 10, 'Xuất sắc'),
(25, 'Bùi Thị Kim', 8.5, 'Cần cải thiện'),
(26, 'Đặng Văn Phúc', 10, 'Xuất sắc'),
(27, 'Vũ Thị Nga', 10, 'Xuất sắc'),
(28, 'Trần Văn Hùng', 10, 'Xuất sắc'),
(29, 'Nguyễn Văn Quốc', 9, 'Tốt'),
(30, 'Phạm Thị Yến', 9.5, 'Tốt'),
(31, 'Lê Văn Thắng', 10, 'Xuất sắc'),
(32, 'Trần Thị Kim', 10, 'Xuất sắc'),
(33, 'Nguyễn Văn Phúc', 9, 'Tốt'),
(34, 'Ngô Thị Thanh', 10, 'Xuất sắc'),
(35, 'Bùi Văn Tài', 8.5, 'Cần cải thiện'),
(36, 'Đặng Văn Bằng', 10, 'Xuất sắc'),
(37, 'Vũ Thị Tuyết', 10, 'Xuất sắc'),
(38, 'Trần Văn Lâm', 10, 'Xuất sắc'),
(39, 'Nguyễn Thị Thanh', 9, 'Tốt'),
(40, 'Phạm Văn Nam', 10, 'Xuất sắc'),
(41, 'Lê Doãn Minh', 10, 'Xuất sắc'),
(42, 'Trần Thị Hằng', 8.5, 'Cần cải thiện'),
(43, 'Nguyễn Văn Vinh', 10, 'Xuất sắc'),
(44, 'Ngô Thị Hạnh', 10, 'Xuất sắc'),
(45, 'Bùi Văn Khải', 8.5, 'Cần cải thiện'),
(46, 'Đặng Văn Chương', 10, 'Xuất sắc'),
(47, 'Vũ Thị Kim Anh', 10, 'Xuất sắc'),
(48, 'Trần Văn Tuấn', 10, 'Xuất sắc'),
(49, 'Nguyễn Thị Yến', 9, 'Tốt'),
(50, 'Phạm Văn Kiên', 9.5, 'Tốt'),
(51, 'Âu Dương Hiệp Hào', 10, 'Xuất sắc');

-- --------------------------------------------------------


CREATE TABLE `product` (
  `Product_ID` int(11) NOT NULL,
  `Product_Code` char(10) DEFAULT NULL,
  `Supplier_ID` int(11) DEFAULT NULL,
  `BuyPrice` decimal(10,2) DEFAULT NULL,
  `ProductRating` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`Product_ID`, `Product_Code`, `Supplier_ID`, `BuyPrice`, `ProductRating`) VALUES
(1, 'Táo', 1, 10.00, 9),
(2, 'Chuối', 1, 15.00, 10),
(3, 'Cam', 1, 12.50, 9),
(4, 'Nho', 1, 11.00, 9),
(5, 'Dưa hấu', 1, 25.00, 10),
(6, 'Kiwi', 1, 18.00, 10),
(7, 'Dứa', 1, 22.00, 9),
(8, 'Lê', 1, 14.00, 9),
(9, 'Mận', 1, 16.00, 10),
(10, 'Bưởi', 1, 11.50, 9),
(11, 'Xoài', 1, 30.00, 10),
(12, 'Chanh', 1, 10.00, 9),
(13, 'Dưa lê', 1, 19.00, 9),
(14, 'Lựu', 1, 17.50, 10),
(15, 'Nhãn', 1, 21.00, 9),
(16, 'Ổi', 1, 20.00, 9),
(17, 'Dưa leo', 1, 29.00, 10),
(18, 'Bơ', 1, 24.00, 9),
(19, 'Quýt', 1, 26.00, 10),
(20, 'Dừa', 1, 23.00, 10);

-- Cấu trúc bảng cho bảng `feedback`
--

CREATE TABLE `feedback` (
  `Feedback_ID` int(11) NOT NULL,
  `Customer_ID` int(11) NOT NULL,
  `Order_ID` int(11) NOT NULL,
  `Rating` int(11) DEFAULT NULL,
  `Comments` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `feedback`
--

INSERT INTO `feedback` (`Feedback_ID`, `Customer_ID`, `Order_ID`, `Rating`, `Comments`) VALUES
(1, 45, 12, 5, 'Dịch vụ rất tuyệt vời, tôi sẽ quay lại lần sau!'),
(2, 17, 23, 4, 'Sản phẩm tốt, giao hàng nhanh chóng. Tuy nhiên, đóng gói chưa kỹ.'),
(3, 52, 35, 3, 'Chất lượng sản phẩm khá ổn, nhưng thời gian giao hàng hơi chậm.'),
(4, 11, 48, 5, 'Tôi rất hài lòng với dịch vụ, mọi thứ đều hoàn hảo.'),
(5, 33, 50, 2, 'Sản phẩm không như mong đợi, cần cải thiện.'),
(6, 25, 56, 4, 'Hàng đẹp, chất lượng tốt, giao hàng đúng hạn.'),
(7, 8, 61, 5, 'Sản phẩm tốt, nhân viên hỗ trợ nhiệt tình, rất hài lòng.'),
(8, 63, 72, 3, 'Mức giá hợp lý nhưng giao hàng chậm hơn dự kiến.'),
(9, 70, 85, 5, 'Rất hài lòng với dịch vụ chăm sóc khách hàng và chất lượng sản phẩm.'),
(10, 27, 90, 4, 'Sản phẩm tốt, nhưng đóng gói không chắc chắn.'),
(11, 10, 98, 4, 'Hàng tốt, giao hàng đúng giờ, cảm ơn shop.'),
(12, 53, 110, 2, 'Sản phẩm không giống hình ảnh, cần xem lại chất lượng.'),
(13, 19, 120, 3, 'Dịch vụ tốt, nhưng sản phẩm không được như kỳ vọng.'),
(14, 38, 125, 5, 'Tôi rất hài lòng với chất lượng sản phẩm và thời gian giao hàng.'),
(15, 66, 135, 4, 'Sản phẩm đẹp, đúng như mô tả, nhưng đóng gói hơi sơ sài.'),
(16, 13, 141, 3, 'Giá hơi cao so với chất lượng sản phẩm.'),
(17, 41, 149, 5, 'Rất hài lòng, sản phẩm chất lượng, giao hàng nhanh.'),
(18, 56, 3, 5, 'Sản phẩm tốt, nhân viên tư vấn nhiệt tình.'),
(19, 5, 6, 4, 'Giao hàng nhanh, chất lượng sản phẩm ổn.'),
(20, 18, 9, 3, 'Dịch vụ không được tốt lắm, mong shop cải thiện.'),
(21, 77, 16, 4, 'Sản phẩm đẹp, giá cả hợp lý, nhân viên hỗ trợ tốt.'),
(22, 20, 22, 5, 'Rất hài lòng với dịch vụ và chất lượng sản phẩm.'),
(23, 68, 25, 3, 'Giao hàng chậm, sản phẩm không như mong đợi.'),
(24, 15, 28, 4, 'Hàng đẹp, giá tốt, nhưng thời gian giao hàng cần cải thiện.'),
(25, 50, 33, 5, 'Tôi rất hài lòng với trải nghiệm mua sắm này.'),
(26, 29, 42, 2, 'Chất lượng sản phẩm không ổn, không giống hình.'),
(27, 75, 46, 5, 'Giao hàng nhanh, chất lượng sản phẩm tuyệt vời.'),
(28, 12, 52, 4, 'Sản phẩm ổn, nhân viên hỗ trợ tốt.'),
(29, 39, 59, 3, 'Hàng không đúng mô tả, cần cải thiện dịch vụ.'),
(30, 34, 63, 4, 'Mua nhiều lần và luôn hài lòng với dịch vụ.'),
(31, 40, 71, 2, 'Sản phẩm kém chất lượng, sẽ không quay lại.'),
(32, 9, 77, 5, 'Rất hài lòng với sản phẩm và dịch vụ.'),
(33, 36, 84, 3, 'Chất lượng bình thường, không có gì đặc biệt.'),
(34, 47, 88, 4, 'Dịch vụ tốt, giá hợp lý, sản phẩm ổn.'),
(35, 64, 95, 5, 'Hàng đẹp, đúng mô tả, rất hài lòng.'),
(36, 16, 100, 4, 'Hàng ổn, nhưng giao hàng hơi chậm.'),
(37, 26, 105, 2, 'Sản phẩm không tốt, dịch vụ cần cải thiện.'),
(38, 3, 115, 5, 'Mọi thứ đều hoàn hảo, sẽ quay lại mua lần nữa.'),
(39, 57, 121, 4, 'Sản phẩm tốt, giao hàng nhanh.'),
(40, 22, 128, 3, 'Sản phẩm tạm được, không có gì nổi bật.'),
(41, 65, 136, 5, 'Tôi rất hài lòng với dịch vụ, hàng chất lượng.'),
(42, 32, 145, 4, 'Sản phẩm tốt, giá hợp lý, giao hàng nhanh.'),
(43, 43, 147, 3, 'Giao hàng chậm, nhưng sản phẩm ổn.'),
(44, 14, 149, 2, 'Không hài lòng với sản phẩm, cần cải thiện.'),
(45, 71, 2, 4, 'Dịch vụ tốt, sản phẩm ổn.'),
(46, 58, 4, 5, 'Rất hài lòng, mọi thứ đều như mong đợi.'),
(47, 24, 8, 3, 'Chất lượng sản phẩm không cao, giao hàng chậm.'),
(48, 37, 14, 4, 'Dịch vụ tốt, nhân viên nhiệt tình.'),
(49, 72, 19, 5, 'Sản phẩm chất lượng, dịch vụ rất chuyên nghiệp.'),
(50, 6, 27, 4, 'Sản phẩm ổn, giao hàng nhanh chóng.'),
(51, 35, 31, 3, 'Không quá ấn tượng, sản phẩm bình thường.'),
(52, 67, 38, 2, 'Sản phẩm kém chất lượng, dịch vụ tệ.'),
(53, 42, 41, 5, 'Sản phẩm tốt, giá cả hợp lý, tôi rất hài lòng.'),
(54, 62, 49, 4, 'Giao hàng nhanh, sản phẩm chất lượng.'),
(55, 31, 53, 3, 'Chất lượng sản phẩm không ổn, đóng gói sơ sài.'),
(56, 74, 57, 5, 'Rất hài lòng với chất lượng sản phẩm.'),
(57, 49, 64, 4, 'Sản phẩm tốt, dịch vụ tốt, tôi sẽ giới thiệu cho bạn bè.'),
(58, 21, 69, 5, 'Rất ấn tượng với dịch vụ, sẽ quay lại.'),
(59, 7, 75, 3, 'Sản phẩm tạm được, dịch vụ cần cải thiện.'),
(60, 30, 82, 4, 'Hàng tốt, nhưng cần cải thiện thời gian giao hàng.'),
(61, 55, 89, 2, 'Chất lượng không đạt yêu cầu, dịch vụ cần cải thiện.'),
(62, 48, 94, 5, 'Tôi rất hài lòng, mọi thứ đều ổn.'),
(63, 4, 101, 3, 'Giao hàng chậm, nhưng sản phẩm ổn.'),
(64, 73, 106, 4, 'Sản phẩm đẹp, dịch vụ tốt.'),
(65, 28, 112, 5, 'Dịch vụ rất tuyệt vời, nhân viên hỗ trợ tốt.'),
(66, 46, 118, 4, 'Hàng đúng như mô tả, giao hàng nhanh.'),
(67, 69, 123, 2, 'Không hài lòng với dịch vụ, sản phẩm không tốt.'),
(68, 54, 126, 3, 'Sản phẩm trung bình, nhưng dịch vụ khá ổn.'),
(69, 61, 131, 5, 'Rất hài lòng, sẽ quay lại mua hàng.'),
(70, 60, 138, 4, 'Chất lượng tốt, giá hợp lý, giao hàng nhanh.');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `Order_ID` int(11) NOT NULL,
  `Customer_ID` int(11) DEFAULT NULL,
  `OrderDate` date DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  `OrderRequired` date DEFAULT NULL,
  `ShipAddress` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`Order_ID`, `Customer_ID`, `OrderDate`, `Status`, `OrderRequired`, `ShipAddress`) VALUES
(1, 32, '2024-09-01', 'Shipped', '2024-09-05', '123 Đường Nguyễn Trãi, Hà Nội'),
(2, 12, '2024-09-02', 'Pending', '2024-09-07', '45 Đường Lê Lợi, Hải Phòng'),
(3, 7, '2024-09-03', 'Shipped', '2024-09-08', '234 Đường Láng Hạ, Hà Nội'),
(4, 45, '2024-09-03', 'Processing', '2024-09-10', '56 Đường Điện Biên Phủ, Hà Nội'),
(5, 18, '2024-09-04', 'Cancelled', '2024-09-12', '78 Đường Tô Hiệu, Hải Dương'),
(6, 9, '2024-09-05', 'Pending', '2024-09-15', '89 Đường Hùng Vương, Bắc Ninh'),
(7, 22, '2024-09-06', 'Shipped', '2024-09-16', '100 Đường Hoàng Quốc Việt, Hà Nội'),
(8, 5, '2024-09-07', 'Cancelled', '2024-09-18', '101 Đường Lý Thường Kiệt, Hà Nội'),
(9, 39, '2024-09-08', 'Processing', '2024-09-19', '200 Đường Quang Trung, Hải Phòng'),
(10, 64, '2024-09-09', 'Shipped', '2024-09-20', '250 Đường Trần Hưng Đạo, Hà Nội'),
(11, 29, '2024-09-10', 'Cancelled', '2024-09-22', '120 Đường Phạm Văn Đồng, Hải Dương'),
(12, 11, '2024-09-11', 'Pending', '2024-09-23', '90 Đường Hoàng Diệu, Hà Nội'),
(13, 55, '2024-09-12', 'Shipped', '2024-09-24', '135 Đường Nguyễn Văn Cừ, Hải Phòng'),
(14, 67, '2024-09-13', 'Processing', '2024-09-26', '140 Đường Trường Chinh, Bắc Ninh'),
(15, 3, '2024-09-14', 'Cancelled', '2024-09-27', '45 Đường Thanh Xuân, Hà Nội'),
(16, 40, '2024-09-15', 'Shipped', '2024-09-28', '76 Đường Lê Hồng Phong, Hà Nội'),
(17, 61, '2024-09-16', 'Pending', '2024-09-29', '90 Đường Bạch Mai, Hà Nội'),
(18, 6, '2024-09-17', 'Processing', '2024-09-30', '56 Đường Nguyễn Văn Huyên, Hà Nội'),
(19, 33, '2024-09-18', 'Cancelled', '2024-10-01', '123 Đường Đại La, Hà Nội'),
(20, 13, '2024-09-19', 'Pending', '2024-10-02', '45 Đường Võ Chí Công, Hà Nội'),
(21, 30, '2024-09-20', 'Shipped', '2024-10-03', '88 Đường Định Công, Hà Nội'),
(22, 71, '2024-09-21', 'Cancelled', '2024-10-04', '123 Đường Cổ Nhuế, Hà Nội'),
(23, 50, '2024-09-22', 'Processing', '2024-10-05', '95 Đường Cầu Giấy, Hà Nội'),
(24, 62, '2024-09-23', 'Shipped', '2024-10-06', '190 Đường Tôn Đức Thắng, Hải Phòng'),
(25, 43, '2024-09-24', 'Pending', '2024-10-07', '111 Đường Nguyễn Chí Thanh, Hà Nội'),
(26, 80, '2024-09-25', 'Shipped', '2024-10-08', '300 Đường Cầu Giấy, Hà Nội'),
(27, 15, '2024-09-26', 'Cancelled', '2024-10-09', '89 Đường Tây Hồ, Hà Nội'),
(28, 58, '2024-09-27', 'Pending', '2024-10-10', '45 Đường Kim Mã, Hà Nội'),
(29, 70, '2024-09-28', 'Shipped', '2024-10-11', '132 Đường Hoàng Cầu, Hà Nội'),
(30, 37, '2024-09-29', 'Processing', '2024-10-12', '165 Đường Nguyễn Khánh Toàn, Hà Nội'),
(31, 24, '2024-09-30', 'Shipped', '2024-10-13', '22 Đường Hoàng Hoa Thám, Hà Nội'),
(32, 17, '2024-10-01', 'Cancelled', '2024-10-14', '67 Đường Văn Cao, Hải Phòng'),
(33, 52, '2024-10-02', 'Pending', '2024-10-15', '12 Đường Xuân Thủy, Hà Nội'),
(34, 36, '2024-10-03', 'Processing', '2024-10-16', '200 Đường Giải Phóng, Hà Nội'),
(35, 49, '2024-10-04', 'Shipped', '2024-10-17', '98 Đường Lạc Long Quân, Hà Nội'),
(36, 10, '2024-10-05', 'Cancelled', '2024-10-18', '45 Đường Đống Đa, Hải Phòng'),
(37, 6, '2024-10-06', 'Shipped', '2024-10-19', '150 Đường Phạm Ngũ Lão, Bắc Ninh'),
(38, 64, '2024-10-07', 'Pending', '2024-10-20', '33 Đường Lê Thánh Tông, Hà Nội'),
(39, 78, '2024-10-08', 'Processing', '2024-10-21', '79 Đường Trần Nhật Duật, Hà Nội'),
(40, 23, '2024-10-09', 'Shipped', '2024-10-22', '112 Đường Kim Liên, Hà Nội'),
(41, 48, '2024-10-10', 'Cancelled', '2024-10-23', '125 Đường Hoàn Kiếm, Hà Nội'),
(42, 19, '2024-10-11', 'Pending', '2024-10-24', '56 Đường Nguyễn Thái Học, Hải Dương'),
(43, 42, '2024-10-12', 'Shipped', '2024-10-25', '33 Đường Đại La, Hà Nội'),
(44, 58, '2024-10-13', 'Processing', '2024-10-26', '145 Đường Hàng Bạc, Hà Nội'),
(45, 13, '2024-10-14', 'Cancelled', '2024-10-27', '90 Đường Bạch Mai, Hải Phòng'),
(46, 51, '2024-10-15', 'Shipped', '2024-10-28', '234 Đường Nguyễn Văn Cừ, Hà Nội'),
(47, 31, '2024-10-16', 'Processing', '2024-10-29', '111 Đường Bưởi, Hà Nội'),
(48, 70, '2024-10-17', 'Shipped', '2024-10-30', '87 Đường Thanh Niên, Hà Nội'),
(49, 33, '2024-10-18', 'Cancelled', '2024-10-31', '67 Đường Tây Sơn, Bắc Ninh'),
(50, 21, '2024-10-19', 'Pending', '2024-11-01', '90 Đường Cổ Linh, Hà Nội'),
(51, 76, '2024-10-20', 'Processing', '2024-11-02', '123 Đường Đinh Tiên Hoàng, Hà Nội'),
(52, 44, '2024-10-21', 'Shipped', '2024-11-03', '34 Đường Lê Lợi, Hải Phòng'),
(53, 12, '2024-10-22', 'Pending', '2024-11-04', '200 Đường Nguyễn Văn Huyên, Hà Nội'),
(54, 8, '2024-10-23', 'Processing', '2024-11-05', '78 Đường Ngô Quyền, Hà Nội'),
(55, 41, '2024-10-24', 'Cancelled', '2024-11-06', '189 Đường Vạn Phúc, Hà Nội'),
(56, 67, '2024-10-25', 'Shipped', '2024-11-07', '99 Đường Trần Quang Khải, Hà Nội'),
(57, 25, '2024-10-26', 'Processing', '2024-11-08', '11 Đường Phan Đình Phùng, Hà Nội'),
(58, 53, '2024-10-27', 'Shipped', '2024-11-09', '44 Đường Nguyễn Du, Hải Phòng'),
(59, 74, '2024-10-28', 'Pending', '2024-11-10', '67 Đường Tràng Tiền, Hà Nội'),
(60, 9, '2024-10-29', 'Cancelled', '2024-11-11', '101 Đường Thái Hà, Hà Nội'),
(61, 35, '2024-10-30', 'Shipped', '2024-11-12', '56 Đường Trần Nhân Tông, Hà Nội'),
(62, 79, '2024-10-31', 'Pending', '2024-11-13', '78 Đường Nguyễn Trãi, Hải Phòng'),
(63, 47, '2024-11-01', 'Cancelled', '2024-11-14', '12 Đường Trần Hưng Đạo, Hà Nội'),
(64, 38, '2024-11-02', 'Shipped', '2024-11-15', '34 Đường Nguyễn Thị Minh Khai, Hà Nội'),
(65, 14, '2024-11-03', 'Processing', '2024-11-16', '80 Đường Nguyễn Công Trứ, Bắc Ninh'),
(66, 1, '2024-11-04', 'Cancelled', '2024-11-17', '90 Đường Hàng Bài, Hà Nội'),
(67, 2, '2024-11-05', 'Shipped', '2024-11-18', '25 Đường Cát Linh, Hà Nội'),
(68, 63, '2024-11-06', 'Pending', '2024-11-19', '12 Đường Đê La Thành, Hà Nội'),
(69, 65, '2024-11-07', 'Processing', '2024-11-20', '90 Đường Hàng Bông, Hà Nội'),
(70, 20, '2024-11-08', 'Cancelled', '2024-11-21', '45 Đường Nguyễn Khuyến, Hải Dương'),
(71, 57, '2024-11-09', 'Shipped', '2024-11-22', '123 Đường Nguyễn Đình Chiểu, Hà Nội'),
(72, 68, '2024-11-10', 'Pending', '2024-11-23', '88 Đường Lê Duẩn, Hà Nội'),
(73, 10, '2024-11-11', 'Cancelled', '2024-11-24', '101 Đường Phố Huế, Hà Nội'),
(74, 55, '2024-11-12', 'Shipped', '2024-11-25', '234 Đường Trần Thái Tông, Hà Nội'),
(75, 72, '2024-11-13', 'Processing', '2024-11-26', '87 Đường Lê Văn Lương, Hà Nội'),
(76, 75, '2024-11-14', 'Cancelled', '2024-11-27', '156 Đường Ngọc Khánh, Hà Nội'),
(77, 46, '2024-11-15', 'Shipped', '2024-11-28', '45 Đường Đỗ Xuân Hợp, Hải Phòng'),
(78, 8, '2024-11-16', 'Pending', '2024-11-29', '132 Đường Chùa Bộc, Hà Nội'),
(79, 11, '2024-11-17', 'Cancelled', '2024-11-30', '45 Đường Nguyên Hồng, Hà Nội'),
(80, 15, '2024-11-18', 'Shipped', '2024-12-01', '200 Đường Phan Đình Phùng, Hà Nội'),
(81, 26, '2024-11-19', 'Processing', '2024-12-02', '56 Đường Lê Hồng Phong, Hải Dương'),
(82, 23, '2024-11-20', 'Cancelled', '2024-12-03', '95 Đường Bến Thành, Hà Nội'),
(83, 29, '2024-11-21', 'Shipped', '2024-12-04', '100 Đường Phố Tôn Đức Thắng, Hải Phòng'),
(84, 60, '2024-11-22', 'Pending', '2024-12-05', '123 Đường Bạch Đằng, Hà Nội'),
(85, 65, '2024-11-23', 'Processing', '2024-12-06', '56 Đường Kim Liên, Hà Nội'),
(86, 4, '2024-11-24', 'Cancelled', '2024-12-07', '78 Đường Đinh Tiên Hoàng, Hải Dương'),
(87, 19, '2024-11-25', 'Shipped', '2024-12-08', '25 Đường Lê Văn Thiêm, Hà Nội'),
(88, 45, '2024-11-26', 'Pending', '2024-12-09', '99 Đường Trường Chinh, Bắc Ninh'),
(89, 6, '2024-11-27', 'Shipped', '2024-12-10', '22 Đường Cầu Giấy, Hà Nội'),
(90, 73, '2024-11-28', 'Cancelled', '2024-12-11', '180 Đường Phạm Văn Đồng, Hà Nội'),
(91, 25, '2024-11-29', 'Shipped', '2024-12-12', '34 Đường Phố Huế, Hà Nội'),
(92, 37, '2024-11-30', 'Pending', '2024-12-13', '67 Đường Đê La Thành, Hà Nội'),
(93, 8, '2024-12-01', 'Cancelled', '2024-12-14', '23 Đường Lê Thanh Nghị, Hải Dương'),
(94, 44, '2024-12-02', 'Shipped', '2024-12-15', '90 Đường Nguyễn Văn Cừ, Hà Nội'),
(95, 64, '2024-12-03', 'Processing', '2024-12-16', '45 Đường Tây Sơn, Hà Nội'),
(96, 34, '2024-12-04', 'Cancelled', '2024-12-17', '78 Đường Tôn Đức Thắng, Bắc Ninh'),
(97, 41, '2024-12-05', 'Shipped', '2024-12-18', '12 Đường Thanh Niên, Hà Nội'),
(98, 53, '2024-12-06', 'Pending', '2024-12-19', '34 Đường Đinh Tiên Hoàng, Hải Phòng'),
(99, 59, '2024-12-07', 'Processing', '2024-12-20', '90 Đường Hàng Bông, Hà Nội'),
(100, 66, '2024-12-08', 'Cancelled', '2024-12-21', '101 Đường Bà Triệu, Hà Nội'),
(101, 27, '2024-12-09', 'Shipped', '2024-12-22', '78 Đường Kim Mã, Hà Nội'),
(102, 70, '2024-12-10', 'Pending', '2024-12-23', '56 Đường Lê Duẩn, Hải Phòng'),
(103, 22, '2024-12-11', 'Cancelled', '2024-12-24', '12 Đường Trường Chinh, Bắc Ninh'),
(104, 13, '2024-12-12', 'Shipped', '2024-12-25', '45 Đường Lê Văn Sỹ, Hà Nội'),
(105, 20, '2024-12-13', 'Processing', '2024-12-26', '200 Đường Tôn Thất Tùng, Hà Nội'),
(106, 35, '2024-12-14', 'Cancelled', '2024-12-27', '134 Đường Thái Hà, Hà Nội'),
(107, 15, '2024-12-15', 'Shipped', '2024-12-28', '25 Đường Vũ Trọng Phụng, Hải Phòng'),
(108, 4, '2024-12-16', 'Pending', '2024-12-29', '78 Đường Cát Linh, Hà Nội'),
(109, 6, '2024-12-17', 'Cancelled', '2024-12-30', '22 Đường Nguyễn Thái Học, Bắc Ninh'),
(110, 31, '2024-12-18', 'Shipped', '2024-12-31', '99 Đường Bạch Mai, Hà Nội'),
(111, 78, '2024-12-19', 'Processing', '2025-01-01', '150 Đường Nguyễn Khuyến, Hải Phòng'),
(112, 5, '2024-12-20', 'Cancelled', '2025-01-02', '45 Đường Hoàng Hoa Thám, Hà Nội'),
(113, 3, '2024-12-21', 'Shipped', '2025-01-03', '34 Đường Hoàn Kiếm, Hà Nội'),
(114, 66, '2024-12-22', 'Pending', '2025-01-04', '123 Đường Vạn Phúc, Bắc Ninh'),
(115, 74, '2024-12-23', 'Cancelled', '2025-01-05', '98 Đường Nguyễn Trãi, Hải Dương'),
(116, 8, '2024-12-24', 'Shipped', '2025-01-06', '90 Đường Nguyễn Văn Huyên, Hà Nội'),
(117, 71, '2024-12-25', 'Processing', '2025-01-07', '145 Đường Hàng Bạc, Hải Phòng'),
(118, 9, '2024-12-26', 'Cancelled', '2025-01-08', '101 Đường Trần Quang Khải, Hà Nội'),
(119, 42, '2024-12-27', 'Shipped', '2025-01-09', '87 Đường Cổ Linh, Hà Nội'),
(120, 18, '2024-12-28', 'Pending', '2025-01-10', '99 Đường Bến Thành, Hải Dương'),
(121, 69, '2024-12-29', 'Processing', '2025-01-11', '34 Đường Phan Đình Phùng, Hà Nội'),
(122, 39, '2024-12-30', 'Cancelled', '2025-01-12', '12 Đường Ngô Quyền, Hải Phòng'),
(123, 30, '2025-01-01', 'Shipped', '2025-01-13', '56 Đường Lê Thánh Tông, Hà Nội'),
(124, 12, '2025-01-02', 'Pending', '2025-01-14', '78 Đường Thanh Niên, Bắc Ninh'),
(125, 50, '2025-01-03', 'Processing', '2025-01-15', '123 Đường Tô Hiến Thành, Hải Dương'),
(126, 61, '2025-01-04', 'Cancelled', '2025-01-16', '90 Đường Phố Huế, Hà Nội'),
(127, 76, '2025-01-05', 'Shipped', '2025-01-17', '45 Đường Giải Phóng, Hải Phòng'),
(128, 10, '2025-01-06', 'Pending', '2025-01-18', '22 Đường Hàng Da, Hà Nội'),
(129, 79, '2025-01-07', 'Processing', '2025-01-19', '34 Đường Bà Triệu, Hà Nội'),
(130, 33, '2025-01-08', 'Cancelled', '2025-01-20', '56 Đường Trần Đăng Ninh, Hải Dương'),
(131, 48, '2025-01-09', 'Shipped', '2025-01-21', '90 Đường Nguyễn Khánh Toàn, Hà Nội'),
(132, 55, '2025-01-10', 'Pending', '2025-01-22', '12 Đường Nguyễn Thái Học, Bắc Ninh'),
(133, 14, '2025-01-11', 'Processing', '2025-01-23', '34 Đường Xuân Thủy, Hà Nội'),
(134, 60, '2025-01-12', 'Cancelled', '2025-01-24', '78 Đường Lê Lợi, Hải Phòng'),
(135, 27, '2025-01-13', 'Shipped', '2025-01-25', '56 Đường Trường Chinh, Hà Nội'),
(136, 77, '2025-01-14', 'Pending', '2025-01-26', '90 Đường Kim Mã, Hải Dương'),
(137, 25, '2025-01-15', 'Processing', '2025-01-27', '12 Đường Vũ Trọng Phụng, Hà Nội'),
(138, 16, '2025-01-16', 'Cancelled', '2025-01-28', '34 Đường Ngọc Lâm, Hải Phòng'),
(139, 49, '2025-01-17', 'Shipped', '2025-01-29', '78 Đường Hoàng Cầu, Bắc Ninh'),
(140, 23, '2025-01-18', 'Pending', '2025-01-30', '90 Đường Bạch Đằng, Hà Nội'),
(141, 80, '2025-01-19', 'Processing', '2025-01-31', '12 Đường Đội Cấn, Hải Dương'),
(142, 19, '2025-01-20', 'Cancelled', '2025-02-01', '34 Đường Phú Thượng, Hà Nội'),
(143, 72, '2025-01-21', 'Shipped', '2025-02-02', '90 Đường Thái Thịnh, Hải Phòng'),
(144, 45, '2025-01-22', 'Pending', '2025-02-03', '123 Đường Văn Cao, Bắc Ninh'),
(145, 15, '2025-01-23', 'Processing', '2025-02-04', '67 Đường Hàng Bông, Hà Nội'),
(146, 24, '2025-01-24', 'Cancelled', '2025-02-05', '99 Đường Nguyễn Hữu Huân, Hải Dương'),
(147, 70, '2025-01-25', 'Shipped', '2025-02-06', '45 Đường Lê Hồng Phong, Hà Nội'),
(148, 43, '2025-01-26', 'Pending', '2025-02-07', '90 Đường Đinh Tiên Hoàng, Bắc Ninh'),
(149, 67, '2025-01-27', 'Processing', '2025-02-08', '123 Đường Phan Chu Trinh, Hải Phòng'),
(150, 20, '2025-01-28', 'Cancelled', '2025-02-09', '56 Đường Trần Quý Cáp, Hà Nội');


-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `project`
--

CREATE TABLE `project` (
  `Project_ID` int(11) NOT NULL,
  `ProjectName` varchar(50) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `project`
--

INSERT INTO `project` (`Project_ID`, `ProjectName`, `Address`) VALUES
(1, 'Siêu Thị Hoa Quả Tươi', 'Số 1, Đường Lê Lợi, Hà Nội'),
(2, 'Cửa Hàng Trái Cây Ngọc Sơn', 'Số 12, Đường Trần Hưng Đạo, Hồ Chí Minh'),
(3, 'Cửa Hàng Trái Cây Sạch', 'Số 34, Đường Nguyễn Văn Cừ, Đà Nẵng'),
(4, 'Hệ Thống Siêu Thị Fruits', 'Số 56, Đường Nguyễn Thái Học, Hải Phòng'),
(5, 'Công ty Cung Cấp Hoa Quả Sạch', 'Số 78, Đường Lê Văn Lương, Cần Thơ'),
(6, 'Dịch vụ Giao Hàng Trái Cây Fresh', 'Số 90, Đường Hoàng Văn Thụ, Nha Trang'),
(7, 'Cửa Hàng Trái Cây An Toàn', 'Số 11, Đường Phan Đình Phùng, Huế'),
(8, 'Chợ Hoa Quả Tươi Mới', 'Số 22, Đường Nguyễn Đình Chiểu, Phú Quốc'),
(1, 'Siêu Thị Hoa Quả Tươi', 'Số 1, Đường Lê Lợi, Hà Nội'),
(2, 'Cửa Hàng Trái Cây Ngọc Sơn', 'Số 12, Đường Trần Hưng Đạo, Hồ Chí Minh'),
(3, 'Cửa Hàng Trái Cây Sạch', 'Số 34, Đường Nguyễn Văn Cừ, Đà Nẵng'),
(4, 'Hệ Thống Siêu Thị Fruits', 'Số 56, Đường Nguyễn Thái Học, Hải Phòng'),
(5, 'Công ty Cung Cấp Hoa Quả Sạch', 'Số 78, Đường Lê Văn Lương, Cần Thơ'),
(6, 'Dịch vụ Giao Hàng Trái Cây Fresh', 'Số 90, Đường Hoàng Văn Thụ, Nha Trang'),
(7, 'Cửa Hàng Trái Cây An Toàn', 'Số 11, Đường Phan Đình Phùng, Huế'),
(8, 'Chợ Hoa Quả Tươi Mới', 'Số 22, Đường Nguyễn Đình Chiểu, Phú Quốc');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `salary`
--

CREATE TABLE `salary` (
  `Employee_ID` int(11) NOT NULL,
  `EmployeeName` varchar(50) NOT NULL,
  `Salary` decimal(10,2) DEFAULT NULL,
  `DaysOff` int(11) DEFAULT NULL,
  `Bonus` decimal(10,2) DEFAULT NULL,
  `LateDays` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `salary`
--

INSERT INTO `salary` (`Employee_ID`, `EmployeeName`, `Salary`, `DaysOff`, `Bonus`, `LateDays`) VALUES
(1, 'Nguyễn Văn Minh', 65000000.00, 1, 3250000.00, 0),
(2, 'Lê Doãn Khế', 36000000.00, 1, 1800000.00, 0),
(3, 'Trần Thị Mai', 30000000.00, 0, 3000000.00, 0),
(4, 'Phạm Ngọc Huy', 30000000.00, 0, 1500000.00, 0),
(5, 'Ngô Văn An', 29000000.00, 0, 1450000.00, 0),
(6, 'Bùi Thị Bích', 32000000.00, 0, 1600000.00, 0),
(7, 'Đặng Văn Hòa', 28000000.00, 0, 1400000.00, 0),
(8, 'Vũ Thị Huệ', 27000000.00, 0, 1350000.00, 0),
(9, 'Lê Hoàng', 45000000.00, 0, 2250000.00, 0),
(10, 'Nguyễn Tuấn', 33000000.00, 0, 1650000.00, 0),
(11, 'Phan Thị Thảo', 25000000.00, 0, 2500000.00, 0),
(12, 'Nguyễn Văn Tâm', 31000000.00, 1, 0.00, 1),
(13, 'Lê Hoàng Hải', 30000000.00, 0, 1500000.00, 0),
(14, 'Trần Minh Tâm', 29000000.00, 0, 1450000.00, 0),
(15, 'Nguyễn Ngọc Sơn', 45000000.00, 0, 2250000.00, 0),
(16, 'Ngô Thị Phương', 31000000.00, 0, 3100000.00, 0),
(17, 'Bùi Văn Khoa', 29000000.00, 0, 1450000.00, 0),
(18, 'Trần Thị Hương', 26000000.00, 0, 1300000.00, 0),
(19, 'Nguyễn Văn Lợi', 28000000.00, 0, 2800000.00, 0),
(20, 'Phạm Văn Long', 32000000.00, 0, 1600000.00, 0),
(21, 'Lê Văn Hậu', 27000000.00, 0, 1350000.00, 0),
(22, 'Trần Minh Quân', 45000000.00, 0, 0.00, 1),
(23, 'Nguyễn Thị Thúy', 24000000.00, 0, 0.00, 2),
(24, 'Ngô Văn Bảo', 25000000.00, 0, 1250000.00, 0),
(25, 'Bùi Thị Kim', 23000000.00, 0, 0.00, 1),
(26, 'Đặng Văn Phúc', 26000000.00, 0, 1300000.00, 0),
(27, 'Vũ Thị Nga', 24000000.00, 0, 1200000.00, 0),
(28, 'Trần Văn Hùng', 27000000.00, 1, 1350000.00, 0),
(29, 'Nguyễn Văn Quốc', 28000000.00, 0, 1400000.00, 0),
(30, 'Phạm Thị Yến', 45000000.00, 0, 2250000.00, 0),
(31, 'Lê Văn Thắng', 26000000.00, 0, 1300000.00, 0),
(32, 'Trần Thị Kim', 23000000.00, 0, 1150000.00, 0),
(33, 'Nguyễn Văn Phúc', 29000000.00, 1, 1450000.00, 0),
(34, 'Ngô Thị Thanh', 25000000.00, 0, 1250000.00, 0),
(35, 'Bùi Văn Tài', 24000000.00, 1, 1200000.00, 0),
(36, 'Đặng Văn Bằng', 22000000.00, 0, 1100000.00, 0),
(37, 'Vũ Thị Tuyết', 23000000.00, 0, 1150000.00, 0),
(38, 'Trần Văn Lâm', 25000000.00, 0, 2500000.00, 0),
(39, 'Nguyễn Thị Thanh', 24000000.00, 0, 1200000.00, 0),
(40, 'Phạm Văn Nam', 45000000.00, 0, 2250000.00, 0),
(41, 'Lê Doãn Minh', 22000000.00, 0, 0.00, 1),
(42, 'Trần Thị Hằng', 21000000.00, 0, 1050000.00, 0),
(43, 'Nguyễn Văn Vinh', 23000000.00, 0, 0.00, 1),
(44, 'Ngô Thị Hạnh', 25000000.00, 0, 2500000.00, 1),
(45, 'Bùi Văn Khải', 22000000.00, 0, 2200000.00, 0),
(46, 'Đặng Văn Chương', 23000000.00, 0, 0.00, 1),
(47, 'Vũ Thị Kim Anh', 24000000.00, 1, 1200000.00, 1),
(48, 'Trần Văn Tuấn', 22000000.00, 0, 0.00, 1),
(49, 'Nguyễn Thị Yến', 24000000.00, 0, 0.00, 1),
(50, 'Phạm Văn Kiên', 21000000.00, 0, 1050000.00, 0),
(51, 'Âu Dương Hiệp Hào', 22000000.00, 0, 0.00, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `supplier`
--

CREATE TABLE `supplier` (
  `Supplier_ID` int(11) NOT NULL,
  `SupplierName` varchar(50) DEFAULT NULL,
  `SupplierEmail` varchar(50) DEFAULT NULL,
  `SupplierAddress` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `supplier`
--

INSERT INTO `supplier` (`Supplier_ID`, `SupplierName`, `SupplierEmail`, `SupplierAddress`) VALUES
(1, 'Clever Fruits', 'cvfruits@gmail.com', 'Hà Nội'),
(2, 'Sức Sống Xanh', 'sucsongxanh@gmail.com', 'Nam Định'),
(3, 'KFruitsC', 'kfcfruits@gmail.com', 'Ninh Thuận'),
(4, 'JoliGreen', 'joligreen@gmail.com', 'Thanh Hóa'),
(5, 'Đặc sản 10 miền', '10mien@gmail.com', 'Đà Nẵng');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `timesheet`
--

CREATE TABLE `timesheet` (
  `Timesheet_ID` int(11) NOT NULL,
  `Employee_ID` int(11) NOT NULL,
  `EmployeeName` varchar(50) NOT NULL,
  `WorkedHours` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `timesheet`
--

INSERT INTO `timesheet` (`Timesheet_ID`, `Employee_ID`, `EmployeeName`, `WorkedHours`) VALUES
(1, 1, 'Nguyễn Văn Minh', 192.00),
(2, 2, 'Lê Doãn Khế', 240.00),
(3, 3, 'Trần Thị Mai', 250.00),
(4, 4, 'Phạm Ngọc Huy', 225.00),
(5, 5, 'Ngô Văn An', 250.00),
(6, 6, 'Bùi Thị Bích', 200.00),
(7, 7, 'Đặng Văn Hòa', 240.00),
(8, 8, 'Vũ Thị Huệ', 250.00),
(9, 9, 'Lê Hoàng', 250.00),
(10, 10, 'Nguyễn Tuấn', 250.00),
(11, 11, 'Phan Thị Thảo', 200.00),
(12, 12, 'Nguyễn Văn Tâm', 184.00),
(13, 13, 'Lê Hoàng Hải', 250.00),
(14, 14, 'Trần Minh Tâm', 250.00),
(15, 15, 'Nguyễn Ngọc Sơn', 250.00),
(16, 16, 'Ngô Thị Phương', 200.00),
(17, 17, 'Bùi Văn Khoa', 240.00),
(18, 18, 'Trần Thị Hương', 225.00),
(19, 19, 'Nguyễn Văn Lợi', 250.00),
(20, 20, 'Phạm Văn Long', 250.00),
(21, 21, 'Lê Văn Hậu', 240.00),
(22, 22, 'Trần Minh Quân', 250.00),
(23, 23, 'Nguyễn Thị Thúy', 184.00),
(24, 24, 'Ngô Văn Bảo', 250.00),
(25, 25, 'Bùi Thị Kim', 192.00),
(26, 26, 'Đặng Văn Phúc', 250.00),
(27, 27, 'Vũ Thị Nga', 250.00),
(28, 28, 'Trần Văn Hùng', 250.00),
(29, 29, 'Nguyễn Văn Quốc', 200.00),
(30, 30, 'Phạm Thị Yến', 240.00),
(31, 31, 'Lê Văn Thắng', 250.00),
(32, 32, 'Trần Thị Kim', 250.00),
(33, 33, 'Nguyễn Văn Phúc', 200.00),
(34, 34, 'Ngô Thị Thanh', 250.00),
(35, 35, 'Bùi Văn Tài', 192.00),
(36, 36, 'Đặng Văn Bằng', 250.00),
(37, 37, 'Vũ Thị Tuyết', 250.00),
(38, 38, 'Trần Văn Lâm', 250.00),
(39, 39, 'Nguyễn Thị Thanh', 200.00),
(40, 40, 'Phạm Văn Nam', 250.00),
(41, 41, 'Lê Doãn Minh', 240.00),
(42, 42, 'Trần Thị Hằng', 192.00),
(43, 43, 'Nguyễn Văn Vinh', 250.00),
(44, 44, 'Ngô Thị Hạnh', 250.00),
(45, 45, 'Bùi Văn Khải', 192.00),
(46, 46, 'Đặng Văn Chương', 250.00),
(47, 47, 'Vũ Thị Kim Anh', 240.00),
(48, 48, 'Trần Văn Tuấn', 250.00),
(49, 49, 'Nguyễn Thị Yến', 250.00),
(50, 50, 'Phạm Văn Kiên', 250.00),
(51, 51, 'Âu Dương Hiệp Hào', 250.00);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `training`
--

CREATE TABLE `training` (
  `Training_ID` int(11) NOT NULL,
  `TrainingName` varchar(50) DEFAULT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date NOT NULL,
  `Employee_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `training`
--

INSERT INTO `training` (`Training_ID`, `TrainingName`, `StartDate`, `EndDate`, `Employee_ID`) VALUES
(1, 'Tiếp thị kỹ thuật số', '2024-01-10', '2024-01-15', 10),
(2, 'Quản lý nhân sự', '2024-02-20', '2024-02-22', 15),
(3, 'Tiếp thị thương hiệu', '2024-03-01', '2024-03-11', 17),
(4, 'Chiến lược nhân sự', '2024-03-15', '2024-03-20', 29),
(5, 'Phân tích dữ liệu', '2024-04-05', '2024-04-07', 37),
(6, 'Quản lý tài chính', '2024-04-18', '2024-04-20', 47),
(7, 'Quản trị nhân sự nền tảng', '2024-05-01', '2024-05-07', 49);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `children`
--
ALTER TABLE `children`
  ADD PRIMARY KEY (`Employee_ID`,`ChildrenName`);

--
-- Chỉ mục cho bảng `contract`
--
ALTER TABLE `contract`
  ADD PRIMARY KEY (`Contract_ID`),
  ADD KEY `Customer_ID` (`Customer_ID`),
  ADD KEY `Project_ID` (`Project_ID`);

--
-- Chỉ mục cho bảng `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Customer_ID`);

--
-- Chỉ mục cho bảng `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`Department_ID`);

--
-- Chỉ mục cho bảng `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`Employee_ID`),
  ADD KEY `ReportTo` (`ReportTo`),
  ADD KEY `Department_ID` (`Department_ID`);

--
-- Chỉ mục cho bảng `employeecontact`
--
ALTER TABLE `employeecontact`
  ADD PRIMARY KEY (`Employee_ID`);

--
-- Chỉ mục cho bảng `employeehealth`
--
ALTER TABLE `employeehealth`
  ADD PRIMARY KEY (`Employee_ID`);

--
-- Chỉ mục cho bảng `employeeperformance`
--
ALTER TABLE `employeeperformance`
  ADD KEY `Employee_ID` (`Employee_ID`);

--

-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`Product_ID`),
  ADD KEY `Supplier_ID` (`Supplier_ID`);

-- Chỉ mục cho bảng `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`Feedback_ID`),
  ADD KEY `Customer_ID` (`Customer_ID`),
  ADD KEY `Order_ID` (`Order_ID`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`Order_ID`),
  ADD KEY `Customer_ID` (`Customer_ID`);


--
-- Chỉ mục cho bảng `salary`
--
ALTER TABLE `salary`
  ADD PRIMARY KEY (`Employee_ID`);

--
-- Chỉ mục cho bảng `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`Supplier_ID`);

--
-- Chỉ mục cho bảng `timesheet`
--
ALTER TABLE `timesheet`
  ADD PRIMARY KEY (`Timesheet_ID`),
  ADD KEY `Employee_ID` (`Employee_ID`);

--
-- Chỉ mục cho bảng `training`
--
ALTER TABLE `training`
  ADD PRIMARY KEY (`Training_ID`),
  ADD KEY `Employee_ID` (`Employee_ID`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `department`
--
ALTER TABLE `department`
  MODIFY `Department_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `employee`
--
ALTER TABLE `employee`
  MODIFY `Employee_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `Order_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT cho bảng `timesheet`
--
ALTER TABLE `timesheet`
  MODIFY `Timesheet_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT cho bảng `training`
--
ALTER TABLE `training`
  MODIFY `Training_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `children`
--
ALTER TABLE `children`
  ADD CONSTRAINT `children_ibfk_1` FOREIGN KEY (`Employee_ID`) REFERENCES `employee` (`Employee_ID`);

--
-- Các ràng buộc cho bảng `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`ReportTo`) REFERENCES `employee` (`Employee_ID`),
  ADD CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`Department_ID`) REFERENCES `department` (`Department_ID`);

--
-- Các ràng buộc cho bảng `employeecontact`
--
ALTER TABLE `employeecontact`
  ADD CONSTRAINT `employeecontact_ibfk_1` FOREIGN KEY (`Employee_ID`) REFERENCES `employee` (`Employee_ID`);

--
-- Các ràng buộc cho bảng `employeehealth`
--
ALTER TABLE `employeehealth`
  ADD CONSTRAINT `employeehealth_ibfk_1` FOREIGN KEY (`Employee_ID`) REFERENCES `employee` (`Employee_ID`);

--
-- Các ràng buộc cho bảng `employeeperformance`
--
ALTER TABLE `employeeperformance`
  ADD CONSTRAINT `employeeperformance_ibfk_1` FOREIGN KEY (`Employee_ID`) REFERENCES `employee` (`Employee_ID`);

--

-- Các ràng buộc cho bảng `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`Supplier_ID`) REFERENCES `supplier` (`Supplier_ID`);

-- Các ràng buộc cho bảng `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`),
  ADD CONSTRAINT `feedback_ibfk_2` FOREIGN KEY (`Order_ID`) REFERENCES `orders` (`Order_ID`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`);


--
-- Các ràng buộc cho bảng `salary`
--
ALTER TABLE `salary`
  ADD CONSTRAINT `salary_ibfk_1` FOREIGN KEY (`Employee_ID`) REFERENCES `employee` (`Employee_ID`);

--
-- Các ràng buộc cho bảng `timesheet`
--
ALTER TABLE `timesheet`
  ADD CONSTRAINT `timesheet_ibfk_1` FOREIGN KEY (`Employee_ID`) REFERENCES `employee` (`Employee_ID`);

--
-- Các ràng buộc cho bảng `training`
--
ALTER TABLE `training`
  ADD CONSTRAINT `training_ibfk_1` FOREIGN KEY (`Employee_ID`) REFERENCES `employee` (`Employee_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
