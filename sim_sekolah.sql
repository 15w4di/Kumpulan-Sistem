-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 15 Okt 2021 pada 17.01
-- Versi Server: 5.6.21
-- PHP Version: 5.5.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `sim_sekolah`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `gaji`
--

CREATE TABLE IF NOT EXISTS `gaji` (
`id` int(11) NOT NULL,
  `id_guru` tinyint(4) NOT NULL,
  `periode` varchar(20) NOT NULL,
  `jam` varchar(4) NOT NULL,
  `nominal` varchar(12) NOT NULL,
  `time` date NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `gaji`
--

INSERT INTO `gaji` (`id`, `id_guru`, `periode`, `jam`, `nominal`, `time`, `tanggal`) VALUES
(2, 3, 'Februari-2020', '16', '40000', '2020-02-25', '2020-02-25 05:16:50'),
(3, 3, 'Januari-2021', '24', '40000', '2021-10-10', '2021-10-10 09:58:10'),
(4, 5, 'Oktober-2021', '12', '40000', '2021-10-10', '2021-10-10 09:59:34');

-- --------------------------------------------------------

--
-- Struktur dari tabel `guru`
--

CREATE TABLE IF NOT EXISTS `guru` (
`id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sex` enum('Pria','Wanita') NOT NULL,
  `nip` varchar(15) NOT NULL,
  `bidang` varchar(40) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `status` enum('Berhenti','Cuti','Aktif') NOT NULL,
  `number` varchar(15) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `guru`
--

INSERT INTO `guru` (`id`, `name`, `sex`, `nip`, `bidang`, `alamat`, `status`, `number`) VALUES
(3, 'Drs. Adrianto, M.Kom', 'Pria', '000211', 'Kepala Sekolah', 'Jl. Halat No. 68 Medan', 'Aktif', '0853-8833-2311'),
(4, 'Buyung Sugiharto, S.Pd', 'Pria', '000072', 'House Keeping', 'Jl. Karya Wisata', 'Aktif', '0852-9992-1212'),
(5, 'Irawaty, SS., M.Hum', 'Wanita', '000082', 'Bahasa Inggris', 'Jl. Seksama - Tembung', 'Aktif', '081254404400'),
(6, 'Drs. Hapis Lubis', 'Pria', '000032', 'Matematika', 'Jl. Pahlawan - Serdang', 'Aktif', '081289000494');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelas`
--

CREATE TABLE IF NOT EXISTS `kelas` (
`id` int(11) NOT NULL,
  `nama` varchar(15) NOT NULL,
  `wali` varchar(50) NOT NULL,
  `keterangan` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kelas`
--

INSERT INTO `kelas` (`id`, `nama`, `wali`, `keterangan`) VALUES
(5, 'XI Perhotelan', 'Buyung Sugiharto, S.Pd', ''),
(6, 'X Perhotelan', 'Irawaty, SS., M.Hum', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `lainnya`
--

CREATE TABLE IF NOT EXISTS `lainnya` (
`id` int(11) NOT NULL,
  `sekarang` varchar(15) NOT NULL,
  `time` date NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  `nominal` varchar(12) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `lainnya`
--

INSERT INTO `lainnya` (`id`, `sekarang`, `time`, `keterangan`, `nominal`, `tanggal`) VALUES
(6, '200225', '2020-02-25', 'Saldo Awal Sekolah', '25000000', '2020-02-25 05:21:15'),
(7, '211015', '2021-10-15', 'BOS', '45000000', '2021-10-15 14:45:12');

-- --------------------------------------------------------

--
-- Struktur dari tabel `laporan`
--

CREATE TABLE IF NOT EXISTS `laporan` (
`id` int(11) NOT NULL,
  `saldo_awal` varchar(15) NOT NULL DEFAULT '0',
  `kas_masuk` varchar(15) DEFAULT '0',
  `kas_keluar` varchar(15) NOT NULL DEFAULT '0',
  `tanggal` date NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `laporan`
--

INSERT INTO `laporan` (`id`, `saldo_awal`, `kas_masuk`, `kas_keluar`, `tanggal`) VALUES
(13, '0', '25000000', '0', '2020-02-25'),
(14, '25000000', '0', '0', '2021-09-25'),
(15, '25000000', '0', '0', '2021-09-26'),
(16, '25000000', '270000', '0', '2021-10-08'),
(17, '25270000', '0', '1440000', '2021-10-10'),
(18, '23830000', '45000000', '56000000', '2021-10-15');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembangunan`
--

CREATE TABLE IF NOT EXISTS `pembangunan` (
`id` int(11) NOT NULL,
  `id_siswa` smallint(6) NOT NULL,
  `nominal` varchar(12) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `waktu` date NOT NULL,
  `time` date NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pembangunan`
--

INSERT INTO `pembangunan` (`id`, `id_siswa`, `nominal`, `tanggal`, `waktu`, `time`) VALUES
(1, 3, '15000', '2019-12-18 10:11:30', '2019-11-08', '2019-11-17'),
(2, 2, '15000', '2019-11-16 20:48:15', '2019-11-09', '2019-11-17'),
(3, 2, '15000', '2019-11-16 20:48:15', '2019-11-11', '2019-11-17'),
(4, 9, '15000', '2019-12-04 07:55:13', '2019-12-04', '2019-12-04'),
(5, 9, '15000', '2019-12-04 07:55:13', '2019-12-05', '2019-12-04'),
(6, 9, '0', '2019-12-18 10:40:36', '2019-12-06', '2019-12-04'),
(7, 9, '15000', '2019-12-04 07:55:13', '2019-12-07', '2019-12-04'),
(9, 9, '15000', '2019-12-04 08:04:39', '2019-12-27', '2019-12-04'),
(10, 9, '15000', '2019-12-04 08:04:39', '2019-12-28', '2019-12-04'),
(11, 9, '15000', '2019-12-04 08:04:39', '2019-12-30', '2019-12-04'),
(12, 8, '15000', '2019-12-04 08:07:48', '2019-12-12', '2019-12-04'),
(13, 8, '15000', '2019-12-04 08:07:48', '2019-12-13', '2019-12-04'),
(14, 8, '15000', '2019-12-04 08:07:48', '2019-12-14', '2019-12-04'),
(15, 8, '15000', '2019-12-04 08:08:51', '2019-12-26', '2019-12-04'),
(16, 8, '15000', '2019-12-04 08:08:51', '2019-12-30', '2019-12-04'),
(17, 8, '0', '2019-12-18 10:25:52', '2019-12-31', '2019-12-04'),
(18, 8, '15000', '2019-12-18 09:15:55', '2019-12-19', '2019-12-18'),
(19, 8, '15000', '2019-12-18 09:15:55', '2019-12-23', '2019-12-18'),
(20, 8, '15000', '2019-12-18 09:15:55', '2019-12-24', '2019-12-18'),
(21, 8, '15000', '2019-12-18 09:15:55', '2019-12-25', '2019-12-18'),
(22, 8, '15000', '2019-12-18 09:15:55', '2020-01-01', '2019-12-18'),
(23, 8, '15000', '2019-12-18 09:15:55', '2020-01-02', '2019-12-18'),
(24, 8, '15000', '2019-12-18 09:15:55', '2020-01-06', '2019-12-18'),
(25, 8, '15000', '2019-12-18 09:15:55', '2020-01-07', '2019-12-18'),
(26, 8, '15000', '2019-12-18 09:15:55', '2020-01-08', '2019-12-18'),
(27, 8, '15000', '2019-12-18 09:15:55', '2020-01-09', '2019-12-18');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE IF NOT EXISTS `pembayaran` (
`id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `nominal` varchar(12) NOT NULL,
  `tipe` enum('KM','KK') NOT NULL,
  `kode` varchar(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pembayaran`
--

INSERT INTO `pembayaran` (`id`, `nama`, `nominal`, `tipe`, `kode`) VALUES
(1, 'Uang SPP', '70000', 'KM', 'KM-0001'),
(2, 'Uang Ujian', '50000', 'KM', 'KM-0002'),
(3, 'Uang Snack', '5000', 'KM', 'KM-0003'),
(4, 'Uang Catering', '15000', 'KM', 'KM-0004'),
(5, 'Uang Pendaftaran', '200000', 'KM', 'KM-0005'),
(6, 'Pembayaran Gaji', '40000', 'KK', 'KK-0001');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pendaftaran`
--

CREATE TABLE IF NOT EXISTS `pendaftaran` (
`id` int(11) NOT NULL,
  `nominal` varchar(12) NOT NULL,
  `time` date NOT NULL,
  `siswa` varchar(50) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pendaftaran`
--

INSERT INTO `pendaftaran` (`id`, `nominal`, `time`, `siswa`, `tanggal`) VALUES
(1, '200000', '2021-10-08', 'Ahmad Safawi', '2021-10-08 10:24:22');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengeluaran`
--

CREATE TABLE IF NOT EXISTS `pengeluaran` (
`id` int(11) NOT NULL,
  `nominal` varchar(12) NOT NULL,
  `sekarang` varchar(10) NOT NULL,
  `time` date NOT NULL,
  `keterangan` text NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pengeluaran`
--

INSERT INTO `pengeluaran` (`id`, `nominal`, `sekarang`, `time`, `keterangan`, `tanggal`) VALUES
(1, '15000000', '211015', '2021-10-15', 'Belanja ATK', '2021-10-15 14:47:24'),
(2, '28000000', '211015', '2021-10-15', 'Bahan Praktek Tata Boga', '2021-10-15 14:47:59'),
(3, '13000000', '211015', '2021-10-15', 'Bahan Praktek TKJ', '2021-10-15 14:48:47');

-- --------------------------------------------------------

--
-- Struktur dari tabel `praktek`
--

CREATE TABLE IF NOT EXISTS `praktek` (
`id` int(11) NOT NULL,
  `id_siswa` smallint(6) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `time` date NOT NULL,
  `waktu` date NOT NULL,
  `nominal` varchar(12) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `praktek`
--

INSERT INTO `praktek` (`id`, `id_siswa`, `tanggal`, `time`, `waktu`, `nominal`) VALUES
(15, 8, '2019-11-17 07:08:52', '2019-11-17', '2019-11-18', '5000'),
(16, 8, '2019-11-17 07:08:52', '2019-11-17', '2019-11-19', '5000'),
(17, 8, '2019-11-17 07:08:52', '2019-11-17', '2019-11-20', '5000'),
(18, 8, '2019-12-18 11:57:24', '2019-11-17', '2019-11-21', '0'),
(19, 8, '2019-11-17 07:08:52', '2019-11-17', '2019-11-22', '5000'),
(20, 8, '2019-11-17 07:08:52', '2019-11-17', '2019-11-23', '5000'),
(21, 8, '2019-12-18 11:01:43', '2019-11-17', '2019-11-25', '0'),
(22, 10, '2020-02-25 05:11:36', '2020-02-25', '2020-02-12', '5000'),
(23, 10, '2020-02-25 05:11:36', '2020-02-25', '2020-02-13', '5000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa`
--

CREATE TABLE IF NOT EXISTS `siswa` (
`id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `nis` varchar(15) NOT NULL,
  `sex` enum('Pria','Wanita') NOT NULL,
  `status` enum('Berhenti','Cuti','Aktif') NOT NULL,
  `wali` varchar(50) NOT NULL,
  `tempat` varchar(20) NOT NULL,
  `tanggal` date NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `kelas` tinyint(4) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `siswa`
--

INSERT INTO `siswa` (`id`, `name`, `nis`, `sex`, `status`, `wali`, `tempat`, `tanggal`, `alamat`, `kelas`) VALUES
(10, 'Suci Permata Sari', '123313134223', 'Wanita', 'Aktif', 'Musa Harun', 'Kampar', '2020-02-17', 'Jl. Simpang Lima', 6),
(11, 'Ahmad Dhairobbi', '1231314331', '', 'Aktif', 'Darmijan', 'Batu Guntung', '2002-07-25', 'Jln Kebakyoran Baru', 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `spp`
--

CREATE TABLE IF NOT EXISTS `spp` (
`id` int(11) NOT NULL,
  `id_siswa` smallint(6) NOT NULL,
  `time` date NOT NULL,
  `bulan` varchar(20) NOT NULL,
  `nominal` varchar(12) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `spp`
--

INSERT INTO `spp` (`id`, `id_siswa`, `time`, `bulan`, `nominal`, `tanggal`) VALUES
(3, 9, '2019-11-17', 'Januari-2019', '70000', '2019-11-17 07:20:18'),
(4, 10, '2020-02-25', 'Januari-2020', '70000', '2020-02-25 05:09:48'),
(5, 11, '2021-10-08', 'Oktober-2021', '70000', '2021-10-08 10:25:23');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tanggal`
--

CREATE TABLE IF NOT EXISTS `tanggal` (
`id` int(11) NOT NULL,
  `tgl` date NOT NULL,
  `Keterangan` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tanggal`
--

INSERT INTO `tanggal` (`id`, `tgl`, `Keterangan`) VALUES
(3, '2020-06-01', 'Hari Pancasila'),
(4, '2020-05-22', 'Hari Buruh');

-- --------------------------------------------------------

--
-- Struktur dari tabel `temp`
--

CREATE TABLE IF NOT EXISTS `temp` (
`id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `nis` varchar(15) NOT NULL,
  `tempat` varchar(50) NOT NULL,
  `tanggal` date NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `wali` varchar(100) NOT NULL,
  `sex` enum('Pria','Wanita') NOT NULL,
  `status` enum('Non-Aktif','Aktif') NOT NULL,
  `kelas` tinyint(4) NOT NULL,
  `bayar` tinyint(4) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `temp`
--

INSERT INTO `temp` (`id`, `name`, `nis`, `tempat`, `tanggal`, `alamat`, `wali`, `sex`, `status`, `kelas`, `bayar`) VALUES
(3, 'Ahmad Safawi', '1333', 'Rambah Samo', '2000-06-13', 'Jl. Simpang Mangga', 'Bahar', 'Pria', 'Non-Aktif', 0, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `ujian`
--

CREATE TABLE IF NOT EXISTS `ujian` (
`id` int(11) NOT NULL,
  `id_siswa` smallint(6) NOT NULL,
  `nominal` varchar(15) NOT NULL,
  `periode` varchar(20) NOT NULL,
  `time` date NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(100) NOT NULL,
  `role` int(11) NOT NULL,
  `active` enum('1','0') NOT NULL,
  `gambar` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `name`, `role`, `active`, `gambar`) VALUES
(1, 'smktelkom2mdn@gmail.com', '$2y$10$dFdQaba34BplJRnmCv54/uhoFLU0wlXCY4lRG/EG9FpX9fN1kzjq.', 'SMK Telkom 2 Medan', 1, '1', 'j.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `gaji`
--
ALTER TABLE `gaji`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `guru`
--
ALTER TABLE `guru`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lainnya`
--
ALTER TABLE `lainnya`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `laporan`
--
ALTER TABLE `laporan`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pembangunan`
--
ALTER TABLE `pembangunan`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pendaftaran`
--
ALTER TABLE `pendaftaran`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pengeluaran`
--
ALTER TABLE `pengeluaran`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `praktek`
--
ALTER TABLE `praktek`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `spp`
--
ALTER TABLE `spp`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tanggal`
--
ALTER TABLE `tanggal`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `temp`
--
ALTER TABLE `temp`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ujian`
--
ALTER TABLE `ujian`
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
-- AUTO_INCREMENT for table `gaji`
--
ALTER TABLE `gaji`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `guru`
--
ALTER TABLE `guru`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `kelas`
--
ALTER TABLE `kelas`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `lainnya`
--
ALTER TABLE `lainnya`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `laporan`
--
ALTER TABLE `laporan`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `pembangunan`
--
ALTER TABLE `pembangunan`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `pendaftaran`
--
ALTER TABLE `pendaftaran`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `pengeluaran`
--
ALTER TABLE `pengeluaran`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `praktek`
--
ALTER TABLE `praktek`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `siswa`
--
ALTER TABLE `siswa`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `spp`
--
ALTER TABLE `spp`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `tanggal`
--
ALTER TABLE `tanggal`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `temp`
--
ALTER TABLE `temp`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `ujian`
--
ALTER TABLE `ujian`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
