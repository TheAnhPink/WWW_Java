-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               11.4.8-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.11.0.7065
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for bookstoredb
CREATE DATABASE IF NOT EXISTS `bookstoredb` /*!40100 DEFAULT CHARACTER SET utf16 COLLATE utf16_uca1400_vietnamese_ai_ci */;
USE `bookstoredb`;

-- Dumping structure for table bookstoredb.books
CREATE TABLE IF NOT EXISTS `books` (
                                       `id` int(11) NOT NULL AUTO_INCREMENT,
                                       `tittle` varchar(50) DEFAULT NULL,
                                       `author` varchar(50) DEFAULT NULL,
                                       `imgbook` varchar(50) DEFAULT NULL,
                                       `price` double DEFAULT NULL,
                                       `quantity` int(11) DEFAULT 0,
                                       PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf16 COLLATE=utf16_uca1400_vietnamese_ai_ci;

-- Dumping data for table bookstoredb.books: ~20 rows (approximately)
DELETE FROM `books`;
INSERT INTO `books`
(`id`, `tittle`, `author`, `imgbook`, `price`, `quantity`) VALUES
                                                               (1, 'Nhà Giả Kim', 'Paulo Coelho', 'nhagiakim.jpg', 89000, 20),
                                                               (2, 'Đắc Nhân Tâm', 'Dale Carnegie', 'dacnhantam.jpg', 79000, 15),
                                                               (3, 'Tuổi Trẻ Đáng Giá Bao Nhiêu', 'Rosie Nguyễn', 'tuoitredanggiabaonhieu.jpg', 85000, 18),
                                                               (4, 'Hạt Giống Tâm Hồn', 'Jack Canfield', 'hatgiongtamhon.jpg', 75000, 12),
                                                               (5, 'Mắt Biếc', 'Nguyễn Nhật Ánh', 'matbiec.jpg', 95000, 25),
                                                               (6, 'Cho Tôi Xin Một Vé Đi Tuổi Thơ', 'Nguyễn Nhật Ánh', 'chotoixinmotvedituoitho.jpg', 80000, 20),
                                                               (7, 'Người Xa Lạ', 'Albert Camus', 'nguoixala.jpg', 70000, 10),
                                                               (8, 'Tôi Thấy Hoa Vàng Trên Cỏ Xanh', 'Nguyễn Nhật Ánh', 'toithayhoavangtrencoxanh.jpg', 110000, 15),
                                                               (9, 'Sapiens: Lược Sử Loài Người', 'Yuval Noah Harari', 'Sapiensluocsuloainguoi.png', 180000, 8),
                                                               (10, 'Đường Xưa Mây Trắng', 'Thích Nhất Hạnh', 'duongxuamaytrang.jpg', 150000, 10),
                                                               (11, 'Cây Cam Ngọt Của Tôi', 'J. M. Vasconcelos', 'caycamngotcuatoi.jpg', 95000, 18),
                                                               (12, 'Nhà Lãnh Đạo Không Chức Danh', 'Robin Sharma', 'nhalanhdao.jpg', 120000, 14),
                                                               (13, 'Tư Duy Nhanh Và Chậm', 'Daniel Kahneman', 'tuduynhanhcham.jpg', 160000, 7),
                                                               (14, 'Hiểu Về Trái Tim', 'Thích Nhất Hạnh', 'hieuvetraitim.jpg', 130000, 16),
                                                               (15, 'Bắt Trẻ Đồng Xanh', 'J. D. Salinger', 'battredongxanh.jpg', 85000, 11),
                                                               (16, 'Giết Con Chim Nháy', 'Harper Lee', 'gietconchimnhay.jpg', 90000, 13),
                                                               (17, 'Chiến Binh Cầu Vồng', 'Andrea Hirata', 'chienbinhcauvong.jpg', 100000, 9),
                                                               (18, 'Không Gia Đình', 'Hector Malot', 'khonggiadinh.jpg', 95000, 17),
                                                               (19, 'Hoàng Tử Bé', 'Antoine de Saint-Exupéry', 'hoangtube.jpg', 75000, 22),
                                                               (20, 'Sherlock Holmes', 'Arthur Conan Doyle', 'sherlockholmes.jpg', 120000, 10);
/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
