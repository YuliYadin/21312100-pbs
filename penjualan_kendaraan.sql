CREATE DATABASE penjualan_kendaraan;
USE penjualan_kendaraan;

CREATE TABLE `fitur` (
  `fitur_id` INT(11) NOT NULL AUTO_INCREMENT,
  `nama_fitur` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`fitur_id`)
) ENGINE=INNODB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `kendaraan` (
  `kendaraan_id` INT(11) NOT NULL AUTO_INCREMENT,
  `nama_model` VARCHAR(255) NOT NULL,
  `merek` VARCHAR(255) NOT NULL,
  `tipe` ENUM('Motor','Mobil') DEFAULT NULL,
  `tahun` INT(11) DEFAULT NULL,
  `jarak_tempuh` INT(11) DEFAULT NULL,
  `warna` VARCHAR(50) DEFAULT NULL,
  `harga` DECIMAL(10,2) NOT NULL,
  `stok` INT(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`kendaraan_id`)
) ENGINE=INNODB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `kendaraanfitur` (
  `kendaraan_id` INT(11) NOT NULL,
  `fitur_id` INT(11) NOT NULL,
  PRIMARY KEY (`kendaraan_id`,`fitur_id`),
  KEY `fitur_id` (`fitur_id`),
  CONSTRAINT `kendaraanfitur_ibfk_1` FOREIGN KEY (`kendaraan_id`) REFERENCES `kendaraan` (`kendaraan_id`),
  CONSTRAINT `kendaraanfitur_ibfk_2` FOREIGN KEY (`fitur_id`) REFERENCES `fitur` (`fitur_id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `pemesanan` (
  `pemesanan_id` INT(11) NOT NULL AUTO_INCREMENT,
  `kendaraan_id` INT(11) DEFAULT NULL,
  `tanggal_pemesanan` DATE DEFAULT NULL,
  `jumlah_pesanan` INT(11) DEFAULT NULL,
  `total_harga` DECIMAL(10,2) DEFAULT NULL,
  `status` ENUM('Belum Diproses','Sedang Diproses','Selesai','Dibatalkan') DEFAULT NULL,
  PRIMARY KEY (`pemesanan_id`),
  KEY `kendaraan_id` (`kendaraan_id`),
  CONSTRAINT `pemesanan_ibfk_1` FOREIGN KEY (`kendaraan_id`) REFERENCES `kendaraan` (`kendaraan_id`)
) ENGINE=INNODB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `fitur` (`fitur_id`, `nama_fitur`) VALUES
(1, 'ABS'),
(2, 'Traction Control'),
(3, 'AC'),
(4, 'Power Steering'),
(5, 'Fuel Injection');


INSERT INTO `kendaraan` (`kendaraan_id`, `nama_model`, `merek`, `tipe`, `tahun`, `jarak_tempuh`, `warna`, `harga`, `stok`) VALUES
(1, 'Ninja ZX-25R', 'Kawasaki', 'Motor', 2023, 1500, 'Hitam', 150000000, 5),
(2, 'Xenia', 'Daihatsu', 'Mobil', 2022, 3000, 'Putih', 200000000, 10),
(3, 'CRF250R', 'Honda', 'Motor', 2023, 1200, 'Merah', 100000000, 3);

INSERT INTO `kendaraanfitur` (`kendaraan_id`, `fitur_id`) VALUES
(1, 1), -- Ninja ZX-25R memiliki fitur ABS
(1, 2), -- Ninja ZX-25R memiliki fitur Traction Control
(2, 3), -- Xenia memiliki fitur AC
(2, 4), -- Xenia memiliki fitur Power Steering
(3, 1), -- CRF250R memiliki fitur ABS
(3, 5); -- CRF250R memiliki fitur Fuel Injection


INSERT INTO `pemesanan` (`pemesanan_id`, `kendaraan_id`, `tanggal_pemesanan`, `jumlah_pesanan`, `total_harga`, `status`) VALUES
(1, 1, '2024-05-01', 1, 150, 'Sedang Diproses'), -- Pemesanan Ninja ZX-25R sedang diproses
(2, 2, '2024-04-28', 2, 400, 'Selesai'), -- Pemesanan 2 unit Xenia selesai
(3, 3, '2024-05-03', 1, 100, 'Belum Diproses'); -- Pemesanan CRF250R belum diproses





