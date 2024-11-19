-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3307
-- Thời gian đã tạo: Th10 19, 2024 lúc 09:13 AM
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
-- Cơ sở dữ liệu: `company_sample`
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
(51, 'Âu Dương Hiệp Hào', 1, '2005-10-02', 3),
(52, 'Lê Thanh Vân', 9, '2024-11-17', 2),
(53, 'Lê Thanh Vân', 9, '2024-11-17', 2),
(54, 'Lê Thanh Vân', 9, '2024-11-17', 2),
(55, 'Lê Văn Nam', 9, '0000-00-00', 2),
(56, 'Lê Văn Nam', 9, '2024-11-06', 2),
(58, 'Lee Van NAm', 9, '2024-10-30', 2),
(59, 'LeE Min HO', 9, '2024-11-12', 2),
(60, 'LeE Min HO', 9, '2024-11-13', 2);

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
(51, '0943456782', 'hao@gmail.com', 'Thái Nguyên, Việt Nam'),
(53, '0923451245', 'van@gmail.com', 'Hà Nội, Việt Nam'),
(54, '0923451245', 'van@gmail.com', 'Hà Nội, Việt Nam'),
(55, 'Hưng Yên', '2024-11-06', 'nam@gmail.com'),
(56, '0332653463', 'nam@gmail.com', 'Hưng Yên'),
(58, '2', 'hello@gmals.com', '2'),
(59, '0234567323', 'asdfasdf@gmail', 'Ha Noi '),
(60, '0234567323', 'asdfasdf@gmail', 'Ha Noi ');

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
(51, 'Âu Dương Hiệp Hào', 10, 'Xuất sắc'),
(53, '', 80, NULL),
(54, '', 80, NULL),
(55, '', 80, NULL),
(56, '', 80, NULL),
(58, '', 80, NULL),
(59, '', 80, NULL),
(60, '', 80, NULL);

-- --------------------------------------------------------

--
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
(1, 45, 4, 5, 'Dịch vụ rất tuyệt vời, tôi sẽ quay lại lần sau!'),
(2, 17, 32, 4, 'Sản phẩm tốt, giao hàng nhanh chóng. Tuy nhiên, đóng gói chưa kỹ.'),
(3, 52, 33, 3, 'Chất lượng sản phẩm khá ổn, nhưng thời gian giao hàng hơi chậm.'),
(4, 11, 12, 5, 'Tôi rất hài lòng với dịch vụ, mọi thứ đều hoàn hảo.'),
(5, 33, 19, 2, 'Sản phẩm không như mong đợi, cần cải thiện.'),
(6, 25, 57, 4, 'Hàng đẹp, chất lượng tốt, giao hàng đúng hạn.'),
(7, 8, 54, 5, 'Sản phẩm tốt, nhân viên hỗ trợ nhiệt tình, rất hài lòng.'),
(8, 63, 68, 3, 'Mức giá hợp lý nhưng giao hàng chậm hơn dự kiến.'),
(9, 70, 29, 5, 'Rất hài lòng với dịch vụ chăm sóc khách hàng và chất lượng sản phẩm.'),
(10, 27, 101, 4, 'Sản phẩm tốt, nhưng đóng gói không chắc chắn.'),
(11, 10, 36, 4, 'Hàng tốt, giao hàng đúng giờ, cảm ơn shop.'),
(12, 53, 58, 2, 'Sản phẩm không giống hình ảnh, cần xem lại chất lượng.'),
(13, 19, 42, 3, 'Dịch vụ tốt, nhưng sản phẩm không được như kỳ vọng.'),
(14, 38, 64, 5, 'Tôi rất hài lòng với chất lượng sản phẩm và thời gian giao hàng.'),
(15, 66, 100, 4, 'Sản phẩm đẹp, đúng như mô tả, nhưng đóng gói hơi sơ sài.'),
(16, 13, 20, 3, 'Giá hơi cao so với chất lượng sản phẩm.'),
(17, 41, 55, 5, 'Rất hài lòng, sản phẩm chất lượng, giao hàng nhanh.'),
(18, 56, 3, 5, 'Sản phẩm tốt, nhân viên tư vấn nhiệt tình.'),
(19, 5, 8, 4, 'Giao hàng nhanh, chất lượng sản phẩm ổn.'),
(20, 18, 5, 3, 'Dịch vụ không được tốt lắm, mong shop cải thiện.'),
(21, 77, 136, 4, 'Sản phẩm đẹp, giá cả hợp lý, nhân viên hỗ trợ tốt.'),
(22, 20, 70, 5, 'Rất hài lòng với dịch vụ và chất lượng sản phẩm.'),
(23, 68, 72, 3, 'Giao hàng chậm, sản phẩm không như mong đợi.'),
(24, 15, 27, 4, 'Hàng đẹp, giá tốt, nhưng thời gian giao hàng cần cải thiện.'),
(25, 50, 23, 5, 'Tôi rất hài lòng với trải nghiệm mua sắm này.'),
(26, 29, 11, 2, 'Chất lượng sản phẩm không ổn, không giống hình.'),
(27, 75, 76, 5, 'Giao hàng nhanh, chất lượng sản phẩm tuyệt vời.'),
(28, 12, 2, 4, 'Sản phẩm ổn, nhân viên hỗ trợ tốt.'),
(29, 39, 9, 3, 'Hàng không đúng mô tả, cần cải thiện dịch vụ.'),
(30, 34, 96, 4, 'Mua nhiều lần và luôn hài lòng với dịch vụ.'),
(31, 40, 16, 2, 'Sản phẩm kém chất lượng, sẽ không quay lại.'),
(32, 9, 6, 5, 'Rất hài lòng với sản phẩm và dịch vụ.'),
(33, 36, 34, 3, 'Chất lượng bình thường, không có gì đặc biệt.'),
(34, 47, 63, 4, 'Dịch vụ tốt, giá hợp lý, sản phẩm ổn.'),
(35, 64, 10, 5, 'Hàng đẹp, đúng mô tả, rất hài lòng.'),
(36, 16, 138, 4, 'Hàng ổn, nhưng giao hàng hơi chậm.'),
(37, 26, 81, 2, 'Sản phẩm không tốt, dịch vụ cần cải thiện.'),
(38, 3, 15, 5, 'Mọi thứ đều hoàn hảo, sẽ quay lại mua lần nữa.'),
(39, 57, 71, 4, 'Sản phẩm tốt, giao hàng nhanh.'),
(40, 22, 7, 3, 'Sản phẩm tạm được, không có gì nổi bật.'),
(41, 65, 69, 5, 'Tôi rất hài lòng với dịch vụ, hàng chất lượng.'),
(42, 32, 1, 4, 'Sản phẩm tốt, giá hợp lý, giao hàng nhanh.'),
(43, 43, 25, 3, 'Giao hàng chậm, nhưng sản phẩm ổn.'),
(44, 14, 65, 2, 'Không hài lòng với sản phẩm, cần cải thiện.'),
(45, 71, 22, 4, 'Dịch vụ tốt, sản phẩm ổn.'),
(46, 58, 28, 5, 'Rất hài lòng, mọi thứ đều như mong đợi.'),
(47, 24, 31, 3, 'Chất lượng sản phẩm không cao, giao hàng chậm.'),
(48, 37, 30, 4, 'Dịch vụ tốt, nhân viên nhiệt tình.'),
(49, 72, 75, 5, 'Sản phẩm chất lượng, dịch vụ rất chuyên nghiệp.'),
(50, 6, 18, 4, 'Sản phẩm ổn, giao hàng nhanh chóng.'),
(51, 35, 61, 3, 'Không quá ấn tượng, sản phẩm bình thường.'),
(52, 67, 14, 2, 'Sản phẩm kém chất lượng, dịch vụ tệ.'),
(53, 42, 43, 5, 'Sản phẩm tốt, giá cả hợp lý, tôi rất hài lòng.'),
(54, 62, 24, 4, 'Giao hàng nhanh, sản phẩm chất lượng.'),
(55, 31, 47, 3, 'Chất lượng sản phẩm không ổn, đóng gói sơ sài.'),
(56, 74, 59, 5, 'Rất hài lòng với chất lượng sản phẩm.'),
(57, 49, 35, 4, 'Sản phẩm tốt, dịch vụ tốt, tôi sẽ giới thiệu cho bạn bè.'),
(58, 21, 50, 5, 'Rất ấn tượng với dịch vụ, sẽ quay lại.'),
(59, 7, 3, 3, 'Sản phẩm tạm được, dịch vụ cần cải thiện.'),
(60, 30, 21, 4, 'Hàng tốt, nhưng cần cải thiện thời gian giao hàng.'),
(61, 55, 13, 2, 'Chất lượng không đạt yêu cầu, dịch vụ cần cải thiện.'),
(62, 48, 41, 5, 'Tôi rất hài lòng, mọi thứ đều ổn.'),
(63, 4, 86, 3, 'Giao hàng chậm, nhưng sản phẩm ổn.'),
(64, 73, 90, 4, 'Sản phẩm đẹp, dịch vụ tốt.'),
(65, 28, 112, 5, 'Dịch vụ rất tuyệt vời, nhân viên hỗ trợ tốt.'),
(66, 46, 77, 4, 'Hàng đúng như mô tả, giao hàng nhanh.'),
(67, 69, 121, 2, 'Không hài lòng với dịch vụ, sản phẩm không tốt.'),
(68, 54, 126, 3, 'Sản phẩm trung bình, nhưng dịch vụ khá ổn.'),
(69, 61, 17, 5, 'Rất hài lòng, sẽ quay lại mua hàng.'),
(70, 60, 84, 4, 'Chất lượng tốt, giá hợp lý, giao hàng nhanh.');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orderdetails`
--

CREATE TABLE `orderdetails` (
  `Order_ID` int(11) NOT NULL,
  `Product_Code` char(10) NOT NULL,
  `PriceEach` decimal(10,2) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `orderdetails`
--

INSERT INTO `orderdetails` (`Order_ID`, `Product_Code`, `PriceEach`, `Quantity`) VALUES
(1, 'Cam', 16.25, 22),
(1, 'Chuối', 19.50, 64),
(1, 'Nho', 14.30, 92),
(1, 'Táo', 13.00, 36),
(2, 'Dứa', 28.60, 39),
(2, 'Dưa hấu', 32.50, 17),
(2, 'Kiwi', 23.40, 75),
(2, 'Lê', 18.20, 53),
(3, 'Bưởi', 14.95, 73),
(3, 'Chanh', 13.00, 88),
(3, 'Mận', 20.80, 48),
(3, 'Xoài', 39.00, 27),
(4, 'Dưa lê', 24.70, 79),
(4, 'Lựu', 22.75, 29),
(4, 'Nhãn', 27.30, 80),
(4, 'Ổi', 26.00, 32),
(5, 'Bơ', 31.20, 78),
(5, 'Dưa leo', 37.70, 91),
(5, 'Dừa sáp', 29.90, 19),
(5, 'Quýt', 33.80, 16),
(6, 'Cam', 16.25, 28),
(6, 'Chuối', 19.50, 30),
(6, 'Nho', 14.30, 42),
(6, 'Táo', 13.00, 38),
(7, 'Dứa', 28.60, 65),
(7, 'Dưa hấu', 32.50, 26),
(7, 'Kiwi', 23.40, 85),
(7, 'Lê', 18.20, 60),
(8, 'Bưởi', 14.95, 10),
(8, 'Chanh', 13.00, 14),
(8, 'Mận', 20.80, 94),
(8, 'Xoài', 39.00, 29),
(9, 'Dưa lê', 24.70, 66),
(9, 'Lựu', 22.75, 94),
(9, 'Nhãn', 27.30, 84),
(9, 'Ổi', 26.00, 36),
(10, 'Bơ', 31.20, 19),
(10, 'Dưa leo', 37.70, 100),
(10, 'Dừa sáp', 29.90, 42),
(10, 'Quýt', 33.80, 58),
(11, 'Cam', 16.25, 49),
(11, 'Dừa sáp', 29.90, 48),
(11, 'Nho', 14.30, 90),
(11, 'Táo', 13.00, 31),
(12, 'Dưa hấu', 32.50, 15),
(12, 'Kiwi', 23.40, 23),
(12, 'Lê', 18.20, 89),
(12, 'Mận', 20.80, 27),
(13, 'Bưởi', 14.95, 40),
(13, 'Chanh', 13.00, 51),
(13, 'Dưa lê', 24.70, 11),
(13, 'Xoài', 39.00, 18),
(14, 'Dứa', 28.60, 70),
(14, 'Lựu', 22.75, 47),
(14, 'Nhãn', 27.30, 72),
(14, 'Ổi', 26.00, 99),
(15, 'Bơ', 31.20, 48),
(15, 'Chuối', 19.50, 46),
(15, 'Dưa leo', 37.70, 93),
(15, 'Quýt', 33.80, 44),
(16, 'Dưa hấu', 32.50, 40),
(16, 'Kiwi', 23.40, 61),
(16, 'Nho', 14.30, 85),
(16, 'Táo', 13.00, 74),
(17, 'Cam', 16.25, 51),
(17, 'Dừa sáp', 29.90, 80),
(17, 'Lê', 18.20, 57),
(17, 'Mận', 20.80, 33),
(18, 'Bưởi', 14.95, 79),
(18, 'Chanh', 13.00, 80),
(18, 'Dưa lê', 24.70, 88),
(18, 'Xoài', 39.00, 11),
(19, 'Dứa', 28.60, 64),
(19, 'Lựu', 22.75, 35),
(19, 'Nhãn', 27.30, 98),
(19, 'Ổi', 26.00, 54),
(20, 'Bơ', 31.20, 62),
(20, 'Chuối', 19.50, 45),
(20, 'Dưa leo', 37.70, 85),
(20, 'Quýt', 33.80, 57),
(21, 'Dưa lê', 24.70, 31),
(21, 'Dừa sáp', 29.90, 32),
(21, 'Lựu', 22.75, 28),
(21, 'Mận', 20.80, 100),
(22, 'Bưởi', 14.95, 97),
(22, 'Kiwi', 23.40, 46),
(22, 'Nhãn', 27.30, 38),
(22, 'Xoài', 39.00, 87),
(23, 'Chuối', 19.50, 96),
(23, 'Dưa hấu', 32.50, 50),
(23, 'Nho', 14.30, 46),
(23, 'Táo', 13.00, 49),
(24, 'Chanh', 13.00, 13),
(24, 'Dứa', 28.60, 68),
(24, 'Lê', 18.20, 33),
(24, 'Quýt', 33.80, 27),
(25, 'Bơ', 31.20, 26),
(25, 'Dưa lê', 24.70, 14),
(25, 'Dưa leo', 37.70, 38),
(25, 'Dừa sáp', 29.90, 36),
(26, 'Chanh', 13.00, 79),
(26, 'Kiwi', 23.40, 83),
(26, 'Mận', 20.80, 39),
(26, 'Nho', 14.30, 79),
(27, 'Bưởi', 14.95, 45),
(27, 'Lựu', 22.75, 14),
(27, 'Nhãn', 27.30, 29),
(27, 'Xoài', 39.00, 71),
(28, 'Dứa', 28.60, 75),
(28, 'Dưa hấu', 32.50, 62),
(28, 'Dừa sáp', 29.90, 77),
(28, 'Táo', 13.00, 100),
(29, 'Bơ', 31.20, 26),
(29, 'Chuối', 19.50, 11),
(29, 'Dưa leo', 37.70, 87),
(29, 'Kiwi', 23.40, 67),
(30, 'Bưởi', 14.95, 53),
(30, 'Dưa lê', 24.70, 96),
(30, 'Mận', 20.80, 70),
(30, 'Quýt', 33.80, 73),
(31, 'Dưa lê', 24.70, 60),
(31, 'Dừa sáp', 29.90, 43),
(31, 'Lựu', 22.75, 63),
(31, 'Mận', 20.80, 76),
(32, 'Bưởi', 14.95, 63),
(32, 'Kiwi', 23.40, 91),
(32, 'Nhãn', 27.30, 34),
(32, 'Xoài', 39.00, 21),
(33, 'Chuối', 19.50, 66),
(33, 'Dưa hấu', 32.50, 93),
(33, 'Nho', 14.30, 78),
(33, 'Táo', 13.00, 15),
(34, 'Chanh', 13.00, 77),
(34, 'Dứa', 28.60, 100),
(34, 'Lê', 18.20, 72),
(34, 'Quýt', 33.80, 29),
(35, 'Bơ', 31.20, 12),
(35, 'Dưa lê', 24.70, 39),
(35, 'Dưa leo', 37.70, 53),
(35, 'Dừa sáp', 29.90, 27),
(36, 'Chanh', 13.00, 46),
(36, 'Kiwi', 23.40, 10),
(36, 'Mận', 20.80, 100),
(36, 'Nho', 14.30, 83),
(37, 'Bưởi', 14.95, 14),
(37, 'Lựu', 22.75, 84),
(37, 'Nhãn', 27.30, 86),
(37, 'Xoài', 39.00, 82),
(38, 'Dứa', 28.60, 53),
(38, 'Dưa hấu', 32.50, 59),
(38, 'Dừa sáp', 29.90, 37),
(38, 'Táo', 13.00, 89),
(39, 'Bơ', 31.20, 13),
(39, 'Chuối', 19.50, 32),
(39, 'Dưa leo', 37.70, 49),
(39, 'Kiwi', 23.40, 76),
(40, 'Bưởi', 14.95, 80),
(40, 'Dưa lê', 24.70, 94),
(40, 'Mận', 20.80, 56),
(40, 'Quýt', 33.80, 13),
(41, 'Dưa lê', 24.70, 43),
(41, 'Dừa sáp', 29.90, 61),
(41, 'Mận', 20.80, 96),
(41, 'Nho', 14.30, 21),
(42, 'Bưởi', 14.95, 43),
(42, 'Kiwi', 23.40, 32),
(42, 'Lựu', 22.75, 100),
(42, 'Xoài', 39.00, 89),
(43, 'Chuối', 19.50, 92),
(43, 'Dưa hấu', 32.50, 19),
(43, 'Dừa sáp', 29.90, 82),
(43, 'Táo', 13.00, 69),
(44, 'Chanh', 13.00, 21),
(44, 'Dứa', 28.60, 61),
(44, 'Lê', 18.20, 92),
(44, 'Quýt', 33.80, 22),
(45, 'Bơ', 31.20, 100),
(45, 'Dưa lê', 24.70, 73),
(45, 'Dưa leo', 37.70, 58),
(45, 'Nhãn', 27.30, 91),
(46, 'Chanh', 13.00, 33),
(46, 'Kiwi', 23.40, 19),
(46, 'Mận', 20.80, 45),
(46, 'Nho', 14.30, 79),
(47, 'Bưởi', 14.95, 56),
(47, 'Dừa sáp', 29.90, 85),
(47, 'Lựu', 22.75, 38),
(47, 'Xoài', 39.00, 34),
(48, 'Dứa', 28.60, 24),
(48, 'Dưa hấu', 32.50, 17),
(48, 'Quýt', 33.80, 43),
(48, 'Táo', 13.00, 54),
(49, 'Bơ', 31.20, 27),
(49, 'Chuối', 19.50, 69),
(49, 'Dưa leo', 37.70, 12),
(49, 'Kiwi', 23.40, 41),
(50, 'Bưởi', 14.95, 37),
(50, 'Dưa lê', 24.70, 79),
(50, 'Dừa sáp', 29.90, 62),
(50, 'Mận', 20.80, 21),
(51, 'Bưởi', 14.95, 49),
(51, 'Dưa hấu', 32.50, 52),
(51, 'Dừa sáp', 29.90, 79),
(51, 'Xoài', 39.00, 26),
(52, 'Dứa', 28.60, 89),
(52, 'Dưa leo', 37.70, 15),
(52, 'Kiwi', 23.40, 73),
(52, 'Nhãn', 27.30, 38),
(53, 'Chanh', 13.00, 50),
(53, 'Lê', 18.20, 36),
(53, 'Mận', 20.80, 21),
(53, 'Quýt', 33.80, 81),
(54, 'Bơ', 31.20, 56),
(54, 'Dưa lê', 24.70, 29),
(54, 'Dừa sáp', 29.90, 59),
(54, 'Nho', 14.30, 16),
(55, 'Chuối', 19.50, 51),
(55, 'Dưa hấu', 32.50, 98),
(55, 'Lựu', 22.75, 16),
(55, 'Táo', 13.00, 76),
(56, 'Dứa', 28.60, 69),
(56, 'Dừa sáp', 29.90, 76),
(56, 'Mận', 20.80, 70),
(56, 'Xoài', 39.00, 40),
(57, 'Bưởi', 14.95, 20),
(57, 'Kiwi', 23.40, 63),
(57, 'Lê', 18.20, 63),
(57, 'Nhãn', 27.30, 27),
(58, 'Chanh', 13.00, 26),
(58, 'Dưa lê', 24.70, 40),
(58, 'Dừa sáp', 29.90, 22),
(58, 'Xoài', 39.00, 72),
(59, 'Bơ', 31.20, 27),
(59, 'Dứa', 28.60, 14),
(59, 'Dưa hấu', 32.50, 12),
(59, 'Nho', 14.30, 83),
(60, 'Chuối', 19.50, 89),
(60, 'Lựu', 22.75, 84),
(60, 'Mận', 20.80, 51),
(60, 'Quýt', 33.80, 87),
(61, 'Bưởi', 14.95, 34),
(61, 'Dừa sáp', 29.90, 48),
(61, 'Nho', 14.30, 39),
(61, 'Táo', 13.00, 37),
(62, 'Dưa hấu', 32.50, 75),
(62, 'Lê', 18.20, 74),
(62, 'Mận', 20.80, 40),
(62, 'Quýt', 33.80, 62),
(63, 'Dứa', 28.60, 86),
(63, 'Dưa lê', 24.70, 90),
(63, 'Kiwi', 23.40, 27),
(63, 'Xoài', 39.00, 17),
(64, 'Chanh', 13.00, 37),
(64, 'Dưa leo', 37.70, 31),
(64, 'Dừa sáp', 29.90, 96),
(64, 'Nhãn', 27.30, 84),
(65, 'Bơ', 31.20, 78),
(65, 'Dưa hấu', 32.50, 12),
(65, 'Lựu', 22.75, 89),
(65, 'Nho', 14.30, 38),
(66, 'Mận', 20.80, 82),
(66, 'Quýt', 33.80, 86),
(66, 'Táo', 13.00, 75),
(66, 'Xoài', 39.00, 94),
(67, 'Bưởi', 14.95, 41),
(67, 'Dứa', 28.60, 82),
(67, 'Dừa sáp', 29.90, 52),
(67, 'Kiwi', 23.40, 96),
(68, 'Chanh', 13.00, 43),
(68, 'Dưa lê', 24.70, 28),
(68, 'Lê', 18.20, 92),
(68, 'Nhãn', 27.30, 90),
(69, 'Dưa hấu', 32.50, 90),
(69, 'Dừa sáp', 29.90, 69),
(69, 'Nho', 14.30, 93),
(69, 'Xoài', 39.00, 66),
(70, 'Bơ', 31.20, 23),
(70, 'Kiwi', 23.40, 95),
(70, 'Lựu', 22.75, 89),
(70, 'Mận', 20.80, 17),
(71, 'Bưởi', 14.95, 18),
(71, 'Dừa sáp', 29.90, 17),
(71, 'Nho', 14.30, 50),
(71, 'Táo', 13.00, 75),
(72, 'Dưa lê', 24.70, 69),
(72, 'Lê', 18.20, 74),
(72, 'Mận', 20.80, 26),
(72, 'Quýt', 33.80, 64),
(73, 'Chanh', 13.00, 55),
(73, 'Dưa hấu', 32.50, 29),
(73, 'Kiwi', 23.40, 96),
(73, 'Xoài', 39.00, 88),
(74, 'Dứa', 28.60, 29),
(74, 'Dưa leo', 37.70, 67),
(74, 'Dừa sáp', 29.90, 51),
(74, 'Nhãn', 27.30, 82),
(75, 'Bơ', 31.20, 16),
(75, 'Dưa hấu', 32.50, 68),
(75, 'Lựu', 22.75, 98),
(75, 'Nho', 14.30, 36),
(76, 'Dừa sáp', 29.90, 87),
(76, 'Kiwi', 23.40, 65),
(76, 'Mận', 20.80, 59),
(76, 'Xoài', 39.00, 67),
(77, 'Bưởi', 14.95, 59),
(77, 'Dứa', 28.60, 35),
(77, 'Dưa lê', 24.70, 24),
(77, 'Lê', 18.20, 96),
(78, 'Chanh', 13.00, 10),
(78, 'Dưa leo', 37.70, 87),
(78, 'Nhãn', 27.30, 89),
(78, 'Quýt', 33.80, 75),
(79, 'Bơ', 31.20, 71),
(79, 'Dưa hấu', 32.50, 35),
(79, 'Dừa sáp', 29.90, 32),
(79, 'Xoài', 39.00, 70),
(80, 'Kiwi', 23.40, 28),
(80, 'Lựu', 22.75, 79),
(80, 'Mận', 20.80, 47),
(80, 'Nho', 14.30, 31),
(81, 'Bưởi', 14.95, 88),
(81, 'Chanh', 13.00, 80),
(81, 'Dừa sáp', 29.90, 59),
(81, 'Mận', 20.80, 71),
(82, 'Dứa', 28.60, 10),
(82, 'Dưa lê', 24.70, 96),
(82, 'Lê', 18.20, 58),
(82, 'Nhãn', 27.30, 25),
(83, 'Dưa hấu', 32.50, 69),
(83, 'Dưa leo', 37.70, 68),
(83, 'Kiwi', 23.40, 39),
(83, 'Xoài', 39.00, 69),
(84, 'Dừa sáp', 29.90, 32),
(84, 'Lựu', 22.75, 87),
(84, 'Mận', 20.80, 36),
(84, 'Nho', 14.30, 78),
(85, 'Chanh', 13.00, 10),
(85, 'Dưa lê', 24.70, 48),
(85, 'Dừa sáp', 29.90, 67),
(85, 'Quýt', 33.80, 54),
(86, 'Bưởi', 14.95, 34),
(86, 'Dứa', 28.60, 92),
(86, 'Mận', 20.80, 49),
(86, 'Nhãn', 27.30, 67),
(87, 'Dưa hấu', 32.50, 86),
(87, 'Kiwi', 23.40, 13),
(87, 'Nho', 14.30, 10),
(87, 'Xoài', 39.00, 45),
(88, 'Bơ', 31.20, 73),
(88, 'Chanh', 13.00, 58),
(88, 'Dưa leo', 37.70, 70),
(88, 'Dừa sáp', 29.90, 57),
(89, 'Lê', 18.20, 57),
(89, 'Mận', 20.80, 10),
(89, 'Nhãn', 27.30, 49),
(89, 'Quýt', 33.80, 54),
(90, 'Dưa lê', 24.70, 33),
(90, 'Dừa sáp', 29.90, 24),
(90, 'Nho', 14.30, 11),
(90, 'Xoài', 39.00, 75),
(91, 'Cam', 16.25, 60),
(91, 'Dừa sáp', 29.90, 60),
(91, 'Kiwi', 23.40, 16),
(91, 'Nhãn', 27.30, 76),
(92, 'Chuối', 19.50, 50),
(92, 'Dưa hấu', 32.50, 11),
(92, 'Lựu', 22.75, 77),
(92, 'Mận', 20.80, 72),
(93, 'Bưởi', 14.95, 25),
(93, 'Dứa', 28.60, 30),
(93, 'Dưa lê', 24.70, 83),
(93, 'Nho', 14.30, 58),
(94, 'Bơ', 31.20, 79),
(94, 'Chanh', 13.00, 60),
(94, 'Dưa leo', 37.70, 18),
(94, 'Xoài', 39.00, 83),
(95, 'Lê', 18.20, 98),
(95, 'Nhãn', 27.30, 100),
(95, 'Quýt', 33.80, 44),
(95, 'Táo', 13.00, 66),
(96, 'Dưa hấu', 32.50, 38),
(96, 'Dừa sáp', 29.90, 97),
(96, 'Kiwi', 23.40, 44),
(96, 'Mận', 20.80, 15),
(97, 'Bưởi', 14.95, 68),
(97, 'Dứa', 28.60, 88),
(97, 'Dưa lê', 24.70, 42),
(97, 'Mận', 20.80, 30),
(98, 'Chanh', 13.00, 61),
(98, 'Nho', 14.30, 46),
(98, 'Quýt', 33.80, 21),
(98, 'Xoài', 39.00, 97),
(99, 'Dưa leo', 37.70, 34),
(99, 'Dừa sáp', 29.90, 19),
(99, 'Lê', 18.20, 42),
(99, 'Nhãn', 27.30, 52),
(100, 'Dưa hấu', 32.50, 94),
(100, 'Kiwi', 23.40, 83),
(100, 'Mận', 20.80, 96),
(100, 'Xoài', 39.00, 30),
(101, 'Cam', 16.25, 80),
(101, 'Dừa sáp', 29.90, 61),
(101, 'Kiwi', 23.40, 27),
(101, 'Nhãn', 27.30, 66),
(102, 'Chuối', 19.50, 56),
(102, 'Dưa hấu', 32.50, 76),
(102, 'Lựu', 22.75, 18),
(102, 'Mận', 20.80, 35),
(103, 'Bưởi', 14.95, 20),
(103, 'Dứa', 28.60, 79),
(103, 'Dưa lê', 24.70, 78),
(103, 'Nho', 14.30, 46),
(104, 'Bơ', 31.20, 57),
(104, 'Chanh', 13.00, 64),
(104, 'Dưa leo', 37.70, 74),
(104, 'Xoài', 39.00, 76),
(105, 'Lê', 18.20, 91),
(105, 'Nhãn', 27.30, 59),
(105, 'Quýt', 33.80, 50),
(105, 'Táo', 13.00, 68),
(106, 'Dưa hấu', 32.50, 64),
(106, 'Dừa sáp', 29.90, 42),
(106, 'Kiwi', 23.40, 85),
(106, 'Mận', 20.80, 14),
(107, 'Bưởi', 14.95, 36),
(107, 'Dứa', 28.60, 21),
(107, 'Dưa lê', 24.70, 46),
(107, 'Mận', 20.80, 47),
(108, 'Chanh', 13.00, 73),
(108, 'Nho', 14.30, 89),
(108, 'Quýt', 33.80, 31),
(108, 'Xoài', 39.00, 20),
(109, 'Dưa leo', 37.70, 50),
(109, 'Dừa sáp', 29.90, 11),
(109, 'Lê', 18.20, 49),
(109, 'Nhãn', 27.30, 23),
(110, 'Dưa hấu', 32.50, 55),
(110, 'Kiwi', 23.40, 29),
(110, 'Mận', 20.80, 79),
(110, 'Xoài', 39.00, 62),
(111, 'Chanh', 13.00, 64),
(111, 'Dừa sáp', 29.90, 52),
(111, 'Mận', 20.80, 28),
(112, 'Dứa', 28.60, 30),
(112, 'Dưa lê', 24.70, 48),
(112, 'Kiwi', 23.40, 37),
(113, 'Dưa leo', 37.70, 87),
(113, 'Nhãn', 27.30, 56),
(113, 'Xoài', 39.00, 31),
(114, 'Bưởi', 14.95, 96),
(114, 'Cam', 16.25, 67),
(114, 'Quýt', 33.80, 73),
(115, 'Dưa hấu', 32.50, 40),
(115, 'Lê', 18.20, 79),
(115, 'Nho', 14.30, 84),
(116, 'Dứa', 28.60, 89),
(116, 'Dưa lê', 24.70, 58),
(116, 'Dừa sáp', 29.90, 82),
(116, 'Mận', 20.80, 37),
(117, 'Bưởi', 14.95, 51),
(117, 'Chanh', 13.00, 15),
(117, 'Nhãn', 27.30, 32),
(117, 'Xoài', 39.00, 72),
(118, 'Dưa hấu', 32.50, 14),
(118, 'Dừa sáp', 29.90, 47),
(118, 'Kiwi', 23.40, 57),
(118, 'Quýt', 33.80, 56),
(119, 'Dưa leo', 37.70, 18),
(119, 'Lê', 18.20, 42),
(119, 'Mận', 20.80, 78),
(119, 'Nho', 14.30, 31),
(120, 'Bưởi', 14.95, 53),
(120, 'Cam', 16.25, 41),
(120, 'Dưa lê', 24.70, 24),
(120, 'Nhãn', 27.30, 34),
(121, 'Chanh', 13.00, 74),
(121, 'Dừa sáp', 29.90, 36),
(121, 'Kiwi', 23.40, 43),
(121, 'Mận', 20.80, 14),
(122, 'Bưởi', 14.95, 11),
(122, 'Dưa hấu', 32.50, 49),
(122, 'Dưa leo', 37.70, 99),
(122, 'Nhãn', 27.30, 83),
(122, 'Xoài', 39.00, 54),
(123, 'Dứa', 28.60, 10),
(123, 'Dưa lê', 24.70, 57),
(123, 'Lê', 18.20, 54),
(124, 'Cam', 16.25, 54),
(124, 'Quýt', 33.80, 65),
(125, 'Dừa sáp', 29.90, 66),
(126, 'Dưa hấu', 32.50, 68),
(126, 'Dưa leo', 37.70, 97),
(126, 'Dừa sáp', 29.90, 82),
(126, 'Nhãn', 27.30, 41),
(127, 'Bưởi', 14.95, 47),
(127, 'Chanh', 13.00, 70),
(127, 'Xoài', 39.00, 26),
(128, 'Dứa', 28.60, 95),
(128, 'Dưa lê', 24.70, 40),
(128, 'Lê', 18.20, 81),
(129, 'Dưa hấu', 32.50, 82),
(129, 'Dừa sáp', 29.90, 34),
(129, 'Kiwi', 23.40, 87),
(129, 'Mận', 20.80, 26),
(130, 'Lê', 18.20, 96),
(130, 'Nhãn', 27.30, 55),
(131, 'Bưởi', 14.95, 57),
(131, 'Chanh', 13.00, 85),
(131, 'Dừa sáp', 29.90, 93),
(131, 'Kiwi', 23.40, 90),
(132, 'Dứa', 28.60, 39),
(132, 'Dưa hấu', 32.50, 54),
(132, 'Dưa lê', 24.70, 81),
(132, 'Mận', 20.80, 78),
(132, 'Nhãn', 27.30, 97),
(133, 'Dưa leo', 37.70, 17),
(133, 'Lê', 18.20, 71),
(133, 'Xoài', 39.00, 11),
(134, 'Bơ', 31.20, 39),
(134, 'Quýt', 33.80, 45),
(135, 'Dừa sáp', 29.90, 97),
(136, 'Dứa', 28.60, 37),
(136, 'Dưa hấu', 32.50, 67),
(136, 'Nhãn', 27.30, 63),
(136, 'Xoài', 39.00, 16),
(137, 'Chanh', 13.00, 63),
(137, 'Dưa lê', 24.70, 32),
(137, 'Lê', 18.20, 60),
(138, 'Dưa leo', 37.70, 55),
(138, 'Dừa sáp', 29.90, 32),
(138, 'Kiwi', 23.40, 78),
(139, 'Bưởi', 14.95, 41),
(139, 'Dưa hấu', 32.50, 10),
(139, 'Mận', 20.80, 34),
(139, 'Xoài', 39.00, 91),
(140, 'Lê', 18.20, 58),
(140, 'Nhãn', 27.30, 50),
(141, 'Dứa', 28.60, 52),
(141, 'Dưa hấu', 32.50, 92),
(141, 'Kiwi', 23.40, 83),
(142, 'Bưởi', 14.95, 84),
(142, 'Chanh', 13.00, 79),
(142, 'Mận', 20.80, 19),
(143, 'Dưa leo', 37.70, 66),
(143, 'Dừa sáp', 29.90, 90),
(143, 'Lê', 18.20, 65),
(143, 'Nhãn', 27.30, 44),
(144, 'Chanh', 13.00, 14),
(144, 'Dứa', 28.60, 44),
(144, 'Dưa hấu', 32.50, 50),
(144, 'Mận', 20.80, 58),
(144, 'Xoài', 39.00, 58),
(145, 'Dừa sáp', 29.90, 32),
(145, 'Nhãn', 27.30, 72),
(146, 'Bưởi', 14.95, 85),
(146, 'Dưa leo', 37.70, 36),
(146, 'Lê', 18.20, 29),
(147, 'Dưa lê', 24.70, 35),
(147, 'Kiwi', 23.40, 83),
(147, 'Nhãn', 27.30, 98),
(147, 'Xoài', 39.00, 33),
(148, 'Dừa sáp', 29.90, 13),
(149, 'Dưa hấu', 32.50, 34),
(149, 'Mận', 20.80, 29),
(150, 'Bưởi', 14.95, 33),
(150, 'Chanh', 13.00, 71),
(150, 'Dừa sáp', 29.90, 73),
(150, 'Lê', 18.20, 90),
(150, 'Nhãn', 27.30, 62);

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
  `ShipAddress` varchar(100) DEFAULT NULL,
  `ShippedDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`Order_ID`, `Customer_ID`, `OrderDate`, `Status`, `OrderRequired`, `ShipAddress`, `ShippedDate`) VALUES
(1, 32, '2024-09-01', 'Shipped', '2024-09-05', '123 Đường Nguyễn Trãi, Hà Nội', '2024-09-03'),
(2, 12, '2024-09-02', 'Shipped', '2024-09-07', '45 Đường Lê Lợi, Hải Phòng', '2024-09-06'),
(3, 7, '2024-09-03', 'Pending', '2024-09-08', '234 Đường Láng Hạ, Hà Nội', NULL),
(4, 45, '2024-09-03', 'Shipped', '2024-09-10', '56 Đường Điện Biên Phủ, Hà Nội', '2024-09-08'),
(5, 18, '2024-09-04', 'Shipped', '2024-09-12', '78 Đường Tô Hiệu, Hải Dương', '2024-09-10'),
(6, 9, '2024-09-05', 'Shipped', '2024-09-15', '89 Đường Hùng Vương, Bắc Ninh', '2024-09-13'),
(7, 22, '2024-09-06', 'Shipped', '2024-09-16', '100 Đường Hoàng Quốc Việt, Hà Nội', '2024-09-14'),
(8, 5, '2024-09-07', 'Pending', '2024-09-18', '101 Đường Lý Thường Kiệt, Hà Nội', NULL),
(9, 39, '2024-09-08', 'Shipped', '2024-09-19', '200 Đường Quang Trung, Hải Phòng', '2024-09-17'),
(10, 64, '2024-09-09', 'Processing', '2024-09-20', '250 Đường Trần Hưng Đạo, Hà Nội', NULL),
(11, 29, '2024-09-10', 'Shipped', '2024-09-22', '120 Đường Phạm Văn Đồng, Hải Dương', '2024-09-20'),
(12, 11, '2024-09-11', 'Cancelled', '2024-09-23', '90 Đường Hoàng Diệu, Hà Nội', NULL),
(13, 55, '2024-09-12', 'Shipped', '2024-09-24', '135 Đường Nguyễn Văn Cừ, Hải Phòng', '2024-09-22'),
(14, 67, '2024-09-13', 'Shipped', '2024-09-26', '140 Đường Trường Chinh, Bắc Ninh', '2024-09-24'),
(15, 3, '2024-09-14', 'Pending', '2024-09-27', '45 Đường Thanh Xuân, Hà Nội', NULL),
(16, 40, '2024-09-15', 'Shipped', '2024-09-28', '76 Đường Lê Hồng Phong, Hà Nội', '2024-09-26'),
(17, 61, '2024-09-16', 'Shipped', '2024-09-29', '90 Đường Bạch Mai, Hà Nội', '2024-09-27'),
(18, 6, '2024-09-17', 'Processing', '2024-09-30', '56 Đường Nguyễn Văn Huyên, Hà Nội', NULL),
(19, 33, '2024-09-18', 'Cancelled', '2024-10-01', '123 Đường Đại La, Hà Nội', NULL),
(20, 13, '2024-09-19', 'Shipped', '2024-10-02', '45 Đường Võ Chí Công, Hà Nội', '2024-09-30'),
(21, 30, '2024-09-20', 'Shipped', '2024-10-03', '88 Đường Định Công, Hà Nội', '2024-10-01'),
(22, 71, '2024-09-21', 'Cancelled', '2024-10-04', '123 Đường Cổ Nhuế, Hà Nội', NULL),
(23, 50, '2024-09-22', 'Pending', '2024-10-05', '95 Đường Cầu Giấy, Hà Nội', NULL),
(24, 62, '2024-09-23', 'Shipped', '2024-10-06', '190 Đường Tôn Đức Thắng, Hải Phòng', '2024-10-04'),
(25, 43, '2024-09-24', 'Processing', '2024-10-07', '111 Đường Nguyễn Chí Thanh, Hà Nội', NULL),
(26, 80, '2024-09-25', 'Shipped', '2024-10-08', '300 Đường Cầu Giấy, Hà Nội', '2024-10-06'),
(27, 15, '2024-09-26', 'Cancelled', '2024-10-09', '89 Đường Tây Hồ, Hà Nội', NULL),
(28, 58, '2024-09-27', 'Shipped', '2024-10-10', '45 Đường Kim Mã, Hà Nội', '2024-10-08'),
(29, 70, '2024-09-28', 'Pending', '2024-10-11', '132 Đường Hoàng Cầu, Hà Nội', NULL),
(30, 37, '2024-09-29', 'Shipped', '2024-10-12', '165 Đường Nguyễn Khánh Toàn, Hà Nội', '2024-10-10'),
(31, 24, '2024-09-30', 'Shipped', '2024-10-13', '22 Đường Hoàng Hoa Thám, Hà Nội', '2024-10-11'),
(32, 17, '2024-10-01', 'Shipped', '2024-10-14', '67 Đường Văn Cao, Hải Phòng', '2024-10-12'),
(33, 52, '2024-10-02', 'Shipped', '2024-10-15', '12 Đường Xuân Thủy, Hà Nội', '2024-10-13'),
(34, 36, '2024-10-03', 'Pending', '2024-10-16', '200 Đường Giải Phóng, Hà Nội', NULL),
(35, 49, '2024-10-04', 'Shipped', '2024-10-17', '98 Đường Lạc Long Quân, Hà Nội', '2024-10-15'),
(36, 10, '2024-10-05', 'Cancelled', '2024-10-18', '45 Đường Đống Đa, Hải Phòng', NULL),
(37, 6, '2024-10-06', 'Shipped', '2024-10-19', '150 Đường Phạm Ngũ Lão, Bắc Ninh', '2024-10-17'),
(38, 64, '2024-10-07', 'Shipped', '2024-10-20', '33 Đường Lê Thánh Tông, Hà Nội', '2024-10-18'),
(39, 78, '2024-10-08', 'Shipped', '2024-10-21', '79 Đường Trần Nhật Duật, Hà Nội', '2024-10-19'),
(40, 23, '2024-10-09', 'Shipped', '2024-10-22', '112 Đường Kim Liên, Hà Nội', '2024-10-20'),
(41, 48, '2024-10-10', 'Pending', '2024-10-23', '125 Đường Hoàn Kiếm, Hà Nội', NULL),
(42, 19, '2024-10-11', 'Shipped', '2024-10-24', '56 Đường Nguyễn Thái Học, Hải Dương', '2024-10-22'),
(43, 42, '2024-10-12', 'Shipped', '2024-10-25', '33 Đường Đại La, Hà Nội', '2024-10-23'),
(44, 58, '2024-10-13', 'Shipped', '2024-10-26', '145 Đường Hàng Bạc, Hà Nội', '2024-10-24'),
(45, 13, '2024-10-14', 'Pending', '2024-10-27', '90 Đường Bạch Mai, Hải Phòng', NULL),
(46, 51, '2024-10-15', 'Shipped', '2024-10-28', '234 Đường Nguyễn Văn Cừ, Hà Nội', '2024-10-26'),
(47, 31, '2024-10-16', 'Processing', '2024-10-29', '111 Đường Bưởi, Hà Nội', NULL),
(48, 70, '2024-10-17', 'Shipped', '2024-10-30', '87 Đường Thanh Niên, Hà Nội', '2024-10-28'),
(49, 33, '2024-10-18', 'Cancelled', '2024-10-31', '67 Đường Tây Sơn, Bắc Ninh', NULL),
(50, 21, '2024-10-19', 'Shipped', '2024-11-01', '90 Đường Cổ Linh, Hà Nội', '2024-10-30'),
(51, 76, '2024-10-20', 'Shipped', '2024-11-02', '123 Đường Đinh Tiên Hoàng, Hà Nội', '2024-11-01'),
(52, 44, '2024-10-21', 'Shipped', '2024-11-03', '34 Đường Lê Lợi, Hải Phòng', '2024-11-01'),
(53, 12, '2024-10-22', 'Pending', '2024-11-04', '200 Đường Nguyễn Văn Huyên, Hà Nội', NULL),
(54, 8, '2024-10-23', 'Shipped', '2024-11-05', '78 Đường Ngô Quyền, Hà Nội', '2024-11-03'),
(55, 41, '2024-10-24', 'Cancelled', '2024-11-06', '189 Đường Vạn Phúc, Hà Nội', NULL),
(56, 67, '2024-10-25', 'Shipped', '2024-11-07', '99 Đường Trần Quang Khải, Hà Nội', '2024-11-05'),
(57, 25, '2024-10-26', 'Processing', '2024-11-08', '11 Đường Phan Đình Phùng, Hà Nội', NULL),
(58, 53, '2024-10-27', 'Shipped', '2024-11-09', '44 Đường Nguyễn Du, Hải Phòng', '2024-11-07'),
(59, 74, '2024-10-28', 'Shipped', '2024-11-10', '67 Đường Tràng Tiền, Hà Nội', '2024-11-08'),
(60, 9, '2024-10-29', 'Shipped', '2024-11-11', '101 Đường Thái Hà, Hà Nội', '2024-11-09'),
(61, 35, '2024-10-30', 'Shipped', '2024-11-12', '56 Đường Trần Nhân Tông, Hà Nội', '2024-11-10'),
(62, 79, '2024-10-31', 'Shipped', '2024-11-13', '78 Đường Nguyễn Trãi, Hải Phòng', '2024-11-11'),
(63, 47, '2024-11-01', 'Shipped', '2024-11-14', '12 Đường Trần Hưng Đạo, Hà Nội', '2024-11-12'),
(64, 38, '2024-11-02', 'Shipped', '2024-11-15', '34 Đường Nguyễn Thị Minh Khai, Hà Nội', '2024-11-13'),
(65, 14, '2024-11-03', 'Processing', '2024-11-16', '80 Đường Nguyễn Công Trứ, Bắc Ninh', NULL),
(66, 1, '2024-11-04', 'Cancelled', '2024-11-17', '90 Đường Hàng Bài, Hà Nội', NULL),
(67, 2, '2024-11-05', 'Shipped', '2024-11-18', '25 Đường Cát Linh, Hà Nội', '2024-11-16'),
(68, 63, '2024-11-06', 'Shipped', '2024-11-19', '12 Đường Đê La Thành, Hà Nội', '2024-11-17'),
(69, 65, '2024-11-07', 'Processing', '2024-11-20', '90 Đường Hàng Bông, Hà Nội', NULL),
(70, 20, '2024-11-08', 'Cancelled', '2024-11-21', '45 Đường Nguyễn Khuyến, Hải Dương', NULL),
(71, 57, '2024-11-09', 'Shipped', '2024-11-22', '123 Đường Nguyễn Đình Chiểu, Hà Nội', '2024-11-20'),
(72, 68, '2024-11-10', 'Shipped', '2024-11-23', '88 Đường Lê Duẩn, Hà Nội', '2024-11-21'),
(73, 10, '2024-11-11', 'Shipped', '2024-11-24', '101 Đường Phố Huế, Hà Nội', '2024-11-22'),
(74, 55, '2024-11-12', 'Shipped', '2024-11-25', '234 Đường Trần Thái Tông, Hà Nội', '2024-11-23'),
(75, 72, '2024-11-13', 'Processing', '2024-11-26', '87 Đường Lê Văn Lương, Hà Nội', NULL),
(76, 75, '2024-11-14', 'Cancelled', '2024-11-27', '156 Đường Ngọc Khánh, Hà Nội', NULL),
(77, 46, '2024-11-15', 'Shipped', '2024-11-28', '45 Đường Đỗ Xuân Hợp, Hải Phòng', '2024-11-26'),
(78, 8, '2024-11-16', 'Shipped', '2024-11-29', '132 Đường Chùa Bộc, Hà Nội', '2024-11-27'),
(79, 11, '2024-11-17', 'Cancelled', '2024-11-30', '45 Đường Nguyên Hồng, Hà Nội', NULL),
(80, 15, '2024-11-18', 'Shipped', '2024-12-01', '200 Đường Phan Đình Phùng, Hà Nội', '2024-11-29'),
(81, 26, '2024-11-19', 'Shipped', '2024-12-02', '56 Đường Lê Hồng Phong, Hải Dương', '2024-11-30'),
(82, 23, '2024-11-20', 'Cancelled', '2024-12-03', '95 Đường Bến Thành, Hà Nội', NULL),
(83, 29, '2024-11-21', 'Shipped', '2024-12-04', '100 Đường Phố Tôn Đức Thắng, Hải Phòng', '2024-12-02'),
(84, 60, '2024-11-22', 'Pending', '2024-12-05', '123 Đường Bạch Đằng, Hà Nội', NULL),
(85, 65, '2024-11-23', 'Processing', '2024-12-06', '56 Đường Kim Liên, Hà Nội', NULL),
(86, 4, '2024-11-24', 'Cancelled', '2024-12-07', '78 Đường Đinh Tiên Hoàng, Hải Dương', NULL),
(87, 19, '2024-11-25', 'Shipped', '2024-12-08', '25 Đường Lê Văn Thiêm, Hà Nội', '2024-12-06'),
(88, 45, '2024-11-26', 'Pending', '2024-12-09', '99 Đường Trường Chinh, Bắc Ninh', NULL),
(89, 6, '2024-11-27', 'Shipped', '2024-12-10', '22 Đường Cầu Giấy, Hà Nội', '2024-12-08'),
(90, 73, '2024-11-28', 'Shipped', '2024-12-11', '180 Đường Phạm Văn Đồng, Hà Nội', '2024-12-09'),
(91, 25, '2024-11-29', 'Shipped', '2024-12-12', '34 Đường Phố Huế, Hà Nội', '2024-12-10'),
(92, 37, '2024-11-30', 'Shipped', '2024-12-13', '67 Đường Đê La Thành, Hà Nội', '2024-12-11'),
(93, 8, '2024-12-01', 'Shipped', '2024-12-14', '23 Đường Lê Thanh Nghị, Hải Dương', '2024-12-12'),
(94, 44, '2024-12-02', 'Shipped', '2024-12-15', '90 Đường Nguyễn Văn Cừ, Hà Nội', '2024-12-13'),
(95, 64, '2024-12-03', 'Processing', '2024-12-16', '45 Đường Tây Sơn, Hà Nội', NULL),
(96, 34, '2024-12-04', 'Shipped', '2024-12-17', '78 Đường Tôn Đức Thắng, Bắc Ninh', '2024-12-15'),
(97, 41, '2024-12-05', 'Shipped', '2024-12-18', '12 Đường Thanh Niên, Hà Nội', '2024-12-16'),
(98, 53, '2024-12-06', 'Shipped', '2024-12-19', '34 Đường Đinh Tiên Hoàng, Hải Phòng', '2024-12-17'),
(99, 59, '2024-12-07', 'Processing', '2024-12-20', '90 Đường Hàng Bông, Hà Nội', NULL),
(100, 66, '2024-12-08', 'Shipped', '2024-12-21', '101 Đường Bà Triệu, Hà Nội', '2024-12-19'),
(101, 27, '2024-12-09', 'Shipped', '2024-12-22', '78 Đường Kim Mã, Hà Nội', '2024-12-20'),
(102, 70, '2024-12-10', 'Pending', '2024-12-23', '56 Đường Lê Duẩn, Hải Phòng', NULL),
(103, 22, '2024-12-11', 'Cancelled', '2024-12-24', '12 Đường Trường Chinh, Bắc Ninh', NULL),
(104, 13, '2024-12-12', 'Shipped', '2024-12-25', '45 Đường Lê Văn Sỹ, Hà Nội', '2024-12-23'),
(105, 20, '2024-12-13', 'Shipped', '2024-12-26', '200 Đường Tôn Thất Tùng, Hà Nội', '2024-12-24'),
(106, 35, '2024-12-14', 'Cancelled', '2024-12-27', '134 Đường Thái Hà, Hà Nội', NULL),
(107, 15, '2024-12-15', 'Shipped', '2024-12-28', '25 Đường Vũ Trọng Phụng, Hải Phòng', '2024-12-26'),
(108, 4, '2024-12-16', 'Pending', '2024-12-29', '78 Đường Cát Linh, Hà Nội', NULL),
(109, 6, '2024-12-17', 'Shipped', '2024-12-30', '22 Đường Nguyễn Thái Học, Bắc Ninh', '2024-12-28'),
(110, 31, '2024-12-18', 'Shipped', '2024-12-31', '99 Đường Bạch Mai, Hà Nội', '2024-12-29'),
(111, 78, '2024-12-19', 'Processing', '2025-01-01', '150 Đường Nguyễn Khuyến, Hải Phòng', NULL),
(112, 5, '2024-12-20', 'Cancelled', '2025-01-02', '45 Đường Hoàng Hoa Thám, Hà Nội', NULL),
(113, 3, '2024-12-21', 'Shipped', '2025-01-03', '34 Đường Hoàn Kiếm, Hà Nội', '2025-01-01'),
(114, 66, '2024-12-22', 'Shipped', '2025-01-04', '123 Đường Vạn Phúc, Bắc Ninh', '2025-01-02'),
(115, 74, '2024-12-23', 'Cancelled', '2025-01-05', '98 Đường Nguyễn Trãi, Hải Dương', NULL),
(116, 8, '2024-12-24', 'Shipped', '2025-01-06', '90 Đường Nguyễn Văn Huyên, Hà Nội', '2025-01-04'),
(117, 71, '2024-12-25', 'Processing', '2025-01-07', '145 Đường Hàng Bạc, Hải Phòng', NULL),
(118, 9, '2024-12-26', 'Shipped', '2025-01-08', '101 Đường Trần Quang Khải, Hà Nội', '2025-01-06'),
(119, 42, '2024-12-27', 'Shipped', '2025-01-09', '87 Đường Cổ Linh, Hà Nội', '2025-01-07'),
(120, 18, '2024-12-28', 'Pending', '2025-01-10', '99 Đường Bến Thành, Hải Dương', NULL),
(121, 69, '2024-12-29', 'Shipped', '2025-01-11', '34 Đường Phan Đình Phùng, Hà Nội', '2025-01-09'),
(122, 39, '2024-12-30', 'Cancelled', '2025-01-12', '12 Đường Ngô Quyền, Hải Phòng', NULL),
(123, 30, '2025-01-01', 'Shipped', '2025-01-13', '56 Đường Lê Thánh Tông, Hà Nội', '2025-01-11'),
(124, 12, '2025-01-02', 'Shipped', '2025-01-14', '78 Đường Thanh Niên, Bắc Ninh', '2025-01-12'),
(125, 50, '2025-01-03', 'Shipped', '2025-01-15', '123 Đường Tô Hiến Thành, Hải Dương', '2025-01-13'),
(126, 61, '2025-01-04', 'Cancelled', '2025-01-16', '90 Đường Phố Huế, Hà Nội', NULL),
(127, 76, '2025-01-05', 'Shipped', '2025-01-17', '45 Đường Giải Phóng, Hải Phòng', '2025-01-15'),
(128, 10, '2025-01-06', 'Pending', '2025-01-18', '22 Đường Hàng Da, Hà Nội', NULL),
(129, 79, '2025-01-07', 'Processing', '2025-01-19', '34 Đường Bà Triệu, Hà Nội', NULL),
(130, 33, '2025-01-08', 'Shipped', '2025-01-20', '56 Đường Trần Đăng Ninh, Hải Dương', '2025-01-18'),
(131, 48, '2025-01-09', 'Shipped', '2025-01-21', '90 Đường Nguyễn Khánh Toàn, Hà Nội', '2025-01-19'),
(132, 55, '2025-01-10', 'Pending', '2025-01-22', '12 Đường Nguyễn Thái Học, Bắc Ninh', NULL),
(133, 14, '2025-01-11', 'Processing', '2025-01-23', '34 Đường Xuân Thủy, Hà Nội', NULL),
(134, 60, '2025-01-12', 'Cancelled', '2025-01-24', '78 Đường Lê Lợi, Hải Phòng', NULL),
(135, 27, '2025-01-13', 'Shipped', '2025-01-25', '56 Đường Trường Chinh, Hà Nội', '2025-01-23'),
(136, 77, '2025-01-14', 'Pending', '2025-01-26', '90 Đường Kim Mã, Hải Dương', NULL),
(137, 25, '2025-01-15', 'Shipped', '2025-01-27', '12 Đường Vũ Trọng Phụng, Hà Nội', '2025-01-25'),
(138, 16, '2025-01-16', 'Cancelled', '2025-01-28', '34 Đường Ngọc Lâm, Hải Phòng', NULL),
(139, 49, '2025-01-17', 'Shipped', '2025-01-29', '78 Đường Hoàng Cầu, Bắc Ninh', '2025-01-27'),
(140, 23, '2025-01-18', 'Shipped', '2025-01-30', '90 Đường Bạch Đằng, Hà Nội', '2025-01-28'),
(141, 80, '2025-01-19', 'Processing', '2025-01-31', '12 Đường Đội Cấn, Hải Dương', NULL),
(142, 19, '2025-01-20', 'Cancelled', '2025-02-01', '34 Đường Phú Thượng, Hà Nội', NULL),
(143, 72, '2025-01-21', 'Shipped', '2025-02-02', '90 Đường Thái Thịnh, Hải Phòng', '2025-01-31'),
(144, 45, '2025-01-22', 'Pending', '2025-02-03', '123 Đường Văn Cao, Bắc Ninh', NULL),
(145, 15, '2025-01-23', 'Processing', '2025-02-04', '67 Đường Hàng Bông, Hà Nội', NULL),
(146, 24, '2025-01-24', 'Cancelled', '2025-02-05', '99 Đường Nguyễn Hữu Huân, Hải Dương', NULL),
(147, 70, '2025-01-25', 'Shipped', '2025-02-06', '45 Đường Lê Hồng Phong, Hà Nội', '2025-02-04'),
(148, 43, '2025-01-26', 'Shipped', '2025-02-07', '90 Đường Đinh Tiên Hoàng, Bắc Ninh', '2025-02-05'),
(149, 67, '2025-01-27', 'Processing', '2025-02-08', '123 Đường Phan Chu Trinh, Hải Phòng', NULL),
(150, 20, '2025-01-28', 'Cancelled', '2025-02-09', '56 Đường Trần Quý Cáp, Hà Nội', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `Product_ID` int(11) NOT NULL,
  `Product_Code` char(10) NOT NULL,
  `Supplier_ID` int(11) DEFAULT NULL,
  `BuyPrice` decimal(10,2) DEFAULT NULL,
  `ProductRating` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`Product_ID`, `Product_Code`, `Supplier_ID`, `BuyPrice`, `ProductRating`) VALUES
(1, 'Táo', 2, 10.00, 9),
(2, 'Chuối', 3, 15.00, 10),
(3, 'Cam', 4, 12.50, 9),
(4, 'Nho', 2, 11.00, 9),
(5, 'Dưa hấu', 5, 25.00, 10),
(6, 'Kiwi', 3, 18.00, 10),
(7, 'Dứa', 5, 22.00, 9),
(8, 'Lê', 2, 14.00, 9),
(9, 'Mận', 1, 16.00, 10),
(10, 'Bưởi', 4, 11.50, 9),
(11, 'Xoài', 1, 30.00, 10),
(12, 'Chanh', 2, 10.00, 9),
(13, 'Dưa lê', 5, 19.00, 9),
(14, 'Lựu', 4, 17.50, 10),
(15, 'Nhãn', 3, 21.00, 9),
(16, 'Ổi', 1, 20.00, 9),
(17, 'Dưa leo', 5, 29.00, 10),
(18, 'Bơ', 3, 24.00, 9),
(19, 'Quýt', 1, 26.00, 10),
(20, 'Dừa sáp', 4, 23.00, 10);

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
-- Chỉ mục cho bảng `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`Feedback_ID`),
  ADD KEY `Customer_ID` (`Customer_ID`),
  ADD KEY `Order_ID` (`Order_ID`);

--
-- Chỉ mục cho bảng `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`Order_ID`,`Product_Code`),
  ADD KEY `Product_Code` (`Product_Code`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`Order_ID`),
  ADD KEY `Customer_ID` (`Customer_ID`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`Product_ID`),
  ADD UNIQUE KEY `Product_Code` (`Product_Code`),
  ADD KEY `Supplier_ID` (`Supplier_ID`);

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
  MODIFY `Employee_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

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
-- Các ràng buộc cho bảng `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`),
  ADD CONSTRAINT `feedback_ibfk_2` FOREIGN KEY (`Order_ID`) REFERENCES `orders` (`Order_ID`);

--
-- Các ràng buộc cho bảng `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`Order_ID`) REFERENCES `orders` (`Order_ID`),
  ADD CONSTRAINT `orderdetails_ibfk_2` FOREIGN KEY (`Product_Code`) REFERENCES `product` (`Product_Code`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`);

--
-- Các ràng buộc cho bảng `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`Supplier_ID`) REFERENCES `supplier` (`Supplier_ID`);

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
