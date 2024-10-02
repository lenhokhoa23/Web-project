-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3307
-- Thời gian đã tạo: Th10 02, 2024 lúc 04:20 PM
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
(1, 'Phòng Nhân sự', 15),
(2, 'Phòng Tài chính', 40),
(3, 'Phòng IT', 22),
(4, 'Phòng Kinh doanh', 9),
(5, 'Phòng Marketing', 30);

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
-- Chỉ mục cho bảng `employeehealth`
--
ALTER TABLE `employeehealth`
  ADD PRIMARY KEY (`Employee_ID`);

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
-- AUTO_INCREMENT cho bảng `training`
--
ALTER TABLE `training`
  MODIFY `Training_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`ReportTo`) REFERENCES `employee` (`Employee_ID`),
  ADD CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`Department_ID`) REFERENCES `department` (`Department_ID`);

--
-- Các ràng buộc cho bảng `employeehealth`
--
ALTER TABLE `employeehealth`
  ADD CONSTRAINT `employeehealth_ibfk_1` FOREIGN KEY (`Employee_ID`) REFERENCES `employee` (`Employee_ID`);

--
-- Các ràng buộc cho bảng `training`
--
ALTER TABLE `training`
  ADD CONSTRAINT `training_ibfk_1` FOREIGN KEY (`Employee_ID`) REFERENCES `employee` (`Employee_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
