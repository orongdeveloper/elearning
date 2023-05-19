-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 19, 2023 at 03:07 PM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.1.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_gudang`
--
CREATE DATABASE IF NOT EXISTS `db_gudang` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `db_gudang`;

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id` int(11) NOT NULL,
  `kode_barang` varchar(255) NOT NULL,
  `nama_barang` varchar(255) NOT NULL,
  `type_barang` varchar(255) NOT NULL,
  `ukuran_barang` varchar(255) NOT NULL,
  `qty_barang` varchar(255) NOT NULL,
  `id_lokasi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sektor`
--

CREATE TABLE `sektor` (
  `id` int(11) NOT NULL,
  `sektor` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sektor`
--

INSERT INTO `sektor` (`id`, `sektor`) VALUES
(1, 'A');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_lokasi` (`id_lokasi`);

--
-- Indexes for table `sektor`
--
ALTER TABLE `sektor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sektor`
--
ALTER TABLE `sektor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `barang_ibfk_1` FOREIGN KEY (`id_lokasi`) REFERENCES `sektor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Database: `elearning`
--
CREATE DATABASE IF NOT EXISTS `elearning` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `elearning`;

-- --------------------------------------------------------

--
-- Table structure for table `el_absen`
--

CREATE TABLE `el_absen` (
  `id` int(11) NOT NULL,
  `kelas_id` int(11) DEFAULT NULL,
  `mapel_id` int(11) DEFAULT NULL,
  `pengajar_id` int(11) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `jam_mulai` time DEFAULT NULL,
  `jam_selesai` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `el_absen`
--

INSERT INTO `el_absen` (`id`, `kelas_id`, `mapel_id`, `pengajar_id`, `tanggal`, `jam_mulai`, `jam_selesai`) VALUES
(3, 2, 2, 2, '2020-05-04', '11:00:00', '13:00:00'),
(4, 7, 2, 2, '2020-05-02', '12:15:00', '02:16:00');

-- --------------------------------------------------------

--
-- Table structure for table `el_absen_siswa`
--

CREATE TABLE `el_absen_siswa` (
  `id` int(11) NOT NULL,
  `absen_id` int(11) DEFAULT NULL,
  `siswa_id` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL COMMENT '0 = alpha, 1 = masuk, 2 = izin,3 = sakit'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `el_absen_siswa`
--

INSERT INTO `el_absen_siswa` (`id`, `absen_id`, `siswa_id`, `status`) VALUES
(1, 3, 11, 1),
(2, 4, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `el_field_tambahan`
--

CREATE TABLE `el_field_tambahan` (
  `id` varchar(255) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `value` longtext DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `el_field_tambahan`
--

INSERT INTO `el_field_tambahan` (`id`, `nama`, `value`) VALUES
('check-urgent-info', 'Check Urgent Info', '{\"info\":\"\",\"last_check\":\"2020-04-30 00:45:10\"}'),
('history-mengerjakan-3-2', 'History pengerjaan tugas', '{\"mulai\":\"2019-12-20 13:33:38\",\"selesai\":\"2019-12-20 14:03:38\",\"uri_string\":\"tugas\\/kerjakan\\/2\",\"valid_route\":[\"\\/tugas\\/kerjakan\",\"\\/tugas\\/finish\",\"\\/tugas\\/submit_essay\",\"\\/tugas\\/submit_upload\"],\"tugas\":{\"id\":\"2\",\"mapel_id\":\"6\",\"pengajar_id\":\"2\",\"type_id\":\"3\",\"judul\":\"SISTEM GERAK PADA MANUSIA\",\"durasi\":\"30\",\"info\":\"<p>KERJAKAN SOAL DENGAN BAIK DAN BENAR<\\/p>\\r\\n\",\"aktif\":\"1\",\"tgl_buat\":\"2019-12-20 13:30:29\",\"tampil_siswa\":\"1\"},\"unix_id\":\"bfb0f813ef2c997245f7651a0cd45fba701601\",\"ip\":\"::1\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.88 Safari\\/537.36\",\"pertanyaan_id\":[\"2\"],\"jawaban\":{\"2\":\"7\"},\"nilai\":100,\"jml_benar\":1,\"jml_salah\":0,\"tgl_submit\":\"2019-12-20 13:41:15\",\"total_waktu\":\"7 menit 37 detik\"}');

-- --------------------------------------------------------

--
-- Table structure for table `el_jawaban`
--

CREATE TABLE `el_jawaban` (
  `id_jawaban` int(11) NOT NULL,
  `id_ujian` int(11) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `jawaban` text NOT NULL,
  `nilai_pg` int(11) NOT NULL,
  `nilai_essay` int(11) DEFAULT NULL,
  `nilai_total` double DEFAULT NULL,
  `jumlah_soal` int(11) NOT NULL,
  `tgl` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `el_jawaban`
--

INSERT INTO `el_jawaban` (`id_jawaban`, `id_ujian`, `id_siswa`, `jawaban`, `nilai_pg`, `nilai_essay`, `nilai_total`, `jumlah_soal`, `tgl`) VALUES
(2, 1, 2, '1:C,3:aaa', 1, 2, 83.333333333333, 2, '0000-00-00 00:00:00'),
(3, 1, 2, '1:C,3:asdsdasdsa', 3, 3, 100, 2, '0000-00-00 00:00:00'),
(4, 3, 2, '1:C,3:adasd,5:B,6:adasdas', 3, 5, 66.666666666667, 4, '2020-05-02 05:04:00');

-- --------------------------------------------------------

--
-- Table structure for table `el_kelas`
--

CREATE TABLE `el_kelas` (
  `id` int(11) NOT NULL,
  `nama` varchar(45) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `urutan` int(11) NOT NULL,
  `aktif` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=aktif 0=tidak'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `el_kelas`
--

INSERT INTO `el_kelas` (`id`, `nama`, `parent_id`, `urutan`, `aktif`) VALUES
(1, 'KELAS X', NULL, 1, 1),
(2, 'KELAS X - A', 1, 2, 1),
(3, 'KELAS X - B', 1, 3, 1),
(4, 'KELAS X - C', 1, 4, 1),
(5, 'KELAS X - D', 1, 5, 1),
(6, 'KELAS XI', NULL, 6, 1),
(7, 'KELAS XI - IPA 1', 6, 7, 1),
(8, 'KELAS XI - IPA 2', 6, 8, 1),
(9, 'KELAS XI - IPS 1', 6, 9, 1),
(10, 'KELAS XI - IPS 2', 6, 10, 1),
(11, 'KELAS XII', NULL, 11, 1),
(12, 'KELAS XII - IPA 1', 11, 12, 1),
(13, 'KELAS XII - IPA 2', 11, 13, 1),
(14, 'KELAS XII - IPS 1', 11, 14, 1),
(15, 'KELAS XII - IPS 2', 11, 15, 1);

-- --------------------------------------------------------

--
-- Table structure for table `el_kelas_siswa`
--

CREATE TABLE `el_kelas_siswa` (
  `id` int(11) NOT NULL,
  `kelas_id` int(11) NOT NULL,
  `siswa_id` int(11) NOT NULL,
  `aktif` tinyint(1) NOT NULL COMMENT '0 jika bukan, 1 jika ya'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `el_kelas_siswa`
--

INSERT INTO `el_kelas_siswa` (`id`, `kelas_id`, `siswa_id`, `aktif`) VALUES
(1, 3, 1, 0),
(2, 2, 1, 0),
(3, 7, 2, 1),
(4, 7, 3, 0),
(5, 12, 4, 1),
(6, 8, 3, 1),
(7, 2, 11, 1),
(9, 4, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `el_komentar`
--

CREATE TABLE `el_komentar` (
  `id` int(11) NOT NULL,
  `login_id` int(11) NOT NULL,
  `materi_id` int(11) NOT NULL,
  `tampil` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0=tidak,1=tampil',
  `konten` text DEFAULT NULL,
  `tgl_posting` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `el_login`
--

CREATE TABLE `el_login` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(225) NOT NULL,
  `siswa_id` int(11) DEFAULT NULL,
  `pengajar_id` int(11) DEFAULT NULL,
  `is_admin` tinyint(1) NOT NULL COMMENT '0=tidak,1=ya',
  `reset_kode` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `el_login`
--

INSERT INTO `el_login` (`id`, `username`, `password`, `siswa_id`, `pengajar_id`, `is_admin`, `reset_kode`) VALUES
(1, 'dicky@gmail.com', 'ee0b6db238b075d0da86340048fb147a', NULL, 1, 1, NULL),
(2, 'murid@gmail.com', 'ee0b6db238b075d0da86340048fb147a', 1, NULL, 0, 'beb1acbe586a732b71fe5fbf81779740'),
(3, 'guru@gmail.com', '77e69c137812518e359196bb2f5e9bb9', NULL, 2, 0, NULL),
(4, 'murid2@gmail.com', '6d24580569bcdc2a7e5405616bf388b9', 2, NULL, 0, NULL),
(5, 'murid3@gmail.com', '95fad2832018df75ef8b9356edab728c', 3, NULL, 0, NULL),
(6, 'alvinodicky548@gmail.com', 'ee0b6db238b075d0da86340048fb147a', 4, NULL, 0, NULL),
(7, 'alvinodicky@gmail.com', '43b93443937ea642a9a43e77fd5d8f77', NULL, 3, 0, NULL),
(12, 'faizazharr@gmail.com', '912ec803b2ce49e4a541068d495ab570', NULL, 4, 0, NULL),
(13, 'satan@gmail.com', '53e8254b3222a33f42b5a6b3d156056c', 11, NULL, 0, NULL),
(14, 'oliver@gmail.com', 'acae273a5a5c88b46b36d65a25f5f435', NULL, 5, 1, NULL),
(15, 'orongdeveloper@gmail.com', '8c91df629944f5b5f5327679e5296add', NULL, 6, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `el_login_log`
--

CREATE TABLE `el_login_log` (
  `id` int(11) NOT NULL,
  `login_id` int(11) NOT NULL,
  `lasttime` datetime NOT NULL,
  `agent` text NOT NULL,
  `last_activity` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `el_login_log`
--

INSERT INTO `el_login_log` (`id`, `login_id`, `lasttime`, `agent`, `last_activity`) VALUES
(1, 1, '2019-12-14 00:05:18', '{\"is_mobile\":0,\"browser\":\"Chrome 70.0.3538.102\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/70.0.3538.102 Safari\\/537.36 Edge\\/18.18362\",\"ip\":\"::1\"}', 1576256924),
(2, 2, '2019-12-14 00:24:52', '{\"is_mobile\":0,\"browser\":\"Chrome 70.0.3538.102\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/70.0.3538.102 Safari\\/537.36 Edge\\/18.18362\",\"ip\":\"::1\"}', 1576257844),
(3, 1, '2019-12-14 00:26:23', '{\"is_mobile\":0,\"browser\":\"Chrome 70.0.3538.102\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/70.0.3538.102 Safari\\/537.36 Edge\\/18.18362\",\"ip\":\"::1\"}', 1576257967),
(4, 3, '2019-12-14 00:28:23', '{\"is_mobile\":0,\"browser\":\"Chrome 70.0.3538.102\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/70.0.3538.102 Safari\\/537.36 Edge\\/18.18362\",\"ip\":\"::1\"}', 1576260424),
(5, 1, '2019-12-14 00:40:18', '{\"is_mobile\":0,\"browser\":\"Chrome 78.0.3904.108\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/78.0.3904.108 Safari\\/537.36\",\"ip\":\"::1\"}', 1576259433),
(6, 1, '2019-12-14 00:53:02', '{\"is_mobile\":0,\"browser\":\"Chrome 78.0.3904.108\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/78.0.3904.108 Safari\\/537.36\",\"ip\":\"::1\"}', 1576259641),
(7, 1, '2019-12-14 00:58:43', '{\"is_mobile\":0,\"browser\":\"Chrome 78.0.3904.108\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/78.0.3904.108 Safari\\/537.36\",\"ip\":\"::1\"}', 1576260072),
(8, 1, '2019-12-14 01:05:59', '{\"is_mobile\":0,\"browser\":\"Chrome 78.0.3904.108\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/78.0.3904.108 Safari\\/537.36\",\"ip\":\"::1\"}', 1576260409),
(9, 1, '2019-12-14 01:32:20', '{\"is_mobile\":0,\"browser\":\"Chrome 70.0.3538.102\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/70.0.3538.102 Safari\\/537.36 Edge\\/18.18362\",\"ip\":\"::1\"}', 1576261830),
(10, 2, '2019-12-14 01:32:50', '{\"is_mobile\":0,\"browser\":\"Chrome 70.0.3538.102\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/70.0.3538.102 Safari\\/537.36 Edge\\/18.18362\",\"ip\":\"::1\"}', 1576261880),
(11, 1, '2019-12-14 01:34:00', '{\"is_mobile\":0,\"browser\":\"Chrome 79.0.3945.79\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.79 Safari\\/537.36\",\"ip\":\"::1\"}', 1576261954),
(12, 2, '2019-12-14 01:34:52', '{\"is_mobile\":0,\"browser\":\"Chrome 79.0.3945.79\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.79 Safari\\/537.36\",\"ip\":\"::1\"}', 1576262031),
(13, 1, '2019-12-14 01:36:13', '{\"is_mobile\":0,\"browser\":\"Chrome 79.0.3945.79\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.79 Safari\\/537.36\",\"ip\":\"::1\"}', 1576262248),
(14, 1, '2019-12-14 01:40:12', '{\"is_mobile\":0,\"browser\":\"Chrome 79.0.3945.79\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.79 Safari\\/537.36\",\"ip\":\"::1\"}', 1576262408),
(15, 3, '2019-12-14 01:42:39', '{\"is_mobile\":0,\"browser\":\"Chrome 79.0.3945.79\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.79 Safari\\/537.36\",\"ip\":\"::1\"}', 1576262709),
(16, 2, '2019-12-14 01:47:27', '{\"is_mobile\":0,\"browser\":\"Chrome 79.0.3945.79\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.79 Safari\\/537.36\",\"ip\":\"::1\"}', 1576262792),
(17, 1, '2019-12-14 01:48:47', '{\"is_mobile\":0,\"browser\":\"Chrome 79.0.3945.79\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.79 Safari\\/537.36\",\"ip\":\"::1\"}', 1576262868),
(18, 1, '2019-12-14 18:42:00', '{\"is_mobile\":0,\"browser\":\"Chrome 79.0.3945.79\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.79 Safari\\/537.36\",\"ip\":\"::1\"}', 1576323947),
(19, 1, '2019-12-14 18:52:48', '{\"is_mobile\":0,\"browser\":\"Chrome 79.0.3945.79\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.79 Safari\\/537.36\",\"ip\":\"::1\"}', 1576325407),
(20, 1, '2019-12-14 19:27:29', '{\"is_mobile\":0,\"browser\":\"Chrome 79.0.3945.79\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.79 Safari\\/537.36\",\"ip\":\"::1\"}', 1576326435),
(21, 2, '2019-12-14 19:29:32', '{\"is_mobile\":0,\"browser\":\"Chrome 79.0.3945.79\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.79 Safari\\/537.36\",\"ip\":\"::1\"}', 1576326543),
(22, 1, '2019-12-14 19:31:19', '{\"is_mobile\":0,\"browser\":\"Chrome 79.0.3945.79\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.79 Safari\\/537.36\",\"ip\":\"::1\"}', 1576326603),
(23, 2, '2019-12-14 19:32:22', '{\"is_mobile\":0,\"browser\":\"Chrome 79.0.3945.79\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.79 Safari\\/537.36\",\"ip\":\"::1\"}', 1576326828),
(24, 1, '2019-12-14 19:36:03', '{\"is_mobile\":0,\"browser\":\"Chrome 79.0.3945.79\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.79 Safari\\/537.36\",\"ip\":\"::1\"}', 1576327415),
(25, 1, '2019-12-18 03:40:38', '{\"is_mobile\":0,\"browser\":\"Chrome 79.0.3945.79\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.79 Safari\\/537.36\",\"ip\":\"::1\"}', 1576615488),
(26, 1, '2019-12-18 03:53:17', '{\"is_mobile\":0,\"browser\":\"Chrome 79.0.3945.79\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.79 Safari\\/537.36\",\"ip\":\"::1\"}', 1576616158),
(27, 1, '2019-12-18 03:56:56', '{\"is_mobile\":0,\"browser\":\"Chrome 79.0.3945.79\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.79 Safari\\/537.36\",\"ip\":\"::1\"}', 1576616218),
(28, 1, '2019-12-18 03:57:45', '{\"is_mobile\":0,\"browser\":\"Chrome 79.0.3945.79\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.79 Safari\\/537.36\",\"ip\":\"::1\"}', 1576616267),
(29, 1, '2019-12-18 04:01:14', '{\"is_mobile\":0,\"browser\":\"Chrome 79.0.3945.79\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.79 Safari\\/537.36\",\"ip\":\"::1\"}', 1576616617),
(30, 1, '2019-12-18 04:04:42', '{\"is_mobile\":0,\"browser\":\"Chrome 79.0.3945.79\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.79 Safari\\/537.36\",\"ip\":\"::1\"}', 1576617133),
(31, 1, '2019-12-20 10:13:59', '{\"is_mobile\":0,\"browser\":\"Chrome 79.0.3945.79\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.79 Safari\\/537.36\",\"ip\":\"::1\"}', 1576812841),
(32, 1, '2019-12-20 11:49:12', '{\"is_mobile\":0,\"browser\":\"Chrome 79.0.3945.88\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.88 Safari\\/537.36\",\"ip\":\"::1\"}', 1576820379),
(33, 1, '2019-12-20 12:42:23', '{\"is_mobile\":0,\"browser\":\"Chrome 79.0.3945.88\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.88 Safari\\/537.36\",\"ip\":\"::1\"}', 1576820456),
(34, 1, '2019-12-20 13:10:57', '{\"is_mobile\":0,\"browser\":\"Chrome 79.0.3945.88\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.88 Safari\\/537.36\",\"ip\":\"::1\"}', 1576823044),
(35, 5, '2019-12-20 13:26:20', '{\"is_mobile\":0,\"browser\":\"Chrome 79.0.3945.88\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.88 Safari\\/537.36\",\"ip\":\"::1\"}', 1576823085),
(36, 1, '2019-12-20 13:27:03', '{\"is_mobile\":0,\"browser\":\"Chrome 79.0.3945.88\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.88 Safari\\/537.36\",\"ip\":\"::1\"}', 1576823134),
(37, 1, '2019-12-20 13:28:29', '{\"is_mobile\":0,\"browser\":\"Chrome 79.0.3945.88\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.88 Safari\\/537.36\",\"ip\":\"::1\"}', 1576823243),
(38, 3, '2019-12-20 13:29:43', '{\"is_mobile\":0,\"browser\":\"Chrome 79.0.3945.88\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.88 Safari\\/537.36\",\"ip\":\"::1\"}', 1576823454),
(39, 5, '2019-12-20 13:33:28', '{\"is_mobile\":0,\"browser\":\"Chrome 79.0.3945.88\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.88 Safari\\/537.36\",\"ip\":\"::1\"}', 1576823972),
(40, 1, '2019-12-23 15:16:39', '{\"is_mobile\":0,\"browser\":\"Chrome 79.0.3945.88\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.88 Safari\\/537.36\",\"ip\":\"::1\"}', 1577088930),
(41, 5, '2019-12-23 15:17:47', '{\"is_mobile\":0,\"browser\":\"Chrome 79.0.3945.88\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.88 Safari\\/537.36\",\"ip\":\"::1\"}', 1577089249),
(42, 1, '2019-12-28 19:11:44', '{\"is_mobile\":0,\"browser\":\"Chrome 79.0.3945.88\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.88 Safari\\/537.36\",\"ip\":\"::1\"}', 1577535120),
(43, 1, '2020-01-01 21:52:00', '{\"is_mobile\":0,\"browser\":\"Chrome 79.0.3945.88\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.88 Safari\\/537.36\",\"ip\":\"::1\"}', 1577890379),
(44, 1, '2020-01-03 20:04:32', '{\"is_mobile\":0,\"browser\":\"Chrome 79.0.3945.88\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.88 Safari\\/537.36\",\"ip\":\"::1\"}', 1578056697),
(45, 1, '2020-01-04 01:54:09', '{\"is_mobile\":0,\"browser\":\"Chrome 79.0.3945.88\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.88 Safari\\/537.36\",\"ip\":\"::1\"}', 1578077878),
(46, 1, '2020-01-04 02:08:50', '{\"is_mobile\":0,\"browser\":\"Chrome 79.0.3945.88\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.88 Safari\\/537.36\",\"ip\":\"::1\"}', 1578078774),
(47, 1, '2020-01-06 10:49:53', '{\"is_mobile\":0,\"browser\":\"Chrome 79.0.3945.88\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.88 Safari\\/537.36\",\"ip\":\"::1\"}', 1578282656),
(48, 1, '2020-01-06 10:52:34', '{\"is_mobile\":0,\"browser\":\"Chrome 79.0.3945.88\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.88 Safari\\/537.36\",\"ip\":\"::1\"}', 1578282662),
(49, 1, '2020-01-06 10:53:34', '{\"is_mobile\":0,\"browser\":\"Chrome 79.0.3945.88\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.88 Safari\\/537.36\",\"ip\":\"::1\"}', 1578282720),
(50, 4, '2020-01-06 10:54:10', '{\"is_mobile\":0,\"browser\":\"Chrome 79.0.3945.88\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.88 Safari\\/537.36\",\"ip\":\"::1\"}', 1578283968),
(51, 1, '2020-01-19 18:54:48', '{\"is_mobile\":0,\"browser\":\"Chrome 79.0.3945.130\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.130 Safari\\/537.36\",\"ip\":\"::1\"}', 1579434841),
(52, 1, '2020-01-19 18:56:12', '{\"is_mobile\":0,\"browser\":\"Chrome 79.0.3945.130\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/79.0.3945.130 Safari\\/537.36\",\"ip\":\"::1\"}', 1579435070),
(53, 1, '2020-02-11 21:10:32', '{\"is_mobile\":0,\"browser\":\"Chrome 80.0.3987.87\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/80.0.3987.87 Safari\\/537.36\",\"ip\":\"::1\"}', 1581430464),
(54, 1, '2020-02-11 21:16:39', '{\"is_mobile\":0,\"browser\":\"Chrome 80.0.3987.87\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/80.0.3987.87 Safari\\/537.36\",\"ip\":\"::1\"}', 1581430612),
(55, 1, '2020-02-11 21:19:05', '{\"is_mobile\":0,\"browser\":\"Chrome 80.0.3987.87\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/80.0.3987.87 Safari\\/537.36\",\"ip\":\"::1\"}', 1581430668),
(56, 3, '2020-02-11 21:20:03', '{\"is_mobile\":0,\"browser\":\"Chrome 80.0.3987.87\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/80.0.3987.87 Safari\\/537.36\",\"ip\":\"::1\"}', 1581431017),
(57, 1, '2020-02-11 21:25:48', '{\"is_mobile\":0,\"browser\":\"Chrome 80.0.3987.87\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/80.0.3987.87 Safari\\/537.36\",\"ip\":\"::1\"}', 1581431115),
(58, 5, '2020-02-11 21:27:25', '{\"is_mobile\":0,\"browser\":\"Chrome 80.0.3987.87\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/80.0.3987.87 Safari\\/537.36\",\"ip\":\"::1\"}', 1581431236),
(59, 1, '2020-02-11 21:29:49', '{\"is_mobile\":0,\"browser\":\"Chrome 80.0.3987.87\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/80.0.3987.87 Safari\\/537.36\",\"ip\":\"::1\"}', 1581431290),
(60, 1, '2020-02-11 21:30:43', '{\"is_mobile\":0,\"browser\":\"Chrome 80.0.3987.87\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/80.0.3987.87 Safari\\/537.36\",\"ip\":\"::1\"}', 1581431343),
(61, 3, '2020-02-11 21:31:12', '{\"is_mobile\":0,\"browser\":\"Chrome 80.0.3987.87\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/80.0.3987.87 Safari\\/537.36\",\"ip\":\"::1\"}', 1581432654),
(62, 1, '2020-02-11 21:53:04', '{\"is_mobile\":0,\"browser\":\"Chrome 80.0.3987.87\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/80.0.3987.87 Safari\\/537.36\",\"ip\":\"::1\"}', 1581437682),
(63, 1, '2020-02-12 20:44:05', '{\"is_mobile\":0,\"browser\":\"Chrome 80.0.3987.87\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/80.0.3987.87 Safari\\/537.36\",\"ip\":\"::1\"}', 1581515023),
(64, 3, '2020-02-12 20:46:13', '{\"is_mobile\":0,\"browser\":\"Chrome 80.0.3987.87\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/80.0.3987.87 Safari\\/537.36\",\"ip\":\"::1\"}', 1581515214),
(65, 3, '2020-02-12 20:57:17', '{\"is_mobile\":0,\"browser\":\"Chrome 80.0.3987.100\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/80.0.3987.100 Safari\\/537.36\",\"ip\":\"::1\"}', 1581516744),
(66, 3, '2020-02-12 21:19:10', '{\"is_mobile\":0,\"browser\":\"Chrome 80.0.3987.100\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/80.0.3987.100 Safari\\/537.36\",\"ip\":\"::1\"}', 1581517429),
(67, 3, '2020-02-12 21:26:02', '{\"is_mobile\":0,\"browser\":\"Chrome 80.0.3987.100\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/80.0.3987.100 Safari\\/537.36\",\"ip\":\"::1\"}', 1581517685),
(68, 1, '2020-02-12 21:42:13', '{\"is_mobile\":0,\"browser\":\"Chrome 80.0.3987.100\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/80.0.3987.100 Safari\\/537.36\",\"ip\":\"::1\"}', 1581518498),
(69, 1, '2020-02-12 21:46:00', '{\"is_mobile\":0,\"browser\":\"Chrome 80.0.3987.100\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/80.0.3987.100 Safari\\/537.36\",\"ip\":\"::1\"}', 1581518745),
(70, 3, '2020-02-12 21:48:00', '{\"is_mobile\":0,\"browser\":\"Chrome 80.0.3987.100\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/80.0.3987.100 Safari\\/537.36\",\"ip\":\"::1\"}', 1581520422),
(71, 1, '2020-02-12 22:15:55', '{\"is_mobile\":0,\"browser\":\"Chrome 80.0.3987.100\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/80.0.3987.100 Safari\\/537.36\",\"ip\":\"::1\"}', 1581520769),
(72, 3, '2020-02-12 22:24:57', '{\"is_mobile\":0,\"browser\":\"Chrome 80.0.3987.100\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/80.0.3987.100 Safari\\/537.36\",\"ip\":\"::1\"}', 1581524667),
(73, 3, '2020-02-12 23:25:51', '{\"is_mobile\":0,\"browser\":\"Chrome 80.0.3987.100\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/80.0.3987.100 Safari\\/537.36\",\"ip\":\"::1\"}', 1581525372),
(74, 3, '2020-02-12 23:38:26', '{\"is_mobile\":0,\"browser\":\"Chrome 80.0.3987.100\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/80.0.3987.100 Safari\\/537.36\",\"ip\":\"::1\"}', 1581525436),
(75, 3, '2020-02-12 23:39:40', '{\"is_mobile\":0,\"browser\":\"Chrome 80.0.3987.100\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/80.0.3987.100 Safari\\/537.36\",\"ip\":\"::1\"}', 1581525500),
(76, 3, '2020-02-12 23:40:30', '{\"is_mobile\":0,\"browser\":\"Chrome 80.0.3987.100\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/80.0.3987.100 Safari\\/537.36\",\"ip\":\"::1\"}', 1581525739),
(77, 1, '2020-02-12 23:44:29', '{\"is_mobile\":0,\"browser\":\"Chrome 80.0.3987.100\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/80.0.3987.100 Safari\\/537.36\",\"ip\":\"::1\"}', 1581525805),
(78, 1, '2020-02-12 23:46:22', '{\"is_mobile\":0,\"browser\":\"Chrome 80.0.3987.100\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/80.0.3987.100 Safari\\/537.36\",\"ip\":\"::1\"}', 1581525886),
(79, 2, '2020-02-12 23:47:00', '{\"is_mobile\":0,\"browser\":\"Chrome 80.0.3987.100\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/80.0.3987.100 Safari\\/537.36\",\"ip\":\"::1\"}', 1581526569),
(80, 3, '2020-02-13 15:14:08', '{\"is_mobile\":0,\"browser\":\"Chrome 80.0.3987.100\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/80.0.3987.100 Safari\\/537.36\",\"ip\":\"::1\"}', 1581582147),
(81, 1, '2020-02-13 15:24:40', '{\"is_mobile\":0,\"browser\":\"Chrome 80.0.3987.100\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/80.0.3987.100 Safari\\/537.36\",\"ip\":\"::1\"}', 1581582305),
(82, 2, '2020-02-13 15:27:17', '{\"is_mobile\":0,\"browser\":\"Chrome 80.0.3987.100\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/80.0.3987.100 Safari\\/537.36\",\"ip\":\"::1\"}', 1581582328),
(83, 3, '2020-02-13 15:27:42', '{\"is_mobile\":0,\"browser\":\"Chrome 80.0.3987.100\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/80.0.3987.100 Safari\\/537.36\",\"ip\":\"::1\"}', 1581587630),
(84, 3, '2020-02-14 06:53:02', '{\"is_mobile\":0,\"browser\":\"Chrome 80.0.3987.100\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/80.0.3987.100 Safari\\/537.36\",\"ip\":\"::1\"}', 1581639068),
(85, 3, '2020-02-19 17:04:54', '{\"is_mobile\":0,\"browser\":\"Chrome 80.0.3987.106\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/80.0.3987.106 Safari\\/537.36\",\"ip\":\"::1\"}', 1582106756),
(86, 1, '2020-03-17 21:32:29', '{\"is_mobile\":0,\"browser\":\"Chrome 80.0.3987.132\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/80.0.3987.132 Safari\\/537.36\",\"ip\":\"::1\"}', 1584455632),
(87, 5, '2020-03-17 21:36:06', '{\"is_mobile\":0,\"browser\":\"Chrome 80.0.3987.132\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/80.0.3987.132 Safari\\/537.36\",\"ip\":\"::1\"}', 1584455693),
(88, 3, '2020-03-17 21:37:03', '{\"is_mobile\":0,\"browser\":\"Chrome 80.0.3987.132\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/80.0.3987.132 Safari\\/537.36\",\"ip\":\"::1\"}', 1584456085),
(89, 5, '2020-03-17 21:43:40', '{\"is_mobile\":0,\"browser\":\"Chrome 80.0.3987.132\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/80.0.3987.132 Safari\\/537.36\",\"ip\":\"::1\"}', 1584456218),
(90, 1, '2020-03-17 21:45:50', '{\"is_mobile\":0,\"browser\":\"Chrome 80.0.3987.132\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/80.0.3987.132 Safari\\/537.36\",\"ip\":\"::1\"}', 1584456819),
(91, 1, '2020-03-18 22:12:28', '{\"is_mobile\":0,\"browser\":\"Chrome 80.0.3987.132\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/80.0.3987.132 Safari\\/537.36\",\"ip\":\"::1\"}', 1584544948),
(92, 5, '2020-03-18 22:24:40', '{\"is_mobile\":0,\"browser\":\"Chrome 80.0.3987.132\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/80.0.3987.132 Safari\\/537.36\",\"ip\":\"::1\"}', 1584634524),
(93, 1, '2020-03-20 00:41:44', '{\"is_mobile\":0,\"browser\":\"Chrome 80.0.3987.132\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/80.0.3987.132 Safari\\/537.36\",\"ip\":\"::1\"}', 1584662465),
(94, 5, '2020-03-20 10:27:10', '{\"is_mobile\":0,\"browser\":\"Chrome 80.0.3987.132\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/80.0.3987.132 Safari\\/537.36\",\"ip\":\"::1\"}', 1584686722),
(95, 1, '2020-03-23 20:15:13', '{\"is_mobile\":0,\"browser\":\"Chrome 80.0.3987.149\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/80.0.3987.149 Safari\\/537.36\",\"ip\":\"::1\"}', 1584969544),
(96, 5, '2020-03-23 20:21:08', '{\"is_mobile\":0,\"browser\":\"Chrome 80.0.3987.149\",\"platform\":\"Unknown Windows OS\",\"agent_string\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/80.0.3987.149 Safari\\/537.36\",\"ip\":\"::1\"}', 1584983830),
(97, 1, '2020-04-02 00:18:26', '{\"is_mobile\":0,\"browser\":\"Chrome 80.0.3987.149\",\"platform\":\"Mac OS X\",\"agent_string\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_14_0) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/80.0.3987.149 Safari\\/537.36\",\"ip\":\"192.168.64.3\"}', 1585768800),
(98, 1, '2020-04-02 02:30:31', '{\"is_mobile\":0,\"browser\":\"Chrome 80.0.3987.149\",\"platform\":\"Mac OS X\",\"agent_string\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_14_0) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/80.0.3987.149 Safari\\/537.36\",\"ip\":\"192.168.64.3\"}', 1585772472),
(99, 3, '2020-04-02 03:23:20', '{\"is_mobile\":0,\"browser\":\"Chrome 80.0.3987.149\",\"platform\":\"Mac OS X\",\"agent_string\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_14_0) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/80.0.3987.149 Safari\\/537.36\",\"ip\":\"192.168.64.3\"}', 1585772840),
(100, 3, '2020-04-02 14:48:50', '{\"is_mobile\":0,\"browser\":\"Chrome 80.0.3987.149\",\"platform\":\"Mac OS X\",\"agent_string\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_14_0) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/80.0.3987.149 Safari\\/537.36\",\"ip\":\"127.0.0.1\"}', 1585813772),
(101, 2, '2020-04-02 14:51:41', '{\"is_mobile\":0,\"browser\":\"Chrome 80.0.3987.149\",\"platform\":\"Mac OS X\",\"agent_string\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_14_0) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/80.0.3987.149 Safari\\/537.36\",\"ip\":\"127.0.0.1\"}', 1585813818),
(102, 3, '2020-04-02 14:52:25', '{\"is_mobile\":0,\"browser\":\"Chrome 80.0.3987.149\",\"platform\":\"Mac OS X\",\"agent_string\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_14_0) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/80.0.3987.149 Safari\\/537.36\",\"ip\":\"127.0.0.1\"}', 1585820538),
(103, 3, '2020-04-02 16:42:34', '{\"is_mobile\":0,\"browser\":\"Chrome 80.0.3987.149\",\"platform\":\"Mac OS X\",\"agent_string\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_14_0) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/80.0.3987.149 Safari\\/537.36\",\"ip\":\"127.0.0.1\"}', 1585830681),
(104, 2, '2020-04-02 19:31:35', '{\"is_mobile\":0,\"browser\":\"Chrome 80.0.3987.149\",\"platform\":\"Mac OS X\",\"agent_string\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_14_0) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/80.0.3987.149 Safari\\/537.36\",\"ip\":\"127.0.0.1\"}', 1585846552),
(105, 2, '2020-04-09 23:22:46', '{\"is_mobile\":0,\"browser\":\"Chrome 80.0.3987.163\",\"platform\":\"Mac OS X\",\"agent_string\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_14_0) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/80.0.3987.163 Safari\\/537.36\",\"ip\":\"127.0.0.1\"}', 1586461954),
(106, 2, '2020-04-25 12:43:36', '{\"is_mobile\":0,\"browser\":\"Chrome 81.0.4044.122\",\"platform\":\"Mac OS X\",\"agent_string\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_14_0) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/81.0.4044.122 Safari\\/537.36\",\"ip\":\"127.0.0.1\"}', 1587799345),
(107, 1, '2020-04-25 14:22:48', '{\"is_mobile\":0,\"browser\":\"Chrome 81.0.4044.122\",\"platform\":\"Mac OS X\",\"agent_string\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_14_0) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/81.0.4044.122 Safari\\/537.36\",\"ip\":\"127.0.0.1\"}', 1587799268),
(108, 2, '2020-04-25 14:23:41', '{\"is_mobile\":0,\"browser\":\"Chrome 81.0.4044.122\",\"platform\":\"Mac OS X\",\"agent_string\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_14_0) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/81.0.4044.122 Safari\\/537.36\",\"ip\":\"127.0.0.1\"}', 1587801740),
(109, 1, '2020-04-25 15:04:32', '{\"is_mobile\":0,\"browser\":\"Chrome 81.0.4044.122\",\"platform\":\"Mac OS X\",\"agent_string\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_14_0) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/81.0.4044.122 Safari\\/537.36\",\"ip\":\"127.0.0.1\"}', 1587802159),
(110, 1, '2020-04-28 10:31:02', '{\"is_mobile\":0,\"browser\":\"Chrome 81.0.4044.122\",\"platform\":\"Mac OS X\",\"agent_string\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_14_0) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/81.0.4044.122 Safari\\/537.36\",\"ip\":\"127.0.0.1\"}', 1588064587),
(111, 1, '2020-04-28 22:03:55', '{\"is_mobile\":0,\"browser\":\"Safari 605.1.15\",\"platform\":\"Mac OS X\",\"agent_string\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_14) AppleWebKit\\/605.1.15 (KHTML, like Gecko) Version\\/12.0 Safari\\/605.1.15\",\"ip\":\"127.0.0.1\"}', 1588099308),
(112, 1, '2020-04-30 00:45:09', '{\"is_mobile\":0,\"browser\":\"Chrome 81.0.4044.122\",\"platform\":\"Mac OS X\",\"agent_string\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_14_0) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/81.0.4044.122 Safari\\/537.36\",\"ip\":\"127.0.0.1\"}', 1588187992),
(113, 3, '2020-04-30 02:22:00', '{\"is_mobile\":0,\"browser\":\"Chrome 81.0.4044.122\",\"platform\":\"Mac OS X\",\"agent_string\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_14_0) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/81.0.4044.122 Safari\\/537.36\",\"ip\":\"127.0.0.1\"}', 1588189086);

-- --------------------------------------------------------

--
-- Table structure for table `el_mapel`
--

CREATE TABLE `el_mapel` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `info` text DEFAULT NULL,
  `aktif` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 = ya, 0 = tidak'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `el_mapel`
--

INSERT INTO `el_mapel` (`id`, `nama`, `info`, `aktif`) VALUES
(1, 'Bahasa Indonesia', NULL, 1),
(2, 'Bahasa Inggris', NULL, 1),
(3, 'Matematika', NULL, 1),
(4, 'Ekonomi', NULL, 1),
(5, 'Geografi', NULL, 1),
(6, 'Biologi', NULL, 1),
(7, 'Penjas', NULL, 1),
(8, 'Agama', NULL, 1),
(9, 'Fisika', NULL, 1),
(10, 'Kimia', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `el_mapel_ajar`
--

CREATE TABLE `el_mapel_ajar` (
  `id` int(11) NOT NULL,
  `hari_id` tinyint(1) NOT NULL COMMENT '1=senin,2=selasa,3=rabu,4=kamis,5=jum''at,6=sabtu,7=minggu',
  `jam_mulai` time NOT NULL,
  `jam_selesai` time NOT NULL,
  `pengajar_id` int(11) NOT NULL,
  `mapel_kelas_id` int(11) NOT NULL,
  `aktif` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 = aktif 0 = tidak'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `el_mapel_ajar`
--

INSERT INTO `el_mapel_ajar` (`id`, `hari_id`, `jam_mulai`, `jam_selesai`, `pengajar_id`, `mapel_kelas_id`, `aktif`) VALUES
(1, 1, '08:00:00', '10:30:00', 2, 11, 1),
(2, 3, '11:00:00', '13:00:00', 2, 11, 1),
(3, 1, '12:33:00', '01:36:00', 3, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `el_mapel_kelas`
--

CREATE TABLE `el_mapel_kelas` (
  `id` int(11) NOT NULL,
  `kelas_id` int(11) NOT NULL,
  `mapel_id` int(11) NOT NULL,
  `aktif` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `el_mapel_kelas`
--

INSERT INTO `el_mapel_kelas` (`id`, `kelas_id`, `mapel_id`, `aktif`) VALUES
(1, 2, 1, 1),
(2, 2, 2, 1),
(3, 2, 3, 1),
(4, 2, 4, 1),
(5, 2, 5, 1),
(6, 2, 6, 1),
(7, 2, 7, 1),
(8, 2, 8, 1),
(9, 2, 9, 1),
(10, 2, 10, 1),
(11, 7, 6, 1),
(12, 1, 1, 0),
(13, 1, 2, 0),
(16, 7, 2, 1),
(17, 7, 3, 1),
(18, 7, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `el_materi`
--

CREATE TABLE `el_materi` (
  `id` int(11) NOT NULL,
  `mapel_id` int(11) NOT NULL,
  `pengajar_id` int(11) DEFAULT NULL,
  `siswa_id` int(11) DEFAULT NULL,
  `judul` varchar(255) NOT NULL,
  `konten` text DEFAULT NULL,
  `file` text DEFAULT NULL,
  `tgl_posting` datetime NOT NULL,
  `publish` tinyint(1) NOT NULL DEFAULT 0,
  `views` int(11) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `el_materi`
--

INSERT INTO `el_materi` (`id`, `mapel_id`, `pengajar_id`, `siswa_id`, `judul`, `konten`, `file`, `tgl_posting`, `publish`, `views`) VALUES
(1, 1, 2, NULL, 'skuy living', NULL, 'skuy_living_1581519810.docx', '2020-02-12 22:03:30', 1, 1),
(4, 2, 2, NULL, 'opening', 'data fill', 'catatan7.txt', '2020-05-01 06:52:13', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `el_materi_kelas`
--

CREATE TABLE `el_materi_kelas` (
  `id` int(11) NOT NULL,
  `materi_id` int(11) NOT NULL,
  `kelas_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `el_materi_kelas`
--

INSERT INTO `el_materi_kelas` (`id`, `materi_id`, `kelas_id`) VALUES
(1, 1, 11),
(2, 4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `el_messages`
--

CREATE TABLE `el_messages` (
  `id` int(11) NOT NULL,
  `type_id` tinyint(1) NOT NULL COMMENT '1=inbox,2=outbox',
  `content` text NOT NULL,
  `owner_id` int(11) NOT NULL,
  `sender_receiver_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `opened` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=belum,1=sudah'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `el_messages`
--

INSERT INTO `el_messages` (`id`, `type_id`, `content`, `owner_id`, `sender_receiver_id`, `date`, `opened`) VALUES
(1, 2, '<p>saya sangat senang belajar e-learning</p>\r\n', 2, 1, '2019-12-14 19:30:49', 1),
(8, 1, '<p>cgcgcgcgcg</p>\r\n', 5, 1, '2020-01-04 02:11:39', 1),
(5, 2, '<p>ok bos&nbsp;</p>\r\n', 2, 1, '2019-12-14 19:32:37', 1),
(16, 1, 'opo le', 3, 2, '2020-04-02 19:30:44', 0),
(20, 1, 'Nuhun euy!', 1, 2, '2020-04-29 19:43:15', 0);

-- --------------------------------------------------------

--
-- Table structure for table `el_nilai_tugas`
--

CREATE TABLE `el_nilai_tugas` (
  `id` int(11) NOT NULL,
  `nilai` float NOT NULL,
  `tugas_id` int(11) NOT NULL,
  `siswa_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `el_nilai_tugas`
--

INSERT INTO `el_nilai_tugas` (`id`, `nilai`, `tugas_id`, `siswa_id`) VALUES
(2, 100, 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `el_pengajar`
--

CREATE TABLE `el_pengajar` (
  `id` int(11) NOT NULL,
  `nip` varchar(45) DEFAULT NULL,
  `nama` varchar(100) NOT NULL,
  `jenis_kelamin` varchar(9) NOT NULL,
  `tempat_lahir` varchar(45) NOT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `alamat` varchar(255) NOT NULL,
  `foto` text DEFAULT NULL,
  `status_id` tinyint(1) NOT NULL COMMENT '0=pending, 1=aktif, 2=blok',
  `id_mapel` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `el_pengajar`
--

INSERT INTO `el_pengajar` (`id`, `nip`, `nama`, `jenis_kelamin`, `tempat_lahir`, `tgl_lahir`, `alamat`, `foto`, `status_id`, `id_mapel`) VALUES
(1, '150212046', 'Engelbertus Hendro', 'Laki-laki', '', '0000-00-00', 'smkn 1 L Bajo', 'fav5f1d27339310dlogo-smkn1labuanbajo.png', 1, '1'),
(2, '123456', 'Dicky Pamungkas', 'Laki-laki', 'penarik', '2999-03-14', 'pbb', 'pengajar-dicky-pamungkas.jpg', 1, '2'),
(3, '12345', 'diki', 'Laki-laki', 'penarik', '2000-02-16', 'pbb', NULL, 0, '3'),
(4, '1234123412341234', 'asdf', 'option1', 'asdf', NULL, 'ASDF', NULL, 0, '3'),
(5, '666', 'Oliver', 'Laki-laki', 'cekcek', '2020-04-22', 'Cikole', NULL, 2, '4'),
(6, '1234567890', 'Engelbertus Hendro', 'Laki-laki', 'Orong', '1997-03-10', 'Labuan Bajo', NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `el_pengaturan`
--

CREATE TABLE `el_pengaturan` (
  `id` varchar(255) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `value` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `el_pengaturan`
--

INSERT INTO `el_pengaturan` (`id`, `nama`, `value`) VALUES
('email-server', 'Email server', 'dicky@domain.com'),
('email-template-approve-pengajar', 'Approve pengajar (email pengajar)', '{\"subject\":\"Pengaktifan Akun\",\"body\":\"<p>Hai {$nama},<\\/p>\\n<p>Anda telah diterima sebagai pengajar pada {$nama_sekolah}, berikut informasi data diri anda:<\\/p>\\n<p>{$tabel_profil}<\\/p>\\n<p>Anda dapat login ke sistem E-Learning menggunakan username dan password yang telah anda buat saat pendaftaran, login pada url berikut : {$url_login}<\\/p>\"}'),
('email-template-approve-siswa', 'Approve siswa (email siswa)', '{\"subject\":\"Pengaktifan Akun\",\"body\":\"<p>Hai {$nama},<\\/p>\\n<p>Anda telah diterima sebagai siswa pada {$nama_sekolah}, berikut informasi data diri anda:<\\/p>\\n<p>{$tabel_profil}<\\/p>\\n<p>Anda dapat login ke sistem E-Learning menggunakan username dan password yang telah anda buat saat pendaftaran, login pada url berikut : {$url_login}<\\/p>\"}'),
('email-template-link-reset', 'Link Reset Password', '{\"subject\":\"Reset Password\",\"body\":\"<p>Hai,<\\/p>\\n<p>Anda mengirimkan permintaan untuk reset password anda, klik link berikut untuk memulai reset password : {$link_reset}<\\/p>\"}'),
('email-template-register-pengajar', 'Register pengajar (email pengajar)', '{\"subject\":\"Registrasi Berhasil\",\"body\":\"<p>Hai {$nama},<\\/p>\\n<p>Terimakasih telah melakukan pendaftaran sebagai pengajar di E-Learning {$nama_sekolah}. Akun anda akan segera diaktifkan oleh admin.<\\/p>\"}'),
('email-template-register-siswa', 'Register siswa (email siswa)', '{\"subject\":\"Registrasi Berhasil\",\"body\":\"<p>Hai {$nama},<\\/p>\\n<p>Terimakasih telah melakukan pendaftaran sebagai siswa di E-Learning {$nama_sekolah}. Akun anda akan segera diaktifkan oleh admin.<\\/p>\"}'),
('info-registrasi', 'Info Registrasi', '<p>Silakan mendaftar sebagai siswa atau pengajar (jika anda sebagai pengajar) dengan memilih sesuai tab berikut :</p>\r\n'),
('peraturan-elearning', 'Peraturan E-learning', ''),
('registrasi-pengajar', 'Registrasi Pengajar', '1'),
('registrasi-siswa', 'Registrasi Siswa', '1'),
('versi', 'Versi', '2.0'),
('jenjang', 'jenjang', 'SMA'),
('nama-sekolah', 'nama-sekolah', 'SMA SINT CAROLUS BENGKULU'),
('alamat', 'alamat', 'Jalan Kapuas Raya no.22'),
('telp', 'telp', '081367783246'),
('install-success', 'install-success', '1'),
('status-registrasi-siswa', 'status-registrasi-siswa', '0'),
('status-registrasi-pengajar', 'status-registrasi-pengajar', '0'),
('smtp-host', 'smtp-host', ''),
('smtp-username', 'smtp-username', ''),
('smtp-pass', 'smtp-pass', ''),
('smtp-port', 'smtp-port', ''),
('edit-username-siswa', 'edit-username-siswa', '1'),
('edit-foto-siswa', 'edit-foto-siswa', '1'),
('info-slide-1', 'info-slide-1', ''),
('info-slide-2', 'info-slide-2', ''),
('info-slide-3', 'info-slide-3', ''),
('info-slide-4', 'info-slide-4', ''),
('logo-sekolah', 'logo-sekolah', 'logo-sekolah.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `el_pengumuman`
--

CREATE TABLE `el_pengumuman` (
  `id` int(11) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `konten` text NOT NULL,
  `tgl_tampil` date NOT NULL,
  `tgl_tutup` date NOT NULL,
  `tampil_siswa` tinyint(1) NOT NULL DEFAULT 1,
  `tampil_pengajar` tinyint(1) NOT NULL DEFAULT 1,
  `pengajar_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `el_pengumuman`
--

INSERT INTO `el_pengumuman` (`id`, `judul`, `konten`, `tgl_tampil`, `tgl_tutup`, `tampil_siswa`, `tampil_pengajar`, `pengajar_id`) VALUES
(1, 'pkn', '<p>haaiiii sekarang kita ada pengumuman yaaa</p>\r\n', '2020-02-13', '2020-03-10', 1, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `el_pilihan`
--

CREATE TABLE `el_pilihan` (
  `id` int(11) NOT NULL,
  `pertanyaan_id` int(11) NOT NULL,
  `konten` text NOT NULL,
  `kunci` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=tidak',
  `urutan` int(11) NOT NULL,
  `aktif` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `el_pilihan`
--

INSERT INTO `el_pilihan` (`id`, `pertanyaan_id`, `konten`, `kunci`, `urutan`, `aktif`) VALUES
(1, 1, '<p>otot</p>\r\n', 1, 1, 1),
(2, 1, '<p>rangka</p>\r\n', 0, 2, 1),
(3, 1, '<p>saraf</p>\r\n', 0, 3, 1),
(4, 1, '<p>pencernaan</p>\r\n', 0, 4, 1),
(5, 1, '<p>anjai</p>\r\n', 0, 5, 0),
(6, 2, '<p>rangka</p>\r\n', 0, 4, 1),
(7, 2, '<p>otot</p>\r\n', 1, 1, 1),
(8, 2, '<p>saraf</p>\r\n', 0, 2, 1),
(9, 2, '<p>pencernaan</p>\r\n', 0, 3, 1),
(10, 3, '<p>sapanich</p>\n', 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `el_siswa`
--

CREATE TABLE `el_siswa` (
  `id` int(11) NOT NULL,
  `nis` varchar(45) DEFAULT NULL,
  `nama` varchar(100) NOT NULL,
  `jenis_kelamin` varchar(9) NOT NULL COMMENT 'Laki-laki dan Perempuan',
  `tempat_lahir` varchar(45) NOT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `agama` char(7) DEFAULT NULL,
  `alamat` varchar(255) NOT NULL,
  `tahun_masuk` year(4) NOT NULL,
  `foto` text DEFAULT NULL,
  `status_id` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=pending, 1=aktif, 2=blok, 3=alumni, 4=deleted'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `el_siswa`
--

INSERT INTO `el_siswa` (`id`, `nis`, `nama`, `jenis_kelamin`, `tempat_lahir`, `tgl_lahir`, `agama`, `alamat`, `tahun_masuk`, `foto`, `status_id`) VALUES
(1, '1151', 'Afriadi', 'Laki-laki', 'ACEH SELATAN', '2005-04-21', 'ISLAM', 'Pasi Kuala Bau, Kluet Utara, Kabupaten Aceh Selatan, Aceh 23771', 2018, 'siswa-afriadi-1151.jpg', 1),
(2, '1157', 'SAIYIDA NATISA', 'Perempuan', 'aceh selatan', '2002-03-07', 'ISLAM', 'aceh selatan', 2018, NULL, 1),
(3, '1152', 'FITRIA SUKMA', 'Perempuan', 'aceh selatan', '2002-10-07', 'ISLAM', 'aceh selatan', 2018, 'siswa-fitria-sukma-11521.jpg', 1),
(4, '12345', 'dicky', 'Laki-laki', 'penarik', '2000-01-14', 'KATOLIK', 'pbb', 2018, NULL, 0),
(9, '123123123123', 'asdf', 'option1', 'asdf', NULL, NULL, 'asdf', 0000, NULL, 0),
(10, '666', 'Satan', 'Laki-laki', 'Kandang', '0000-00-00', 'BUDHA', 'asana', 2020, NULL, 3),
(11, '666', 'Satan', 'Laki-laki', 'cekcek', '2020-04-15', 'ISLAM', 'asana', 2021, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `el_soal`
--

CREATE TABLE `el_soal` (
  `id_soal` int(11) NOT NULL,
  `pertanyaan` text NOT NULL,
  `pg_a` text DEFAULT NULL,
  `pg_b` text DEFAULT NULL,
  `pg_c` text DEFAULT NULL,
  `jawaban_pg` varchar(32) DEFAULT NULL,
  `tipe` int(11) NOT NULL COMMENT '1=pg,2=essay',
  `pengajar_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `el_soal`
--

INSERT INTO `el_soal` (`id_soal`, `pertanyaan`, `pg_a`, `pg_b`, `pg_c`, `jawaban_pg`, `tipe`, `pengajar_id`) VALUES
(1, '1+1=0 ?', 'A.Ya', 'B.Tidak', 'C.Pertanyaan macam apa ini', 'C', 1, 2),
(3, 'Jelaskan menurut anda bumi bulat atau datar?', NULL, NULL, NULL, NULL, 2, 2),
(5, 'aasdasd', 'A.a', 'B.d', 'C.s', 'C', 1, 2),
(6, 'dasdasdasd??', NULL, NULL, NULL, NULL, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `el_tugas`
--

CREATE TABLE `el_tugas` (
  `id` int(11) NOT NULL,
  `mapel_id` int(11) NOT NULL,
  `pengajar_id` int(11) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `info` text DEFAULT NULL,
  `file` text DEFAULT NULL,
  `tgl_buat` datetime DEFAULT NULL,
  `durasi` datetime DEFAULT NULL COMMENT 'lama pengerjaan dalam menit',
  `aktif` tinyint(1) NOT NULL DEFAULT 0,
  `tampil_siswa` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=tidak tampil di siswa, 1=tampil siswa'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `el_tugas`
--

INSERT INTO `el_tugas` (`id`, `mapel_id`, `pengajar_id`, `judul`, `info`, `file`, `tgl_buat`, `durasi`, `aktif`, `tampil_siswa`) VALUES
(4, 2, 2, 'Tugas WFH', 'COBA kerjakan selama korona', 'catatan9.txt', '2020-05-01 09:39:19', '2020-05-14 13:00:00', 1, 1),
(5, 2, 2, 'tugas wfh', 'kerjain sampai korona', 'catatan10.txt', '2020-05-01 09:48:50', '2020-05-04 07:48:00', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `el_tugas_kelas`
--

CREATE TABLE `el_tugas_kelas` (
  `id` int(11) NOT NULL,
  `tugas_id` int(11) NOT NULL,
  `kelas_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `el_tugas_kelas`
--

INSERT INTO `el_tugas_kelas` (`id`, `tugas_id`, `kelas_id`) VALUES
(5, 5, 7),
(4, 4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `el_tugas_kumpul`
--

CREATE TABLE `el_tugas_kumpul` (
  `id` int(11) NOT NULL,
  `kelas_id` int(11) DEFAULT NULL,
  `siswa_id` int(11) DEFAULT NULL,
  `tugas_id` int(11) DEFAULT NULL,
  `file` text DEFAULT NULL,
  `nilai` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `el_tugas_kumpul`
--

INSERT INTO `el_tugas_kumpul` (`id`, `kelas_id`, `siswa_id`, `tugas_id`, `file`, `nilai`) VALUES
(2, 7, 2, 5, 'catatan12.txt', '22');

-- --------------------------------------------------------

--
-- Table structure for table `el_tugas_pertanyaan`
--

CREATE TABLE `el_tugas_pertanyaan` (
  `id` int(11) NOT NULL,
  `pertanyaan` text NOT NULL,
  `urutan` int(11) NOT NULL,
  `tugas_id` int(11) NOT NULL,
  `aktif` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `el_tugas_pertanyaan`
--

INSERT INTO `el_tugas_pertanyaan` (`id`, `pertanyaan`, `urutan`, `tugas_id`, `aktif`) VALUES
(1, '<p>sistem tubuh yang berfungsi sebagai penyangga, pemberi bentuk tubuh, dan alat gerak pasif adalah &hellip;</p>\r\n', 1, 1, 1),
(2, '<p>sistem tubuh yang berfungsi sebagai penyangga, pemberi bentuk tubuh, dan alat gerak pasif adalah &hellip;</p>\r\n', 1, 2, 1),
(3, '<p>Siapa nama Bapak Saya?</p>\n', 2, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `el_ujian`
--

CREATE TABLE `el_ujian` (
  `id` int(11) NOT NULL,
  `judul` text NOT NULL,
  `tgl_dibuat` date NOT NULL,
  `tgl_expired` date NOT NULL,
  `waktu` int(11) NOT NULL,
  `mapel_kelas_id` int(11) NOT NULL,
  `pengajar_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `el_ujian`
--

INSERT INTO `el_ujian` (`id`, `judul`, `tgl_dibuat`, `tgl_expired`, `waktu`, `mapel_kelas_id`, `pengajar_id`) VALUES
(1, 'Testingg', '2020-04-30', '2020-05-02', 30, 11, 2),
(2, 'coba lagi dong', '2020-04-29', '2020-05-02', 20, 3, 2),
(3, 'asdasdasd', '2020-05-01', '2020-05-04', 10, 11, 2);

-- --------------------------------------------------------

--
-- Table structure for table `el_ujian_soal`
--

CREATE TABLE `el_ujian_soal` (
  `id_ujian_soal` int(11) NOT NULL,
  `id_ujian` int(11) NOT NULL,
  `id_soal` int(11) NOT NULL,
  `aktif` int(11) NOT NULL COMMENT '1=aktif'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `el_ujian_soal`
--

INSERT INTO `el_ujian_soal` (`id_ujian_soal`, `id_ujian`, `id_soal`, `aktif`) VALUES
(1, 2, 1, 1),
(2, 2, 3, 0),
(3, 1, 1, 1),
(5, 1, 3, 1),
(6, 3, 1, 1),
(7, 3, 3, 1),
(8, 3, 5, 1),
(9, 3, 6, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `el_absen`
--
ALTER TABLE `el_absen`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `el_absen_siswa`
--
ALTER TABLE `el_absen_siswa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `el_field_tambahan`
--
ALTER TABLE `el_field_tambahan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `el_jawaban`
--
ALTER TABLE `el_jawaban`
  ADD PRIMARY KEY (`id_jawaban`);

--
-- Indexes for table `el_kelas`
--
ALTER TABLE `el_kelas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `parent_id_2` (`parent_id`);

--
-- Indexes for table `el_kelas_siswa`
--
ALTER TABLE `el_kelas_siswa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kelas_id` (`kelas_id`,`siswa_id`),
  ADD KEY `kelas_id_2` (`kelas_id`,`siswa_id`);

--
-- Indexes for table `el_komentar`
--
ALTER TABLE `el_komentar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `login_id` (`login_id`,`materi_id`),
  ADD KEY `login_id_2` (`login_id`,`materi_id`),
  ADD KEY `login_id_3` (`login_id`,`materi_id`);

--
-- Indexes for table `el_login`
--
ALTER TABLE `el_login`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`siswa_id`,`pengajar_id`),
  ADD KEY `username_2` (`username`,`siswa_id`,`pengajar_id`);

--
-- Indexes for table `el_login_log`
--
ALTER TABLE `el_login_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `login_id` (`login_id`),
  ADD KEY `login_id_2` (`login_id`),
  ADD KEY `login_id_3` (`login_id`);

--
-- Indexes for table `el_mapel`
--
ALTER TABLE `el_mapel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `el_mapel_ajar`
--
ALTER TABLE `el_mapel_ajar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hari_id` (`hari_id`,`pengajar_id`,`mapel_kelas_id`),
  ADD KEY `hari_id_2` (`hari_id`,`pengajar_id`,`mapel_kelas_id`);

--
-- Indexes for table `el_mapel_kelas`
--
ALTER TABLE `el_mapel_kelas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kelas_id` (`kelas_id`,`mapel_id`),
  ADD KEY `kelas_id_2` (`kelas_id`,`mapel_id`);

--
-- Indexes for table `el_materi`
--
ALTER TABLE `el_materi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mapel_id` (`mapel_id`,`pengajar_id`,`siswa_id`),
  ADD KEY `mapel_id_2` (`mapel_id`,`pengajar_id`,`siswa_id`);

--
-- Indexes for table `el_materi_kelas`
--
ALTER TABLE `el_materi_kelas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `materi_id` (`materi_id`,`kelas_id`),
  ADD KEY `materi_id_2` (`materi_id`,`kelas_id`);

--
-- Indexes for table `el_messages`
--
ALTER TABLE `el_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type_id` (`type_id`,`owner_id`,`sender_receiver_id`),
  ADD KEY `type_id_2` (`type_id`,`owner_id`,`sender_receiver_id`);

--
-- Indexes for table `el_nilai_tugas`
--
ALTER TABLE `el_nilai_tugas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tugas_id` (`tugas_id`,`siswa_id`),
  ADD KEY `tugas_id_2` (`tugas_id`,`siswa_id`);

--
-- Indexes for table `el_pengajar`
--
ALTER TABLE `el_pengajar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nip` (`nip`),
  ADD KEY `nip_2` (`nip`);

--
-- Indexes for table `el_pengaturan`
--
ALTER TABLE `el_pengaturan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `el_pengumuman`
--
ALTER TABLE `el_pengumuman`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pengajar_id` (`pengajar_id`),
  ADD KEY `pengajar_id_2` (`pengajar_id`),
  ADD KEY `pengajar_id_3` (`pengajar_id`);

--
-- Indexes for table `el_pilihan`
--
ALTER TABLE `el_pilihan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pertanyaan_id` (`pertanyaan_id`),
  ADD KEY `pertanyaan_id_2` (`pertanyaan_id`,`kunci`);

--
-- Indexes for table `el_siswa`
--
ALTER TABLE `el_siswa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nis` (`nis`,`nama`,`status_id`),
  ADD KEY `nis_2` (`nis`,`nama`,`status_id`);

--
-- Indexes for table `el_soal`
--
ALTER TABLE `el_soal`
  ADD PRIMARY KEY (`id_soal`);

--
-- Indexes for table `el_tugas`
--
ALTER TABLE `el_tugas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mapel_id` (`mapel_id`,`pengajar_id`),
  ADD KEY `mapel_id_2` (`mapel_id`,`pengajar_id`);

--
-- Indexes for table `el_tugas_kelas`
--
ALTER TABLE `el_tugas_kelas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tugas_id` (`tugas_id`,`kelas_id`),
  ADD KEY `tugas_id_2` (`tugas_id`,`kelas_id`);

--
-- Indexes for table `el_tugas_kumpul`
--
ALTER TABLE `el_tugas_kumpul`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `el_tugas_pertanyaan`
--
ALTER TABLE `el_tugas_pertanyaan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tugas_id` (`tugas_id`),
  ADD KEY `tugas_id_2` (`tugas_id`);

--
-- Indexes for table `el_ujian`
--
ALTER TABLE `el_ujian`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `el_ujian_soal`
--
ALTER TABLE `el_ujian_soal`
  ADD PRIMARY KEY (`id_ujian_soal`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `el_absen`
--
ALTER TABLE `el_absen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `el_absen_siswa`
--
ALTER TABLE `el_absen_siswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `el_jawaban`
--
ALTER TABLE `el_jawaban`
  MODIFY `id_jawaban` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `el_kelas`
--
ALTER TABLE `el_kelas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `el_kelas_siswa`
--
ALTER TABLE `el_kelas_siswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `el_komentar`
--
ALTER TABLE `el_komentar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `el_login`
--
ALTER TABLE `el_login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `el_login_log`
--
ALTER TABLE `el_login_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT for table `el_mapel`
--
ALTER TABLE `el_mapel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `el_mapel_ajar`
--
ALTER TABLE `el_mapel_ajar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `el_mapel_kelas`
--
ALTER TABLE `el_mapel_kelas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `el_materi`
--
ALTER TABLE `el_materi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `el_materi_kelas`
--
ALTER TABLE `el_materi_kelas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `el_messages`
--
ALTER TABLE `el_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `el_nilai_tugas`
--
ALTER TABLE `el_nilai_tugas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `el_pengajar`
--
ALTER TABLE `el_pengajar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `el_pengumuman`
--
ALTER TABLE `el_pengumuman`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `el_pilihan`
--
ALTER TABLE `el_pilihan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `el_siswa`
--
ALTER TABLE `el_siswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `el_soal`
--
ALTER TABLE `el_soal`
  MODIFY `id_soal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `el_tugas`
--
ALTER TABLE `el_tugas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `el_tugas_kelas`
--
ALTER TABLE `el_tugas_kelas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `el_tugas_kumpul`
--
ALTER TABLE `el_tugas_kumpul`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `el_tugas_pertanyaan`
--
ALTER TABLE `el_tugas_pertanyaan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `el_ujian`
--
ALTER TABLE `el_ujian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `el_ujian_soal`
--
ALTER TABLE `el_ujian_soal`
  MODIFY `id_ujian_soal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- Database: `framework-master`
--
CREATE DATABASE IF NOT EXISTS `framework-master` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `framework-master`;

-- --------------------------------------------------------

--
-- Table structure for table `committees`
--

CREATE TABLE `committees` (
  `committee_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `committees`
--

INSERT INTO `committees` (`committee_id`, `name`) VALUES
(1, 'joni'),
(2, 'jaka'),
(3, 'dodo'),
(4, 'excel');

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `member_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`member_id`, `name`) VALUES
(1, 'john'),
(2, 'jesen'),
(3, 'jesi'),
(4, 'ira');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` decimal(12,5) NOT NULL,
  `sku` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `description`, `price`, `sku`, `image`) VALUES
(1, 'test', 'test product model', '50000.00000', '5000', '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`) VALUES
(1, 'jesen', 'jesen123', 'jesen@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `committees`
--
ALTER TABLE `committees`
  ADD PRIMARY KEY (`committee_id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`member_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `committees`
--
ALTER TABLE `committees`
  MODIFY `committee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `member_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Database: `mylms`
--
CREATE DATABASE IF NOT EXISTS `mylms` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `mylms`;

-- --------------------------------------------------------

--
-- Table structure for table `imgupload`
--

CREATE TABLE `imgupload` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `imgupload`
--

INSERT INTO `imgupload` (`id`, `userid`, `status`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `idUsers` int(11) NOT NULL,
  `uidUsers` tinytext NOT NULL,
  `emailUsers` tinytext NOT NULL,
  `pwdUsers` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`idUsers`, `uidUsers`, `emailUsers`, `pwdUsers`) VALUES
(1, 'Tino Rajen', 'orongdeveloper@gmail.com', '$2y$10$8mDTMO7exSIj1DNyosqYbeMNMRJ83KlG5fHrSyCJMTga67Sy2BVxW');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `imgupload`
--
ALTER TABLE `imgupload`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`idUsers`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `imgupload`
--
ALTER TABLE `imgupload`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `idUsers` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Database: `mysmkn`
--
CREATE DATABASE IF NOT EXISTS `mysmkn` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `mysmkn`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(64) NOT NULL,
  `username` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `email`) VALUES
(0, 'admin', '$2y$10$EX0L5MeIQldpkCuTZW.mjujTaj.Yy20IW0GOluecU/c.es.9r6E5.', 'admin@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `guru`
--

CREATE TABLE `guru` (
  `nip` int(64) NOT NULL,
  `email` varchar(255) NOT NULL,
  `nama_guru` varchar(128) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama_mapel` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `guru`
--

INSERT INTO `guru` (`nip`, `email`, `nama_guru`, `password`, `nama_mapel`) VALUES
(214748364, 'Dummy@gmail.com', 'Ahmad Saugi', '', 'Pendidikan Agama Islam'),
(214748365, 'zaidanline67@gmail.com', 'Saauky', '$2y$10$3qQ2TYrtQHy44LblPMexnu4ZQrCWD.dYh20P.sOL5cyo6Z48fJQEq', 'Matematika'),
(1819107728, 'imas@gmail.com', 'Imas Kartika', '$2y$10$wCSBYTaCpSJaEX/1VUo1p.YU88vbgr7PeW.j1OkmD2xnKjIbB7SD6', 'Matematika');

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `id` int(255) NOT NULL,
  `kelas` varchar(128) NOT NULL,
  `nama_siswa` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `materi`
--

CREATE TABLE `materi` (
  `id` int(11) NOT NULL,
  `nama_guru` varchar(128) NOT NULL,
  `nama_mapel` varchar(128) NOT NULL,
  `video` varchar(255) NOT NULL,
  `deskripsi` varchar(1024) NOT NULL,
  `kelas` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `materi`
--

INSERT INTO `materi` (`id`, `nama_guru`, `nama_mapel`, `video`, `deskripsi`, `kelas`) VALUES
(38, 'Saauky', 'Matematika', 'Matematika_-_Dummy_-_1.mp4', '                                        RG Squad, siapa yang pernah dengar kata aljabar? Ini merupakan satu cabang matematika dalam pemecahan masalah dengan menggunakan huruf-huruf untuk mewakili angka-angka. Berasal dari bahasa Arab, al-jabr yang artinya penyelesaian. Kamu tahu siapa penemunya? Ia merupakan cendikiawan bernama Al-Khawarizmi. Sekarang, mari kita simak lebih lanjut tentang definisi dan bentuk-bentuk aljabar secara lebih mendalam ya! s', 'X'),
(42, 'Saauky', 'Matematika', 'Matematika_-_Dummy_-_1.mp4', 'Dalam matematika dan ilmu komputer, Aljabar Boolean adalah struktur aljabar yang &quot;mencakup intisari&quot; operasi logika AND, OR, NOR, dan NAND dan juga teori himpunan untuk operasi union, interseksi dan komplemen. Penamaan Aljabar Boolean sendiri berasal dari nama seorang matematikawan asal Inggris, bernama George Boole.', 'X'),
(43, 'Saauky', 'Matematika', 'Matematika_-_Dummy_-_2.mp4', 'Aljabar linear adalah bidang studi matematika yang mempelajari sistem persamaan linear dan solusinya, vektor, serta transformasi linear. Matriks dan operasinya juga merupakan hal yang berkaitan erat dengan bidang aljabar linear.', 'XI'),
(44, 'Saauky', 'Matematika', 'Matematika_-_Dummy_3.mp4', 'Vektor merupakan kajian aljabar yang biasanya digunakan untuk memecahkan permasalahan fisika seperti gerak, gaya, dan sebagainya. ... Sebuah vektor bisa dinyatakan dalam bentuk geometri yang digambarkan sebagai sebuah ruas garis dengan arah tertentu dimana salah satunya merupakan pangkal dan satunya lagi merupakan ujung.', 'XI'),
(45, 'Saauky', 'Matematika', 'Matematika_-_Dummy_4.mp4', 'Vektor dalam matematika dan fisika adalah objek geometri yang memiliki besar dan arah. Vektor jika dilambangkan dengan tanda panah. Besar vektor proporsional dengan panjang panah dan arahnya bertepatan dengan arah panah. Vektor dapat melambangkan perpindahan dari titik A ke B. Vektor sering ditandai sebagai', 'XII'),
(46, 'Saauky', 'Matematika', 'Matematika_-_Dummy_5.mp4', 'Pecahan, atau disebut fraksi adalah istilah dalam matematika yang terdiri dari pembilang dan penyebut. Hakikat transaksi dalam bilangan pecahan adalah bagaimana cara menyederhanakan pembilang dan penyebut.', 'XII'),
(47, 'Zaaidan', 'IPA', 'IPA_-_Dummy_1.mp4', 'Fisika adalah salah satu disiplin akademik paling tua, mungkin yang tertua melalui astronomi yang juga termasuk di dalamnya.[6] Lebih dari dua milenia, fisika menjadi bagian dari Ilmu Alam bersama dengan kimia, biologi, dan cabang tertentu matematika, tetapi ketika munculnya revolusi ilmiah pada abad ke-17, ilmu alam berkembang sebagai program penelitian sendiri.[b] Fisika berkembang dengan banyak spesialisasi bidang ilmu lain, seperti biofisika dan kimia kuantum, dan batasan fisiknya tidak didefinisikan dengan jelas. Ilmu baru dalam fisika terkadang digunakan untuk menjelaskan mekanisme dasar sains lainnya[3] serta membuka jalan area penelitian lainnya seperti matematika dan filsafat.', 'X'),
(50, 'Zaaidan', 'IPA', 'IPA_-_Dummy_2.mp4', 'Kristalisasi adalah proses pembentukan bahan padat dari pengendapan larutan, melt, atau lebih jarang pengendapan langsung dari gas. Kristalisasi juga merupakan teknik pemisahan kimia antara bahan padat-cair, di mana terjadi perpindahan massa dari suat zat terlarut dari cairan larutan ke fase kristal padat', 'X'),
(51, 'Zaaidan', 'IPA', 'IPA_-_Dummy_3.mp4', 'Peleburan adalah proses reduksi bijih sehingga menjadi logam unsur yang dapat digunakan berbagai macam zat seperti karbid, hidrogen, logam aktif atau dengan cara elektrolisis. Pemilihan zat pereduksi ini tergantung dari kereaktifan masing-masing zat.', 'XI'),
(52, 'Zaaidan', 'IPA', 'IPA_-_Dummy_4.mp4', 'Pencairan, pelelehan atau Peleburan adalah proses yang menghasilkan perubahan fase zat dari padat ke cair. Energi internal dari zat padat meningkat mencapai temperatur tertentu saat zat ini berubah menjadi cair.Benda yang telah mencair sepenuhnya disebut benda cair.', 'XI'),
(53, 'Zaaidan', 'IPA', 'IPA_-_Dummy_5.mp4', 'Dalam ilmu fisika dan kimia, pembekuan adalah proses di mana cairan berubah menjadi padatan. Titik beku adalah temperatur di mana hal ini terjadi. Peleburan, adalah proses kebalikan dari pembekuan di mana padatan berubah manjadi cairan. Pada sebagian besar zat, titik beku dan titik lebur biasanya sama.', 'XII'),
(54, 'Zaaidan', 'IPA', 'IPA_-_Dummy_6.mp4', 'Teknologi pembekuan makanan adalah teknologi mengawetkan makanan dengan menurunkan temperaturnya hingga di bawah titik beku air.', 'XII'),
(55, 'Khaairan', 'Bahasa Inggris', 'Inggris_-_Dummy_1.mp4', 'Bahasa Inggris adalah bahasa Jermanik yang pertama kali dituturkan di Inggris pada Abad Pertengahan Awal dan saat ini merupakan bahasa yang paling umum digunakan di seluruh dunia.[4] Bahasa Inggris dituturkan sebagai bahasa pertama oleh mayoritas penduduk di berbagai negara, termasuk Britania Raya, Irlandia, Amerika Serikat, Kanada, Australia, Selandia Baru, dan sejumlah negara-negara Karibia; serta menjadi bahasa resmi di hampir 60 negara berdaulat. Bahasa Inggris adalah bahasa ibu ketiga yang paling banyak dituturkan di seluruh dunia, setelah bahasa Mandarin dan bahasa Spanyol.[5] Bahasa Inggris juga digunakan sebagai bahasa kedua dan bahasa resmi oleh Uni Eropa, Negara Persemakmuran, dan Perserikatan Bangsa-Bangsa, serta beragam organisasi lainnya.', 'X'),
(56, 'Khaairan', 'Bahasa Inggris', 'Inggris_-_Dummy_2.mp4', 'Bahasa Inggris berkembang pertama kali di Kerajaan Anglo-Saxon Inggris dan di wilayah yang saat ini membentuk Skotlandia tenggara. Setelah meluasnya pengaruh Britania Raya pada abad ke-17 dan ke-20 melalui Imperium Britania, bahasa Inggris tersebar luas di seluruh dunia.[6][7][8] Di samping itu, luasnya penggunaan bahasa Inggris juga disebabkan oleh penyebaran kebudayaan dan teknologi Amerika Serikat yang mendominasi di sepanjang abad ke-20.[9] Hal-hal tersebut telah menyebabkan bahasa Inggris saat ini menjadi bahasa utama dan secara tidak resmi (de facto) dianggap sebagai lingua franca di berbagai belahan dunia.[10][11]', 'X'),
(57, 'Khaairan', 'Bahasa Inggris', 'Inggris_-_Dummy_3.mp4', 'Menurut sejarahnya, bahasa Inggris berasal dari peleburan beragam dialek terkait, yang saat ini secara kolektif dikenal sebagai bahasa Inggris Kuno, yang dibawa ke pantai timur Pulau Britania oleh pendatang Jermanik (Anglo-Saxons) pada abad ke-5; kata English\' berasal dari nama Angles.[12] Suku Anglo-Saxons ini sendiri berasal dari wilayah Angeln (saat ini Schleswig-Holstein, Jerman). Bahasa Inggris awal juga dipengaruhi oleh bahasa Norse Kuno setelah Viking menaklukkan Inggris pada abad ke-9 dan ke-10.', 'XI'),
(58, 'Khaairan', 'Bahasa Inggris', 'Inggris_-_Dummy_4.mp4', 'Penaklukan Normandia terhadap Inggris pada abad ke-11 menyebabkan bahasa Inggris juga mendapat pengaruh dari bahasa Prancis Norman, dan kosakata serta ejaan dalam bahasa Inggris mulai dipengaruhi oleh bahasa Latin Romawi (meskipun bahasa Inggris sendiri bukanlah rumpun bahasa Romawi),[13][14] yang kemudian dikenal dengan bahasa Inggris Pertengahan. Pergeseran Vokal yang dimulai di Inggris bagian selatan pada abad ke-15 adalah salah satu peristiwa bersejarah yang menandai peralihan bahasa Inggris Pertengahan menjadi bahasa Inggris Modern.', 'XI'),
(59, 'Khaairan', 'Bahasa Inggris', 'Inggris_-_Dummy_5.mp4', 'Selain Anglo-Saxons dan Prancis Norman, sejumlah besar kata dalam bahasa Inggris juga berakar dari bahasa Latin, karena Latin adalah lingua franca Gereja Kristen dan bahasa utama di kalangan intelektual Eropa,[15] dan telah menjadi dasar kosakata bagi bahasa Inggris modern.', 'XII'),
(60, 'Khaairan', 'Bahasa Inggris', 'Inggris_-_Dummy_6.mp4', 'Karena telah mengalami perpaduan beragam kata dari berbagai bahasa di sepanjang sejarah, bahasa Inggris modern memiliki kosakata yang sangat banyak, dengan pengejaan yang kompleks dan tidak teratur (irregular), khususnya vokal. Bahasa Inggris modern tidak hanya merupakan perpaduan dari bahasa-bahasa Eropa, tetapi juga dari berbagai bahasa di seluruh dunia. Oxford English Dictionary memuat daftar lebih dari 250.000 kata berbeda, tidak termasuk istilah-istilah teknis, sains, dan bahasa gaul yang jumlahnya juga sangat banyak.[16][17]', 'XII'),
(61, 'Khairi Firdaus', 'Bahasa Indonesia', 'Indonesia_-_Dummy_1.mp4', 'Bahasa Indonesia adalah bahasa Melayu yang dijadikan sebagai bahasa resmi Republik Indonesia[1] dan bahasa persatuan bangsa Indonesia.[2] Bahasa Indonesia diresmikan penggunaannya setelah Proklamasi Kemerdekaan Indonesia, tepatnya sehari sesudahnya, bersamaan dengan mulai berlakunya konstitusi. Di Timor Leste, bahasa Indonesia berstatus sebagai bahasa kerja.', 'X'),
(62, 'Khairi Firdaus', 'Bahasa Indonesia', 'Indonesia_-_Dummy_2.mp4', 'Dari sudut pandang linguistik, bahasa Indonesia adalah salah satu dari banyak varietas bahasa Melayu.[3] Dasar yang dipakai sebagai dasar bahasa Indonesia baku adalah bahasa Melayu Tinggi (&quot;Riau&quot;).[4][5] Dalam perkembangannya, ia mengalami perubahan akibat penggunaannya sebagai bahasa kerja di lingkungan administrasi kolonial dan berbagai proses pembakuan sejak awal abad ke-20. Penamaan &quot;bahasa Indonesia&quot; diawali sejak dicanangkannya Sumpah Pemuda, 28 Oktober 1928, untuk menghindari kesan &quot;imperialisme bahasa&quot; apabila nama bahasa Melayu tetap digunakan.[6] Proses ini menyebabkan berbedanya bahasa Indonesia saat ini dari varian bahasa Melayu yang digunakan di Riau maupun Semenanjung Malaya. Hingga saat ini, bahasa Indonesia merupakan bahasa yang hidup, yang terus menghasilkan kata-kata baru, baik melalui penciptaan maupun penyerapan dari bahasa daerah dan bahasa asing.', 'X'),
(63, 'Khairi Firdaus', 'Bahasa Indonesia', 'Indonesia_-_Dummy_3.mp4', 'Meskipun dipahami dan dituturkan oleh lebih dari 90% warga Indonesia, bahasa Indonesia bukanlah bahasa ibu bagi kebanyakan penuturnya. Sebagian besar warga Indonesia menggunakan salah satu dari 748 bahasa yang ada di Indonesia sebagai bahasa ibu.[7] Istilah &quot;bahasa Indonesia&quot; paling umum dikaitkan dengan bahasa baku yang digunakan dalam situasi formal.[4] Ragam bahasa baku tersebut berhubungan diglosik dengan bentuk-bentuk bahasa Melayu vernacular yang digunakan sebagai peranti komunikasi sehari-hari.[4] Artinya, penutur bahasa Indonesia kerap kali menggunakan versi sehari-hari (colloquial) dan/atau mencampuradukkan dengan dialek Melayu lainnya atau bahasa ibunya. Meskipun demikian, bahasa Indonesia digunakan sangat luas di perguruan-perguruan, di media massa, sastra, perangkat lunak, surat-menyurat resmi, dan berbagai forum publik lainnya,[8] sehingga dapatlah dikatakan bahwa bahasa Indonesia digunakan oleh semua warga Indonesia.', 'XI'),
(64, 'Khairi Firdaus', 'Bahasa Indonesia', 'Indonesia_-_Dummy_4.mp4', 'Aksara pertama dalam bahasa Melayu atau Jawi ditemukan di pesisir tenggara Pulau Sumatra, menunjukkan bahwa bahasa ini menyebar ke berbagai tempat di Nusantara dari wilayah ini, berkat penggunaannya oleh Kerajaan Sriwijaya yang menguasai jalur perdagangan. Istilah Melayu atau sebutan bagi wilayahnya sebagai Malaya sendiri berasal dari Kerajaan Malayu yang bertempat di Batang Hari, Jambi.', 'XI'),
(65, 'Khairi Firdaus', 'Bahasa Indonesia', 'Indonesia_-_Dummy_5.mp4', 'stilah Melayu atau Malayu berasal dari Kerajaan Malayu, sebuah kerajaan Hindu-Buddha pada abad ke-7 di hulu sungai Batanghari, Jambi di pulau Sumatra, jadi secara geografis semula hanya mengacu kepada wilayah kerajaan tersebut yang merupakan sebagian dari wilayah pulau Sumatra. Dalam perkembangannya, pemakaian istilah Melayu mencakup wilayah geografis yang lebih luas dari wilayah Kerajaan Malayu tersebut, mencakup negeri-negeri di pulau Sumatra sehingga pulau tersebut disebut juga Bumi Melayu seperti disebutkan dalam Kakawin Nagarakretagama.', 'XII'),
(67, 'Khairi Firdaus', 'Bahasa Indonesia', 'Indonesia_-_Dummy_6.mp4', 'Ibu kota Kerajaan Melayu semakin mundur ke pedalaman karena serangan Sriwijaya dan masyarakatnya diaspora keluar Bumi Melayu, belakangan masyarakat pendukungnya yang mundur ke pedalaman berasimilasi ke dalam masyarakat Minangkabau menjadi klan Malayu (suku Melayu Minangkabau) yang merupakan salah satu marga di Sumatra Barat. Sriwijaya berpengaruh luas hingga ke Filipina membawa penyebaran Bahasa Melayu semakin meluas, tampak dalam prasasti Keping Tembaga Laguna.\r\n\r\nBahasa Melayu kuno yang berkembang di Bumi Melayu tersebut berlogat &quot;o&quot; seperti Melayu Jambi, Minangkabau, Kerinci, Palembang dan Bengkulu. Semenanjung Malaka dalam Nagarakretagama disebut Hujung Medini artinya Semenanjung Medini.', 'XII'),
(69, 'Ahmad Saugi', 'Pendidikan Agama Islam', 'Agama_Islam_-_Dummy_-_1.mp4', 'Islam (bahasa Arab: ???????, translit. al-isl?m?, Tentang suara ini dengarkan) adalah salah satu agama dari kelompok agama yang diterima oleh seorang nabi (agama samawi) yang mengajarkan monoteisme tanpa kompromi, iman terhadap wahyu, iman terhadap akhir zaman, dan tanggung jawab.[1] Bersama para pengikut Yudaisme dan Kekristenan, seluruh muslim–pengikut ajaran Islam–adalah anak turun Ibrahim.[2] Islam diikuti oleh 1,8 miliar orang di seluruh dunia sehingga menjadi agama terbesar kedua setelah Kristen.[3]', 'X'),
(70, 'Ahmad Saugi', 'Pendidikan Agama Islam', 'Agama_Islam_-_Dummy_-_2.mp4', 'Kata “isl?m” berasal dari bahasa Arab aslama - yuslimu dengan arti semantik sebagai berikut: tunduk dan patuh (khadha‘a wa istaslama), berserah diri, menyerahkan, memasrahkan (sallama), mengikuti (atba‘a), menunaikan, menyampaikan (add?), masuk dalam kedamaian, keselamatan, atau kemurnian (dakhala fi al-salm au al-silm au al-sal?m).[4] Dari istilah-istilah lain yang akar katanya sama, “isl?m” berhubungan erat dengan makna keselamatan, kedamaian, dan kemurnian.[5]', 'X'),
(71, 'Ahmad Saugi', 'Pendidikan Agama Islam', 'Agama_Islam_-_Dummy_-_3.mp4', 'Islam dapat juga disebut dengan iman, millah, dan syariah dalam pengertiannya sebagai aturan yang diturunkan oleh Allah melalui para utusan yang mencakup kepercayaan, keyakinan, adab, akhlak, perintah, dan larangan.[9] Agama Islam berdasarkan kewajiban untuk berserah diri dan menunaikan ajarannya disebut islam; jika dilihat berdasarkan kepercayaan terhadap Allah dan yang Dia turunkan, maka disebut iman; karena Islam itu diktatif dan terdokumentasikan, maka disebut millah; dan karena sumber hukumnya adalah Allah, maka disebut syariah.[9]', 'XI'),
(72, 'Ahmad Saugi', 'Pendidikan Agama Islam', 'Agama_Islam_-_Dummy_-_4.mp4', 'Allah, menurut ajaran Islam, adalah satu-satunya Tuhan yang berhak disembah, memiliki nama-nama terbaik, dan memiliki sifat dan karakter tertinggi.[11] Ajaran monoteisme Islam disebut tauhid, yang didefinisikan sebagai pengesaan Allah dalam hal-hal yang menjadi kekhususan Tuhan dan yang Dia wajibkan.[12] Pengesaan Allah dalam hal-hal kekhususan Tuhan dibagi menjadi dua bahasan: tauhid rububiyah dan tauhid asma\' wash-shifat, sedangkan pengesaan Allah dalam hal-hal yang Dia wajibkan dibahas dalam tauhid uluhiyah.[13]', 'XI'),
(73, 'Ahmad Saugi', 'Pendidikan Agama Islam', 'Agama_Islam_-_Dummy_-_4.mp4', 'Dalam tauhid rububiyah, Allah diakui sebagai satu-satunya Rabb (Yang Menguasai), sehingga semua selain Allah adalah ‘abd (hamba/budak/yang dikuasai).[14] Allah adalah Rabb Yang Berkuasa dalam penciptaan, pengurusan, dan kerajaan alam semesta.[15] Allah sebagai satu-satunya Pencipta adalah juga Yang Memberi rezeki, Yang Menghidupkan, Yang Mematikan, serta Yang Memberi kebaikan dan keburukan.[16] Allah yang mengurus segala sesuatu; semua urusan yang Dia tangani adalah kebaikan; dan Allah Mahakuasa terhadap apa yang Dia kehendaki.[16] Dalilnya adalah ayat dalam Alquran, “Segala penciptaan dan urusan menjadi hak-Nya.”[Al-A\'raf:54][15]', 'XII'),
(76, 'Ahmad Saugi', 'Pendidikan Agama Islam', 'Agama_Islam_-_Dummy_-_6.mp4', 'Islam adalah salah satu agama dari kelompok agama yang diterima oleh seorang nabi yang mengajarkan monoteisme tanpa kompromi, iman terhadap wahyu, iman terhadap akhir zaman, dan tanggung jawab. Bersama para pengikut Yudaisme dan Kekristenan, seluruh muslim–pengikut ajaran Islam–adalah anak turun Ibrahim.', 'XII'),
(77, 'Saauky', 'Matematika', 'Agama_Islam_-_Dummy_-_6.mp4', 'Test', 'X');

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `id` int(64) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(128) NOT NULL,
  `image` varchar(255) NOT NULL,
  `is_active` int(1) NOT NULL,
  `date_created` int(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`id`, `nama`, `password`, `email`, `image`, `is_active`, `date_created`) VALUES
(39, 'Syaauqi Zaaidan', '$2y$10$djI2M/FQH2k3H7b6tLK5X.MZG1R.wrARoR6NerH3tsScNnsNCnexa', 'zaidanline67@gmail.com', '73349393_156861225523800_2119508204152772215_n_(1)6.jpg', 1, 1586163321),
(47, 'Tino Rajen', '$2y$10$3bh3rfBcDqGJgyH4zC.reub4dM7WC/GCPKJgTRBjDKDz..Y3S6MB6', 'engelbertushendro@gmail.com', 'default.jpg', 1, 1682511069);

-- --------------------------------------------------------

--
-- Table structure for table `token`
--

CREATE TABLE `token` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `guru`
--
ALTER TABLE `guru`
  ADD PRIMARY KEY (`nip`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `materi`
--
ALTER TABLE `materi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `token`
--
ALTER TABLE `token`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `materi`
--
ALTER TABLE `materi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `siswa`
--
ALTER TABLE `siswa`
  MODIFY `id` int(64) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `token`
--
ALTER TABLE `token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin DEFAULT NULL,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Dumping data for table `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{\"angular_direct\":\"direct\",\"snap_to_grid\":\"off\",\"relation_lines\":\"true\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

--
-- Dumping data for table `pma__export_templates`
--

INSERT INTO `pma__export_templates` (`id`, `username`, `export_type`, `template_name`, `template_data`) VALUES
(1, 'root', 'server', 'elearning', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"db_select[]\":[\"db_gudang\",\"elearning\",\"framework-master\",\"mylms\",\"mysmkn\",\"phpmyadmin\",\"simplemvc\",\"test\",\"uniquedeveloper\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@SERVER@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Structure of table @TABLE@\",\"latex_structure_continued_caption\":\"Structure of table @TABLE@ (continued)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Content of table @TABLE@\",\"latex_data_continued_caption\":\"Content of table @TABLE@ (continued)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"yaml_structure_or_data\":\"data\",\"\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_drop_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_procedure_function\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"mysmkn\",\"table\":\"admin\"},{\"db\":\"mysmkn\",\"table\":\"guru\"},{\"db\":\"mysmkn\",\"table\":\"kelas\"},{\"db\":\"mysmkn\",\"table\":\"token\"},{\"db\":\"mysmkn\",\"table\":\"siswa\"},{\"db\":\"mysmkn\",\"table\":\"materi\"},{\"db\":\"db_gudang\",\"table\":\"barang\"},{\"db\":\"db_gudang\",\"table\":\"sektor\"},{\"db\":\"db_gudang\",\"table\":\"users\"},{\"db\":\"simplemvc\",\"table\":\"users\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin DEFAULT NULL,
  `data_sql` longtext COLLATE utf8_bin DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2023-05-19 13:06:59', '{\"Console\\/Mode\":\"collapse\",\"Server\\/hide_db\":\"\",\"Server\\/only_db\":\"\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `simplemvc`
--
CREATE DATABASE IF NOT EXISTS `simplemvc` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `simplemvc`;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`) VALUES
(1, 'kakabotek', '123456', 'engelbertushendro@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;

-- --------------------------------------------------------

--
-- Table structure for table `anggota`
--

CREATE TABLE `anggota` (
  `ID_Anggota` int(11) NOT NULL,
  `Nama` varchar(50) DEFAULT NULL,
  `Alamat` varchar(100) DEFAULT NULL,
  `Nomor_Telepon` varchar(15) DEFAULT NULL,
  `Saldo_Simpanan` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `anggota`
--

INSERT INTO `anggota` (`ID_Anggota`, `Nama`, `Alamat`, `Nomor_Telepon`, `Saldo_Simpanan`) VALUES
(0, 'John Doe', 'Jl. Jend. Sudirman', '081234567890', '1000.00'),
(2, 'toktok', 'tiktik', '09876543221', '5000000.00');

-- --------------------------------------------------------

--
-- Table structure for table `pinjaman`
--

CREATE TABLE `pinjaman` (
  `ID_Pinjaman` int(11) NOT NULL,
  `ID_Anggota` int(11) DEFAULT NULL,
  `Jumlah_Pinjaman` decimal(10,2) DEFAULT NULL,
  `Tanggal_Pengajuan` date DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  `Jumlah_Angsuran` int(11) DEFAULT NULL,
  `Jumlah_Angsuran_Terbayar` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `simpanan`
--

CREATE TABLE `simpanan` (
  `ID_Simpanan` int(11) NOT NULL,
  `ID_Anggota` int(11) DEFAULT NULL,
  `Jumlah_Simpanan` decimal(10,2) DEFAULT NULL,
  `Tanggal_Simpanan` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `ID_Transaksi` int(11) NOT NULL,
  `ID_Anggota` int(11) DEFAULT NULL,
  `ID_Pinjaman` int(11) DEFAULT NULL,
  `ID_Simpanan` int(11) DEFAULT NULL,
  `Jumlah_Transaksi` decimal(10,2) DEFAULT NULL,
  `Tanggal_Transaksi` date DEFAULT NULL,
  `Jenis_Transaksi` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`ID_Anggota`);

--
-- Indexes for table `pinjaman`
--
ALTER TABLE `pinjaman`
  ADD PRIMARY KEY (`ID_Pinjaman`),
  ADD KEY `ID_Anggota` (`ID_Anggota`);

--
-- Indexes for table `simpanan`
--
ALTER TABLE `simpanan`
  ADD PRIMARY KEY (`ID_Simpanan`),
  ADD KEY `ID_Anggota` (`ID_Anggota`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`ID_Transaksi`),
  ADD KEY `ID_Anggota` (`ID_Anggota`),
  ADD KEY `ID_Pinjaman` (`ID_Pinjaman`),
  ADD KEY `ID_Simpanan` (`ID_Simpanan`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pinjaman`
--
ALTER TABLE `pinjaman`
  ADD CONSTRAINT `pinjaman_ibfk_1` FOREIGN KEY (`ID_Anggota`) REFERENCES `anggota` (`ID_Anggota`);

--
-- Constraints for table `simpanan`
--
ALTER TABLE `simpanan`
  ADD CONSTRAINT `simpanan_ibfk_1` FOREIGN KEY (`ID_Anggota`) REFERENCES `anggota` (`ID_Anggota`);

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`ID_Anggota`) REFERENCES `anggota` (`ID_Anggota`),
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`ID_Pinjaman`) REFERENCES `pinjaman` (`ID_Pinjaman`),
  ADD CONSTRAINT `transaksi_ibfk_3` FOREIGN KEY (`ID_Simpanan`) REFERENCES `simpanan` (`ID_Simpanan`);
--
-- Database: `uniquedeveloper`
--
CREATE DATABASE IF NOT EXISTS `uniquedeveloper` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `uniquedeveloper`;

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `aid` int(255) NOT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `ans_id` int(250) DEFAULT NULL,
  `course_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `answers`
--

INSERT INTO `answers` (`aid`, `answer`, `ans_id`, `course_name`) VALUES
(1, 'Home Tool Markup Language', 1, 'html'),
(2, 'Hyperlinks and Text Markup Language', 1, 'html'),
(3, ' Hyper Text Markup Language', 1, 'html'),
(4, ' Hyper Train Markup Language', 1, 'html'),
(5, '  Mozilla', 2, 'html'),
(6, '  Google', 2, 'html'),
(7, 'Microsoft', 2, 'html'),
(8, 'W3C', 2, 'html'),
(9, '<head>', 3, 'html'),
(10, '<heading>', 3, 'html'),
(11, '<h6>', 3, 'html'),
(12, '<h1>', 3, 'html'),
(13, '<lb>', 4, 'html'),
(14, '<br>', 4, 'html'),
(15, '<break>', 4, 'html'),
(16, '<bk>', 4, 'html'),
(17, 'programming language', 5, 'java'),
(18, 'web designing language', 5, 'java'),
(19, 'OOPS language', 5, 'java'),
(20, 'general purpose language', 5, 'java');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(4) NOT NULL,
  `cat_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `cat_name`) VALUES
(1, 'php'),
(2, 'java'),
(3, 'javascript'),
(4, 'python'),
(5, 'android'),
(6, 'jQuery'),
(8, 'IR'),
(9, 'hadoop'),
(10, 'hadoop'),
(11, 'comedy nights'),
(12, 'css'),
(13, 'spring');

-- --------------------------------------------------------

--
-- Table structure for table `commentsection`
--

CREATE TABLE `commentsection` (
  `cid` int(11) NOT NULL,
  `uid` varchar(120) NOT NULL,
  `date` datetime NOT NULL,
  `message` text NOT NULL,
  `video_id` int(255) NOT NULL,
  `video_path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `commentsection`
--

INSERT INTO `commentsection` (`cid`, `uid`, `date`, `message`, `video_id`, `video_path`) VALUES
(153, 'sunil yadav', '2019-04-15 19:05:17', '5', 50, 'comedy knights'),
(155, 'sunil', '2021-03-13 15:50:57', 'very helpful', 51, '');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `topic_name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `course_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `topic_name`, `description`, `course_name`) VALUES
(1, 'JAVA_HOME', '<h1 style=\"margin-left:200px\"><span style=\"color:#3498db\"><strong>Java Tutorial</strong></span></h1>\r\n\r\n<p>Java is a high-level programming language originally developed by Sun Microsystems and released in 1995. Java runs on a variety of platforms, such as Windows, Mac OS, and the various versions of UNIX. This tutorial gives a complete understanding of Java. This reference will take you through simple and practical approaches while learning Java Programming language.</p>\r\n\r\n<h1>Audience</h1>\r\n\r\n<p>This tutorial has been prepared for the beginners to help them understand the basic to advanced concepts related to Java Programming language.</p>\r\n\r\n<h1>Prerequisites</h1>\r\n\r\n<p>Before you start practicing various types of examples given in this reference, we assume that you are already aware about computer programs and computer programming languages.</p>\r\n', 'java'),
(2, 'Java - Overview', '<h1 style=\"margin-left:160px\"><span style=\"color:#3498db\"><strong>Java - Overview</strong></span></h1>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Java programming language was originally developed by Sun Microsystems which was initiated by James Gosling and released in 1995 as core component of Sun Microsystems&#39; Java platform (Java 1.0 [J2SE]).</p>\r\n\r\n<p>The latest release of the Java Standard Edition is Java SE 8. With the advancement of Java and its widespread popularity, multiple configurations were built to suit various types of platforms. For example: J2EE for Enterprise Applications, J2ME for Mobile Applications.</p>\r\n\r\n<p>The new J2 versions were renamed as Java SE, Java EE, and Java ME respectively. Java is guaranteed to be&nbsp;<strong>Write Once, Run Anywhere.</strong></p>\r\n\r\n<p>Java is &minus;</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>Object Oriented</strong>&nbsp;&minus; In Java, everything is an Object. Java can be easily extended since it is based on the Object model.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Platform Independent</strong>&nbsp;&minus; Unlike many other programming languages including C and C++, when Java is compiled, it is not compiled into platform specific machine, rather into platform independent byte code. This byte code is distributed over the web and interpreted by the Virtual Machine (JVM) on whichever platform it is being run on.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Simple</strong>&nbsp;&minus; Java is designed to be easy to learn. If you understand the basic concept of OOP Java, it would be easy to master.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Secure</strong>&nbsp;&minus; With Java&#39;s secure feature it enables to develop virus-free, tamper-free systems. Authentication techniques are based on public-key encryption.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Architecture-neutral</strong>&nbsp;&minus; Java compiler generates an architecture-neutral object file format, which makes the compiled code executable on many processors, with the presence of Java runtime system.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Portable</strong>&nbsp;&minus; Being architecture-neutral and having no implementation dependent aspects of the specification makes Java portable. Compiler in Java is written in ANSI C with a clean portability boundary, which is a POSIX subset.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Robust</strong>&nbsp;&minus; Java makes an effort to eliminate error prone situations by emphasizing mainly on compile time error checking and runtime checking.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Multithreaded</strong>&nbsp;&minus; With Java&#39;s multithreaded feature it is possible to write programs that can perform many tasks simultaneously. This design feature allows the developers to construct interactive applications that can run smoothly.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Interpreted</strong>&nbsp;&minus; Java byte code is translated on the fly to native machine instructions and is not stored anywhere. The development process is more rapid and analytical since the linking is an incremental and light-weight process.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>High Performance</strong>&nbsp;&minus; With the use of Just-In-Time compilers, Java enables high performance.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Distributed</strong>&nbsp;&minus; Java is designed for the distributed environment of the internet.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Dynamic</strong>&nbsp;&minus; Java is considered to be more dynamic than C or C++ since it is designed to adapt to an evolving environment. Java programs can carry extensive amount of run-time information that can be used to verify and resolve accesses to objects on run-time.</p>\r\n	</li>\r\n</ul>\r\n\r\n<h2>History of Java</h2>\r\n\r\n<p>James Gosling initiated Java language project in June 1991 for use in one of his many set-top box projects. The language, initially called &lsquo;Oak&rsquo; after an oak tree that stood outside Gosling&#39;s office, also went by the name &lsquo;Green&rsquo; and ended up later being renamed as Java, from a list of random words.</p>\r\n\r\n<p>Sun released the first public implementation as Java 1.0 in 1995. It promised&nbsp;<strong>Write Once, Run Anywhere</strong>&nbsp;(WORA), providing no-cost run-times on popular platforms.</p>\r\n\r\n<p>On 13 November, 2006, Sun released much of Java as free and open source software under the terms of the GNU General Public License (GPL).</p>\r\n\r\n<p>On 8 May, 2007, Sun finished the process, making all of Java&#39;s core code free and open-source, aside from a small portion of code to which Sun did not hold the copyright.</p>\r\n\r\n<h2>Tools You Will Need</h2>\r\n\r\n<p>For performing the examples discussed in this tutorial, you will need a Pentium 200-MHz computer with a minimum of 64 MB of RAM (128 MB of RAM recommended).</p>\r\n\r\n<p>You will also need the following softwares &minus;</p>\r\n\r\n<ul>\r\n	<li>Linux 7.1 or Windows xp/7/8 operating system</li>\r\n	<li>Java JDK 8</li>\r\n	<li>Microsoft Notepad or any other text editor</li>\r\n</ul>\r\n\r\n<p>This tutorial will provide the necessary skills to create GUI, networking, and web applications using Java.</p>\r\n\r\n<h2>What is Next?</h2>\r\n\r\n<p>The next chapter will guide you to how you can obtain Java and its documentation. Finally, it instructs you on how to install Java and prepare an environment to develop Java applications.</p>\r\n', 'java'),
(33, 'Java - Environment Setup', '<h1 style=\"margin-left:120px\"><span style=\"font-size:24px\"><span style=\"color:#3498db\"><strong>Java - Environment Setup</strong></span></span></h1>\r\n\r\n<p>In this chapter, we will discuss on the different aspects of setting up a congenial environment for Java.</p>\r\n\r\n<h2>Local Environment Setup</h2>\r\n\r\n<p>If you are still willing to set up your environment for Java programming language, then this section guides you on how to download and set up Java on your machine. Following are the steps to set up the environment.</p>\r\n\r\n<p>Java SE is freely available from the link&nbsp;<a href=\"https://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html\" rel=\"nofollow\" target=\"_blank\">Download Java</a>. You can download a version based on your operating system.</p>\r\n\r\n<p>Follow the instructions to download Java and run the&nbsp;<strong>.exe</strong>&nbsp;to install Java on your machine. Once you installed Java on your machine, you will need to set environment variables to point to correct installation directories &minus;</p>\r\n\r\n<h3>Setting Up the Path for Windows</h3>\r\n\r\n<p>Assuming you have installed Java in&nbsp;<em>c:Program Filesjavajdk</em>&nbsp;directory &minus;</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Right-click on &#39;My Computer&#39; and select &#39;Properties&#39;.</p>\r\n	</li>\r\n	<li>\r\n	<p>Click the &#39;Environment variables&#39; button under the &#39;Advanced&#39; tab.</p>\r\n	</li>\r\n	<li>\r\n	<p>Now, alter the &#39;Path&#39; variable so that it also contains the path to the Java executable. Example, if the path is currently set to &#39;C:WINDOWSSYSTEM32&#39;, then change your path to read &#39;C:WINDOWSSYSTEM32;c:Program Filesjavajdkin&#39;.</p>\r\n	</li>\r\n</ul>\r\n\r\n<h3>Setting Up the Path for Linux, UNIX, Solaris, FreeBSD</h3>\r\n\r\n<p>Environment variable PATH should be set to point to where the Java binaries have been installed. Refer to your shell documentation, if you have trouble doing this.</p>\r\n\r\n<p>Example, if you use&nbsp;<em>bash</em>&nbsp;as your shell, then you would add the following line to the end of your &#39;.bashrc: export PATH = /path/to/java:$PATH&#39;</p>\r\n\r\n<h2>Popular Java Editors</h2>\r\n\r\n<p>To write your Java programs, you will need a text editor. There are even more sophisticated IDEs available in the market. But for now, you can consider one of the following &minus;</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>Notepad</strong>&nbsp;&minus; On Windows machine, you can use any simple text editor like Notepad (Recommended for this tutorial), TextPad.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Netbeans</strong>&nbsp;&minus; A Java IDE that is open-source and free which can be downloaded from&nbsp;<a href=\"https://www.netbeans.org/index.html\" rel=\"nofollow\" target=\"_blank\">https://www.netbeans.org/index.html</a>.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Eclipse</strong>&nbsp;&minus; A Java IDE developed by the eclipse open-source community and can be downloaded from&nbsp;<a href=\"https://www.eclipse.org/\" rel=\"nofollow\" target=\"_blank\">https://www.eclipse.org/</a>.</p>\r\n	</li>\r\n</ul>\r\n\r\n<h2>What is Next?</h2>\r\n\r\n<p>Next chapter will teach you how to write and run your first Java program and some of the important basic syntaxes in Java needed for developing applications.</p>\r\n', 'java'),
(34, 'Java - Basic Syntax', '<h1 style=\"margin-left:80px\"><span style=\"color:#3498db\"><span style=\"font-size:24px\">Java - Basic Syntax</span></span></h1>\r\n\r\n<p>When we consider a Java program, it can be defined as a collection of objects that communicate via invoking each other&#39;s methods. Let us now briefly look into what do class, object, methods, and instance variables mean.</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>Object</strong>&nbsp;&minus; Objects have states and behaviors. Example: A dog has states - color, name, breed as well as behavior such as wagging their tail, barking, eating. An object is an instance of a class.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Class</strong>&nbsp;&minus; A class can be defined as a template/blueprint that describes the behavior/state that the object of its type supports.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Methods</strong>&nbsp;&minus; A method is basically a behavior. A class can contain many methods. It is in methods where the logics are written, data is manipulated and all the actions are executed.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Instance Variables</strong>&nbsp;&minus; Each object has its unique set of instance variables. An object&#39;s state is created by the values assigned to these instance variables.</p>\r\n	</li>\r\n</ul>\r\n\r\n<h2>First Java Program</h2>\r\n\r\n<p>Let us look at a simple code that will print the words&nbsp;<strong><em>Hello World</em></strong>.</p>\r\n\r\n<h3>Example</h3>\r\n\r\n<p><a href=\"http://tpcg.io/tv5b2l\" rel=\"nofollow\" target=\"_blank\">&nbsp;Live Demo</a></p>\r\n\r\n<pre>\r\npublic class MyFirstJavaProgram {\r\n\r\n   /* This is my first java program.\r\n    * This will print &#39;Hello World&#39; as the output\r\n    */\r\n\r\n   public static void main(String []args) {\r\n      System.out.println(&quot;Hello World&quot;); // prints Hello World\r\n   }\r\n}</pre>\r\n\r\n<p>Let&#39;s look at how to save the file, compile, and run the program. Please follow the subsequent steps &minus;</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Open notepad and add the code as above.</p>\r\n	</li>\r\n	<li>\r\n	<p>Save the file as: MyFirstJavaProgram.java.</p>\r\n	</li>\r\n	<li>\r\n	<p>Open a command prompt window and go to the directory where you saved the class. Assume it&#39;s C:.</p>\r\n	</li>\r\n	<li>\r\n	<p>Type &#39;javac MyFirstJavaProgram.java&#39; and press enter to compile your code. If there are no errors in your code, the command prompt will take you to the next line (Assumption : The path variable is set).</p>\r\n	</li>\r\n	<li>\r\n	<p>Now, type &#39; java MyFirstJavaProgram &#39; to run your program.</p>\r\n	</li>\r\n	<li>\r\n	<p>You will be able to see &#39; Hello World &#39; printed on the window.</p>\r\n	</li>\r\n</ul>\r\n\r\n<h3>Output</h3>\r\n\r\n<pre>\r\nC:&gt; javac MyFirstJavaProgram.java\r\nC:&gt; java MyFirstJavaProgram \r\nHello World\r\n</pre>\r\n\r\n<h2>Basic Syntax</h2>\r\n\r\n<p>About Java programs, it is very important to keep in mind the following points.</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>Case Sensitivity</strong>&nbsp;&minus; Java is case sensitive, which means identifier&nbsp;<strong>Hello</strong>&nbsp;and&nbsp;<strong>hello</strong>&nbsp;would have different meaning in Java.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Class Names</strong>&nbsp;&minus; For all class names the first letter should be in Upper Case. If several words are used to form a name of the class, each inner word&#39;s first letter should be in Upper Case.</p>\r\n\r\n	<p><strong>Example:</strong>&nbsp;<em>class MyFirstJavaClass</em></p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Method Names</strong>&nbsp;&minus; All method names should start with a Lower Case letter. If several words are used to form the name of the method, then each inner word&#39;s first letter should be in Upper Case.</p>\r\n\r\n	<p><strong>Example:</strong>&nbsp;<em>public void myMethodName()</em></p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Program File Name</strong>&nbsp;&minus; Name of the program file should exactly match the class name.</p>\r\n\r\n	<p>When saving the file, you should save it using the class name (Remember Java is case sensitive) and append &#39;.java&#39; to the end of the name (if the file name and the class name do not match, your program will not compile).</p>\r\n\r\n	<p>But please make a note that in case you do not have a public class present in the file then file name can be different than class name. It is also not mandatory to have a public class in the file.</p>\r\n\r\n	<p><strong>Example:</strong>&nbsp;Assume &#39;MyFirstJavaProgram&#39; is the class name. Then the file should be saved as&nbsp;<em>&#39;MyFirstJavaProgram.java&#39;</em></p>\r\n	</li>\r\n	<li>\r\n	<p><strong>public static void main(String args[])</strong>&nbsp;&minus; Java program processing starts from the main() method which is a mandatory part of every Java program.</p>\r\n	</li>\r\n</ul>\r\n\r\n<h2>Java Identifiers</h2>\r\n\r\n<p>All Java components require names. Names used for classes, variables, and methods are called&nbsp;<strong>identifiers</strong>.</p>\r\n\r\n<p>In Java, there are several points to remember about identifiers. They are as follows &minus;</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>All identifiers should begin with a letter (A to Z or a to z), currency character ($) or an underscore (_).</p>\r\n	</li>\r\n	<li>\r\n	<p>After the first character, identifiers can have any combination of characters.</p>\r\n	</li>\r\n	<li>\r\n	<p>A key word cannot be used as an identifier.</p>\r\n	</li>\r\n	<li>\r\n	<p>Most importantly, identifiers are case sensitive.</p>\r\n	</li>\r\n	<li>\r\n	<p>Examples of legal identifiers: age, $salary, _value, __1_value.</p>\r\n	</li>\r\n	<li>\r\n	<p>Examples of illegal identifiers: 123abc, -salary.</p>\r\n	</li>\r\n</ul>\r\n\r\n<h2>Java Modifiers</h2>\r\n\r\n<p>Like other languages, it is possible to modify classes, methods, etc., by using modifiers. There are two categories of modifiers &minus;</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>Access Modifiers</strong>&nbsp;&minus; default, public , protected, private</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Non-access Modifiers</strong>&nbsp;&minus; final, abstract, strictfp</p>\r\n	</li>\r\n</ul>\r\n\r\n<p>We will be looking into more details about modifiers in the next section.</p>\r\n\r\n<h2>Java Variables</h2>\r\n\r\n<p>Following are the types of variables in Java &minus;</p>\r\n\r\n<ul>\r\n	<li>Local Variables</li>\r\n	<li>Class Variables (Static Variables)</li>\r\n	<li>Instance Variables (Non-static Variables)</li>\r\n</ul>\r\n\r\n<h2>Java Arrays</h2>\r\n\r\n<p>Arrays are objects that store multiple variables of the same type. However, an array itself is an object on the heap. We will look into how to declare, construct, and initialize in the upcoming chapters.</p>\r\n\r\n<h2>Java Enums</h2>\r\n\r\n<p>Enums were introduced in Java 5.0. Enums restrict a variable to have one of only a few predefined values. The values in this enumerated list are called enums.</p>\r\n\r\n<p>With the use of enums it is possible to reduce the number of bugs in your code.</p>\r\n\r\n<p>For example, if we consider an application for a fresh juice shop, it would be possible to restrict the glass size to small, medium, and large. This would make sure that it would not allow anyone to order any size other than small, medium, or large.</p>\r\n\r\n<h3>Example</h3>\r\n\r\n<p><a href=\"http://tpcg.io/VNJ9DE\" rel=\"nofollow\" target=\"_blank\">&nbsp;Live Demo</a></p>\r\n\r\n<pre>\r\nclass FreshJuice {\r\n   enum FreshJuiceSize{ SMALL, MEDIUM, LARGE }\r\n   FreshJuiceSize size;\r\n}\r\n\r\npublic class FreshJuiceTest {\r\n\r\n   public static void main(String args[]) {\r\n      FreshJuice juice = new FreshJuice();\r\n      juice.size = FreshJuice.FreshJuiceSize.MEDIUM ;\r\n      System.out.println(&quot;Size: &quot; + juice.size);\r\n   }\r\n}</pre>\r\n\r\n<p>The above example will produce the following result &minus;</p>\r\n\r\n<h3>Output</h3>\r\n\r\n<pre>\r\nSize: MEDIUM\r\n</pre>\r\n\r\n<p><strong>Note</strong>&nbsp;&minus; Enums can be declared as their own or inside a class. Methods, variables, constructors can be defined inside enums as well.</p>\r\n\r\n<h2>Java Keywords</h2>\r\n\r\n<p>The following list shows the reserved words in Java. These reserved words may not be used as constant or variable or any other identifier names.</p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>abstract</td>\r\n			<td>assert</td>\r\n			<td>boolean</td>\r\n			<td>break</td>\r\n		</tr>\r\n		<tr>\r\n			<td>byte</td>\r\n			<td>case</td>\r\n			<td>catch</td>\r\n			<td>char</td>\r\n		</tr>\r\n		<tr>\r\n			<td>class</td>\r\n			<td>const</td>\r\n			<td>continue</td>\r\n			<td>default</td>\r\n		</tr>\r\n		<tr>\r\n			<td>do</td>\r\n			<td>double</td>\r\n			<td>else</td>\r\n			<td>enum</td>\r\n		</tr>\r\n		<tr>\r\n			<td>extends</td>\r\n			<td>final</td>\r\n			<td>finally</td>\r\n			<td>float</td>\r\n		</tr>\r\n		<tr>\r\n			<td>for</td>\r\n			<td>goto</td>\r\n			<td>if</td>\r\n			<td>implements</td>\r\n		</tr>\r\n		<tr>\r\n			<td>import</td>\r\n			<td>instanceof</td>\r\n			<td>int</td>\r\n			<td>interface</td>\r\n		</tr>\r\n		<tr>\r\n			<td>long</td>\r\n			<td>native</td>\r\n			<td>new</td>\r\n			<td>package</td>\r\n		</tr>\r\n		<tr>\r\n			<td>private</td>\r\n			<td>protected</td>\r\n			<td>public</td>\r\n			<td>return</td>\r\n		</tr>\r\n		<tr>\r\n			<td>short</td>\r\n			<td>static</td>\r\n			<td>strictfp</td>\r\n			<td>super</td>\r\n		</tr>\r\n		<tr>\r\n			<td>switch</td>\r\n			<td>synchronized</td>\r\n			<td>this</td>\r\n			<td>throw</td>\r\n		</tr>\r\n		<tr>\r\n			<td>throws</td>\r\n			<td>transient</td>\r\n			<td>try</td>\r\n			<td>void</td>\r\n		</tr>\r\n		<tr>\r\n			<td>volatile</td>\r\n			<td>while</td>\r\n			<td>&nbsp;</td>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h2>Comments in Java</h2>\r\n\r\n<p>Java supports single-line and multi-line comments very similar to C and C++. All characters available inside any comment are ignored by Java compiler.</p>\r\n\r\n<h3>Example</h3>\r\n\r\n<p><a href=\"http://tpcg.io/RVBY2x\" rel=\"nofollow\" target=\"_blank\">&nbsp;Live Demo</a></p>\r\n\r\n<pre>\r\npublic class MyFirstJavaProgram {\r\n\r\n   /* This is my first java program.\r\n    * This will print &#39;Hello World&#39; as the output\r\n    * This is an example of multi-line comments.\r\n    */\r\n\r\n   public static void main(String []args) {\r\n      // This is an example of single line comment\r\n      /* This is also an example of single line comment. */\r\n      System.out.println(&quot;Hello World&quot;);\r\n   }\r\n}</pre>\r\n\r\n<h3>Output</h3>\r\n\r\n<pre>\r\nHello World\r\n</pre>\r\n\r\n<h2>Using Blank Lines</h2>\r\n\r\n<p>A line containing only white space, possibly with a comment, is known as a blank line, and Java totally ignores it.</p>\r\n\r\n<h2>Inheritance</h2>\r\n\r\n<p>In Java, classes can be derived from classes. Basically, if you need to create a new class and here is already a class that has some of the code you require, then it is possible to derive your new class from the already existing code.</p>\r\n\r\n<p>This concept allows you to reuse the fields and methods of the existing class without having to rewrite the code in a new class. In this scenario, the existing class is called the&nbsp;<strong>superclass</strong>&nbsp;and the derived class is called the&nbsp;<strong>subclass</strong>.</p>\r\n\r\n<h2>Interfaces</h2>\r\n\r\n<p>In Java language, an interface can be defined as a contract between objects on how to communicate with each other. Interfaces play a vital role when it comes to the concept of inheritance.</p>\r\n\r\n<p>An interface defines the methods, a deriving class (subclass) should use. But the implementation of the methods is totally up to the subclass.</p>\r\n\r\n<h2>What is Next?</h2>\r\n\r\n<p>The next section explains about Objects and classes in Java programming. At the end of the session, you will be able to get a clear picture as to what are objects and what are classes in Java.</p>\r\n', 'java'),
(35, 'Java - Object and Classes', '<h1 style=\"margin-left:80px\"><span style=\"color:#3498db\"><strong><span style=\"font-size:24px\">Java - Object and Classes</span></strong></span></h1>\r\n\r\n<p>Java is an Object-Oriented Language. As a language that has the Object-Oriented feature, Java supports the following fundamental concepts &minus;</p>\r\n\r\n<ul>\r\n	<li>Polymorphism</li>\r\n	<li>Inheritance</li>\r\n	<li>Encapsulation</li>\r\n	<li>Abstraction</li>\r\n	<li>Classes</li>\r\n	<li>Objects</li>\r\n	<li>Instance</li>\r\n	<li>Method</li>\r\n	<li>Message Passing</li>\r\n</ul>\r\n\r\n<p>In this chapter, we will look into the concepts - Classes and Objects.</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>Object</strong>&nbsp;&minus; Objects have states and behaviors. Example: A dog has states - color, name, breed as well as behaviors &ndash; wagging the tail, barking, eating. An object is an instance of a class.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Class</strong>&nbsp;&minus; A class can be defined as a template/blueprint that describes the behavior/state that the object of its type support.</p>\r\n	</li>\r\n</ul>\r\n\r\n<h2>Objects in Java</h2>\r\n\r\n<p>Let us now look deep into what are objects. If we consider the real-world, we can find many objects around us, cars, dogs, humans, etc. All these objects have a state and a behavior.</p>\r\n\r\n<p>If we consider a dog, then its state is - name, breed, color, and the behavior is - barking, wagging the tail, running.</p>\r\n\r\n<p>If you compare the software object with a real-world object, they have very similar characteristics.</p>\r\n\r\n<p>Software objects also have a state and a behavior. A software object&#39;s state is stored in fields and behavior is shown via methods.</p>\r\n\r\n<p>So in software development, methods operate on the internal state of an object and the object-to-object communication is done via methods.</p>\r\n\r\n<h2>Classes in Java</h2>\r\n\r\n<p>A class is a blueprint from which individual objects are created.</p>\r\n\r\n<p>Following is a sample of a class.</p>\r\n\r\n<h3>Example</h3>\r\n\r\n<pre>\r\npublic class Dog {\r\n   String breed;\r\n   int age;\r\n   String color;\r\n\r\n   void barking() {\r\n   }\r\n\r\n   void hungry() {\r\n   }\r\n\r\n   void sleeping() {\r\n   }\r\n}</pre>\r\n\r\n<p>A class can contain any of the following variable types.</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>Local variables</strong>&nbsp;&minus; Variables defined inside methods, constructors or blocks are called local variables. The variable will be declared and initialized within the method and the variable will be destroyed when the method has completed.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Instance variables</strong>&nbsp;&minus; Instance variables are variables within a class but outside any method. These variables are initialized when the class is instantiated. Instance variables can be accessed from inside any method, constructor or blocks of that particular class.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Class variables</strong>&nbsp;&minus; Class variables are variables declared within a class, outside any method, with the static keyword.</p>\r\n	</li>\r\n</ul>\r\n\r\n<p>A class can have any number of methods to access the value of various kinds of methods. In the above example, barking(), hungry() and sleeping() are methods.</p>\r\n\r\n<p>Following are some of the important topics that need to be discussed when looking into classes of the Java Language.</p>\r\n\r\n<h2>Constructors</h2>\r\n\r\n<p>When discussing about classes, one of the most important sub topic would be constructors. Every class has a constructor. If we do not explicitly write a constructor for a class, the Java compiler builds a default constructor for that class.</p>\r\n\r\n<p>Each time a new object is created, at least one constructor will be invoked. The main rule of constructors is that they should have the same name as the class. A class can have more than one constructor.</p>\r\n\r\n<p>Following is an example of a constructor &minus;</p>\r\n\r\n<h3>Example</h3>\r\n\r\n<pre>\r\npublic class Puppy {\r\n   public Puppy() {\r\n   }\r\n\r\n   public Puppy(String name) {\r\n      // This constructor has one parameter, <em>name</em>.\r\n   }\r\n}</pre>\r\n\r\n<p>Java also supports&nbsp;<a href=\"https://www.tutorialspoint.com/java/java_using_singleton.htm\">Singleton Classes</a>&nbsp;where you would be able to create only one instance of a class.</p>\r\n\r\n<p><strong>Note</strong>&nbsp;&minus; We have two different types of constructors. We are going to discuss constructors in detail in the subsequent chapters.</p>\r\n\r\n<h2>Creating an Object</h2>\r\n\r\n<p>As mentioned previously, a class provides the blueprints for objects. So basically, an object is created from a class. In Java, the new keyword is used to create new objects.</p>\r\n\r\n<p>There are three steps when creating an object from a class &minus;</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>Declaration</strong>&nbsp;&minus; A variable declaration with a variable name with an object type.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Instantiation</strong>&nbsp;&minus; The &#39;new&#39; keyword is used to create the object.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Initialization</strong>&nbsp;&minus; The &#39;new&#39; keyword is followed by a call to a constructor. This call initializes the new object.</p>\r\n	</li>\r\n</ul>\r\n\r\n<p>Following is an example of creating an object &minus;</p>\r\n\r\n<h3>Example</h3>\r\n\r\n<p><a href=\"http://tpcg.io/gQv0gO\" rel=\"nofollow\" target=\"_blank\">&nbsp;Live Demo</a></p>\r\n\r\n<pre>\r\npublic class Puppy {\r\n   public Puppy(String name) {\r\n      // This constructor has one parameter, <em>name</em>.\r\n      System.out.println(&quot;Passed Name is :&quot; + name );\r\n   }\r\n\r\n   public static void main(String []args) {\r\n      // Following statement would create an object myPuppy\r\n      Puppy myPuppy = new Puppy( &quot;tommy&quot; );\r\n   }\r\n}</pre>\r\n\r\n<p>If we compile and run the above program, then it will produce the following result &minus;</p>\r\n\r\n<h3>Output</h3>\r\n\r\n<pre>\r\nPassed Name is :tommy\r\n</pre>\r\n\r\n<h2>Accessing Instance Variables and Methods</h2>\r\n\r\n<p>Instance variables and methods are accessed via created objects. To access an instance variable, following is the fully qualified path &minus;</p>\r\n\r\n<pre>\r\n/* First create an object */\r\nObjectReference = new Constructor();\r\n\r\n/* Now call a variable as follows */\r\nObjectReference.variableName;\r\n\r\n/* Now you can call a class method as follows */\r\nObjectReference.MethodName();\r\n</pre>\r\n\r\n<h3>Example</h3>\r\n\r\n<p>This example explains how to access instance variables and methods of a class.</p>\r\n\r\n<p><a href=\"http://tpcg.io/VnuprO\" rel=\"nofollow\" target=\"_blank\">&nbsp;Live Demo</a></p>\r\n\r\n<pre>\r\npublic class Puppy {\r\n   int puppyAge;\r\n\r\n   public Puppy(String name) {\r\n      // This constructor has one parameter, <em>name</em>.\r\n      System.out.println(&quot;Name chosen is :&quot; + name );\r\n   }\r\n\r\n   public void setAge( int age ) {\r\n      puppyAge = age;\r\n   }\r\n\r\n   public int getAge( ) {\r\n      System.out.println(&quot;Puppy&#39;s age is :&quot; + puppyAge );\r\n      return puppyAge;\r\n   }\r\n\r\n   public static void main(String []args) {\r\n      /* Object creation */\r\n      Puppy myPuppy = new Puppy( &quot;tommy&quot; );\r\n\r\n      /* Call class method to set puppy&#39;s age */\r\n      myPuppy.setAge( 2 );\r\n\r\n      /* Call another class method to get puppy&#39;s age */\r\n      myPuppy.getAge( );\r\n\r\n      /* You can access instance variable as follows as well */\r\n      System.out.println(&quot;Variable Value :&quot; + myPuppy.puppyAge );\r\n   }\r\n}</pre>\r\n\r\n<p>If we compile and run the above program, then it will produce the following result &minus;</p>\r\n\r\n<h3>Output</h3>\r\n\r\n<pre>\r\nName chosen is :tommy\r\nPuppy&#39;s age is :2\r\nVariable Value :2\r\n</pre>\r\n\r\n<h2>Source File Declaration Rules</h2>\r\n\r\n<p>As the last part of this section, let&#39;s now look into the source file declaration rules. These rules are essential when declaring classes,&nbsp;<em>import</em>&nbsp;statements and&nbsp;<em>package</em>&nbsp;statements in a source file.</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>There can be only one public class per source file.</p>\r\n	</li>\r\n	<li>\r\n	<p>A source file can have multiple non-public classes.</p>\r\n	</li>\r\n	<li>\r\n	<p>The public class name should be the name of the source file as well which should be appended by&nbsp;<strong>.java</strong>&nbsp;at the end. For example: the class name is&nbsp;<em>public class Employee{}</em>&nbsp;then the source file should be as Employee.java.</p>\r\n	</li>\r\n	<li>\r\n	<p>If the class is defined inside a package, then the package statement should be the first statement in the source file.</p>\r\n	</li>\r\n	<li>\r\n	<p>If import statements are present, then they must be written between the package statement and the class declaration. If there are no package statements, then the import statement should be the first line in the source file.</p>\r\n	</li>\r\n	<li>\r\n	<p>Import and package statements will imply to all the classes present in the source file. It is not possible to declare different import and/or package statements to different classes in the source file.</p>\r\n	</li>\r\n</ul>\r\n\r\n<p>Classes have several access levels and there are different types of classes; abstract classes, final classes, etc. We will be explaining about all these in the access modifiers chapter.</p>\r\n\r\n<p>Apart from the above mentioned types of classes, Java also has some special classes called Inner classes and Anonymous classes.</p>\r\n\r\n<h2>Java Package</h2>\r\n\r\n<p>In simple words, it is a way of categorizing the classes and interfaces. When developing applications in Java, hundreds of classes and interfaces will be written, therefore categorizing these classes is a must as well as makes life much easier.</p>\r\n\r\n<h2>Import Statements</h2>\r\n\r\n<p>In Java if a fully qualified name, which includes the package and the class name is given, then the compiler can easily locate the source code or classes. Import statement is a way of giving the proper location for the compiler to find that particular class.</p>\r\n\r\n<p>For example, the following line would ask the compiler to load all the classes available in directory java_installation/java/io &minus;</p>\r\n\r\n<pre>\r\nimport java.io.*;\r\n</pre>\r\n\r\n<h2>A Simple Case Study</h2>\r\n\r\n<p>For our case study, we will be creating two classes. They are Employee and EmployeeTest.</p>\r\n\r\n<p>First open notepad and add the following code. Remember this is the Employee class and the class is a public class. Now, save this source file with the name Employee.java.</p>\r\n\r\n<p>The Employee class has four instance variables - name, age, designation and salary. The class has one explicitly defined constructor, which takes a parameter.</p>\r\n\r\n<h3>Example</h3>\r\n\r\n<pre>\r\nimport java.io.*;\r\npublic class Employee {\r\n\r\n   String name;\r\n   int age;\r\n   String designation;\r\n   double salary;\r\n\r\n   // This is the constructor of the class Employee\r\n   public Employee(String name) {\r\n      this.name = name;\r\n   }\r\n\r\n   // Assign the age of the Employee  to the variable age.\r\n   public void empAge(int empAge) {\r\n      age = empAge;\r\n   }\r\n\r\n   /* Assign the designation to the variable designation.*/\r\n   public void empDesignation(String empDesig) {\r\n      designation = empDesig;\r\n   }\r\n\r\n   /* Assign the salary to the variable	salary.*/\r\n   public void empSalary(double empSalary) {\r\n      salary = empSalary;\r\n   }\r\n\r\n   /* Print the Employee details */\r\n   public void printEmployee() {\r\n      System.out.println(&quot;Name:&quot;+ name );\r\n      System.out.println(&quot;Age:&quot; + age );\r\n      System.out.println(&quot;Designation:&quot; + designation );\r\n      System.out.println(&quot;Salary:&quot; + salary);\r\n   }\r\n}</pre>\r\n\r\n<p>As mentioned previously in this tutorial, processing starts from the main method. Therefore, in order for us to run this Employee class there should be a main method and objects should be created. We will be creating a separate class for these tasks.</p>\r\n\r\n<p>Following is the&nbsp;<em>EmployeeTest</em>&nbsp;class, which creates two instances of the class Employee and invokes the methods for each object to assign values for each variable.</p>\r\n\r\n<p>Save the following code in EmployeeTest.java file.</p>\r\n\r\n<pre>\r\nimport java.io.*;\r\npublic class EmployeeTest {\r\n\r\n   public static void main(String args[]) {\r\n      /* Create two objects using constructor */\r\n      Employee empOne = new Employee(&quot;James Smith&quot;);\r\n      Employee empTwo = new Employee(&quot;Mary Anne&quot;);\r\n\r\n      // Invoking methods for each object created\r\n      empOne.empAge(26);\r\n      empOne.empDesignation(&quot;Senior Software Engineer&quot;);\r\n      empOne.empSalary(1000);\r\n      empOne.printEmployee();\r\n\r\n      empTwo.empAge(21);\r\n      empTwo.empDesignation(&quot;Software Engineer&quot;);\r\n      empTwo.empSalary(500);\r\n      empTwo.printEmployee();\r\n   }\r\n}</pre>\r\n\r\n<p>Now, compile both the classes and then run&nbsp;<em>EmployeeTest</em>&nbsp;to see the result as follows &minus;</p>\r\n\r\n<h3>Output</h3>\r\n\r\n<pre>\r\nC:&gt; javac Employee.java\r\nC:&gt; javac EmployeeTest.java\r\nC:&gt; java EmployeeTest\r\nName:James Smith\r\nAge:26\r\nDesignation:Senior Software Engineer\r\nSalary:1000.0\r\nName:Mary Anne\r\nAge:21\r\nDesignation:Software Engineer\r\nSalary:500.0\r\n</pre>\r\n\r\n<h2>What is Next?</h2>\r\n\r\n<p>In the next session, we will discuss the basic data types in Java and how they can be used when developing Java applications.</p>\r\n', 'java'),
(36, 'Java - Constructors', '<p style=\"margin-left:120px\"><span style=\"color:#3498db\"><span style=\"font-size:24px\"><strong>Java - Constructors</strong></span></span></p>\r\n\r\n<p>A constructor initializes an object when it is created. It has the same name as its class and is syntactically similar to a method. However, constructors have no explicit return type.</p>\r\n\r\n<p>Typically, you will use a constructor to give initial values to the instance variables defined by the class, or to perform any other start-up procedures required to create a fully formed object.</p>\r\n\r\n<p>All classes have constructors, whether you define one or not, because Java automatically provides a default constructor that initializes all member variables to zero. However, once you define your own constructor, the default constructor is no longer used.</p>\r\n\r\n<h2>Syntax</h2>\r\n\r\n<p>Following is the syntax of a constructor &minus;</p>\r\n\r\n<pre>\r\nclass ClassName {\r\n   ClassName() {\r\n   }\r\n}</pre>\r\n\r\n<p>Java allows two types of constructors namely &minus;</p>\r\n\r\n<ul>\r\n	<li>No argument Constructors</li>\r\n	<li>Parameterized Constructors</li>\r\n</ul>\r\n\r\n<h2>No argument Constructors</h2>\r\n\r\n<p>As the name specifies the no argument constructors of Java does not accept any parameters instead, using these constructors the instance variables of a method will be initialized with fixed values for all objects.</p>\r\n\r\n<h2>Example</h2>\r\n\r\n<pre>\r\nPublic class MyClass {\r\n   Int num;\r\n   MyClass() {\r\n      num = 100;\r\n   }\r\n}</pre>\r\n\r\n<p>You would call constructor to initialize objects as follows</p>\r\n\r\n<pre>\r\npublic class ConsDemo {\r\n   public static void main(String args[]) {\r\n      MyClass t1 = new MyClass();\r\n      MyClass t2 = new MyClass();\r\n      System.out.println(t1.num + &quot; &quot; + t2.num);\r\n   }\r\n}</pre>\r\n\r\n<p>This would produce the following result</p>\r\n\r\n<pre>\r\n100 100\r\n</pre>\r\n\r\n<h2>Parameterized Constructors</h2>\r\n\r\n<p>Most often, you will need a constructor that accepts one or more parameters. Parameters are added to a constructor in the same way that they are added to a method, just declare them inside the parentheses after the constructor&#39;s name.</p>\r\n\r\n<h2>Example</h2>\r\n\r\n<p>Here is a simple example that uses a constructor &minus;</p>\r\n\r\n<pre>\r\n// A simple constructor.\r\nclass MyClass {\r\n   int x;\r\n   \r\n   // Following is the constructor\r\n   MyClass(int i ) {\r\n      x = i;\r\n   }\r\n}</pre>\r\n\r\n<p>You would call constructor to initialize objects as follows &minus;</p>\r\n\r\n<pre>\r\npublic class ConsDemo {\r\n   public static void main(String args[]) {\r\n      MyClass t1 = new MyClass( 10 );\r\n      MyClass t2 = new MyClass( 20 );\r\n      System.out.println(t1.x + &quot; &quot; + t2.x);\r\n   }\r\n}</pre>\r\n\r\n<p>This would produce the following result &minus;</p>\r\n', 'java'),
(37, 'Java - Basic Datatypes', '<p style=\"margin-left:120px\"><span style=\"color:#3498db\"><span style=\"font-size:24px\"><strong>Java - Basic Datatypes</strong></span></span></p>\r\n\r\n<p>Based on the data type of a variable, the operating system allocates memory and decides what can be stored in the reserved memory. Therefore, by assigning different data types to variables, you can store integers, decimals, or characters in these variables.</p>\r\n\r\n<p>There are two data types available in Java &minus;</p>\r\n\r\n<ul>\r\n	<li>Primitive Data Types</li>\r\n	<li>Reference/Object Data Types</li>\r\n</ul>\r\n\r\n<h2>Primitive Data Types</h2>\r\n\r\n<p>There are eight primitive datatypes supported by Java. Primitive datatypes are predefined by the language and named by a keyword. Let us now look into the eight primitive data types in detail.</p>\r\n\r\n<h3>byte</h3>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Byte data type is an 8-bit signed two&#39;s complement integer</p>\r\n	</li>\r\n	<li>\r\n	<p>Minimum value is -128 (-2^7)</p>\r\n	</li>\r\n	<li>\r\n	<p>Maximum value is 127 (inclusive)(2^7 -1)</p>\r\n	</li>\r\n	<li>\r\n	<p>Default value is 0</p>\r\n	</li>\r\n	<li>\r\n	<p>Byte data type is used to save space in large arrays, mainly in place of integers, since a byte is four times smaller than an integer.</p>\r\n	</li>\r\n	<li>\r\n	<p>Example: byte a = 100, byte b = -50</p>\r\n	</li>\r\n</ul>\r\n\r\n<h3>short</h3>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Short data type is a 16-bit signed two&#39;s complement integer</p>\r\n	</li>\r\n	<li>\r\n	<p>Minimum value is -32,768 (-2^15)</p>\r\n	</li>\r\n	<li>\r\n	<p>Maximum value is 32,767 (inclusive) (2^15 -1)</p>\r\n	</li>\r\n	<li>\r\n	<p>Short data type can also be used to save memory as byte data type. A short is 2 times smaller than an integer</p>\r\n	</li>\r\n	<li>\r\n	<p>Default value is 0.</p>\r\n	</li>\r\n	<li>\r\n	<p>Example: short s = 10000, short r = -20000</p>\r\n	</li>\r\n</ul>\r\n\r\n<h3>int</h3>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Int data type is a 32-bit signed two&#39;s complement integer.</p>\r\n	</li>\r\n	<li>\r\n	<p>Minimum value is - 2,147,483,648 (-2^31)</p>\r\n	</li>\r\n	<li>\r\n	<p>Maximum value is 2,147,483,647(inclusive) (2^31 -1)</p>\r\n	</li>\r\n	<li>\r\n	<p>Integer is generally used as the default data type for integral values unless there is a concern about memory.</p>\r\n	</li>\r\n	<li>\r\n	<p>The default value is 0</p>\r\n	</li>\r\n	<li>\r\n	<p>Example: int a = 100000, int b = -200000</p>\r\n	</li>\r\n</ul>\r\n\r\n<h3>long</h3>\r\n\r\n<ul>\r\n	<li>Long data type is a 64-bit signed two&#39;s complement integer</li>\r\n	<li>Minimum value is -9,223,372,036,854,775,808(-2^63)</li>\r\n	<li>Maximum value is 9,223,372,036,854,775,807 (inclusive)(2^63 -1)</li>\r\n	<li>This type is used when a wider range than int is needed</li>\r\n	<li>Default value is 0L</li>\r\n	<li>Example: long a = 100000L, long b = -200000L</li>\r\n</ul>\r\n\r\n<h3>float</h3>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Float data type is a single-precision 32-bit IEEE 754 floating point</p>\r\n	</li>\r\n	<li>\r\n	<p>Float is mainly used to save memory in large arrays of floating point numbers</p>\r\n	</li>\r\n	<li>\r\n	<p>Default value is 0.0f</p>\r\n	</li>\r\n	<li>\r\n	<p>Float data type is never used for precise values such as currency</p>\r\n	</li>\r\n	<li>\r\n	<p>Example: float f1 = 234.5f</p>\r\n	</li>\r\n</ul>\r\n\r\n<h3>double</h3>\r\n\r\n<ul>\r\n	<li>\r\n	<p>double data type is a double-precision 64-bit IEEE 754 floating point</p>\r\n	</li>\r\n	<li>\r\n	<p>This data type is generally used as the default data type for decimal values, generally the default choice</p>\r\n	</li>\r\n	<li>\r\n	<p>Double data type should never be used for precise values such as currency</p>\r\n	</li>\r\n	<li>\r\n	<p>Default value is 0.0d</p>\r\n	</li>\r\n	<li>\r\n	<p>Example: double d1 = 123.4</p>\r\n	</li>\r\n</ul>\r\n\r\n<h3>boolean</h3>\r\n\r\n<ul>\r\n	<li>boolean data type represents one bit of information</li>\r\n	<li>There are only two possible values: true and false</li>\r\n	<li>This data type is used for simple flags that track true/false conditions</li>\r\n	<li>Default value is false</li>\r\n	<li>Example: boolean one = true</li>\r\n</ul>\r\n\r\n<h3>char</h3>\r\n\r\n<ul>\r\n	<li>char data type is a single 16-bit Unicode character</li>\r\n	<li>Minimum value is &#39;u0000&#39; (or 0)</li>\r\n	<li>Maximum value is &#39;uffff&#39; (or 65,535 inclusive)</li>\r\n	<li>Char data type is used to store any character</li>\r\n	<li>Example: char letterA = &#39;A&#39;</li>\r\n</ul>\r\n\r\n<h2>Reference Datatypes</h2>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Reference variables are created using defined constructors of the classes. They are used to access objects. These variables are declared to be of a specific type that cannot be changed. For example, Employee, Puppy, etc.</p>\r\n	</li>\r\n	<li>\r\n	<p>Class objects and various type of array variables come under reference datatype.</p>\r\n	</li>\r\n	<li>\r\n	<p>Default value of any reference variable is null.</p>\r\n	</li>\r\n	<li>\r\n	<p>A reference variable can be used to refer any object of the declared type or any compatible type.</p>\r\n	</li>\r\n	<li>\r\n	<p>Example: Animal animal = new Animal(&quot;giraffe&quot;);</p>\r\n	</li>\r\n</ul>\r\n\r\n<h2>Java Literals</h2>\r\n\r\n<p>A literal is a source code representation of a fixed value. They are represented directly in the code without any computation.</p>\r\n\r\n<p>Literals can be assigned to any primitive type variable. For example &minus;</p>\r\n\r\n<pre>\r\nbyte a = 68;\r\nchar a = &#39;A&#39;;</pre>\r\n\r\n<p>byte, int, long, and short can be expressed in decimal(base 10), hexadecimal(base 16) or octal(base 8) number systems as well.</p>\r\n\r\n<p>Prefix 0 is used to indicate octal, and prefix 0x indicates hexadecimal when using these number systems for literals. For example &minus;</p>\r\n\r\n<pre>\r\nint decimal = 100;\r\nint octal = 0144;\r\nint hexa =  0x64;</pre>\r\n\r\n<p>String literals in Java are specified like they are in most other languages by enclosing a sequence of characters between a pair of double quotes. Examples of string literals are &minus;</p>\r\n\r\n<h3>Example</h3>\r\n\r\n<pre>\r\n&quot;Hello World&quot;\r\n&quot;two\nlines&quot;\r\n&quot;&quot;This is in quotes&quot;&quot;</pre>\r\n\r\n<p>String and char types of literals can contain any Unicode characters. For example &minus;</p>\r\n\r\n<pre>\r\nchar a = &#39;u0001&#39;;\r\nString a = &quot;u0001&quot;;</pre>\r\n\r\n<p>Java language supports few special escape sequences for String and char literals as well. They are &minus;</p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<th>Notation</th>\r\n			<th>Character represented</th>\r\n		</tr>\r\n		<tr>\r\n			<td>\n</td>\r\n			<td>Newline (0x0a)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r</td>\r\n			<td>Carriage return (0x0d)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>f</td>\r\n			<td>Formfeed (0x0c)</td>\r\n		</tr>\r\n		<tr>\r\n			<td></td>\r\n			<td>Backspace (0x08)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>s</td>\r\n			<td>Space (0x20)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>	</td>\r\n			<td>tab</td>\r\n		</tr>\r\n		<tr>\r\n			<td>&quot;</td>\r\n			<td>Double quote</td>\r\n		</tr>\r\n		<tr>\r\n			<td>&#39;</td>\r\n			<td>Single quote</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\\</td>\r\n			<td>backslash</td>\r\n		</tr>\r\n		<tr>\r\n			<td>ddd</td>\r\n			<td>Octal character (ddd)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>uxxxx</td>\r\n			<td>Hexadecimal UNICODE character (xxxx)</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h2>What is Next?</h2>\r\n\r\n<p>This chapter explained the various data types. The next topic explains different variable types and their usage. This will give you a good understanding on how they can be used in the Java classes, interfaces, etc.</p>\r\n', 'java');
INSERT INTO `courses` (`id`, `topic_name`, `description`, `course_name`) VALUES
(38, 'Java - Variable Types', '<h1 style=\"margin-left:120px\"><span style=\"color:#3498db\"><span style=\"font-size:24px\"><strong>Java - Variable Types</strong></span></span></h1>\r\n\r\n<p>A variable provides us with named storage that our programs can manipulate. Each variable in Java has a specific type, which determines the size and layout of the variable&#39;s memory; the range of values that can be stored within that memory; and the set of operations that can be applied to the variable.</p>\r\n\r\n<p>You must declare all variables before they can be used. Following is the basic form of a variable declaration &minus;</p>\r\n\r\n<pre>\r\ndata type variable [ = value][, variable [ = value] ...] ;\r\n</pre>\r\n\r\n<p>Here&nbsp;<em>data type</em>&nbsp;is one of Java&#39;s datatypes and&nbsp;<em>variable</em>&nbsp;is the name of the variable. To declare more than one variable of the specified type, you can use a comma-separated list.</p>\r\n\r\n<p>Following are valid examples of variable declaration and initialization in Java &minus;</p>\r\n\r\n<h2>Example</h2>\r\n\r\n<pre>\r\nint a, b, c;         // Declares three ints, a, b, and c.\r\nint a = 10, b = 10;  // Example of initialization\r\nbyte B = 22;         // initializes a byte type variable B.\r\ndouble pi = 3.14159; // declares and assigns a value of PI.\r\nchar a = &#39;a&#39;;        // the char variable a iis initialized with value &#39;a&#39;</pre>\r\n\r\n<p>This chapter will explain various variable types available in Java Language. There are three kinds of variables in Java &minus;</p>\r\n\r\n<ul>\r\n	<li>Local variables</li>\r\n	<li>Instance variables</li>\r\n	<li>Class/Static variables</li>\r\n</ul>\r\n\r\n<h2>Local Variables</h2>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Local variables are declared in methods, constructors, or blocks.</p>\r\n	</li>\r\n	<li>\r\n	<p>Local variables are created when the method, constructor or block is entered and the variable will be destroyed once it exits the method, constructor, or block.</p>\r\n	</li>\r\n	<li>\r\n	<p>Access modifiers cannot be used for local variables.</p>\r\n	</li>\r\n	<li>\r\n	<p>Local variables are visible only within the declared method, constructor, or block.</p>\r\n	</li>\r\n	<li>\r\n	<p>Local variables are implemented at stack level internally.</p>\r\n	</li>\r\n	<li>\r\n	<p>There is no default value for local variables, so local variables should be declared and an initial value should be assigned before the first use.</p>\r\n	</li>\r\n</ul>\r\n\r\n<h3>Example</h3>\r\n\r\n<p>Here,&nbsp;<em>age</em>&nbsp;is a local variable. This is defined inside&nbsp;<em>pupAge()</em>&nbsp;method and its scope is limited to only this method.</p>\r\n\r\n<p><a href=\"http://tpcg.io/07heJ9\" rel=\"nofollow\" target=\"_blank\">&nbsp;Live Demo</a></p>\r\n\r\n<pre>\r\npublic class Test {\r\n   public void pupAge() {\r\n      int age = 0;\r\n      age = age + 7;\r\n      System.out.println(&quot;Puppy age is : &quot; + age);\r\n   }\r\n\r\n   public static void main(String args[]) {\r\n      Test test = new Test();\r\n      test.pupAge();\r\n   }\r\n}</pre>\r\n\r\n<p>This will produce the following result &minus;</p>\r\n\r\n<h3>Output</h3>\r\n\r\n<pre>\r\nPuppy age is: 7\r\n</pre>\r\n\r\n<h3>Example</h3>\r\n\r\n<p>Following example uses&nbsp;<em>age</em>&nbsp;without initializing it, so it would give an error at the time of compilation.</p>\r\n\r\n<p><a href=\"http://tpcg.io/kv9gf6\" rel=\"nofollow\" target=\"_blank\">&nbsp;Live Demo</a></p>\r\n\r\n<pre>\r\npublic class Test {\r\n   public void pupAge() {\r\n      int age;\r\n      age = age + 7;\r\n      System.out.println(&quot;Puppy age is : &quot; + age);\r\n   }\r\n\r\n   public static void main(String args[]) {\r\n      Test test = new Test();\r\n      test.pupAge();\r\n   }\r\n}</pre>\r\n\r\n<p>This will produce the following error while compiling it &minus;</p>\r\n\r\n<h3>Output</h3>\r\n\r\n<pre>\r\nTest.java:4:variable number might not have been initialized\r\nage = age + 7;\r\n         ^\r\n1 error\r\n</pre>\r\n\r\n<h2>Instance Variables</h2>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Instance variables are declared in a class, but outside a method, constructor or any block.</p>\r\n	</li>\r\n	<li>\r\n	<p>When a space is allocated for an object in the heap, a slot for each instance variable value is created.</p>\r\n	</li>\r\n	<li>\r\n	<p>Instance variables are created when an object is created with the use of the keyword &#39;new&#39; and destroyed when the object is destroyed.</p>\r\n	</li>\r\n	<li>\r\n	<p>Instance variables hold values that must be referenced by more than one method, constructor or block, or essential parts of an object&#39;s state that must be present throughout the class.</p>\r\n	</li>\r\n	<li>\r\n	<p>Instance variables can be declared in class level before or after use.</p>\r\n	</li>\r\n	<li>\r\n	<p>Access modifiers can be given for instance variables.</p>\r\n	</li>\r\n	<li>\r\n	<p>The instance variables are visible for all methods, constructors and block in the class. Normally, it is recommended to make these variables private (access level). However, visibility for subclasses can be given for these variables with the use of access modifiers.</p>\r\n	</li>\r\n	<li>\r\n	<p>Instance variables have default values. For numbers, the default value is 0, for Booleans it is false, and for object references it is null. Values can be assigned during the declaration or within the constructor.</p>\r\n	</li>\r\n	<li>\r\n	<p>Instance variables can be accessed directly by calling the variable name inside the class. However, within static methods (when instance variables are given accessibility), they should be called using the fully qualified name.&nbsp;<em>ObjectReference.VariableName</em>.</p>\r\n	</li>\r\n</ul>\r\n\r\n<h3>Example</h3>\r\n\r\n<p><a href=\"http://tpcg.io/mULkxL\" rel=\"nofollow\" target=\"_blank\">&nbsp;Live Demo</a></p>\r\n\r\n<pre>\r\nimport java.io.*;\r\npublic class Employee {\r\n\r\n   // this instance variable is visible for any child class.\r\n   public String name;\r\n\r\n   // salary  variable is visible in Employee class only.\r\n   private double salary;\r\n\r\n   // The name variable is assigned in the constructor.\r\n   public Employee (String empName) {\r\n      name = empName;\r\n   }\r\n\r\n   // The salary variable is assigned a value.\r\n   public void setSalary(double empSal) {\r\n      salary = empSal;\r\n   }\r\n\r\n   // This method prints the employee details.\r\n   public void printEmp() {\r\n      System.out.println(&quot;name  : &quot; + name );\r\n      System.out.println(&quot;salary :&quot; + salary);\r\n   }\r\n\r\n   public static void main(String args[]) {\r\n      Employee empOne = new Employee(&quot;Ransika&quot;);\r\n      empOne.setSalary(1000);\r\n      empOne.printEmp();\r\n   }\r\n}</pre>\r\n\r\n<p>This will produce the following result &minus;</p>\r\n\r\n<h3>Output</h3>\r\n\r\n<pre>\r\nname  : Ransika\r\nsalary :1000.0\r\n</pre>\r\n\r\n<h2>Class/Static Variables</h2>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Class variables also known as static variables are declared with the static keyword in a class, but outside a method, constructor or a block.</p>\r\n	</li>\r\n	<li>\r\n	<p>There would only be one copy of each class variable per class, regardless of how many objects are created from it.</p>\r\n	</li>\r\n	<li>\r\n	<p>Static variables are rarely used other than being declared as constants. Constants are variables that are declared as public/private, final, and static. Constant variables never change from their initial value.</p>\r\n	</li>\r\n	<li>\r\n	<p>Static variables are stored in the static memory. It is rare to use static variables other than declared final and used as either public or private constants.</p>\r\n	</li>\r\n	<li>\r\n	<p>Static variables are created when the program starts and destroyed when the program stops.</p>\r\n	</li>\r\n	<li>\r\n	<p>Visibility is similar to instance variables. However, most static variables are declared public since they must be available for users of the class.</p>\r\n	</li>\r\n	<li>\r\n	<p>Default values are same as instance variables. For numbers, the default value is 0; for Booleans, it is false; and for object references, it is null. Values can be assigned during the declaration or within the constructor. Additionally, values can be assigned in special static initializer blocks.</p>\r\n	</li>\r\n	<li>\r\n	<p>Static variables can be accessed by calling with the class name&nbsp;<em>ClassName.VariableName</em>.</p>\r\n	</li>\r\n	<li>\r\n	<p>When declaring class variables as public static final, then variable names (constants) are all in upper case. If the static variables are not public and final, the naming syntax is the same as instance and local variables.</p>\r\n	</li>\r\n</ul>\r\n\r\n<h3>Example</h3>\r\n\r\n<p><a href=\"http://tpcg.io/NHe4EU\" rel=\"nofollow\" target=\"_blank\">&nbsp;Live Demo</a></p>\r\n\r\n<pre>\r\nimport java.io.*;\r\npublic class Employee {\r\n\r\n   // salary  variable is a private static variable\r\n   private static double salary;\r\n\r\n   // DEPARTMENT is a constant\r\n   public static final String DEPARTMENT = &quot;Development &quot;;\r\n\r\n   public static void main(String args[]) {\r\n      salary = 1000;\r\n      System.out.println(DEPARTMENT + &quot;average salary:&quot; + salary);\r\n   }\r\n}</pre>\r\n\r\n<p>This will produce the following result &minus;</p>\r\n\r\n<h3>Output</h3>\r\n\r\n<pre>\r\nDevelopment average salary:1000\r\n</pre>\r\n\r\n<p><strong>Note</strong>&nbsp;&minus; If the variables are accessed from an outside class, the constant should be accessed as Employee.DEPARTMENT</p>\r\n\r\n<h2>What is Next?</h2>\r\n\r\n<p>You already have used access modifiers (public &amp; private) in this chapter. The next chapter will explain Access Modifiers and Non-Access Modifiers in detail.</p>\r\n', 'java'),
(39, 'Java - Modifier Types', '<h1 style=\"margin-left:120px\"><span style=\"color:#3498db\"><span style=\"font-size:24px\"><strong>Java - Modifier Types</strong></span></span></h1>\r\n\r\n<p>Modifiers are keywords that you add to those definitions to change their meanings. Java language has a wide variety of modifiers, including the following &minus;</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><a href=\"https://www.tutorialspoint.com/java/java_access_modifiers.htm\">Java Access Modifiers</a></p>\r\n	</li>\r\n	<li>\r\n	<p><a href=\"https://www.tutorialspoint.com/java/java_nonaccess_modifiers.htm\">Non Access Modifiers</a></p>\r\n	</li>\r\n</ul>\r\n\r\n<p>To use a modifier, you include its keyword in the definition of a class, method, or variable. The modifier precedes the rest of the statement, as in the following example.</p>\r\n\r\n<h3>Example</h3>\r\n\r\n<pre>\r\n<em>public</em> class className {\r\n   // ...\r\n}\r\n\r\n<em>private</em> boolean myFlag;\r\n<em>static final</em> double weeks = 9.5;\r\n<em>protected static final</em> int BOXWIDTH = 42;\r\n\r\n<em>public static</em> void main(String[] arguments) {\r\n   // body of method\r\n}</pre>\r\n\r\n<h2>Access Control Modifiers</h2>\r\n\r\n<p>Java provides a number of access modifiers to set access levels for classes, variables, methods and constructors. The four access levels are &minus;</p>\r\n\r\n<ul>\r\n	<li>Visible to the package, the default. No modifiers are needed.</li>\r\n	<li>Visible to the class only (private).</li>\r\n	<li>Visible to the world (public).</li>\r\n	<li>Visible to the package and all subclasses (protected).</li>\r\n</ul>\r\n\r\n<h2>Non-Access Modifiers</h2>\r\n\r\n<p>Java provides a number of non-access modifiers to achieve many other functionality.</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>The&nbsp;<em>static</em>&nbsp;modifier for creating class methods and variables.</p>\r\n	</li>\r\n	<li>\r\n	<p>The&nbsp;<em>final</em>&nbsp;modifier for finalizing the implementations of classes, methods, and variables.</p>\r\n	</li>\r\n	<li>\r\n	<p>The&nbsp;<em>abstract</em>&nbsp;modifier for creating abstract classes and methods.</p>\r\n	</li>\r\n	<li>\r\n	<p>The&nbsp;<em>synchronized</em>&nbsp;and&nbsp;<em>volatile</em>&nbsp;modifiers, which are used for threads.</p>\r\n	</li>\r\n</ul>\r\n\r\n<h2>What is Next?</h2>\r\n\r\n<p>In the next section, we will be discussing about Basic Operators used in Java Language. The chapter will give you an overview of how these operators can be used during application development.</p>\r\n', 'java'),
(40, 'Java - Basic Operators', '<h1 style=\"margin-left:120px\"><span style=\"font-size:24px\"><span style=\"color:#3498db\"><strong>Java - Basic Operators</strong></span></span></h1>\r\n\r\n<p>Java provides a rich set of operators to manipulate variables. We can divide all the Java operators into the following groups &minus;</p>\r\n\r\n<ul>\r\n	<li>Arithmetic Operators</li>\r\n	<li>Relational Operators</li>\r\n	<li>Bitwise Operators</li>\r\n	<li>Logical Operators</li>\r\n	<li>Assignment Operators</li>\r\n	<li>Misc Operators</li>\r\n</ul>\r\n\r\n<h2>The Arithmetic Operators</h2>\r\n\r\n<p>Arithmetic operators are used in mathematical expressions in the same way that they are used in algebra. The following table lists the arithmetic operators &minus;</p>\r\n\r\n<p>Assume integer variable A holds 10 and variable B holds 20, then &minus;</p>\r\n\r\n<p><a href=\"https://www.tutorialspoint.com/java/java_arithmatic_operators_examples.htm\">Show Examples</a></p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<th>Operator</th>\r\n			<th>Description</th>\r\n			<th>Example</th>\r\n		</tr>\r\n		<tr>\r\n			<td>+ (Addition)</td>\r\n			<td>Adds values on either side of the operator.</td>\r\n			<td>A + B will give 30</td>\r\n		</tr>\r\n		<tr>\r\n			<td>- (Subtraction)</td>\r\n			<td>Subtracts right-hand operand from left-hand operand.</td>\r\n			<td>A - B will give -10</td>\r\n		</tr>\r\n		<tr>\r\n			<td>* (Multiplication)</td>\r\n			<td>Multiplies values on either side of the operator.</td>\r\n			<td>A * B will give 200</td>\r\n		</tr>\r\n		<tr>\r\n			<td>/ (Division)</td>\r\n			<td>Divides left-hand operand by right-hand operand.</td>\r\n			<td>B / A will give 2</td>\r\n		</tr>\r\n		<tr>\r\n			<td>% (Modulus)</td>\r\n			<td>Divides left-hand operand by right-hand operand and returns remainder.</td>\r\n			<td>B % A will give 0</td>\r\n		</tr>\r\n		<tr>\r\n			<td>++ (Increment)</td>\r\n			<td>Increases the value of operand by 1.</td>\r\n			<td>B++ gives 21</td>\r\n		</tr>\r\n		<tr>\r\n			<td>-- (Decrement)</td>\r\n			<td>Decreases the value of operand by 1.</td>\r\n			<td>B-- gives 19</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h2>The Relational Operators</h2>\r\n\r\n<p>There are following relational operators supported by Java language.</p>\r\n\r\n<p>Assume variable A holds 10 and variable B holds 20, then &minus;</p>\r\n\r\n<p><a href=\"https://www.tutorialspoint.com/java/java_relational_operators_examples.htm\">Show Examples</a></p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<th>Operator</th>\r\n			<th>Description</th>\r\n			<th>Example</th>\r\n		</tr>\r\n		<tr>\r\n			<td>== (equal to)</td>\r\n			<td>Checks if the values of two operands are equal or not, if yes then condition becomes true.</td>\r\n			<td>(A == B) is not true.</td>\r\n		</tr>\r\n		<tr>\r\n			<td>!= (not equal to)</td>\r\n			<td>Checks if the values of two operands are equal or not, if values are not equal then condition becomes true.</td>\r\n			<td>(A != B) is true.</td>\r\n		</tr>\r\n		<tr>\r\n			<td>&gt; (greater than)</td>\r\n			<td>Checks if the value of left operand is greater than the value of right operand, if yes then condition becomes true.</td>\r\n			<td>(A &gt; B) is not true.</td>\r\n		</tr>\r\n		<tr>\r\n			<td>&lt; (less than)</td>\r\n			<td>Checks if the value of left operand is less than the value of right operand, if yes then condition becomes true.</td>\r\n			<td>(A &lt; B) is true.</td>\r\n		</tr>\r\n		<tr>\r\n			<td>&gt;= (greater than or equal to)</td>\r\n			<td>Checks if the value of left operand is greater than or equal to the value of right operand, if yes then condition becomes true.</td>\r\n			<td>(A &gt;= B) is not true.</td>\r\n		</tr>\r\n		<tr>\r\n			<td>&lt;= (less than or equal to)</td>\r\n			<td>Checks if the value of left operand is less than or equal to the value of right operand, if yes then condition becomes true.</td>\r\n			<td>(A &lt;= B) is true.</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h2>The Bitwise Operators</h2>\r\n\r\n<p>Java defines several bitwise operators, which can be applied to the integer types, long, int, short, char, and byte.</p>\r\n\r\n<p>Bitwise operator works on bits and performs bit-by-bit operation. Assume if a = 60 and b = 13; now in binary format they will be as follows &minus;</p>\r\n\r\n<p>a = 0011 1100</p>\r\n\r\n<p>b = 0000 1101</p>\r\n\r\n<p>-----------------</p>\r\n\r\n<p>a&amp;b = 0000 1100</p>\r\n\r\n<p>a|b = 0011 1101</p>\r\n\r\n<p>a^b = 0011 0001</p>\r\n\r\n<p>~a&nbsp; = 1100 0011</p>\r\n\r\n<p>The following table lists the bitwise operators &minus;</p>\r\n\r\n<p>Assume integer variable A holds 60 and variable B holds 13 then &minus;</p>\r\n\r\n<p><a href=\"https://www.tutorialspoint.com/java/java_bitwise_operators_examples.htm\">Show Examples</a></p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<th>Operator</th>\r\n			<th>Description</th>\r\n			<th>Example</th>\r\n		</tr>\r\n		<tr>\r\n			<td>&amp; (bitwise and)</td>\r\n			<td>Binary AND Operator copies a bit to the result if it exists in both operands.</td>\r\n			<td>(A &amp; B) will give 12 which is 0000 1100</td>\r\n		</tr>\r\n		<tr>\r\n			<td>| (bitwise or)</td>\r\n			<td>Binary OR Operator copies a bit if it exists in either operand.</td>\r\n			<td>(A | B) will give 61 which is 0011 1101</td>\r\n		</tr>\r\n		<tr>\r\n			<td>^ (bitwise XOR)</td>\r\n			<td>Binary XOR Operator copies the bit if it is set in one operand but not both.</td>\r\n			<td>(A ^ B) will give 49 which is 0011 0001</td>\r\n		</tr>\r\n		<tr>\r\n			<td>~ (bitwise compliment)</td>\r\n			<td>Binary Ones Complement Operator is unary and has the effect of &#39;flipping&#39; bits.</td>\r\n			<td>(~A ) will give -61 which is 1100 0011 in 2&#39;s complement form due to a signed binary number.</td>\r\n		</tr>\r\n		<tr>\r\n			<td>&lt;&lt; (left shift)</td>\r\n			<td>Binary Left Shift Operator. The left operands value is moved left by the number of bits specified by the right operand.</td>\r\n			<td>A &lt;&lt; 2 will give 240 which is 1111 0000</td>\r\n		</tr>\r\n		<tr>\r\n			<td>&gt;&gt; (right shift)</td>\r\n			<td>Binary Right Shift Operator. The left operands value is moved right by the number of bits specified by the right operand.</td>\r\n			<td>A &gt;&gt; 2 will give 15 which is 1111</td>\r\n		</tr>\r\n		<tr>\r\n			<td>&gt;&gt;&gt; (zero fill right shift)</td>\r\n			<td>Shift right zero fill operator. The left operands value is moved right by the number of bits specified by the right operand and shifted values are filled up with zeros.</td>\r\n			<td>A &gt;&gt;&gt;2 will give 15 which is 0000 1111</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h2>The Logical Operators</h2>\r\n\r\n<p>The following table lists the logical operators &minus;</p>\r\n\r\n<p>Assume Boolean variables A holds true and variable B holds false, then &minus;</p>\r\n\r\n<p><a href=\"https://www.tutorialspoint.com/java/java_logical_operators_examples.htm\">Show Examples</a></p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<th>Operator</th>\r\n			<th>Description</th>\r\n			<th>Example</th>\r\n		</tr>\r\n		<tr>\r\n			<td>&amp;&amp; (logical and)</td>\r\n			<td>Called Logical AND operator. If both the operands are non-zero, then the condition becomes true.</td>\r\n			<td>(A &amp;&amp; B) is false</td>\r\n		</tr>\r\n		<tr>\r\n			<td>|| (logical or)</td>\r\n			<td>Called Logical OR Operator. If any of the two operands are non-zero, then the condition becomes true.</td>\r\n			<td>(A || B) is true</td>\r\n		</tr>\r\n		<tr>\r\n			<td>! (logical not)</td>\r\n			<td>Called Logical NOT Operator. Use to reverses the logical state of its operand. If a condition is true then Logical NOT operator will make false.</td>\r\n			<td>!(A &amp;&amp; B) is true</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h2>The Assignment Operators</h2>\r\n\r\n<p>Following are the assignment operators supported by Java language &minus;</p>\r\n\r\n<p><a href=\"https://www.tutorialspoint.com/java/java_assignment_operators_examples.htm\">Show Examples</a></p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<th>Operator</th>\r\n			<th>Description</th>\r\n			<th>Example</th>\r\n		</tr>\r\n		<tr>\r\n			<td>=</td>\r\n			<td>Simple assignment operator. Assigns values from right side operands to left side operand.</td>\r\n			<td>C = A + B will assign value of A + B into C</td>\r\n		</tr>\r\n		<tr>\r\n			<td>+=</td>\r\n			<td>Add AND assignment operator. It adds right operand to the left operand and assign the result to left operand.</td>\r\n			<td>C += A is equivalent to C = C + A</td>\r\n		</tr>\r\n		<tr>\r\n			<td>-=</td>\r\n			<td>Subtract AND assignment operator. It subtracts right operand from the left operand and assign the result to left operand.</td>\r\n			<td>C -= A is equivalent to C = C &ndash; A</td>\r\n		</tr>\r\n		<tr>\r\n			<td>*=</td>\r\n			<td>Multiply AND assignment operator. It multiplies right operand with the left operand and assign the result to left operand.</td>\r\n			<td>C *= A is equivalent to C = C * A</td>\r\n		</tr>\r\n		<tr>\r\n			<td>/=</td>\r\n			<td>Divide AND assignment operator. It divides left operand with the right operand and assign the result to left operand.</td>\r\n			<td>C /= A is equivalent to C = C / A</td>\r\n		</tr>\r\n		<tr>\r\n			<td>%=</td>\r\n			<td>Modulus AND assignment operator. It takes modulus using two operands and assign the result to left operand.</td>\r\n			<td>C %= A is equivalent to C = C % A</td>\r\n		</tr>\r\n		<tr>\r\n			<td>&lt;&lt;=</td>\r\n			<td>Left shift AND assignment operator.</td>\r\n			<td>C &lt;&lt;= 2 is same as C = C &lt;&lt; 2</td>\r\n		</tr>\r\n		<tr>\r\n			<td>&gt;&gt;=</td>\r\n			<td>Right shift AND assignment operator.</td>\r\n			<td>C &gt;&gt;= 2 is same as C = C &gt;&gt; 2</td>\r\n		</tr>\r\n		<tr>\r\n			<td>&amp;=</td>\r\n			<td>Bitwise AND assignment operator.</td>\r\n			<td>C &amp;= 2 is same as C = C &amp; 2</td>\r\n		</tr>\r\n		<tr>\r\n			<td>^=</td>\r\n			<td>bitwise exclusive OR and assignment operator.</td>\r\n			<td>C ^= 2 is same as C = C ^ 2</td>\r\n		</tr>\r\n		<tr>\r\n			<td>|=</td>\r\n			<td>bitwise inclusive OR and assignment operator.</td>\r\n			<td>C |= 2 is same as C = C | 2</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h2>Miscellaneous Operators</h2>\r\n\r\n<p>There are few other operators supported by Java Language.</p>\r\n\r\n<h3>Conditional Operator ( ? : )</h3>\r\n\r\n<p>Conditional operator is also known as the&nbsp;<strong>ternary operator</strong>. This operator consists of three operands and is used to evaluate Boolean expressions. The goal of the operator is to decide, which value should be assigned to the variable. The operator is written as &minus;</p>\r\n\r\n<pre>\r\nvariable x = (expression) ? value if true : value if false\r\n</pre>\r\n\r\n<p>Following is an example &minus;</p>\r\n\r\n<p><strong>Example</strong></p>\r\n\r\n<p><a href=\"http://tpcg.io/xJJ2kP\" rel=\"nofollow\" target=\"_blank\">&nbsp;Live Demo</a></p>\r\n\r\n<pre>\r\npublic class Test {\r\n\r\n   public static void main(String args[]) {\r\n      int a, b;\r\n      a = 10;\r\n      b = (a == 1) ? 20: 30;\r\n      System.out.println( &quot;Value of b is : &quot; +  b );\r\n\r\n      b = (a == 10) ? 20: 30;\r\n      System.out.println( &quot;Value of b is : &quot; + b );\r\n   }\r\n}</pre>\r\n\r\n<p>This will produce the following result &minus;</p>\r\n\r\n<p><strong>Output</strong></p>\r\n\r\n<pre>\r\nValue of b is : 30\r\nValue of b is : 20\r\n</pre>\r\n\r\n<h3>instanceof Operator</h3>\r\n\r\n<p>This operator is used only for object reference variables. The operator checks whether the object is of a particular type (class type or interface type). instanceof operator is written as &minus;</p>\r\n\r\n<pre>\r\n( Object reference variable ) instanceof  (class/interface type)\r\n</pre>\r\n\r\n<p>If the object referred by the variable on the left side of the operator passes the IS-A check for the class/interface type on the right side, then the result will be true. Following is an example &minus;</p>\r\n\r\n<p><strong>Example</strong></p>\r\n\r\n<p><a href=\"http://tpcg.io/P7OE1d\" rel=\"nofollow\" target=\"_blank\">&nbsp;Live Demo</a></p>\r\n\r\n<pre>\r\npublic class Test {\r\n\r\n   public static void main(String args[]) {\r\n\r\n      String name = &quot;James&quot;;\r\n\r\n      // following will return true since name is type of String\r\n      boolean result = name instanceof String;\r\n      System.out.println( result );\r\n   }\r\n}</pre>\r\n\r\n<p>This will produce the following result &minus;</p>\r\n\r\n<p><strong>Output</strong></p>\r\n\r\n<pre>\r\ntrue\r\n</pre>\r\n\r\n<p>This operator will still return true, if the object being compared is the assignment compatible with the type on the right. Following is one more example &minus;</p>\r\n\r\n<p><strong>Example</strong></p>\r\n\r\n<p><a href=\"http://tpcg.io/TWlS7d\" rel=\"nofollow\" target=\"_blank\">&nbsp;Live Demo</a></p>\r\n\r\n<pre>\r\nclass Vehicle {}\r\n\r\npublic class Car extends Vehicle {\r\n\r\n   public static void main(String args[]) {\r\n\r\n      Vehicle a = new Car();\r\n      boolean result =  a instanceof Car;\r\n      System.out.println( result );\r\n   }\r\n}</pre>\r\n\r\n<p>This will produce the following result &minus;</p>\r\n\r\n<p><strong>Output</strong></p>\r\n\r\n<pre>\r\ntrue\r\n</pre>\r\n\r\n<h2>Precedence of Java Operators</h2>\r\n\r\n<p>Operator precedence determines the grouping of terms in an expression. This affects how an expression is evaluated. Certain operators have higher precedence than others; for example, the multiplication operator has higher precedence than the addition operator &minus;</p>\r\n\r\n<p>For example, x = 7 + 3 * 2; here x is assigned 13, not 20 because operator * has higher precedence than +, so it first gets multiplied with 3 * 2 and then adds into 7.</p>\r\n\r\n<p>Here, operators with the highest precedence appear at the top of the table, those with the lowest appear at the bottom. Within an expression, higher precedence operators will be evaluated first.</p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<th>Category</th>\r\n			<th>Operator</th>\r\n			<th>Associativity</th>\r\n		</tr>\r\n		<tr>\r\n			<td>Postfix</td>\r\n			<td>expression++ expression--</td>\r\n			<td>Left to right</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Unary</td>\r\n			<td>++expression &ndash;-expression +expression &ndash;expression ~ !</td>\r\n			<td>Right to left</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Multiplicative</td>\r\n			<td>* / %</td>\r\n			<td>Left to right</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Additive</td>\r\n			<td>+ -</td>\r\n			<td>Left to right</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Shift</td>\r\n			<td>&lt;&lt; &gt;&gt; &gt;&gt;&gt;</td>\r\n			<td>Left to right</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Relational</td>\r\n			<td>&lt; &gt; &lt;= &gt;= instanceof</td>\r\n			<td>Left to right</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Equality</td>\r\n			<td>== !=</td>\r\n			<td>Left to right</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Bitwise AND</td>\r\n			<td>&amp;</td>\r\n			<td>Left to right</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Bitwise XOR</td>\r\n			<td>^</td>\r\n			<td>Left to right</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Bitwise OR</td>\r\n			<td>|</td>\r\n			<td>Left to right</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Logical AND</td>\r\n			<td>&amp;&amp;</td>\r\n			<td>Left to right</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Logical OR</td>\r\n			<td>||</td>\r\n			<td>Left to right</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Conditional</td>\r\n			<td>?:</td>\r\n			<td>Right to left</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Assignment</td>\r\n			<td>= += -= *= /= %= ^= |= &lt;&lt;= &gt;&gt;= &gt;&gt;&gt;=</td>\r\n			<td>Right to left</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h2>What is Next?</h2>\r\n\r\n<p>The next chapter will explain about loop control in Java programming. The chapter will describe various types of loops and how these loops can be used in Java program development and for what purposes they are being used.</p>\r\n', 'java'),
(41, 'Java - Loop Control', '<h1 style=\"margin-left:120px\"><span style=\"color:#3498db\"><span style=\"font-size:24px\"><strong>Java - Loop Control</strong></span></span></h1>\r\n\r\n<p>There may be a situation when you need to execute a block of code several number of times. In general, statements are executed sequentially: The first statement in a function is executed first, followed by the second, and so on.</p>\r\n\r\n<p>Programming languages provide various control structures that allow for more complicated execution paths.</p>\r\n\r\n<p>A&nbsp;<strong>loop</strong>&nbsp;statement allows us to execute a statement or group of statements multiple times and following is the general form of a loop statement in most of the programming languages &minus;</p>\r\n\r\n<p><img alt=\"Loop Architecture\" src=\"https://www.tutorialspoint.com/java/images/loop_architecture.jpg\" /></p>\r\n\r\n<p>Java programming language provides the following types of loop to handle looping requirements. Click the following links to check their detail.</p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<th>Sr.No.</th>\r\n			<th>Loop &amp; Description</th>\r\n		</tr>\r\n		<tr>\r\n			<td>1</td>\r\n			<td><a href=\"https://www.tutorialspoint.com/java/java_while_loop.htm\">while loop</a>\r\n			<p>Repeats a statement or group of statements while a given condition is true. It tests the condition before executing the loop body.</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>2</td>\r\n			<td><a href=\"https://www.tutorialspoint.com/java/java_for_loop.htm\">for loop</a>\r\n			<p>Execute a sequence of statements multiple times and abbreviates the code that manages the loop variable.</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>3</td>\r\n			<td><a href=\"https://www.tutorialspoint.com/java/java_do_while_loop.htm\">do...while loop</a>\r\n			<p>Like a while statement, except that it tests the condition at the end of the loop body.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h2>Loop Control Statements</h2>\r\n\r\n<p>Loop control statements change execution from its normal sequence. When execution leaves a scope, all automatic objects that were created in that scope are destroyed.</p>\r\n\r\n<p>Java supports the following control statements. Click the following links to check their detail.</p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<th>Sr.No.</th>\r\n			<th>Control Statement &amp; Description</th>\r\n		</tr>\r\n		<tr>\r\n			<td>1</td>\r\n			<td><a href=\"https://www.tutorialspoint.com/java/java_break_statement.htm\">break statement</a>\r\n			<p>Terminates the&nbsp;<strong>loop</strong>&nbsp;or&nbsp;<strong>switch</strong>&nbsp;statement and transfers execution to the statement immediately following the loop or switch.</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>2</td>\r\n			<td><a href=\"https://www.tutorialspoint.com/java/java_continue_statement.htm\">continue statement</a>\r\n			<p>Causes the loop to skip the remainder of its body and immediately retest its condition prior to reiterating.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h2>Enhanced for loop in Java</h2>\r\n\r\n<p>As of Java 5, the enhanced for loop was introduced. This is mainly used to traverse collection of elements including arrays.</p>\r\n\r\n<h3>Syntax</h3>\r\n\r\n<p>Following is the syntax of enhanced for loop &minus;</p>\r\n\r\n<pre>\r\nfor(declaration : expression) {\r\n   // Statements\r\n}\r\n</pre>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>Declaration</strong>&nbsp;&minus; The newly declared block variable, is of a type compatible with the elements of the array you are accessing. The variable will be available within the for block and its value would be the same as the current array element.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Expression</strong>&nbsp;&minus; This evaluates to the array you need to loop through. The expression can be an array variable or method call that returns an array.</p>\r\n	</li>\r\n</ul>\r\n\r\n<h3>Example</h3>\r\n\r\n<p><a href=\"http://tpcg.io/4R5ayk\" rel=\"nofollow\" target=\"_blank\">&nbsp;Live Demo</a></p>\r\n\r\n<pre>\r\npublic class Test {\r\n\r\n   public static void main(String args[]) {\r\n      int [] numbers = {10, 20, 30, 40, 50};\r\n\r\n      for(int x : numbers ) {\r\n         System.out.print( x );\r\n         System.out.print(&quot;,&quot;);\r\n      }\r\n      System.out.print(&quot;\n&quot;);\r\n      String [] names = {&quot;James&quot;, &quot;Larry&quot;, &quot;Tom&quot;, &quot;Lacy&quot;};\r\n\r\n      for( String name : names ) {\r\n         System.out.print( name );\r\n         System.out.print(&quot;,&quot;);\r\n      }\r\n   }\r\n}</pre>\r\n\r\n<p>This will produce the following result &minus;</p>\r\n\r\n<h3>Output</h3>\r\n\r\n<pre>\r\n10, 20, 30, 40, 50,\r\nJames, Larry, Tom, Lacy,\r\n</pre>\r\n\r\n<h2>What is Next?</h2>\r\n\r\n<p>In the following chapter, we will be learning about decision making statements in Java programming.</p>\r\n', 'java'),
(42, 'Java - Decision Making', '<h1 style=\"margin-left:120px\"><span style=\"color:#ffffff\"><span style=\"font-size:24px\"><strong><span style=\"background-color:#3498db\">Java - Decision Making</span></strong></span></span></h1>\r\n\r\n<p>Decision making structures have one or more conditions to be evaluated or tested by the program, along with a statement or statements that are to be executed if the condition is determined to be true, and optionally, other statements to be executed if the condition is determined to be false.</p>\r\n\r\n<p>Following is the general form of a typical decision making structure found in most of the programming languages &minus;</p>\r\n\r\n<p><img alt=\"Decision Making\" src=\"https://www.tutorialspoint.com/java/images/decision_making.jpg\" /></p>\r\n\r\n<p>Java programming language provides following types of decision making statements. Click the following links to check their detail.</p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<th>Sr.No.</th>\r\n			<th>Statement &amp; Description</th>\r\n		</tr>\r\n		<tr>\r\n			<td>1</td>\r\n			<td><a href=\"https://www.tutorialspoint.com/java/if_statement_in_java.htm\">if statement</a>\r\n			<p>An&nbsp;<strong>if statement</strong>&nbsp;consists of a boolean expression followed by one or more statements.</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>2</td>\r\n			<td><a href=\"https://www.tutorialspoint.com/java/if_else_statement_in_java.htm\">if...else statement</a>\r\n			<p>An&nbsp;<strong>if statement</strong>&nbsp;can be followed by an optional&nbsp;<strong>else statement</strong>, which executes when the boolean expression is false.</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>3</td>\r\n			<td><a href=\"https://www.tutorialspoint.com/java/nested_if_statements_in_java.htm\">nested if statement</a>\r\n			<p>You can use one&nbsp;<strong>if</strong>&nbsp;or&nbsp;<strong>else if</strong>&nbsp;statement inside another&nbsp;<strong>if</strong>&nbsp;or&nbsp;<strong>else if</strong>statement(s).</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>4</td>\r\n			<td><a href=\"https://www.tutorialspoint.com/java/switch_statement_in_java.htm\">switch statement</a>\r\n			<p>A&nbsp;<strong>switch</strong>&nbsp;statement allows a variable to be tested for equality against a list of values.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h2>The ? : Operator</h2>\r\n\r\n<p>We have covered&nbsp;<strong>conditional operator ? :</strong>&nbsp;in the previous chapter which can be used to replace&nbsp;<strong>if...else</strong>&nbsp;statements. It has the following general form &minus;</p>\r\n\r\n<pre>\r\nExp1 ? Exp2 : Exp3;\r\n</pre>\r\n\r\n<p>Where Exp1, Exp2, and Exp3 are expressions. Notice the use and placement of the colon.</p>\r\n\r\n<p>To determine the value of the whole expression, initially exp1 is evaluated.</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>If the value of exp1 is true, then the value of Exp2 will be the value of the whole expression.</p>\r\n	</li>\r\n	<li>\r\n	<p>If the value of exp1 is false, then Exp3 is evaluated and its value becomes the value of the entire expression.</p>\r\n	</li>\r\n</ul>\r\n\r\n<h2>What is Next?</h2>\r\n\r\n<p>In the next chapter, we will discuss about Number class (in the java.lang package) and its subclasses in Java Language.</p>\r\n\r\n<p>We will be looking into some of the situations where you will use instantiations of these classes rather than the primitive data types, as well as classes such as formatting, mathematical functions that you need to know about when working with Numbers.</p>\r\n', 'java'),
(43, 'Java - Numbers Class', '<h1 style=\"margin-left:120px\"><span style=\"color:#3498db\"><span style=\"font-size:24px\"><strong>Java - Numbers Class</strong></span></span></h1>\r\n\r\n<p>Normally, when we work with Numbers, we use primitive data types such as byte, int, long, double, etc.</p>\r\n\r\n<h3>Example</h3>\r\n\r\n<pre>\r\nint i = 5000;\r\nfloat gpa = 13.65;\r\ndouble mask = 0xaf;</pre>\r\n\r\n<p>However, in development, we come across situations where we need to use objects instead of primitive data types. In order to achieve this, Java provides&nbsp;<strong>wrapper classes</strong>.</p>\r\n\r\n<p>All the wrapper classes (Integer, Long, Byte, Double, Float, Short) are subclasses of the abstract class Number.</p>\r\n\r\n<p><img alt=\"Number Classes\" src=\"https://www.tutorialspoint.com/java/images/number_classes.jpg\" /></p>\r\n\r\n<p>The object of the wrapper class contains or wraps its respective primitive data type. Converting primitive data types into object is called&nbsp;<strong>boxing</strong>, and this is taken care by the compiler. Therefore, while using a wrapper class you just need to pass the value of the primitive data type to the constructor of the Wrapper class.</p>\r\n\r\n<p>And the Wrapper object will be converted back to a primitive data type, and this process is called unboxing. The&nbsp;<strong>Number</strong>&nbsp;class is part of the java.lang package.</p>\r\n\r\n<p>Following is an example of boxing and unboxing &minus;</p>\r\n\r\n<h3>Example</h3>\r\n\r\n<p><a href=\"http://tpcg.io/rNELk1\" rel=\"nofollow\" target=\"_blank\">&nbsp;Live Demo</a></p>\r\n\r\n<pre>\r\npublic class Test {\r\n\r\n   public static void main(String args[]) {\r\n      Integer x = 5; // boxes int to an Integer object\r\n      x =  x + 10;   // unboxes the Integer to a int\r\n      System.out.println(x); \r\n   }\r\n}</pre>\r\n\r\n<p>This will produce the following result &minus;</p>\r\n\r\n<h3>Output</h3>\r\n\r\n<pre>\r\n15\r\n</pre>\r\n\r\n<p>When x is assigned an integer value, the compiler boxes the integer because x is integer object. Later, x is unboxed so that they can be added as an integer.</p>\r\n\r\n<h2>Number Methods</h2>\r\n\r\n<p>Following is the list of the instance methods that all the subclasses of the Number class implements &minus;</p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<th>Sr.No.</th>\r\n			<th>Method &amp; Description</th>\r\n		</tr>\r\n		<tr>\r\n			<td>1</td>\r\n			<td><a href=\"https://www.tutorialspoint.com/java/number_xxxvalue.htm\">xxxValue()</a>\r\n			<p>Converts the value of&nbsp;<em>this</em>&nbsp;Number object to the xxx data type and returns it.</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>2</td>\r\n			<td><a href=\"https://www.tutorialspoint.com/java/number_compareto.htm\">compareTo()</a>\r\n			<p>Compares&nbsp;<em>this</em>&nbsp;Number object to the argument.</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>3</td>\r\n			<td><a href=\"https://www.tutorialspoint.com/java/number_equals.htm\">equals()</a>\r\n			<p>Determines whether&nbsp;<em>this</em>&nbsp;number object is equal to the argument.</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>4</td>\r\n			<td><a href=\"https://www.tutorialspoint.com/java/number_valueof.htm\">valueOf()</a>\r\n			<p>Returns an Integer object holding the value of the specified primitive.</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>5</td>\r\n			<td><a href=\"https://www.tutorialspoint.com/java/number_tostring.htm\">toString()</a>\r\n			<p>Returns a String object representing the value of a specified int or Integer.</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>6</td>\r\n			<td><a href=\"https://www.tutorialspoint.com/java/number_parseint.htm\">parseInt()</a>\r\n			<p>This method is used to get the primitive data type of a certain String.</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>7</td>\r\n			<td><a href=\"https://www.tutorialspoint.com/java/number_abs.htm\">abs()</a>\r\n			<p>Returns the absolute value of the argument.</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>8</td>\r\n			<td><a href=\"https://www.tutorialspoint.com/java/number_ceil.htm\">ceil()</a>\r\n			<p>Returns the smallest integer that is greater than or equal to the argument. Returned as a double.</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>9</td>\r\n			<td><a href=\"https://www.tutorialspoint.com/java/number_floor.htm\">floor()</a>\r\n			<p>Returns the largest integer that is less than or equal to the argument. Returned as a double.</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>10</td>\r\n			<td><a href=\"https://www.tutorialspoint.com/java/number_rint.htm\">rint()</a>\r\n			<p>Returns the integer that is closest in value to the argument. Returned as a double.</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>11</td>\r\n			<td><a href=\"https://www.tutorialspoint.com/java/number_round.htm\">round()</a>\r\n			<p>Returns the closest long or int, as indicated by the method&#39;s return type to the argument.</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>12</td>\r\n			<td><a href=\"https://www.tutorialspoint.com/java/number_min.htm\">min()</a>\r\n			<p>Returns the smaller of the two arguments.</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>13</td>\r\n			<td><a href=\"https://www.tutorialspoint.com/java/number_max.htm\">max()</a>\r\n			<p>Returns the larger of the two arguments.</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>14</td>\r\n			<td><a href=\"https://www.tutorialspoint.com/java/number_exp.htm\">exp()</a>\r\n			<p>Returns the base of the natural logarithms, e, to the power of the argument.</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>15</td>\r\n			<td><a href=\"https://www.tutorialspoint.com/java/number_log.htm\">log()</a>\r\n			<p>Returns the natural logarithm of the argument.</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>16</td>\r\n			<td><a href=\"https://www.tutorialspoint.com/java/number_pow.htm\">pow()</a>\r\n			<p>Returns the value of the first argument raised to the power of the second argument.</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>17</td>\r\n			<td><a href=\"https://www.tutorialspoint.com/java/number_sqrt.htm\">sqrt()</a>\r\n			<p>Returns the square root of the argument.</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>18</td>\r\n			<td><a href=\"https://www.tutorialspoint.com/java/number_sin.htm\">sin()</a>\r\n			<p>Returns the sine of the specified double value.</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>19</td>\r\n			<td><a href=\"https://www.tutorialspoint.com/java/number_cos.htm\">cos()</a>\r\n			<p>Returns the cosine of the specified double value.</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>20</td>\r\n			<td><a href=\"https://www.tutorialspoint.com/java/number_tan.htm\">tan()</a>\r\n			<p>Returns the tangent of the specified double value.</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>21</td>\r\n			<td><a href=\"https://www.tutorialspoint.com/java/number_asin.htm\">asin()</a>\r\n			<p>Returns the arcsine of the specified double value.</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>22</td>\r\n			<td><a href=\"https://www.tutorialspoint.com/java/number_acos.htm\">acos()</a>\r\n			<p>Returns the arccosine of the specified double value.</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>23</td>\r\n			<td><a href=\"https://www.tutorialspoint.com/java/number_atan.htm\">atan()</a>\r\n			<p>Returns the arctangent of the specified double value.</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>24</td>\r\n			<td><a href=\"https://www.tutorialspoint.com/java/number_atan2.htm\">atan2()</a>\r\n			<p>Converts rectangular coordinates (x, y) to polar coordinate (r, theta) and returns theta.</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>25</td>\r\n			<td><a href=\"https://www.tutorialspoint.com/java/number_todegrees.htm\">toDegrees()</a>\r\n			<p>Converts the argument to degrees.</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>26</td>\r\n			<td><a href=\"https://www.tutorialspoint.com/java/number_toradians.htm\">toRadians()</a>\r\n			<p>Converts the argument to radians.</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>27</td>\r\n			<td><a href=\"https://www.tutorialspoint.com/java/number_random.htm\">random()</a>\r\n			<p>Returns a random number.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h2>What is Next?</h2>\r\n\r\n<p>In the next section, we will be going through the Character class in Java. You will be learning how to use object Characters and primitive data type char in Java.</p>\r\n', 'java'),
(44, 'Python - Tutorial', '<h1 style=\"margin-left:160px\"><span style=\"color:#3498db\"><span style=\"font-size:24px\"><strong>Python - Tutorial</strong></span></span></h1>\r\n\r\n<p>Python is a general-purpose interpreted, interactive, object-oriented, and high-level programming language. It was created by Guido van Rossum during 1985- 1990. Like Perl, Python source code is also available under the GNU General Public License (GPL). This tutorial gives enough understanding on Python programming language.</p>\r\n\r\n<h1>Audience</h1>\r\n\r\n<p>This tutorial is designed for software programmers who need to learn Python programming language from scratch.</p>\r\n\r\n<h1>Prerequisites</h1>\r\n\r\n<p>You should have a basic understanding of Computer Programming terminologies. A basic understanding of any of the programming languages is a plus.</p>\r\n', 'PYTHON');
INSERT INTO `courses` (`id`, `topic_name`, `description`, `course_name`) VALUES
(45, 'Python - Overview', '<p style=\"margin-left:160px\"><span style=\"color:#3498db\"><span style=\"font-size:24px\"><strong>Python - Overview</strong></span></span></p>\r\n\r\n<p>Python is a high-level, interpreted, interactive and object-oriented scripting language. Python is designed to be highly readable. It uses English keywords frequently where as other languages use punctuation, and it has fewer syntactical constructions than other languages.</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>Python is Interpreted</strong>&nbsp;&minus; Python is processed at runtime by the interpreter. You do not need to compile your program before executing it. This is similar to PERL and PHP.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Python is Interactive</strong>&nbsp;&minus; You can actually sit at a Python prompt and interact with the interpreter directly to write your programs.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Python is Object-Oriented</strong>&nbsp;&minus; Python supports Object-Oriented style or technique of programming that encapsulates code within objects.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Python is a Beginner&#39;s Language</strong>&nbsp;&minus; Python is a great language for the beginner-level programmers and supports the development of a wide range of applications from simple text processing to WWW browsers to games.</p>\r\n	</li>\r\n</ul>\r\n\r\n<h2>History of Python</h2>\r\n\r\n<p>Python was developed by Guido van Rossum in the late eighties and early nineties at the National Research Institute for Mathematics and Computer Science in the Netherlands.</p>\r\n\r\n<p>Python is derived from many other languages, including ABC, Modula-3, C, C++, Algol-68, SmallTalk, and Unix shell and other scripting languages.</p>\r\n\r\n<p>Python is copyrighted. Like Perl, Python source code is now available under the GNU General Public License (GPL).</p>\r\n\r\n<p>Python is now maintained by a core development team at the institute, although Guido van Rossum still holds a vital role in directing its progress.</p>\r\n\r\n<h2>Python Features</h2>\r\n\r\n<p>Python&#39;s features include &minus;</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>Easy-to-learn</strong>&nbsp;&minus; Python has few keywords, simple structure, and a clearly defined syntax. This allows the student to pick up the language quickly.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Easy-to-read</strong>&nbsp;&minus; Python code is more clearly defined and visible to the eyes.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Easy-to-maintain</strong>&nbsp;&minus; Python&#39;s source code is fairly easy-to-maintain.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>A broad standard library</strong>&nbsp;&minus; Python&#39;s bulk of the library is very portable and cross-platform compatible on UNIX, Windows, and Macintosh.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Interactive Mode</strong>&nbsp;&minus; Python has support for an interactive mode which allows interactive testing and debugging of snippets of code.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Portable</strong>&nbsp;&minus; Python can run on a wide variety of hardware platforms and has the same interface on all platforms.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Extendable</strong>&nbsp;&minus; You can add low-level modules to the Python interpreter. These modules enable programmers to add to or customize their tools to be more efficient.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Databases</strong>&nbsp;&minus; Python provides interfaces to all major commercial databases.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>GUI Programming</strong>&nbsp;&minus; Python supports GUI applications that can be created and ported to many system calls, libraries and windows systems, such as Windows MFC, Macintosh, and the X Window system of Unix.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Scalable</strong>&nbsp;&minus; Python provides a better structure and support for large programs than shell scripting.</p>\r\n	</li>\r\n</ul>\r\n\r\n<p>Apart from the above-mentioned features, Python has a big list of good features, few are listed below &minus;</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>It supports functional and structured programming methods as well as OOP.</p>\r\n	</li>\r\n	<li>\r\n	<p>It can be used as a scripting language or can be compiled to byte-code for building large applications.</p>\r\n	</li>\r\n	<li>\r\n	<p>It provides very high-level dynamic data types and supports dynamic type checking.</p>\r\n	</li>\r\n	<li>\r\n	<p>It supports automatic garbage collection.</p>\r\n	</li>\r\n	<li>\r\n	<p>It can be easily integrated with C, C++, COM, ActiveX, CORBA, and Java.</p>\r\n	</li>\r\n</ul>\r\n', 'PYTHON'),
(46, 'Python - Environment Setup', '<p style=\"margin-left:120px\"><span style=\"color:#3498db\"><span style=\"font-size:24px\"><strong>Python - Environment Setup</strong></span></span></p>\r\n\r\n<p>Python is available on a wide variety of platforms including Linux and Mac OS X. Let&#39;s understand how to set up our Python environment.</p>\r\n\r\n<h2>Local Environment Setup</h2>\r\n\r\n<p>Open a terminal window and type &quot;python&quot; to find out if it is already installed and which version is installed.</p>\r\n\r\n<ul>\r\n	<li>Unix (Solaris, Linux, FreeBSD, AIX, HP/UX, SunOS, IRIX, etc.)</li>\r\n	<li>Win 9x/NT/2000</li>\r\n	<li>Macintosh (Intel, PPC, 68K)</li>\r\n	<li>OS/2</li>\r\n	<li>DOS (multiple versions)</li>\r\n	<li>PalmOS</li>\r\n	<li>Nokia mobile phones</li>\r\n	<li>Windows CE</li>\r\n	<li>Acorn/RISC OS</li>\r\n	<li>BeOS</li>\r\n	<li>Amiga</li>\r\n	<li>VMS/OpenVMS</li>\r\n	<li>QNX</li>\r\n	<li>VxWorks</li>\r\n	<li>Psion</li>\r\n	<li>Python has also been ported to the Java and .NET virtual machines</li>\r\n</ul>\r\n\r\n<h2>Getting Python</h2>\r\n\r\n<p>The most up-to-date and current source code, binaries, documentation, news, etc., is available on the official website of Python&nbsp;<a href=\"https://www.python.org/\" rel=\"nofollow\" target=\"_blank\">https://www.python.org/</a></p>\r\n\r\n<p>You can download Python documentation from&nbsp;<a href=\"https://www.python.org/doc/\" rel=\"nofollow\" target=\"_blank\">https://www.python.org/doc/</a>. The documentation is available in HTML, PDF, and PostScript formats.</p>\r\n\r\n<h2>Installing Python</h2>\r\n\r\n<p>Python distribution is available for a wide variety of platforms. You need to download only the binary code applicable for your platform and install Python.</p>\r\n\r\n<p>If the binary code for your platform is not available, you need a C compiler to compile the source code manually. Compiling the source code offers more flexibility in terms of choice of features that you require in your installation.</p>\r\n\r\n<p>Here is a quick overview of installing Python on various platforms &minus;</p>\r\n\r\n<h3>Unix and Linux Installation</h3>\r\n\r\n<p>Here are the simple steps to install Python on Unix/Linux machine.</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Open a Web browser and go to&nbsp;<a href=\"https://www.python.org/downloads/\" rel=\"nofollow\" target=\"_blank\">https://www.python.org/downloads/</a>.</p>\r\n	</li>\r\n	<li>\r\n	<p>Follow the link to download zipped source code available for Unix/Linux.</p>\r\n	</li>\r\n	<li>\r\n	<p>Download and extract files.</p>\r\n	</li>\r\n	<li>\r\n	<p>Editing the&nbsp;<em>Modules/Setup</em>&nbsp;file if you want to customize some options.</p>\r\n	</li>\r\n	<li>\r\n	<p>run ./configure script</p>\r\n	</li>\r\n	<li>\r\n	<p>make</p>\r\n	</li>\r\n	<li>\r\n	<p>make install</p>\r\n	</li>\r\n</ul>\r\n\r\n<p>This installs Python at standard location&nbsp;<em>/usr/local/bin</em>&nbsp;and its libraries at&nbsp;<em>/usr/local/lib/pythonXX</em>&nbsp;where XX is the version of Python.</p>\r\n\r\n<h3>Windows Installation</h3>\r\n\r\n<p>Here are the steps to install Python on Windows machine.</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Open a Web browser and go to&nbsp;<a href=\"https://www.python.org/downloads/\" rel=\"nofollow\" target=\"_blank\">https://www.python.org/downloads/</a>.</p>\r\n	</li>\r\n	<li>\r\n	<p>Follow the link for the Windows installer&nbsp;<em>python-XYZ.msi</em>&nbsp;file where XYZ is the version you need to install.</p>\r\n	</li>\r\n	<li>\r\n	<p>To use this installer&nbsp;<em>python-XYZ.msi</em>, the Windows system must support Microsoft Installer 2.0. Save the installer file to your local machine and then run it to find out if your machine supports MSI.</p>\r\n	</li>\r\n	<li>\r\n	<p>Run the downloaded file. This brings up the Python install wizard, which is really easy to use. Just accept the default settings, wait until the install is finished, and you are done.</p>\r\n	</li>\r\n</ul>\r\n\r\n<h3>Macintosh Installation</h3>\r\n\r\n<p>Recent Macs come with Python installed, but it may be several years out of date. See&nbsp;<a href=\"https://www.python.org/download/mac/\" rel=\"nofollow\" target=\"_blank\">http://www.python.org/download/mac/</a>&nbsp;for instructions on getting the current version along with extra tools to support development on the Mac. For older Mac OS&#39;s before Mac OS X 10.3 (released in 2003), MacPython is available.</p>\r\n\r\n<p>Jack Jansen maintains it and you can have full access to the entire documentation at his website &minus;&nbsp;<a href=\"http://www.cwi.nl/~jack/macpython.html\" rel=\"nofollow\" target=\"_blank\">http://www.cwi.nl/~jack/macpython.html</a>. You can find complete installation details for Mac OS installation.</p>\r\n\r\n<h2>Setting up PATH</h2>\r\n\r\n<p>Programs and other executable files can be in many directories, so operating systems provide a search path that lists the directories that the OS searches for executables.</p>\r\n\r\n<p>The path is stored in an environment variable, which is a named string maintained by the operating system. This variable contains information available to the command shell and other programs.</p>\r\n\r\n<p>The&nbsp;<strong>path</strong>&nbsp;variable is named as PATH in Unix or Path in Windows (Unix is case sensitive; Windows is not).</p>\r\n\r\n<p>In Mac OS, the installer handles the path details. To invoke the Python interpreter from any particular directory, you must add the Python directory to your path.</p>\r\n\r\n<h2>Setting path at Unix/Linux</h2>\r\n\r\n<p>To add the Python directory to the path for a particular session in Unix &minus;</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>In the csh shell</strong>&nbsp;&minus; type setenv PATH &quot;$PATH:/usr/local/bin/python&quot; and press Enter.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>In the bash shell (Linux)</strong>&nbsp;&minus; type export PATH=&quot;$PATH:/usr/local/bin/python&quot; and press Enter.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>In the sh or ksh shell</strong>&nbsp;&minus; type PATH=&quot;$PATH:/usr/local/bin/python&quot; and press Enter.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Note</strong>&nbsp;&minus; /usr/local/bin/python is the path of the Python directory</p>\r\n	</li>\r\n</ul>\r\n\r\n<h2>Setting path at Windows</h2>\r\n\r\n<p>To add the Python directory to the path for a particular session in Windows &minus;</p>\r\n\r\n<p><strong>At the command prompt</strong>&nbsp;&minus; type path %path%;C:Python and press Enter.</p>\r\n\r\n<p><strong>Note</strong>&nbsp;&minus; C:Python is the path of the Python directory</p>\r\n\r\n<h2>Python Environment Variables</h2>\r\n\r\n<p>Here are important environment variables, which can be recognized by Python &minus;</p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<th>Sr.No.</th>\r\n			<th>Variable &amp; Description</th>\r\n		</tr>\r\n		<tr>\r\n			<td>1</td>\r\n			<td>\r\n			<p><strong>PYTHONPATH</strong></p>\r\n\r\n			<p>It has a role similar to PATH. This variable tells the Python interpreter where to locate the module files imported into a program. It should include the Python source library directory and the directories containing Python source code. PYTHONPATH is sometimes preset by the Python installer.</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>2</td>\r\n			<td>\r\n			<p><strong>PYTHONSTARTUP</strong></p>\r\n\r\n			<p>It contains the path of an initialization file containing Python source code. It is executed every time you start the interpreter. It is named as .pythonrc.py in Unix and it contains commands that load utilities or modify PYTHONPATH.</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>3</td>\r\n			<td>\r\n			<p><strong>PYTHONCASEOK</strong></p>\r\n\r\n			<p>It is used in Windows to instruct Python to find the first case-insensitive match in an import statement. Set this variable to any value to activate it.</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>4</td>\r\n			<td>\r\n			<p><strong>PYTHONHOME</strong></p>\r\n\r\n			<p>It is an alternative module search path. It is usually embedded in the PYTHONSTARTUP or PYTHONPATH directories to make switching module libraries easy.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h2>Running Python</h2>\r\n\r\n<p>There are three different ways to start Python &minus;</p>\r\n\r\n<h3>Interactive Interpreter</h3>\r\n\r\n<p>You can start Python from Unix, DOS, or any other system that provides you a command-line interpreter or shell window.</p>\r\n\r\n<p>Enter&nbsp;<strong>python</strong>&nbsp;the command line.</p>\r\n\r\n<p>Start coding right away in the interactive interpreter.</p>\r\n\r\n<pre>\r\n$python # Unix/Linux\r\nor\r\npython% # Unix/Linux\r\nor\r\nC:&gt; python # Windows/DOS\r\n</pre>\r\n\r\n<p>Here is the list of all the available command line options &minus;</p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<th>Sr.No.</th>\r\n			<th>Option &amp; Description</th>\r\n		</tr>\r\n		<tr>\r\n			<td>1</td>\r\n			<td>\r\n			<p><strong>-d</strong></p>\r\n\r\n			<p>It provides debug output.</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>2</td>\r\n			<td>\r\n			<p><strong>-O</strong></p>\r\n\r\n			<p>It generates optimized bytecode (resulting in .pyo files).</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>3</td>\r\n			<td>\r\n			<p><strong>-S</strong></p>\r\n\r\n			<p>Do not run import site to look for Python paths on startup.</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>4</td>\r\n			<td>\r\n			<p><strong>-v</strong></p>\r\n\r\n			<p>verbose output (detailed trace on import statements).</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>5</td>\r\n			<td>\r\n			<p><strong>-X</strong></p>\r\n\r\n			<p>disable class-based built-in exceptions (just use strings); obsolete starting with version 1.6.</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>6</td>\r\n			<td>\r\n			<p><strong>-c cmd</strong></p>\r\n\r\n			<p>run Python script sent in as cmd string</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>7</td>\r\n			<td>\r\n			<p><strong>file</strong></p>\r\n\r\n			<p>run Python script from given file</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h3>Script from the Command-line</h3>\r\n\r\n<p>A Python script can be executed at command line by invoking the interpreter on your application, as in the following &minus;</p>\r\n\r\n<pre>\r\n$python script.py # Unix/Linux\r\n\r\nor\r\n\r\npython% script.py # Unix/Linux\r\n\r\nor \r\n\r\nC: &gt;python script.py # Windows/DOS\r\n</pre>\r\n\r\n<p><strong>Note</strong>&nbsp;&minus; Be sure the file permission mode allows execution.</p>\r\n\r\n<h3>Integrated Development Environment</h3>\r\n\r\n<p>You can run Python from a Graphical User Interface (GUI) environment as well, if you have a GUI application on your system that supports Python.</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>Unix</strong>&nbsp;&minus; IDLE is the very first Unix IDE for Python.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Windows</strong>&nbsp;&minus; PythonWin is the first Windows interface for Python and is an IDE with a GUI.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Macintosh</strong>&nbsp;&minus; The Macintosh version of Python along with the IDLE IDE is available from the main website, downloadable as either MacBinary or BinHex&#39;d files.</p>\r\n	</li>\r\n</ul>\r\n\r\n<p>If you are not able to set up the environment properly, then you can take help from your system admin. Make sure the Python environment is properly set up and working perfectly fine.</p>\r\n\r\n<p><strong>Note</strong>&nbsp;&minus; All the examples given in subsequent chapters are executed with Python 2.4.3 version available on CentOS flavor of Linux.</p>\r\n\r\n<p>We already have set up Python Programming environment online, so that you can execute all the available examples online at the same time when you are learning theory. Feel free to modify any example and execute it online</p>\r\n', 'PYTHON'),
(47, 'Python - Basic Syntax', '<h1 style=\"margin-left:120px\"><span style=\"color:#3498db\"><span style=\"font-size:24px\"><strong>Python - Basic Syntax</strong></span></span></h1>\r\n\r\n<p>The Python language has many similarities to Perl, C, and Java. However, there are some definite differences between the languages.</p>\r\n\r\n<h2>First Python Program</h2>\r\n\r\n<p>Let us execute programs in different modes of programming.</p>\r\n\r\n<h3>Interactive Mode Programming</h3>\r\n\r\n<p>Invoking the interpreter without passing a script file as a parameter brings up the following prompt &minus;</p>\r\n\r\n<pre>\r\n$ python\r\nPython 2.4.3 (#1, Nov 11 2010, 13:34:43)\r\n[GCC 4.1.2 20080704 (Red Hat 4.1.2-48)] on linux2\r\nType &quot;help&quot;, &quot;copyright&quot;, &quot;credits&quot; or &quot;license&quot; for more information.\r\n&gt;&gt;&gt;</pre>\r\n\r\n<p>Type the following text at the Python prompt and press the Enter &minus;</p>\r\n\r\n<pre>\r\n&gt;&gt;&gt; print &quot;Hello, Python!&quot;</pre>\r\n\r\n<p>If you are running new version of Python, then you would need to use print statement with parenthesis as in&nbsp;<strong>print (&quot;Hello, Python!&quot;);</strong>. However in Python version 2.4.3, this produces the following result &minus;</p>\r\n\r\n<pre>\r\nHello, Python!\r\n</pre>\r\n\r\n<h3>Script Mode Programming</h3>\r\n\r\n<p>Invoking the interpreter with a script parameter begins execution of the script and continues until the script is finished. When the script is finished, the interpreter is no longer active.</p>\r\n\r\n<p>Let us write a simple Python program in a script. Python files have extension&nbsp;<strong>.py</strong>. Type the following source code in a test.py file &minus;</p>\r\n\r\n<p><a href=\"http://tpcg.io/lsYEBf\" rel=\"nofollow\" target=\"_blank\">&nbsp;Live Demo</a></p>\r\n\r\n<pre>\r\nprint &quot;Hello, Python!&quot;</pre>\r\n\r\n<p>We assume that you have Python interpreter set in PATH variable. Now, try to run this program as follows &minus;</p>\r\n\r\n<pre>\r\n$ python test.py</pre>\r\n\r\n<p>This produces the following result &minus;</p>\r\n\r\n<pre>\r\nHello, Python!\r\n</pre>\r\n\r\n<p>Let us try another way to execute a Python script. Here is the modified test.py file &minus;</p>\r\n\r\n<p><a href=\"http://tpcg.io/2hIf1p\" rel=\"nofollow\" target=\"_blank\">&nbsp;Live Demo</a></p>\r\n\r\n<pre>\r\n#!/usr/bin/python\r\n\r\nprint &quot;Hello, Python!&quot;</pre>\r\n\r\n<p>We assume that you have Python interpreter available in /usr/bin directory. Now, try to run this program as follows &minus;</p>\r\n\r\n<pre>\r\n$ chmod +x test.py     # This is to make file executable\r\n$./test.py</pre>\r\n\r\n<p>This produces the following result &minus;</p>\r\n\r\n<pre>\r\nHello, Python!\r\n</pre>\r\n\r\n<h2>Python Identifiers</h2>\r\n\r\n<p>A Python identifier is a name used to identify a variable, function, class, module or other object. An identifier starts with a letter A to Z or a to z or an underscore (_) followed by zero or more letters, underscores and digits (0 to 9).</p>\r\n\r\n<p>Python does not allow punctuation characters such as @, $, and % within identifiers. Python is a case sensitive programming language. Thus,&nbsp;<strong>Manpower</strong>&nbsp;and&nbsp;<strong>manpower</strong>&nbsp;are two different identifiers in Python.</p>\r\n\r\n<p>Here are naming conventions for Python identifiers &minus;</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Class names start with an uppercase letter. All other identifiers start with a lowercase letter.</p>\r\n	</li>\r\n	<li>\r\n	<p>Starting an identifier with a single leading underscore indicates that the identifier is private.</p>\r\n	</li>\r\n	<li>\r\n	<p>Starting an identifier with two leading underscores indicates a strongly private identifier.</p>\r\n	</li>\r\n	<li>\r\n	<p>If the identifier also ends with two trailing underscores, the identifier is a language-defined special name.</p>\r\n	</li>\r\n</ul>\r\n\r\n<h2>Reserved Words</h2>\r\n\r\n<p>The following list shows the Python keywords. These are reserved words and you cannot use them as constant or variable or any other identifier names. All the Python keywords contain lowercase letters only.</p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>and</td>\r\n			<td>exec</td>\r\n			<td>not</td>\r\n		</tr>\r\n		<tr>\r\n			<td>assert</td>\r\n			<td>finally</td>\r\n			<td>or</td>\r\n		</tr>\r\n		<tr>\r\n			<td>break</td>\r\n			<td>for</td>\r\n			<td>pass</td>\r\n		</tr>\r\n		<tr>\r\n			<td>class</td>\r\n			<td>from</td>\r\n			<td>print</td>\r\n		</tr>\r\n		<tr>\r\n			<td>continue</td>\r\n			<td>global</td>\r\n			<td>raise</td>\r\n		</tr>\r\n		<tr>\r\n			<td>def</td>\r\n			<td>if</td>\r\n			<td>return</td>\r\n		</tr>\r\n		<tr>\r\n			<td>del</td>\r\n			<td>import</td>\r\n			<td>try</td>\r\n		</tr>\r\n		<tr>\r\n			<td>elif</td>\r\n			<td>in</td>\r\n			<td>while</td>\r\n		</tr>\r\n		<tr>\r\n			<td>else</td>\r\n			<td>is</td>\r\n			<td>with</td>\r\n		</tr>\r\n		<tr>\r\n			<td>except</td>\r\n			<td>lambda</td>\r\n			<td>yield</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h2>Lines and Indentation</h2>\r\n\r\n<p>Python provides no braces to indicate blocks of code for class and function definitions or flow control. Blocks of code are denoted by line indentation, which is rigidly enforced.</p>\r\n\r\n<p>The number of spaces in the indentation is variable, but all statements within the block must be indented the same amount. For example &minus;</p>\r\n\r\n<pre>\r\nif True:\r\n   print &quot;True&quot;\r\nelse:\r\n   print &quot;False&quot;\r\n</pre>\r\n\r\n<p>However, the following block generates an error &minus;</p>\r\n\r\n<pre>\r\nif True:\r\nprint &quot;Answer&quot;\r\nprint &quot;True&quot;\r\nelse:\r\nprint &quot;Answer&quot;\r\nprint &quot;False&quot;</pre>\r\n\r\n<p>Thus, in Python all the continuous lines indented with same number of spaces would form a block. The following example has various statement blocks &minus;</p>\r\n\r\n<p><strong>Note</strong>&nbsp;&minus; Do not try to understand the logic at this point of time. Just make sure you understood various blocks even if they are without braces.</p>\r\n\r\n<pre>\r\n#!/usr/bin/python\r\n\r\nimport sys\r\n\r\ntry:\r\n   # open file stream\r\n   file = open(file_name, &quot;w&quot;)\r\nexcept IOError:\r\n   print &quot;There was an error writing to&quot;, file_name\r\n   sys.exit()\r\nprint &quot;Enter &#39;&quot;, file_finish,\r\nprint &quot;&#39; When finished&quot;\r\nwhile file_text != file_finish:\r\n   file_text = raw_input(&quot;Enter text: &quot;)\r\n   if file_text == file_finish:\r\n      # close the file\r\n      file.close\r\n      break\r\n   file.write(file_text)\r\n   file.write(&quot;\n&quot;)\r\nfile.close()\r\nfile_name = raw_input(&quot;Enter filename: &quot;)\r\nif len(file_name) == 0:\r\n   print &quot;Next time please enter something&quot;\r\n   sys.exit()\r\ntry:\r\n   file = open(file_name, &quot;r&quot;)\r\nexcept IOError:\r\n   print &quot;There was an error reading file&quot;\r\n   sys.exit()\r\nfile_text = file.read()\r\nfile.close()\r\nprint file_text</pre>\r\n\r\n<h2>Multi-Line Statements</h2>\r\n\r\n<p>Statements in Python typically end with a new line. Python does, however, allow the use of the line continuation character () to denote that the line should continue. For example &minus;</p>\r\n\r\n<pre>\r\ntotal = item_one + \r\n        item_two + \r\n        item_three\r\n</pre>\r\n\r\n<p>Statements contained within the [], {}, or () brackets do not need to use the line continuation character. For example &minus;</p>\r\n\r\n<pre>\r\ndays = [&#39;Monday&#39;, &#39;Tuesday&#39;, &#39;Wednesday&#39;,\r\n        &#39;Thursday&#39;, &#39;Friday&#39;]\r\n</pre>\r\n\r\n<h2>Quotation in Python</h2>\r\n\r\n<p>Python accepts single (&#39;), double (&quot;) and triple (&#39;&#39;&#39; or &quot;&quot;&quot;) quotes to denote string literals, as long as the same type of quote starts and ends the string.</p>\r\n\r\n<p>The triple quotes are used to span the string across multiple lines. For example, all the following are legal &minus;</p>\r\n\r\n<pre>\r\nword = &#39;word&#39;\r\nsentence = &quot;This is a sentence.&quot;\r\nparagraph = &quot;&quot;&quot;This is a paragraph. It is\r\nmade up of multiple lines and sentences.&quot;&quot;&quot;\r\n</pre>\r\n\r\n<h2>Comments in Python</h2>\r\n\r\n<p>A hash sign (#) that is not inside a string literal begins a comment. All characters after the # and up to the end of the physical line are part of the comment and the Python interpreter ignores them.</p>\r\n\r\n<p><a href=\"http://tpcg.io/VgbqMb\" rel=\"nofollow\" target=\"_blank\">&nbsp;Live Demo</a></p>\r\n\r\n<pre>\r\n#!/usr/bin/python\r\n\r\n# First comment\r\nprint &quot;Hello, Python!&quot; # second comment</pre>\r\n\r\n<p>This produces the following result &minus;</p>\r\n\r\n<pre>\r\nHello, Python!\r\n</pre>\r\n\r\n<p>You can type a comment on the same line after a statement or expression &minus;</p>\r\n\r\n<pre>\r\nname = &quot;Madisetti&quot; # This is again comment\r\n</pre>\r\n\r\n<p>You can comment multiple lines as follows &minus;</p>\r\n\r\n<pre>\r\n# This is a comment.\r\n# This is a comment, too.\r\n# This is a comment, too.\r\n# I said that already.\r\n</pre>\r\n\r\n<p>Following triple-quoted string is also ignored by Python interpreter and can be used as a multiline comments:</p>\r\n\r\n<pre>\r\n&#39;&#39;&#39;\r\nThis is a multiline\r\ncomment.\r\n&#39;&#39;&#39;\r\n</pre>\r\n\r\n<h2>Using Blank Lines</h2>\r\n\r\n<p>A line containing only whitespace, possibly with a comment, is known as a blank line and Python totally ignores it.</p>\r\n\r\n<p>In an interactive interpreter session, you must enter an empty physical line to terminate a multiline statement.</p>\r\n\r\n<h2>Waiting for the User</h2>\r\n\r\n<p>The following line of the program displays the prompt, the statement saying &ldquo;Press the enter key to exit&rdquo;, and waits for the user to take action &minus;</p>\r\n\r\n<pre>\r\n#!/usr/bin/python\r\n\r\nraw_input(&quot;\n\nPress the enter key to exit.&quot;)</pre>\r\n\r\n<p>Here, &quot;\n\n&quot; is used to create two new lines before displaying the actual line. Once the user presses the key, the program ends. This is a nice trick to keep a console window open until the user is done with an application.</p>\r\n\r\n<h2>Multiple Statements on a Single Line</h2>\r\n\r\n<p>The semicolon ( ; ) allows multiple statements on the single line given that neither statement starts a new code block. Here is a sample snip using the semicolon &minus;</p>\r\n\r\n<pre>\r\nimport sys; x = &#39;foo&#39;; sys.stdout.write(x + &#39;\n&#39;)</pre>\r\n\r\n<h2>Multiple Statement Groups as Suites</h2>\r\n\r\n<p>A group of individual statements, which make a single code block are called&nbsp;<strong>suites</strong>&nbsp;in Python. Compound or complex statements, such as if, while, def, and class require a header line and a suite.</p>\r\n\r\n<p>Header lines begin the statement (with the keyword) and terminate with a colon ( : ) and are followed by one or more lines which make up the suite. For example &minus;</p>\r\n\r\n<pre>\r\nif expression : \r\n   suite\r\nelif expression : \r\n   suite \r\nelse : \r\n   suite\r\n</pre>\r\n\r\n<h2>Command Line Arguments</h2>\r\n\r\n<p>Many programs can be run to provide you with some basic information about how they should be run. Python enables you to do this with -h &minus;</p>\r\n\r\n<pre>\r\n$ python -h\r\nusage: python [option] ... [-c cmd | -m mod | file | -] [arg] ...\r\nOptions and arguments (and corresponding environment variables):\r\n-c cmd : program passed in as string (terminates option list)\r\n-d     : debug output from parser (also PYTHONDEBUG=x)\r\n-E     : ignore environment variables (such as PYTHONPATH)\r\n-h     : print this help message and exit\r\n\r\n[ etc. ]</pre>\r\n\r\n<p>You can also program your script in such a way that it should accept various options.&nbsp;<a href=\"https://www.tutorialspoint.com/python/python_command_line_arguments.htm\">Command Line Arguments</a>&nbsp;is an advanced topic and should be studied a bit later once you have gone through rest of the Python concepts.</p>\r\n', 'PYTHON'),
(48, 'Python - Variable Types', '<h1 style=\"margin-left:120px\"><span style=\"color:#3498db\"><span style=\"font-size:24px\"><strong>Python - Variable Types</strong></span></span></h1>\r\n\r\n<p>Variables are nothing but reserved memory locations to store values. This means that when you create a variable you reserve some space in memory.</p>\r\n\r\n<p>Based on the data type of a variable, the interpreter allocates memory and decides what can be stored in the reserved memory. Therefore, by assigning different data types to variables, you can store integers, decimals or characters in these variables.</p>\r\n\r\n<h2>Assigning Values to Variables</h2>\r\n\r\n<p>Python variables do not need explicit declaration to reserve memory space. The declaration happens automatically when you assign a value to a variable. The equal sign (=) is used to assign values to variables.</p>\r\n\r\n<p>The operand to the left of the = operator is the name of the variable and the operand to the right of the = operator is the value stored in the variable. For example &minus;</p>\r\n\r\n<p><a href=\"http://tpcg.io/Eh9FoM\" rel=\"nofollow\" target=\"_blank\">&nbsp;Live Demo</a></p>\r\n\r\n<pre>\r\n#!/usr/bin/python\r\n\r\ncounter = 100          # An integer assignment\r\nmiles   = 1000.0       # A floating point\r\nname    = &quot;John&quot;       # A string\r\n\r\nprint counter\r\nprint miles\r\nprint name</pre>\r\n\r\n<p>Here, 100, 1000.0 and &quot;John&quot; are the values assigned to&nbsp;<em>counter</em>,&nbsp;<em>miles</em>, and&nbsp;<em>name</em>&nbsp;variables, respectively. This produces the following result &minus;</p>\r\n\r\n<pre>\r\n100\r\n1000.0\r\nJohn\r\n</pre>\r\n\r\n<h2>Multiple Assignment</h2>\r\n\r\n<p>Python allows you to assign a single value to several variables simultaneously. For example &minus;</p>\r\n\r\n<pre>\r\na = b = c = 1\r\n</pre>\r\n\r\n<p>Here, an integer object is created with the value 1, and all three variables are assigned to the same memory location. You can also assign multiple objects to multiple variables. For example &minus;</p>\r\n\r\n<pre>\r\na,b,c = 1,2,&quot;john&quot;\r\n</pre>\r\n\r\n<p>Here, two integer objects with values 1 and 2 are assigned to variables a and b respectively, and one string object with the value &quot;john&quot; is assigned to the variable c.</p>\r\n\r\n<h2>Standard Data Types</h2>\r\n\r\n<p>The data stored in memory can be of many types. For example, a person&#39;s age is stored as a numeric value and his or her address is stored as alphanumeric characters. Python has various standard data types that are used to define the operations possible on them and the storage method for each of them.</p>\r\n\r\n<p>Python has five standard data types &minus;</p>\r\n\r\n<ul>\r\n	<li>Numbers</li>\r\n	<li>String</li>\r\n	<li>List</li>\r\n	<li>Tuple</li>\r\n	<li>Dictionary</li>\r\n</ul>\r\n\r\n<h2>Python Numbers</h2>\r\n\r\n<p>Number data types store numeric values. Number objects are created when you assign a value to them. For example &minus;</p>\r\n\r\n<pre>\r\nvar1 = 1\r\nvar2 = 10\r\n</pre>\r\n\r\n<p>You can also delete the reference to a number object by using the del statement. The syntax of the del statement is &minus;</p>\r\n\r\n<pre>\r\ndel var1[,var2[,var3[....,varN]]]]\r\n</pre>\r\n\r\n<p>You can delete a single object or multiple objects by using the del statement. For example &minus;</p>\r\n\r\n<pre>\r\ndel var\r\ndel var_a, var_b\r\n</pre>\r\n\r\n<p>Python supports four different numerical types &minus;</p>\r\n\r\n<ul>\r\n	<li>int (signed integers)</li>\r\n	<li>long (long integers, they can also be represented in octal and hexadecimal)</li>\r\n	<li>float (floating point real values)</li>\r\n	<li>complex (complex numbers)</li>\r\n</ul>\r\n\r\n<h3>Examples</h3>\r\n\r\n<p>Here are some examples of numbers &minus;</p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<th>int</th>\r\n			<th>long</th>\r\n			<th>float</th>\r\n			<th>complex</th>\r\n		</tr>\r\n		<tr>\r\n			<td>10</td>\r\n			<td>51924361L</td>\r\n			<td>0.0</td>\r\n			<td>3.14j</td>\r\n		</tr>\r\n		<tr>\r\n			<td>100</td>\r\n			<td>-0x19323L</td>\r\n			<td>15.20</td>\r\n			<td>45.j</td>\r\n		</tr>\r\n		<tr>\r\n			<td>-786</td>\r\n			<td>0122L</td>\r\n			<td>-21.9</td>\r\n			<td>9.322e-36j</td>\r\n		</tr>\r\n		<tr>\r\n			<td>080</td>\r\n			<td>0xDEFABCECBDAECBFBAEl</td>\r\n			<td>32.3+e18</td>\r\n			<td>.876j</td>\r\n		</tr>\r\n		<tr>\r\n			<td>-0490</td>\r\n			<td>535633629843L</td>\r\n			<td>-90.</td>\r\n			<td>-.6545+0J</td>\r\n		</tr>\r\n		<tr>\r\n			<td>-0x260</td>\r\n			<td>-052318172735L</td>\r\n			<td>-32.54e100</td>\r\n			<td>3e+26J</td>\r\n		</tr>\r\n		<tr>\r\n			<td>0x69</td>\r\n			<td>-4721885298529L</td>\r\n			<td>70.2-E12</td>\r\n			<td>4.53e-7j</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Python allows you to use a lowercase l with long, but it is recommended that you use only an uppercase L to avoid confusion with the number 1. Python displays long integers with an uppercase L.</p>\r\n	</li>\r\n	<li>\r\n	<p>A complex number consists of an ordered pair of real floating-point numbers denoted by x + yj, where x and y are the real numbers and j is the imaginary unit.</p>\r\n	</li>\r\n</ul>\r\n\r\n<h2>Python Strings</h2>\r\n\r\n<p>Strings in Python are identified as a contiguous set of characters represented in the quotation marks. Python allows for either pairs of single or double quotes. Subsets of strings can be taken using the slice operator ([ ] and [:] ) with indexes starting at 0 in the beginning of the string and working their way from -1 at the end.</p>\r\n\r\n<p>The plus (+) sign is the string concatenation operator and the asterisk (*) is the repetition operator. For example &minus;</p>\r\n\r\n<p><a href=\"http://tpcg.io/PsSj6c\" rel=\"nofollow\" target=\"_blank\">&nbsp;Live Demo</a></p>\r\n\r\n<pre>\r\n#!/usr/bin/python\r\n\r\nstr = &#39;Hello World!&#39;\r\n\r\nprint str          # Prints complete string\r\nprint str[0]       # Prints first character of the string\r\nprint str[2:5]     # Prints characters starting from 3rd to 5th\r\nprint str[2:]      # Prints string starting from 3rd character\r\nprint str * 2      # Prints string two times\r\nprint str + &quot;TEST&quot; # Prints concatenated string</pre>\r\n\r\n<p>This will produce the following result &minus;</p>\r\n\r\n<pre>\r\nHello World!\r\nH\r\nllo\r\nllo World!\r\nHello World!Hello World!\r\nHello World!TEST\r\n</pre>\r\n\r\n<h2>Python Lists</h2>\r\n\r\n<p>Lists are the most versatile of Python&#39;s compound data types. A list contains items separated by commas and enclosed within square brackets ([]). To some extent, lists are similar to arrays in C. One difference between them is that all the items belonging to a list can be of different data type.</p>\r\n\r\n<p>The values stored in a list can be accessed using the slice operator ([ ] and [:]) with indexes starting at 0 in the beginning of the list and working their way to end -1. The plus (+) sign is the list concatenation operator, and the asterisk (*) is the repetition operator. For example &minus;</p>\r\n\r\n<pre>\r\n#!/usr/bin/python\r\n\r\nlist = [ &#39;abcd&#39;, 786 , 2.23, &#39;john&#39;, 70.2 ]\r\ntinylist = [123, &#39;john&#39;]\r\n\r\nprint list          # Prints complete list\r\nprint list[0]       # Prints first element of the list\r\nprint list[1:3]     # Prints elements starting from 2nd till 3rd \r\nprint list[2:]      # Prints elements starting from 3rd element\r\nprint tinylist * 2  # Prints list two times\r\nprint list + tinylist # Prints concatenated lists</pre>\r\n\r\n<p>This produce the following result &minus;</p>\r\n\r\n<pre>\r\n[&#39;abcd&#39;, 786, 2.23, &#39;john&#39;, 70.2]\r\nabcd\r\n[786, 2.23]\r\n[2.23, &#39;john&#39;, 70.2]\r\n[123, &#39;john&#39;, 123, &#39;john&#39;]\r\n[&#39;abcd&#39;, 786, 2.23, &#39;john&#39;, 70.2, 123, &#39;john&#39;]\r\n</pre>\r\n\r\n<h2>Python Tuples</h2>\r\n\r\n<p>A tuple is another sequence data type that is similar to the list. A tuple consists of a number of values separated by commas. Unlike lists, however, tuples are enclosed within parentheses.</p>\r\n\r\n<p>The main differences between lists and tuples are: Lists are enclosed in brackets ( [ ] ) and their elements and size can be changed, while tuples are enclosed in parentheses ( ( ) ) and cannot be updated. Tuples can be thought of as&nbsp;<strong>read-only</strong>&nbsp;lists. For example &minus;</p>\r\n\r\n<p><a href=\"http://tpcg.io/XYBk9k\" rel=\"nofollow\" target=\"_blank\">&nbsp;Live Demo</a></p>\r\n\r\n<pre>\r\n#!/usr/bin/python\r\n\r\ntuple = ( &#39;abcd&#39;, 786 , 2.23, &#39;john&#39;, 70.2  )\r\ntinytuple = (123, &#39;john&#39;)\r\n\r\nprint tuple           # Prints complete list\r\nprint tuple[0]        # Prints first element of the list\r\nprint tuple[1:3]      # Prints elements starting from 2nd till 3rd \r\nprint tuple[2:]       # Prints elements starting from 3rd element\r\nprint tinytuple * 2   # Prints list two times\r\nprint tuple + tinytuple # Prints concatenated lists</pre>\r\n\r\n<p>This produce the following result &minus;</p>\r\n\r\n<pre>\r\n(&#39;abcd&#39;, 786, 2.23, &#39;john&#39;, 70.2)\r\nabcd\r\n(786, 2.23)\r\n(2.23, &#39;john&#39;, 70.2)\r\n(123, &#39;john&#39;, 123, &#39;john&#39;)\r\n(&#39;abcd&#39;, 786, 2.23, &#39;john&#39;, 70.2, 123, &#39;john&#39;)\r\n</pre>\r\n\r\n<p>The following code is invalid with tuple, because we attempted to update a tuple, which is not allowed. Similar case is possible with lists &minus;</p>\r\n\r\n<pre>\r\n#!/usr/bin/python\r\n\r\ntuple = ( &#39;abcd&#39;, 786 , 2.23, &#39;john&#39;, 70.2  )\r\nlist = [ &#39;abcd&#39;, 786 , 2.23, &#39;john&#39;, 70.2  ]\r\ntuple[2] = 1000    # Invalid syntax with tuple\r\nlist[2] = 1000     # Valid syntax with list</pre>\r\n\r\n<h2>Python Dictionary</h2>\r\n\r\n<p>Python&#39;s dictionaries are kind of hash table type. They work like associative arrays or hashes found in Perl and consist of key-value pairs. A dictionary key can be almost any Python type, but are usually numbers or strings. Values, on the other hand, can be any arbitrary Python object.</p>\r\n\r\n<p>Dictionaries are enclosed by curly braces ({ }) and values can be assigned and accessed using square braces ([]). For example &minus;</p>\r\n\r\n<p><a href=\"http://tpcg.io/DlY1Gc\" rel=\"nofollow\" target=\"_blank\">&nbsp;Live Demo</a></p>\r\n\r\n<pre>\r\n#!/usr/bin/python\r\n\r\ndict = {}\r\ndict[&#39;one&#39;] = &quot;This is one&quot;\r\ndict[2]     = &quot;This is two&quot;\r\n\r\ntinydict = {&#39;name&#39;: &#39;john&#39;,&#39;code&#39;:6734, &#39;dept&#39;: &#39;sales&#39;}\r\n\r\n\r\nprint dict[&#39;one&#39;]       # Prints value for &#39;one&#39; key\r\nprint dict[2]           # Prints value for 2 key\r\nprint tinydict          # Prints complete dictionary\r\nprint tinydict.keys()   # Prints all the keys\r\nprint tinydict.values() # Prints all the values</pre>\r\n\r\n<p>This produce the following result &minus;</p>\r\n\r\n<pre>\r\nThis is one\r\nThis is two\r\n{&#39;dept&#39;: &#39;sales&#39;, &#39;code&#39;: 6734, &#39;name&#39;: &#39;john&#39;}\r\n[&#39;dept&#39;, &#39;code&#39;, &#39;name&#39;]\r\n[&#39;sales&#39;, 6734, &#39;john&#39;]\r\n</pre>\r\n\r\n<p>Dictionaries have no concept of order among elements. It is incorrect to say that the elements are &quot;out of order&quot;; they are simply unordered.</p>\r\n\r\n<h2>Data Type Conversion</h2>\r\n\r\n<p>Sometimes, you may need to perform conversions between the built-in types. To convert between types, you simply use the type name as a function.</p>\r\n\r\n<p>There are several built-in functions to perform conversion from one data type to another. These functions return a new object representing the converted value.</p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<th>Sr.No.</th>\r\n			<th>Function &amp; Description</th>\r\n		</tr>\r\n		<tr>\r\n			<td>1</td>\r\n			<td>\r\n			<p><strong>int(x [,base])</strong></p>\r\n\r\n			<p>Converts x to an integer. base specifies the base if x is a string.</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>2</td>\r\n			<td>\r\n			<p><strong>long(x [,base] )</strong></p>\r\n\r\n			<p>Converts x to a long integer. base specifies the base if x is a string.</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>3</td>\r\n			<td>\r\n			<p><strong>float(x)</strong></p>\r\n\r\n			<p>Converts x to a floating-point number.</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>4</td>\r\n			<td>\r\n			<p><strong>complex(real [,imag])</strong></p>\r\n\r\n			<p>Creates a complex number.</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>5</td>\r\n			<td>\r\n			<p><strong>str(x)</strong></p>\r\n\r\n			<p>Converts object x to a string representation.</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>6</td>\r\n			<td>\r\n			<p><strong>repr(x)</strong></p>\r\n\r\n			<p>Converts object x to an expression string.</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>7</td>\r\n			<td>\r\n			<p><strong>eval(str)</strong></p>\r\n\r\n			<p>Evaluates a string and returns an object.</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>8</td>\r\n			<td>\r\n			<p><strong>tuple(s)</strong></p>\r\n\r\n			<p>Converts s to a tuple.</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>9</td>\r\n			<td>\r\n			<p><strong>list(s)</strong></p>\r\n\r\n			<p>Converts s to a list.</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>10</td>\r\n			<td>\r\n			<p><strong>set(s)</strong></p>\r\n\r\n			<p>Converts s to a set.</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>11</td>\r\n			<td>\r\n			<p><strong>dict(d)</strong></p>\r\n\r\n			<p>Creates a dictionary. d must be a sequence of (key,value) tuples.</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>12</td>\r\n			<td>\r\n			<p><strong>frozenset(s)</strong></p>\r\n\r\n			<p>Converts s to a frozen set.</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>13</td>\r\n			<td>\r\n			<p><strong>chr(x)</strong></p>\r\n\r\n			<p>Converts an integer to a character.</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>14</td>\r\n			<td>\r\n			<p><strong>unichr(x)</strong></p>\r\n\r\n			<p>Converts an integer to a Unicode character.</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>15</td>\r\n			<td>\r\n			<p><strong>ord(x)</strong></p>\r\n\r\n			<p>Converts a single character to its integer value.</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>16</td>\r\n			<td>\r\n			<p><strong>hex(x)</strong></p>\r\n\r\n			<p>Converts an integer to a hexadecimal string.</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>17</td>\r\n			<td>\r\n			<p><strong>oct(x)</strong></p>\r\n\r\n			<p>Converts an integer to an octal string.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 'PYTHON');
INSERT INTO `courses` (`id`, `topic_name`, `description`, `course_name`) VALUES
(49, 'Python - Basic Operators', '<h1 style=\"margin-left:120px\"><span style=\"font-size:24px\"><span style=\"color:#3498db\"><strong>Python - Basic Operators</strong></span></span></h1>\r\n\r\n<p>Operators are the constructs which can manipulate the value of operands.</p>\r\n\r\n<p>Consider the expression 4 + 5 = 9. Here, 4 and 5 are called operands and + is called operator.</p>\r\n\r\n<h2>Types of Operator</h2>\r\n\r\n<p>Python language supports the following types of operators.</p>\r\n\r\n<ul>\r\n	<li>Arithmetic Operators</li>\r\n	<li>Comparison (Relational) Operators</li>\r\n	<li>Assignment Operators</li>\r\n	<li>Logical Operators</li>\r\n	<li>Bitwise Operators</li>\r\n	<li>Membership Operators</li>\r\n	<li>Identity Operators</li>\r\n</ul>\r\n\r\n<p>Let us have a look on all operators one by one.</p>\r\n\r\n<h2>Python Arithmetic Operators</h2>\r\n\r\n<p>Assume variable a holds 10 and variable b holds 20, then &minus;</p>\r\n\r\n<p>[&nbsp;<a href=\"https://www.tutorialspoint.com/python/arithmetic_operators_example.htm\">Show Example</a>&nbsp;]</p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<th>Operator</th>\r\n			<th>Description</th>\r\n			<th>Example</th>\r\n		</tr>\r\n		<tr>\r\n			<td>+ Addition</td>\r\n			<td>Adds values on either side of the operator.</td>\r\n			<td>a + b = 30</td>\r\n		</tr>\r\n		<tr>\r\n			<td>- Subtraction</td>\r\n			<td>Subtracts right hand operand from left hand operand.</td>\r\n			<td>a &ndash; b = -10</td>\r\n		</tr>\r\n		<tr>\r\n			<td>* Multiplication</td>\r\n			<td>Multiplies values on either side of the operator</td>\r\n			<td>a * b = 200</td>\r\n		</tr>\r\n		<tr>\r\n			<td>/ Division</td>\r\n			<td>Divides left hand operand by right hand operand</td>\r\n			<td>b / a = 2</td>\r\n		</tr>\r\n		<tr>\r\n			<td>% Modulus</td>\r\n			<td>Divides left hand operand by right hand operand and returns remainder</td>\r\n			<td>b % a = 0</td>\r\n		</tr>\r\n		<tr>\r\n			<td>** Exponent</td>\r\n			<td>Performs exponential (power) calculation on operators</td>\r\n			<td>a**b =10 to the power 20</td>\r\n		</tr>\r\n		<tr>\r\n			<td>//</td>\r\n			<td>Floor Division - The division of operands where the result is the quotient in which the digits after the decimal point are removed. But if one of the operands is negative, the result is floored, i.e., rounded away from zero (towards negative infinity) &minus;</td>\r\n			<td>9//2 = 4 and 9.0//2.0 = 4.0, -11//3 = -4, -11.0//3 = -4.0</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h2>Python Comparison Operators</h2>\r\n\r\n<p>These operators compare the values on either sides of them and decide the relation among them. They are also called Relational operators.</p>\r\n\r\n<p>Assume variable a holds 10 and variable b holds 20, then &minus;</p>\r\n\r\n<p>[&nbsp;<a href=\"https://www.tutorialspoint.com/python/comparison_operators_example.htm\">Show Example</a>&nbsp;]</p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<th>Operator</th>\r\n			<th>Description</th>\r\n			<th>Example</th>\r\n		</tr>\r\n		<tr>\r\n			<td>==</td>\r\n			<td>If the values of two operands are equal, then the condition becomes true.</td>\r\n			<td>(a == b) is not true.</td>\r\n		</tr>\r\n		<tr>\r\n			<td>!=</td>\r\n			<td>If values of two operands are not equal, then condition becomes true.</td>\r\n			<td>(a != b) is true.</td>\r\n		</tr>\r\n		<tr>\r\n			<td>&lt;&gt;</td>\r\n			<td>If values of two operands are not equal, then condition becomes true.</td>\r\n			<td>(a &lt;&gt; b) is true. This is similar to != operator.</td>\r\n		</tr>\r\n		<tr>\r\n			<td>&gt;</td>\r\n			<td>If the value of left operand is greater than the value of right operand, then condition becomes true.</td>\r\n			<td>(a &gt; b) is not true.</td>\r\n		</tr>\r\n		<tr>\r\n			<td>&lt;</td>\r\n			<td>If the value of left operand is less than the value of right operand, then condition becomes true.</td>\r\n			<td>(a &lt; b) is true.</td>\r\n		</tr>\r\n		<tr>\r\n			<td>&gt;=</td>\r\n			<td>If the value of left operand is greater than or equal to the value of right operand, then condition becomes true.</td>\r\n			<td>(a &gt;= b) is not true.</td>\r\n		</tr>\r\n		<tr>\r\n			<td>&lt;=</td>\r\n			<td>If the value of left operand is less than or equal to the value of right operand, then condition becomes true.</td>\r\n			<td>(a &lt;= b) is true.</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h2>Python Assignment Operators</h2>\r\n\r\n<p>Assume variable a holds 10 and variable b holds 20, then &minus;</p>\r\n\r\n<p>[&nbsp;<a href=\"https://www.tutorialspoint.com/python/assignment_operators_example.htm\">Show Example</a>&nbsp;]</p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<th>Operator</th>\r\n			<th>Description</th>\r\n			<th>Example</th>\r\n		</tr>\r\n		<tr>\r\n			<td>=</td>\r\n			<td>Assigns values from right side operands to left side operand</td>\r\n			<td>c = a + b assigns value of a + b into c</td>\r\n		</tr>\r\n		<tr>\r\n			<td>+= Add AND</td>\r\n			<td>It adds right operand to the left operand and assign the result to left operand</td>\r\n			<td>c += a is equivalent to c = c + a</td>\r\n		</tr>\r\n		<tr>\r\n			<td>-= Subtract AND</td>\r\n			<td>It subtracts right operand from the left operand and assign the result to left operand</td>\r\n			<td>c -= a is equivalent to c = c - a</td>\r\n		</tr>\r\n		<tr>\r\n			<td>*= Multiply AND</td>\r\n			<td>It multiplies right operand with the left operand and assign the result to left operand</td>\r\n			<td>c *= a is equivalent to c = c * a</td>\r\n		</tr>\r\n		<tr>\r\n			<td>/= Divide AND</td>\r\n			<td>It divides left operand with the right operand and assign the result to left operand</td>\r\n			<td>c /= a is equivalent to c = c / ac /= a is equivalent to c = c / a</td>\r\n		</tr>\r\n		<tr>\r\n			<td>%= Modulus AND</td>\r\n			<td>It takes modulus using two operands and assign the result to left operand</td>\r\n			<td>c %= a is equivalent to c = c % a</td>\r\n		</tr>\r\n		<tr>\r\n			<td>**= Exponent AND</td>\r\n			<td>Performs exponential (power) calculation on operators and assign value to the left operand</td>\r\n			<td>c **= a is equivalent to c = c ** a</td>\r\n		</tr>\r\n		<tr>\r\n			<td>//= Floor Division</td>\r\n			<td>It performs floor division on operators and assign value to the left operand</td>\r\n			<td>c //= a is equivalent to c = c // a</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h2>Python Bitwise Operators</h2>\r\n\r\n<p>Bitwise operator works on bits and performs bit by bit operation. Assume if a = 60; and b = 13; Now in binary format they will be as follows &minus;</p>\r\n\r\n<p>a = 0011 1100</p>\r\n\r\n<p>b = 0000 1101</p>\r\n\r\n<p>-----------------</p>\r\n\r\n<p>a&amp;b = 0000 1100</p>\r\n\r\n<p>a|b = 0011 1101</p>\r\n\r\n<p>a^b = 0011 0001</p>\r\n\r\n<p>~a&nbsp; = 1100 0011</p>\r\n\r\n<p>There are following Bitwise operators supported by Python language</p>\r\n\r\n<p>[&nbsp;<a href=\"https://www.tutorialspoint.com/python/bitwise_operators_example.htm\">Show Example</a>&nbsp;]</p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<th>Operator</th>\r\n			<th>Description</th>\r\n			<th>Example</th>\r\n		</tr>\r\n		<tr>\r\n			<td>&amp; Binary AND</td>\r\n			<td>Operator copies a bit to the result if it exists in both operands</td>\r\n			<td>(a &amp; b) (means 0000 1100)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>| Binary OR</td>\r\n			<td>It copies a bit if it exists in either operand.</td>\r\n			<td>(a | b) = 61 (means 0011 1101)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>^ Binary XOR</td>\r\n			<td>It copies the bit if it is set in one operand but not both.</td>\r\n			<td>(a ^ b) = 49 (means 0011 0001)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>~ Binary Ones Complement</td>\r\n			<td>It is unary and has the effect of &#39;flipping&#39; bits.</td>\r\n			<td>(~a ) = -61 (means 1100 0011 in 2&#39;s complement form due to a signed binary number.</td>\r\n		</tr>\r\n		<tr>\r\n			<td>&lt;&lt; Binary Left Shift</td>\r\n			<td>The left operands value is moved left by the number of bits specified by the right operand.</td>\r\n			<td>a &lt;&lt; 2 = 240 (means 1111 0000)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>&gt;&gt; Binary Right Shift</td>\r\n			<td>The left operands value is moved right by the number of bits specified by the right operand.</td>\r\n			<td>a &gt;&gt; 2 = 15 (means 0000 1111)</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h2>Python Logical Operators</h2>\r\n\r\n<p>There are following logical operators supported by Python language. Assume variable a holds 10 and variable b holds 20 then</p>\r\n\r\n<p>[&nbsp;<a href=\"https://www.tutorialspoint.com/python/logical_operators_example.htm\">Show Example</a>&nbsp;]</p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<th>Operator</th>\r\n			<th>Description</th>\r\n			<th>Example</th>\r\n		</tr>\r\n		<tr>\r\n			<td>and Logical AND</td>\r\n			<td>If both the operands are true then condition becomes true.</td>\r\n			<td>(a and b) is true.</td>\r\n		</tr>\r\n		<tr>\r\n			<td>or Logical OR</td>\r\n			<td>If any of the two operands are non-zero then condition becomes true.</td>\r\n			<td>(a or b) is true.</td>\r\n		</tr>\r\n		<tr>\r\n			<td>not Logical NOT</td>\r\n			<td>Used to reverse the logical state of its operand.</td>\r\n			<td>Not(a and b) is false.</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>Used to reverse the logical state of its operand.</p>\r\n\r\n<h2>Python Membership Operators</h2>\r\n\r\n<p>Python&rsquo;s membership operators test for membership in a sequence, such as strings, lists, or tuples. There are two membership operators as explained below &minus;</p>\r\n\r\n<p>[&nbsp;<a href=\"https://www.tutorialspoint.com/python/membership_operators_example.htm\">Show Example</a>&nbsp;]</p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<th>Operator</th>\r\n			<th>Description</th>\r\n			<th>Example</th>\r\n		</tr>\r\n		<tr>\r\n			<td>in</td>\r\n			<td>Evaluates to true if it finds a variable in the specified sequence and false otherwise.</td>\r\n			<td>x in y, here in results in a 1 if x is a member of sequence y.</td>\r\n		</tr>\r\n		<tr>\r\n			<td>not in</td>\r\n			<td>Evaluates to true if it does not finds a variable in the specified sequence and false otherwise.</td>\r\n			<td>x not in y, here not in results in a 1 if x is not a member of sequence y.</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h2>Python Identity Operators</h2>\r\n\r\n<p>Identity operators compare the memory locations of two objects. There are two Identity operators explained below &minus;</p>\r\n\r\n<p>[&nbsp;<a href=\"https://www.tutorialspoint.com/python/identity_operators_example.htm\">Show Example</a>&nbsp;]</p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<th>Operator</th>\r\n			<th>Description</th>\r\n			<th>Example</th>\r\n		</tr>\r\n		<tr>\r\n			<td>is</td>\r\n			<td>Evaluates to true if the variables on either side of the operator point to the same object and false otherwise.</td>\r\n			<td>x is y, here&nbsp;<strong>is</strong>&nbsp;results in 1 if id(x) equals id(y).</td>\r\n		</tr>\r\n		<tr>\r\n			<td>is not</td>\r\n			<td>Evaluates to false if the variables on either side of the operator point to the same object and true otherwise.</td>\r\n			<td>x is not y, here&nbsp;<strong>is not</strong>&nbsp;results in 1 if id(x) is not equal to id(y).</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h2>Python Operators Precedence</h2>\r\n\r\n<p>The following table lists all operators from highest precedence to lowest.</p>\r\n\r\n<p>[&nbsp;<a href=\"https://www.tutorialspoint.com/python/operators_precedence_example.htm\">Show Example</a>&nbsp;]</p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<th>Sr.No.</th>\r\n			<th>Operator &amp; Description</th>\r\n		</tr>\r\n		<tr>\r\n			<td>1</td>\r\n			<td>\r\n			<p><strong>**</strong></p>\r\n\r\n			<p>Exponentiation (raise to the power)</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>2</td>\r\n			<td>\r\n			<p><strong>~ + -</strong></p>\r\n\r\n			<p>Complement, unary plus and minus (method names for the last two are +@ and -@)</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>3</td>\r\n			<td>\r\n			<p><strong>* / % //</strong></p>\r\n\r\n			<p>Multiply, divide, modulo and floor division</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>4</td>\r\n			<td>\r\n			<p><strong>+ -</strong></p>\r\n\r\n			<p>Addition and subtraction</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>5</td>\r\n			<td>\r\n			<p><strong>&gt;&gt; &lt;&lt;</strong></p>\r\n\r\n			<p>Right and left bitwise shift</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>6</td>\r\n			<td>\r\n			<p><strong>&amp;</strong></p>\r\n\r\n			<p>Bitwise &#39;AND&#39;</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>7</td>\r\n			<td>\r\n			<p><strong>^ |</strong></p>\r\n\r\n			<p>Bitwise exclusive `OR&#39; and regular `OR&#39;</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>8</td>\r\n			<td>\r\n			<p><strong>&lt;= &lt; &gt; &gt;=</strong></p>\r\n\r\n			<p>Comparison operators</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>9</td>\r\n			<td>\r\n			<p><strong>&lt;&gt; == !=</strong></p>\r\n\r\n			<p>Equality operators</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>10</td>\r\n			<td>\r\n			<p><strong>= %= /= //= -= += *= **=</strong></p>\r\n\r\n			<p>Assignment operators</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>11</td>\r\n			<td>\r\n			<p><strong>is is not</strong></p>\r\n\r\n			<p>Identity operators</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>12</td>\r\n			<td>\r\n			<p><strong>in not in</strong></p>\r\n\r\n			<p>Membership operators</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>13</td>\r\n			<td>\r\n			<p><strong>not or and</strong></p>\r\n\r\n			<p>Logical operators</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 'PYTHON'),
(51, 'C-Variable', '<p>vavriab;e</p>\r\n', 'C'),
(52, 'android-variable', '<p>android variables are statically typed</p>\r\n', 'Android'),
(53, 'java-static', '<p>sdfzf</p>\r\n', 'java'),
(54, 'CSS Variable', '<p>CSS VAriabel demo.</p>\r\n', 'css'),
(55, 'CSS style tag', '<p>it is a description</p>\r\n', 'css');

-- --------------------------------------------------------

--
-- Table structure for table `faq`
--

CREATE TABLE `faq` (
  `id` int(11) NOT NULL,
  `faq_title` varchar(255) NOT NULL,
  `faq_description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `faq`
--

INSERT INTO `faq` (`id`, `faq_title`, `faq_description`) VALUES
(1, 'what is your website is about ?', 'this website is a free TV shows ratting website'),
(2, 'How to rate the videos ?', 'Go to view videos section and select your favourite TV show and give ratting there'),
(3, 'how to log in ?', 'goto bingeflix.com/login and from there you can login');

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

CREATE TABLE `image` (
  `img` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `image`
--

INSERT INTO `image` (`img`) VALUES
('uploadimg/4.png'),
('uploadimg/4.png'),
('uploadimg/3logo.png');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id` int(255) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id`, `username`, `password`, `email`) VALUES
(1, 'sunil yadav', '1234', 'sam123.sy28@gmail.com'),
(3, 'sunil ', '1234', 'sdjcjsavj@gmail.com'),
(8, 'deepak', '5687', 'ndvnkvjks'),
(11, 'deepak y', '258', 'lsnzbbv'),
(12, 'deepa', '520', 'sam8rt7gnailvnnvngkjf'),
(19, 'ghf', 'rtat', ''),
(20, 'deepak', '7896', 'osdbfas@ukhsvdfb'),
(21, 'mahesh', '258', 'jadvsadv@sbv.com'),
(22, 'mahesh', 'mahesh', 'sanmsnksd@,zxv'),
(23, 'mangesh', '2589', 'sbdjchjsdc'),
(24, 'rahul', '123', 'bdjkbdasb'),
(25, 'mangesh tiwari', '123', 'jfdvfsdvdf'),
(26, 'sunil yadav', '12345', 'jbsadjvb'),
(27, 'hg', '', ''),
(28, 'admin', 'admin', 'samndjdsfadg'),
(29, 'deepak yadav', '123456789', ''),
(30, '', '', ''),
(32, 'mahesh', 'singh', '12345'),
(33, 'mangesh', '12345678', 'jdvzhfds'),
(34, 'deepak', 'deepak123', 'sam123.sy28@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `mytable`
--

CREATE TABLE `mytable` (
  `id` int(255) NOT NULL,
  `video_path` varchar(255) NOT NULL,
  `video_name` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mytable`
--

INSERT INTO `mytable` (`id`, `video_path`, `video_name`, `img`) VALUES
(1, 'path1', 'myvideo', 'httpvideo'),
(2, 'path2', 'myvideo2', 'httpvideo2');

-- --------------------------------------------------------

--
-- Table structure for table `programming_languages`
--

CREATE TABLE `programming_languages` (
  `id` int(255) NOT NULL,
  `language_name` varchar(255) DEFAULT NULL,
  `language_image` varchar(255) DEFAULT NULL,
  `language_description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `programming_languages`
--

INSERT INTO `programming_languages` (`id`, `language_name`, `language_image`, `language_description`) VALUES
(0, 'java', 'uploadimg/JAVA.png', ''),
(3, 'Android', 'uploadimg/ANDROID.png', 'its an android course'),
(9, 'python', 'uploadimg/PYTHON.png', '');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `qid` int(250) NOT NULL,
  `question` varchar(255) DEFAULT NULL,
  `ans_id` int(255) DEFAULT NULL,
  `course_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`qid`, `question`, `ans_id`, `course_name`) VALUES
(1, 'what does html stands for', 1, 'html'),
(2, ' Who is making the Web standards?', 5, 'html'),
(3, ' Choose the correct HTML element for the largest heading:', 9, 'html'),
(4, 'What is the correct HTML element for inserting a line break?', 13, 'html'),
(5, 'what is java ?', 17, 'java');

-- --------------------------------------------------------

--
-- Table structure for table `question_test`
--

CREATE TABLE `question_test` (
  `id` int(255) NOT NULL,
  `question` varchar(255) NOT NULL,
  `opt1` varchar(255) NOT NULL,
  `opt2` varchar(255) NOT NULL,
  `opt3` varchar(255) NOT NULL,
  `opt4` varchar(255) NOT NULL,
  `answer` int(100) NOT NULL,
  `course_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `question_test`
--

INSERT INTO `question_test` (`id`, `question`, `opt1`, `opt2`, `opt3`, `opt4`, `answer`, `course_id`) VALUES
(1, 'What does PHP stand for?', 'PHP: Hypertext Preprocessor', 'Private Home Page', 'Personal Hypertext Processor', 'i dont know', 0, 1),
(2, 'How do you write \"Hello World\" in PHP', ' Document.Write(\"Hello World\")', ' echo \"Hello World\"', '\"Hello World\"', 'i dont know', 1, 1),
(14, 'what is haddop', 'i dont know', 'whatever ', 'bigdata soluntion', 'bigdata', 2, 9),
(15, 'The practice of creating objects based on predefined classes is often referred to as..', ' class creation', 'object creation', 'object instantiation', 'class instantiation', 3, 1),
(19, '', '', '', '', '', 0, 0),
(20, 'question 1', 'option 1', 'option 2', 'option 3', 'option 4 ', 1, 13),
(21, '', '', '', '', '', 0, 0),
(22, 'question 1', 'option 1', 'option 2', 'option 3', 'option 4 ', 1, 14),
(23, '', '', '', '', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `uid` int(255) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `totalques` int(255) DEFAULT NULL,
  `answerscorrect` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`uid`, `username`, `totalques`, `answerscorrect`) VALUES
(1, 'sunil yadav', 5, 4),
(2, 'sunil yadav', 5, 0),
(3, 'sunil yadav', 5, 0),
(4, 'sunil yadav', 5, 0),
(5, 'sunil yadav', 5, 0),
(6, 'sunil yadav', 5, 0),
(7, 'sunil yadav', 5, 0),
(8, 'sunil yadav', 5, 0),
(9, 'sunil yadav', 5, 0),
(10, 'sunil yadav', 5, 0),
(11, 'sunil yadav', 5, 0),
(12, 'sunil yadav', 5, 0),
(13, 'sunil yadav', 5, 0),
(14, 'sunil yadav', 5, 0),
(15, 'sunil yadav', 5, 0),
(16, 'sunil yadav', 5, 0),
(17, 'sunil yadav', 5, 0),
(18, 'sunil yadav', 5, 0),
(19, 'sunil yadav', 5, 3),
(20, 'sunil yadav', 5, 3),
(21, 'sunil yadav', 5, 0),
(22, 'sunil yadav', 5, 2),
(23, 'sunil yadav', 5, 2),
(24, 'sunil yadav', 5, 5),
(25, 'sunil yadav', 5, 1),
(26, 'sunil yadav', 5, 0),
(27, 'sunil yadav', 5, 1),
(28, 'sunil yadav', 5, 1),
(29, 'sunil yadav', 5, 1),
(30, 'sunil yadav', 5, 0),
(31, 'sunil yadav', 5, 0),
(32, 'sunil yadav', 5, 0),
(33, 'sunil yadav', 5, 0),
(34, 'sunil yadav', 5, 0),
(35, 'sunil yadav', 5, 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` int(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `password`, `email`, `img`) VALUES
(15, 'sunil yadav', 2365, 'sam123.sy28@gmail.com', 'img1.jpg'),
(16, 'sunil yadav', 541, 'sam123.sy28@gmail.com', 'img1.jpg'),
(17, 'sunil yadav', 520, 'sam123.sy28@gmail.com', 'img1.jpg'),
(18, 'sunil yadav', 56321, 'sam123.sy28@gmail.com', 'img1.jpg'),
(19, 'sunil yadav', 5641, 'sam123.sy28@gmail.com', 'ANDROID.png'),
(20, 'sunil yadav', 856412, 'sam123.sy28@gmail.com', 'danish.jpg'),
(21, 'sunil yadav', 56441, 'sam123.sy28@gmail.com', 'javalogo.png');

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE `videos` (
  `video_id` int(255) NOT NULL,
  `video_path` varchar(255) NOT NULL,
  `video_name` varchar(255) NOT NULL,
  `course_name` varchar(255) NOT NULL,
  `video_image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `videos`
--

INSERT INTO `videos` (`video_id`, `video_path`, `video_name`, `course_name`, `video_image`) VALUES
(51, 'https://www.youtube.com/embed/LGKniBZoxvc', 'How to download jcalender in Netbeans | Hindi', 'java', '../../uploadimg/4.png'),
(52, 'https://www.youtube.com/embed/QmKJrnt4rQg', 'How to download jcalender in Netbeans | Hindi', 'java', '../../uploadimg/v.png'),
(54, 'https://www.youtube.com/embed/9vIi56spxo8', 'How to do this', 'java', '../../uploadimg/ANDROID.png'),
(56, 'https://www.youtube.com/embed/VEQYRJkoRBY', 'this is a python video', 'python', '../../uploadimg/2.png');

-- --------------------------------------------------------

--
-- Table structure for table `videos_demo`
--

CREATE TABLE `videos_demo` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `video_info`
--

CREATE TABLE `video_info` (
  `course_id` int(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `course_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `video_info`
--

INSERT INTO `video_info` (`course_id`, `image`, `description`, `course_name`) VALUES
(20, '../../uploadimg/java_online.png', 'its a complete java tutorial', 'java');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `commentsection`
--
ALTER TABLE `commentsection`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faq`
--
ALTER TABLE `faq`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mytable`
--
ALTER TABLE `mytable`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `programming_languages`
--
ALTER TABLE `programming_languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`qid`);

--
-- Indexes for table `question_test`
--
ALTER TABLE `question_test`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`video_id`);

--
-- Indexes for table `videos_demo`
--
ALTER TABLE `videos_demo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `video_info`
--
ALTER TABLE `video_info`
  ADD PRIMARY KEY (`course_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
  MODIFY `aid` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `commentsection`
--
ALTER TABLE `commentsection`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=159;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `faq`
--
ALTER TABLE `faq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `mytable`
--
ALTER TABLE `mytable`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `programming_languages`
--
ALTER TABLE `programming_languages`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `qid` int(250) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `question_test`
--
ALTER TABLE `question_test`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `uid` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `videos`
--
ALTER TABLE `videos`
  MODIFY `video_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `videos_demo`
--
ALTER TABLE `videos_demo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `video_info`
--
ALTER TABLE `video_info`
  MODIFY `course_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
