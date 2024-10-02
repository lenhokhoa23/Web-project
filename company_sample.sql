-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3307
-- Thời gian đã tạo: Th10 02, 2024 lúc 06:46 AM
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
(50, 'Phạm Văn Kiên', 30, '2019-03-02', 3);

--
-- Chỉ mục cho các bảng đã đổ
--

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
  MODIFY `Employee_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`ReportTo`) REFERENCES `employee` (`Employee_ID`),
  ADD CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`Department_ID`) REFERENCES `department` (`Department_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
