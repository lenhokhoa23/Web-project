-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Oct 02, 2024 at 04:38 PM
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
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `Customer_ID` int(11) NOT NULL,
  `CustomerName` varchar(50) DEFAULT NULL,
  `CustomerEmail` varchar(50) DEFAULT NULL,
  `Num_Order` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer`
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
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `Department_ID` int(11) NOT NULL,
  `DepartmentName` varchar(20) DEFAULT NULL,
  `Manager_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`Department_ID`, `DepartmentName`, `Manager_ID`) VALUES
(1, 'Human Resources', 15),
(2, 'Finance', 40),
(3, 'IT', 22),
(4, 'Sales', 9),
(5, 'Marketing', 30);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `Employee_ID` int(11) NOT NULL,
  `EmployeeName` varchar(50) DEFAULT NULL,
  `ReportTo` int(11) DEFAULT NULL,
  `StartDate` date NOT NULL,
  `Department_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
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
-- Table structure for table `employeecontact`
--

CREATE TABLE `employeecontact` (
  `Employee_ID` int(11) NOT NULL,
  `PhoneNumber` char(10) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `EmployeeAddress` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employeecontact`
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
-- Table structure for table `employeehealth`
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
-- Dumping data for table `employeehealth`
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
-- Table structure for table `training`
--

CREATE TABLE `training` (
  `Training_ID` int(11) NOT NULL,
  `TrainingName` varchar(50) DEFAULT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date NOT NULL,
  `Employee_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Customer_ID`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`Department_ID`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`Employee_ID`),
  ADD KEY `ReportTo` (`ReportTo`),
  ADD KEY `Department_ID` (`Department_ID`);

--
-- Indexes for table `employeecontact`
--
ALTER TABLE `employeecontact`
  ADD PRIMARY KEY (`Employee_ID`);

--
-- Indexes for table `employeehealth`
--
ALTER TABLE `employeehealth`
  ADD PRIMARY KEY (`Employee_ID`);

--
-- Indexes for table `training`
--
ALTER TABLE `training`
  ADD PRIMARY KEY (`Training_ID`),
  ADD KEY `Employee_ID` (`Employee_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `Department_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `Employee_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `training`
--
ALTER TABLE `training`
  MODIFY `Training_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`ReportTo`) REFERENCES `employee` (`Employee_ID`),
  ADD CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`Department_ID`) REFERENCES `department` (`Department_ID`);

--
-- Constraints for table `employeecontact`
--
ALTER TABLE `employeecontact`
  ADD CONSTRAINT `employeecontact_ibfk_1` FOREIGN KEY (`Employee_ID`) REFERENCES `employee` (`Employee_ID`);

--
-- Constraints for table `employeehealth`
--
ALTER TABLE `employeehealth`
  ADD CONSTRAINT `employeehealth_ibfk_1` FOREIGN KEY (`Employee_ID`) REFERENCES `employee` (`Employee_ID`);

--
-- Constraints for table `training`
--
ALTER TABLE `training`
  ADD CONSTRAINT `training_ibfk_1` FOREIGN KEY (`Employee_ID`) REFERENCES `employee` (`Employee_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
