-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 27 Agu 2020 pada 16.46
-- Versi server: 10.1.37-MariaDB
-- Versi PHP: 7.1.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cbt`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `nip` varchar(20) NOT NULL,
  `jabatan` varchar(50) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id_admin`, `nama`, `nip`, `jabatan`, `username`, `password`) VALUES
(1, 'Hj. Nurul Muhda S.Pd', '1963041419941220004', 'Administrator', 'nurul', '$2y$10$W3n2V87TZQRpaR5JFdmcr.GQquPCME99j3D7VzzRy08jF3UAgrim2'),
(6, 'Ernawansyah, S.Pd', '2958735638300002', 'Kepala Sekolah', 'ernawansyah', '$2y$10$8/c4dRbGuqFbB7MPPQLiJuVhQkRHwhTOM7fK4HNJu89.3.A298R06');

-- --------------------------------------------------------

--
-- Struktur dari tabel `guru`
--

CREATE TABLE `guru` (
  `id_guru` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `nuptk` varchar(50) NOT NULL,
  `nip` varchar(20) NOT NULL,
  `jenis_kelamin` enum('Laki-Laki','Perempuan') NOT NULL,
  `tmpt_lahir` varchar(50) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `alamat` text NOT NULL,
  `no_hp` varchar(15) NOT NULL,
  `agama` varchar(30) NOT NULL,
  `pendidikan` varchar(100) NOT NULL,
  `mapel` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(32) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `guru`
--

INSERT INTO `guru` (`id_guru`, `nama`, `nuptk`, `nip`, `jenis_kelamin`, `tmpt_lahir`, `tgl_lahir`, `alamat`, `no_hp`, `agama`, `pendidikan`, `mapel`, `username`, `password`, `created_at`) VALUES
(1, 'AKHMAD GAZALI', '6634749651200022', '197103022014061002', 'Laki-Laki', 'AMUNTAI', '1971-03-02', 'Jl. Desa Banjang Kec.Banjang', '089627306954', 'Islam', 'S1 Pendidikan Bahasa dan Sastra Indonesia', 2, 'ahmad', 'ahmad', '2020-08-18 11:58:20'),
(2, 'MUNIROH', '4746741645300002', '1963041419941220004', 'Perempuan', 'LIHUNG', '1963-04-14', 'Jl. Desa Baruh Tabing Kec.Banjang', '089627306955', 'Islam', 'S1 Pendidikan Bahasa Inggris', 3, 'muniroh', 'muniroh', '2020-08-18 11:59:04'),
(3, 'RUSDI', '3951749651200002', '197106191999031008', 'Laki-Laki', 'PAKACANGAN', '1971-06-19', 'Jl. Desa Danau Terate Kec.Banjang', '089627306957', 'Islam', 'S1 Pendidikan IPA', 4, 'rusdi', 'rusdi', '2020-08-22 15:18:03'),
(4, 'H. MANSYAH ERPAIN', '2754736638200012', '195804221981031015', 'Laki-Laki', 'KELUA', '1958-04-22', 'Jl. Desa Garunggang Kec.Banjang', '089627306958', 'Islam', 'S1 Pendidikan IPS', 5, 'mansyah', 'mansyah', '2020-08-18 12:01:02'),
(5, 'HASANUDDIN', '7458759660200012', '198101262008041006', 'Laki-Laki', 'Banjarmasin', '1981-01-26', 'Jl. Desa Kaludan Besar Kec.Banjang', '089627306960', 'Islam', 'S1 Pendidikan Matematika', 1, 'hasan', 'hasan', '2020-08-18 12:03:41'),
(6, 'Hj. MARDIANA', '8862745647300002', '196705301992032005', 'Perempuan', 'HULU SUNGAI UTARA', '1967-05-30', 'JL. Desa Karias Dalam Kec.Banjang', '089627306962', 'Islam', 'S1 Pendidikan Agama Islam', 6, 'diana', 'diana', '2020-08-18 12:05:31'),
(7, 'IFROHATUL ULYATI DAROJAH', '2335753654300013', '197510032006042005', 'Perempuan', 'MAGELANG', '1975-10-03', 'Jl. Desa Kaludan Kecil Kec.Banjang', '089627306961', 'Islam', 'S1 Pendidikan Matematika', 1, 'yati', 'yati', '2020-08-18 12:04:39'),
(8, 'IRWAN IHSAN', '2956751653200002', '197306242005011006', 'Laki-Laki', 'AMUNTAI', '1973-06-24', 'Jl. Desa Lok Bangkai Kec.Banjang', '089627306963', 'Islam', 'S1 Pendidikan Jasmani', 7, 'irwan', 'irwan', '2020-08-18 12:06:15'),
(9, 'MARSIDAH', '1336740644300003', '196210041984122003', 'Perempuan', 'MADURA', '1962-10-04', 'Jl. Desa Kalintamui Kec.Banjang', '089627306959', 'Islam', 'S1 Pendidikan IPS', 5, 'sidah', 'sidah', '2020-08-18 12:02:47'),
(10, 'MISLINA', '5650758660300002', '198003182008012027', 'Perempuan', 'AMUNTAI', '1980-03-18', 'Jl. Desa Beringin Kec.Banjang', '089627306956', 'Islam', 'S1 Pendidikan Bahasa Inggris', 3, 'lina', 'lina', '2020-08-18 11:59:45');

--
-- Trigger `guru`
--
DELIMITER $$
CREATE TRIGGER `hapus_guru` BEFORE DELETE ON `guru` FOR EACH ROW BEGIN
	DELETE FROM soal WHERE soal.guru=OLD.id_guru;
	DELETE FROM ujian WHERE ujian.id_guru=OLD.id_guru;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ikut_ujian`
--

CREATE TABLE `ikut_ujian` (
  `id_tes` int(11) NOT NULL,
  `id_ujian` int(11) DEFAULT NULL,
  `id_siswa` int(11) DEFAULT NULL,
  `list_soal` longtext,
  `list_jawaban` longtext,
  `jml_benar` int(11) DEFAULT NULL,
  `nilai` int(11) DEFAULT NULL,
  `tgl_mulai` datetime DEFAULT NULL,
  `tgl_selesai` datetime DEFAULT NULL,
  `status` enum('Y','N') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `ikut_ujian`
--

INSERT INTO `ikut_ujian` (`id_tes`, `id_ujian`, `id_siswa`, `list_soal`, `list_jawaban`, `jml_benar`, `nilai`, `tgl_mulai`, `tgl_selesai`, `status`) VALUES
(1, 1, 11, '16,26,23,29', '16:C,26:A,23:D,29:A', 3, 75, '2020-08-22 22:34:47', '2020-08-22 22:54:47', 'N'),
(2, 2, 12, '7,4,10,19,13', '7:A,4:B,10:D,19:C,13:C', 5, 100, '2020-08-27 09:39:01', '2020-08-27 09:54:01', 'N'),
(3, 2, 11, '10,1,13,4,19', '10:D,1:A,13:C,4:B,19:C', 4, 80, '2020-08-27 09:39:57', '2020-08-27 09:54:57', 'N'),
(4, 2, 14, '19,13,4,1,7', '19:C,13:C,4:B,1:D,7:A', 4, 80, '2020-08-27 09:45:23', '2020-08-27 10:00:23', 'N'),
(5, 2, 13, '1,7,19,10,4', '1:B,7:A,19:C,10:C,4:B', 4, 80, '2020-08-27 09:46:07', '2020-08-27 10:01:07', 'N');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL,
  `kategori` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `kategori`) VALUES
(1, 'Pertemuan 1'),
(2, 'Pertemuan 2'),
(3, 'Pertemuan 3'),
(4, 'Pertemuan 4'),
(5, 'Pertemuan 5');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelas`
--

CREATE TABLE `kelas` (
  `id_kelas` int(11) NOT NULL,
  `kelas` int(11) NOT NULL,
  `kode_kelas` varchar(10) NOT NULL,
  `id_guru` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kelas`
--

INSERT INTO `kelas` (`id_kelas`, `kelas`, `kode_kelas`, `id_guru`) VALUES
(10, 7, '7A', 1),
(11, 7, '7B', 2),
(12, 7, '7C', 10),
(13, 8, '8A', 4),
(14, 8, '8B', 9),
(15, 8, '8C', 5),
(16, 9, '9A', 6),
(17, 9, '9B', 8);

--
-- Trigger `kelas`
--
DELIMITER $$
CREATE TRIGGER `hapus_kelas` BEFORE DELETE ON `kelas` FOR EACH ROW BEGIN
	DELETE FROM siswa WHERE siswa.kelas=OLD.id_kelas;
	DELETE FROM soal WHERE soal.kelas=OLD.id_kelas;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `mapel`
--

CREATE TABLE `mapel` (
  `id_mapel` int(11) NOT NULL,
  `mapel` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `mapel`
--

INSERT INTO `mapel` (`id_mapel`, `mapel`) VALUES
(1, 'Matematika'),
(2, 'Bahasa Indonesia'),
(3, 'Bahasa Inggris'),
(4, 'IPA'),
(5, 'IPS'),
(6, 'PAI'),
(7, 'Penjaskes');

--
-- Trigger `mapel`
--
DELIMITER $$
CREATE TRIGGER `hapus_mapel` BEFORE DELETE ON `mapel` FOR EACH ROW BEGIN
	DELETE FROM guru WHERE guru.mapel=OLD.id_mapel;
	DELETE FROM soal WHERE soal.mapel=OLD.id_mapel;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa`
--

CREATE TABLE `siswa` (
  `id_siswa` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `nis` int(11) NOT NULL,
  `jenis_kelamin` enum('Laki-Laki','Perempuan') NOT NULL,
  `tmpt_lahir` varchar(50) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `alamat` text NOT NULL,
  `kelas` int(11) NOT NULL,
  `password` varchar(32) NOT NULL,
  `nohp` char(12) NOT NULL,
  `tahun_ajaran` varchar(5) NOT NULL,
  `foto` varchar(150) NOT NULL,
  `pertanyaan` varchar(50) NOT NULL,
  `jawaban` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `siswa`
--

INSERT INTO `siswa` (`id_siswa`, `nama`, `nis`, `jenis_kelamin`, `tmpt_lahir`, `tgl_lahir`, `alamat`, `kelas`, `password`, `nohp`, `tahun_ajaran`, `foto`, `pertanyaan`, `jawaban`) VALUES
(11, 'Abuyajid Al-Bustami', 2008001, 'Laki-Laki', 'Amuntai', '2010-02-01', 'Jl. Desa Banjang Kec.Banjang', 10, 'coba', '081549324968', '2020', 'default.jpg', 'warna kesukaan kamu ?', 'biru'),
(12, 'Achmad Jefry Rayhan', 2008002, 'Laki-Laki', 'Banjarmasin', '2010-03-02', 'Jl. Desa Baruh Tabing Kec.Banjang', 10, 'coba', '081549324969', '2020', 'default.jpg', 'warna kesukaan kamu ?', 'biru'),
(13, 'Ahmad Rijani', 2008003, 'Laki-Laki', 'Barabai', '2010-04-03', 'Jl. Desa Beringin Kec. Banjang', 10, 'coba', '081549324970', '2020', 'default.jpg', 'binatang peliharaan', 'kucing'),
(14, 'Aprilia Salsabila Putri', 2008004, 'Perempuan', 'Tanjung', '2010-05-04', 'Jl. Desa Danau Terate Kec.Banjang', 10, 'coba', '081549324971', '2020', 'default.jpg', 'warna kesukaan kamu ?', 'kuning'),
(15, 'Apriliani Suciati', 2008005, 'Perempuan', 'Rantau', '2010-06-05', 'Jl. Desa Garunggang Kec.Banjang', 10, '2008005', '081549324972', '2020', 'default.jpg', '', ''),
(16, 'Assyifa Dwi Rukmana', 2008006, 'Perempuan', 'Amuntai', '2010-02-20', 'Jl. Desa Kalintamui Kec.Banjang', 11, '2008006', '081549324973', '2020', 'default.jpg', '', ''),
(17, 'Eka Santhi Wardani', 2008007, 'Perempuan', 'Amuntai', '2010-08-07', 'Jl. Desa Kaludan Besar Kec.Banjang', 11, '2008007', '081549324974', '2020', 'default.jpg', '', ''),
(18, 'Eliyana', 2008008, 'Perempuan', 'Banjarmasin', '2010-09-08', 'Jl. Desa Kaludan Kecil Kec.Banjang', 11, '2008008', '081549324975', '2020', 'default.jpg', '', ''),
(19, 'Farah Azkiya', 2008009, 'Perempuan', 'Barabai', '2010-10-09', 'JL. Desa Karias Dalam Kec.Banjang', 11, '2008009', '081549324976', '2020', 'default.jpg', '', ''),
(20, 'Ghaida Amira Fawziya', 2008010, 'Perempuan', 'Rantau', '2010-11-10', 'Jl. Desa Lok Bangkai Kec.Banjang', 11, '2008010', '081549324977', '2020', 'default.jpg', '', ''),
(21, 'Hanafi Farifan Pratama', 2008011, 'Laki-Laki', 'Amuntai', '2010-11-11', 'Jl. Desa Murung Padang Kec.Banjang', 12, '2008011', '081549324978', '2020', 'default.jpg', '', ''),
(22, 'Hasya', 2008012, 'Perempuan', 'Banjarmasin', '2010-12-11', 'Jl. Desa Palanjungan Sari Kec.Banjang', 12, '2008012', '081549324979', '2020', 'default.jpg', '', ''),
(23, 'Ibnu Hanifah', 2008013, 'Laki-Laki', 'Barabai', '2010-12-12', 'Jl. Desa Pandulangan Kec.Banjang', 12, '2008013', '081549324980', '2020', 'default.jpg', '', ''),
(24, 'Izzati Ramadhania', 2008014, 'Perempuan', 'Rantau', '2010-01-13', 'Jl. Desa Patarikan', 12, '2008014', '081549324981', '2020', 'default.jpg', '', ''),
(25, 'Mawaddah', 2008015, 'Perempuan', 'Amuntai', '2010-02-14', 'Jl. Desa Pawalutan Kec.Banjang', 12, '2008015', '081549324982', '2020', 'default.jpg', '', ''),
(26, 'Muhammad Adnan', 2008016, 'Laki-Laki', 'Amuntai', '2009-03-15', 'Jl. Desa Pulau Damar Kec.Banjang', 13, '2008016', '081549324983', '2019', 'default.jpg', '', ''),
(27, 'M. Ansharullah Al-Faruqi', 2008017, 'Laki-Laki', 'Banjarmasin', '2009-04-15', 'Jl. Desa Rantau Bujur Kec. Banjang', 13, '2008017', '081549324984', '2019', 'default.jpg', '', ''),
(28, 'M. Ferdy Saputra', 2008018, 'Laki-Laki', 'Rantau', '2009-05-16', 'Jl. Desa Sungai Bahadangan Kec.Banjang', 13, '2008018', '081549324985', '2019', 'default.jpg', '', ''),
(29, 'M. Noor Akhyar', 2008019, 'Laki-Laki', 'Barabai', '2009-06-17', 'Jl. Desa Teluk Buluh', 13, '2008019', '081549324986', '2019', 'default.jpg', '', ''),
(30, 'M. Rendy Asbeanoor', 2008020, 'Laki-Laki', 'Tanjung', '2009-07-18', 'Jl. Desa Teluk Sarikat Kec.Banjang', 13, '2008020', '081549324987', '2019', 'default.jpg', '', ''),
(31, 'Nazwa Karima', 2008021, 'Perempuan', 'Amuntai', '2009-12-01', 'Jl. Desa Banjang Kec.Banjang', 14, '2008021', '081549324988', '2019', 'default.jpg', '', ''),
(32, 'Noor Amalia Pebriani', 2008022, 'Perempuan', 'Banjarmasin', '2009-12-02', 'Jl. Desa Baruh Tabing Kec.Banjang', 14, '2008022', '081549324989', '2019', 'default.jpg', '', ''),
(33, 'Nur Husnina', 2008023, 'Perempuan', 'Barabai', '2009-12-03', 'Jl. Desa Beringin Kec.Banjang', 14, '2008023', '081549324990', '2019', 'default.jpg', '', ''),
(34, 'Risaf Ryan Maulana', 2008024, 'Laki-Laki', 'Rantau', '2009-12-04', 'Jl. Desa Danau Terate Kec.Banjang', 14, '2008024', '081549324991', '2019', 'default.jpg', '', ''),
(35, 'Salsabela', 2008025, 'Perempuan', 'Tanjung', '2009-12-05', 'Jl. Desa Garunggang Kec.Banjang', 14, '2008025', '081549324991', '2019', 'default.jpg', '', ''),
(36, 'Siti Amanda Dewi', 2008026, 'Perempuan', 'Amuntai', '2009-12-06', 'Jl. Desa Kalintamui Kec.Banjang', 15, '2008026', '081549324992', '2019', 'default.jpg', '', ''),
(37, 'Siti Nur Haliza', 2008027, 'Perempuan', 'Banjarmasin', '2009-12-07', 'Jl. Desa Kaludan Kecil Kec.Banjang', 15, '2008027', '081549324992', '2019', 'default.jpg', '', ''),
(38, 'Syafitr Zahira', 2008028, 'Perempuan', 'Barabai', '2009-12-08', 'Jl. Desa Kaludan Besar Kec.Banjang', 15, '2008028', '081549324993', '2019', 'default.jpg', '', ''),
(39, 'Wahyu Tri Utami', 2008029, 'Perempuan', 'Rantau', '2009-12-09', 'JL. Desa Karias Dalam Kec.Banjang', 15, '2008029', '081549324994', '2019', 'default.jpg', '', ''),
(40, 'Abi Husien', 2008030, 'Laki-Laki', 'Tanjung', '2019-12-10', 'Jl. Desa Lok Bangkai Kec.Banjang', 15, '2008030', '081549324994', '2019', 'default.jpg', '', ''),
(41, 'Alisya Kayla Azzahra', 2008031, 'Perempuan', 'Amuntai', '2008-12-11', 'Jl. Desa Murung Padang Kec.Banjang', 16, '2008031', '081549324995', '2018', 'default.jpg', 'warna kesukaan kamu ?', 'biru'),
(42, 'Annisa Firda Hayati', 2008032, 'Perempuan', 'Banjarmasin', '2008-12-12', 'Jl. Desa Palanjungan Sari Kec.Banjang', 16, '2008032', '081549324996', '2020', 'default.jpg', 'binatang peliharaan', 'kucing'),
(43, 'Ayu Lestari', 2008033, 'Perempuan', 'Barabai', '2008-12-13', 'Jl. Desa Pandulangan Kec.Banjang', 16, '2008033', '081549324997', '2018', 'default.jpg', '', ''),
(44, 'Cahaya Karmila', 2008034, 'Perempuan', 'Rantau', '2008-12-14', 'Jl. Desa Patarikan Kec.Banjang', 16, '2008034', '081549324998', '2018', 'default.jpg', '', ''),
(45, 'Desi Amelia Sari', 2008035, 'Perempuan', 'Tanjung', '2008-12-15', 'Jl. Desa Pawalutan Kec.Banjang', 16, '2008035', '081549324999', '2018', 'default.jpg', '', ''),
(46, 'Dina Hidayati', 2008036, 'Perempuan', 'Amuntai', '2008-12-16', 'Jl. Desa Pulau Damar Kec.Banjang', 17, '2008036', '081549324500', '2018', 'default.jpg', '', ''),
(47, 'Elysa Salsabila', 2008037, 'Perempuan', 'Banjarmasin', '2008-12-17', 'Jl. Desa Rantau Bujur Kec. Banjang', 17, '2008037', '081549324500', '2018', 'default.jpg', '', ''),
(48, 'Halyza Azahro', 2008038, 'Perempuan', 'Barabai', '2008-12-18', 'Jl. Desa Sungai Bahadangan Kec.Banjang', 17, '2008038', '081549324500', '2018', 'default.jpg', '', ''),
(49, 'M. Bintang Maritza', 2008039, 'Laki-Laki', 'Rantau', '2008-12-19', 'Jl. Desa Teluk Buluh', 17, '2008039', '081549324500', '2018', 'default.jpg', '', ''),
(50, 'M. Hafiz Ansyari', 2008040, 'Laki-Laki', 'Tanjung', '2008-12-20', 'Jl. Desa Teluk Buluh Kec.Banjang', 17, '2008040', '081549324500', '2018', 'default.jpg', '', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `soal`
--

CREATE TABLE `soal` (
  `id_soal` int(11) NOT NULL,
  `mapel` int(11) DEFAULT NULL,
  `id_kategori` int(11) NOT NULL,
  `nama_soal` varchar(100) NOT NULL,
  `kelas` int(11) DEFAULT NULL,
  `guru` int(11) DEFAULT NULL,
  `soal` text,
  `media` varchar(50) DEFAULT NULL,
  `opsi_a` text,
  `opsi_b` text,
  `opsi_c` text,
  `opsi_d` text,
  `jawaban` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `soal`
--

INSERT INTO `soal` (`id_soal`, `mapel`, `id_kategori`, `nama_soal`, `kelas`, `guru`, `soal`, `media`, `opsi_a`, `opsi_b`, `opsi_c`, `opsi_d`, `jawaban`, `created_at`) VALUES
(1, 2, 1, 'Tujuan Teks Deskripsi', 10, 1, '<p>Sungguh kaya warisan budaya Indonesia. Kita bangga memiliki warisan budaya dengan nilai arsitek yang tinggi dan unik. Rumah adat Tongkonan warisan budaya yang perlu kita jaga.&nbsp;</p>\r\n\r\n<p>Tujuan teks deskripsi di atas adalah mendeskripsikan ....</p>\r\n', NULL, 'Tongkonan merupakan rumah adat bagi masyarakat Toraja sebagai warisan budaya', 'Rumah adat yang terbuat dari bahan kayu yang bagus dengan hiasan indah', 'Rumah tersebut tidak perlu di vernis maupun di sirlak sampai ratusan tahun lamanya', 'Kita bangga kalau tinggal di tanah Toraja karena memiliki rumah yang unik', 'B', '2020-08-22 11:33:32'),
(2, 2, 1, 'Tujuan Deskripsi', 11, 1, '<p>Sungguh kaya warisan budaya Indonesia. Kita bangga memiliki warisan budaya dengan nilai arsitek yang tinggi dan unik. Rumah adat Tongkonan warisan budaya yang perlu kita jaga.&nbsp;</p>\r\n\r\n<p>Tujuan teks deskripsi di atas adalah mendeskripsikan ....</p>\r\n', NULL, 'Tongkonan merupakan rumah adat bagi masyarakat Toraja sebagai warisan budaya', 'Rumah adat yang terbuat dari bahan kayu yang bagus dengan hiasan indah', 'Rumah tersebut tidak perlu di vernis maupun di sirlak sampai ratusan tahun lamanya', 'Kita bangga kalau tinggal di tanah Toraja karena memiliki rumah yang unik', 'B', '2020-08-22 12:05:05'),
(3, 2, 1, 'Tujuan Teks Deskripsi', 12, 1, '<p>Sungguh kaya warisan budaya Indonesia. Kita bangga memiliki warisan budaya dengan nilai arsitek yang tinggi dan unik. Rumah adat Tongkonan warisan budaya yang perlu kita jaga.&nbsp;</p>\r\n\r\n<p>Tujuan teks deskripsi di atas adalah mendeskripsikan ....</p>\r\n', NULL, 'Tongkonan merupakan rumah adat bagi masyarakat Toraja sebagai warisan budaya', 'Rumah adat yang terbuat dari bahan kayu yang bagus dengan hiasan indah', 'Rumah tersebut tidak perlu di vernis maupun di sirlak sampai ratusan tahun lamanya', 'Kita bangga kalau tinggal di tanah Toraja karena memiliki rumah yang unik', 'B', '2020-08-22 11:33:33'),
(4, 2, 1, 'Ciri Deskripsi', 10, 1, '<p>Sungguh kaya warisan budaya Indonesia. Kita bangga memiliki warisan budaya dengan nilai arsitek yang tinggi dan unik. Rumah adat Tongkonan warisan budaya yang perlu kita jaga.</p>\r\n\r\n<p>Ciri isi teks deskripsi yang terdapat pada teks tersebut adalah ...</p>\r\n', NULL, 'Mengurutkan langkah-langkah dengan sistematis', 'Menggambarkan objek secara detail dan jelas', 'Menjelaskan argumen-argumen didukung oleh fakta yang kuat', 'Menceritakan bagian-bagian objek secara logis dan dramatis', 'B', '2020-08-22 12:03:48'),
(5, 2, 1, 'Ciri Deskripsi', 11, 1, '<p>Sungguh kaya warisan budaya Indonesia. Kita bangga memiliki warisan budaya dengan nilai arsitek yang tinggi dan unik. Rumah adat Tongkonan warisan budaya yang perlu kita jaga.</p>\r\n\r\n<p>Ciri isi teks deskripsi yang terdapat pada teks tersebut adalah ...</p>\r\n', NULL, 'Mengurutkan langkah-langkah dengan sistematis', 'Menggambarkan objek secara detail dan jelas', 'Menjelaskan argumen-argumen didukung oleh fakta yang kuat', 'Menceritakan bagian-bagian objek secara logis dan dramatis', 'B', '2020-08-22 12:03:48'),
(6, 2, 1, 'Ciri Deskripsi', 12, 1, '<p>Sungguh kaya warisan budaya Indonesia. Kita bangga memiliki warisan budaya dengan nilai arsitek yang tinggi dan unik. Rumah adat Tongkonan warisan budaya yang perlu kita jaga.</p>\r\n\r\n<p>Ciri isi teks deskripsi yang terdapat pada teks tersebut adalah ...</p>\r\n', NULL, 'Mengurutkan langkah-langkah dengan sistematis', 'Menggambarkan objek secara detail dan jelas', 'Menjelaskan argumen-argumen didukung oleh fakta yang kuat', 'Menceritakan bagian-bagian objek secara logis dan dramatis', 'B', '2020-08-22 12:03:48'),
(7, 2, 1, 'Rincian Deskripsi', 10, 1, '<p>Sungguh kaya warisan budaya Indonesia. Kita bangga memiliki warisan budaya dengan nilai arsitek yang tinggi dan unik. Rumah adat Tongkonan warisan budaya yang perlu kita jaga.</p>\r\n\r\n<p>Teks di atas merinci tentang ...</p>\r\n', NULL, 'bahan kayu, ukiran rumah, hiasan atap', 'harga rumah dan proses membuatnya', 'lokasi tanah, rumah adat, hiasan tanduk', 'proses pengukuhan Tongkonan sebagai ikon buat Indonesia', 'A', '2020-08-22 12:25:25'),
(8, 2, 1, 'Rincian Deskripsi', 11, 1, '<p>Sungguh kaya warisan budaya Indonesia. Kita bangga memiliki warisan budaya dengan nilai arsitek yang tinggi dan unik. Rumah adat Tongkonan warisan budaya yang perlu kita jaga.</p>\r\n\r\n<p>Teks di atas merinci tentang ...</p>\r\n', NULL, 'bahan kayu, ukiran rumah, hiasan atap', 'harga rumah dan proses membuatnya', 'lokasi tanah, rumah adat, hiasan tanduk', 'proses pengukuhan Tongkonan sebagai ikon buat Indonesia', 'A', '2020-08-22 12:25:25'),
(9, 2, 1, 'Rincian Deskripsi', 12, 1, '<p>Sungguh kaya warisan budaya Indonesia. Kita bangga memiliki warisan budaya dengan nilai arsitek yang tinggi dan unik. Rumah adat Tongkonan warisan budaya yang perlu kita jaga.</p>\r\n\r\n<p>Teks di atas merinci tentang ...</p>\r\n', NULL, 'bahan kayu, ukiran rumah, hiasan atap', 'harga rumah dan proses membuatnya', 'lokasi tanah, rumah adat, hiasan tanduk', 'proses pengukuhan Tongkonan sebagai ikon buat Indonesia', 'A', '2020-08-22 12:25:25'),
(10, 2, 1, 'Paragraf Penutup', 10, 1, '<p>Sungguh kaya warisan budaya Indonesia. Kita bangga memiliki warisan budaya dengan nilai arsitek yang tinggi dan unik. Rumah adat Tongkonan warisan budaya yang perlu kita jaga.&nbsp;</p>\r\n\r\n<p>Kesan umum pada paragraf penutup teks di atas adalah ...</p>\r\n', NULL, 'Kita harus bersedia apabila memiliki rumah adat yang jauh tapi unik dan indah', 'Kita menerima bahan rumah Tongkonan dinobatkan sebagai rumah adat Toraja', 'Kita harus memahami bagaimana proses pembangunan rumah adat yang kaya dengan hiasannya', 'Kita merasa bangga, Indonesia memiliki warisan budaya yang tinggi dan wajib menjaganya', 'D', '2020-08-22 12:28:33'),
(11, 2, 1, 'Paragraf Penutup', 11, 1, '<p>Sungguh kaya warisan budaya Indonesia. Kita bangga memiliki warisan budaya dengan nilai arsitek yang tinggi dan unik. Rumah adat Tongkonan warisan budaya yang perlu kita jaga.&nbsp;</p>\r\n\r\n<p>Kesan umum pada paragraf penutup teks di atas adalah ...</p>\r\n', NULL, 'Kita harus bersedia apabila memiliki rumah adat yang jauh tapi unik dan indah', 'Kita menerima bahan rumah Tongkonan dinobatkan sebagai rumah adat Toraja', 'Kita harus memahami bagaimana proses pembangunan rumah adat yang kaya dengan hiasannya', 'Kita merasa bangga, Indonesia memiliki warisan budaya yang tinggi dan wajib menjaganya', 'D', '2020-08-22 12:28:33'),
(12, 2, 1, 'Paragraf Penutup', 12, 1, '<p>Sungguh kaya warisan budaya Indonesia. Kita bangga memiliki warisan budaya dengan nilai arsitek yang tinggi dan unik. Rumah adat Tongkonan warisan budaya yang perlu kita jaga.&nbsp;</p>\r\n\r\n<p>Kesan umum pada paragraf penutup teks di atas adalah ...</p>\r\n', NULL, 'Kita harus bersedia apabila memiliki rumah adat yang jauh tapi unik dan indah', 'Kita menerima bahan rumah Tongkonan dinobatkan sebagai rumah adat Toraja', 'Kita harus memahami bagaimana proses pembangunan rumah adat yang kaya dengan hiasannya', 'Kita merasa bangga, Indonesia memiliki warisan budaya yang tinggi dan wajib menjaganya', 'D', '2020-08-22 12:28:33'),
(13, 2, 1, 'Ciri bagian identifikasi', 10, 1, '<p>Sungguh kaya warisan budaya Indonesia. Kita bangga memiliki warisan budaya dengan nilai arsitek yang tinggi dan unik. Rumah adat Tongkonan warisan budaya yang perlu kita jaga.</p>\r\n\r\n<p>Ciri bagian identifikasi pada struktur teks deskripsi di atas adalah ...</p>\r\n', NULL, 'merinci bagian-bagian yang dilihat', 'pernyataan yang berisi tanggapan personal', 'nama objek yang dibahas, lokasi, sejarah', 'simpulan umum atau tanggapan pribadi', 'C', '2020-08-22 12:31:31'),
(14, 2, 1, 'Ciri bagian identifikasi', 11, 1, '<p>Sungguh kaya warisan budaya Indonesia. Kita bangga memiliki warisan budaya dengan nilai arsitek yang tinggi dan unik. Rumah adat Tongkonan warisan budaya yang perlu kita jaga.</p>\r\n\r\n<p>Ciri bagian identifikasi pada struktur teks deskripsi di atas adalah ...</p>\r\n', NULL, 'merinci bagian-bagian yang dilihat', 'pernyataan yang berisi tanggapan personal', 'nama objek yang dibahas, lokasi, sejarah', 'simpulan umum atau tanggapan pribadi', 'C', '2020-08-22 12:31:31'),
(15, 2, 1, 'Ciri bagian identifikasi', 12, 1, '<p>Sungguh kaya warisan budaya Indonesia. Kita bangga memiliki warisan budaya dengan nilai arsitek yang tinggi dan unik. Rumah adat Tongkonan warisan budaya yang perlu kita jaga.</p>\r\n\r\n<p>Ciri bagian identifikasi pada struktur teks deskripsi di atas adalah ...</p>\r\n', NULL, 'merinci bagian-bagian yang dilihat', 'pernyataan yang berisi tanggapan personal', 'nama objek yang dibahas, lokasi, sejarah', 'simpulan umum atau tanggapan pribadi', 'C', '2020-08-22 12:31:31'),
(16, 2, 2, 'Contoh Majas', 10, 1, '<p>Sungguh kaya warisan budaya Indonesia. Kita bangga memiliki warisan budaya dengan nilai arsitek yang tinggi dan unik. Rumah adat Tongkonan warisan budaya yang perlu kita jaga.</p>\r\n\r\n<p>Pada teks berikut ini terdapat contoh majas yang sesuai dengan isi teks deskripsi di atas ...</p>\r\n', NULL, 'Rumah adat tersebut dibuat dari bahan-bahan kayu berkualitas bagus dengan hiasan unik', 'Ukiran yang ada di sekujur rumah itu menambah cantik penampilannya', 'Tongkonan di dekorasi dengan hiasan tanduk kerbau yang ditancapkan', 'Rumah tongkonan yang berjajar rapi dan indah seakan menyambut dengan ramah.', 'D', '2020-08-22 12:33:39'),
(17, 2, 2, 'Contoh Majas', 11, 1, '<p>Sungguh kaya warisan budaya Indonesia. Kita bangga memiliki warisan budaya dengan nilai arsitek yang tinggi dan unik. Rumah adat Tongkonan warisan budaya yang perlu kita jaga.</p>\r\n\r\n<p>Pada teks berikut ini terdapat contoh majas yang sesuai dengan isi teks deskripsi di atas ...</p>\r\n', NULL, 'Rumah adat tersebut dibuat dari bahan-bahan kayu berkualitas bagus dengan hiasan unik', 'Ukiran yang ada di sekujur rumah itu menambah cantik penampilannya', 'Tongkonan di dekorasi dengan hiasan tanduk kerbau yang ditancapkan', 'Rumah tongkonan yang berjajar rapi dan indah seakan menyambut dengan ramah.', 'D', '2020-08-22 12:33:39'),
(18, 2, 2, 'Contoh Majas', 12, 1, '<p>Sungguh kaya warisan budaya Indonesia. Kita bangga memiliki warisan budaya dengan nilai arsitek yang tinggi dan unik. Rumah adat Tongkonan warisan budaya yang perlu kita jaga.</p>\r\n\r\n<p>Pada teks berikut ini terdapat contoh majas yang sesuai dengan isi teks deskripsi di atas ...</p>\r\n', NULL, 'Rumah adat tersebut dibuat dari bahan-bahan kayu berkualitas bagus dengan hiasan unik', 'Ukiran yang ada di sekujur rumah itu menambah cantik penampilannya', 'Tongkonan di dekorasi dengan hiasan tanduk kerbau yang ditancapkan', 'Rumah tongkonan yang berjajar rapi dan indah seakan menyambut dengan ramah.', 'D', '2020-08-22 12:33:39'),
(19, 2, 1, 'Penggunaan Kata Depan', 10, 1, '<p>Penggunaan kata depan &ldquo;di&rdquo; yang tepat terdapat pada kalimat ...</p>\r\n', NULL, 'Salah satu museum yang banyak dikunjungi pelajar adalah Museum Geologi Bandung.', 'Museum ini didirikan pada zaman kolonialisme Belanda.', 'Malioboro adalah sebuah jalan di pusat kota Yogyakarta.', 'Pulau Komodo bisa dikunjungi kurang lebih 1-2 jam dari pelabuhan terdekat.', 'C', '2020-08-22 12:39:45'),
(20, 2, 1, 'Penggunaan Kata Depan', 11, 1, '<p>Penggunaan kata depan &ldquo;di&rdquo; yang tepat terdapat pada kalimat ...</p>\r\n', NULL, 'Salah satu museum yang banyak dikunjungi pelajar adalah Museum Geologi Bandung.', 'Museum ini didirikan pada zaman kolonialisme Belanda.', 'Malioboro adalah sebuah jalan di pusat kota Yogyakarta.', 'Pulau Komodo bisa dikunjungi kurang lebih 1-2 jam dari pelabuhan terdekat.', 'C', '2020-08-22 12:39:45'),
(21, 2, 1, 'Penggunaan Kata Depan', 12, 1, '<p>Penggunaan kata depan &ldquo;di&rdquo; yang tepat terdapat pada kalimat ...</p>\r\n', NULL, 'Salah satu museum yang banyak dikunjungi pelajar adalah Museum Geologi Bandung.', 'Museum ini didirikan pada zaman kolonialisme Belanda.', 'Malioboro adalah sebuah jalan di pusat kota Yogyakarta.', 'Pulau Komodo bisa dikunjungi kurang lebih 1-2 jam dari pelabuhan terdekat.', 'C', '2020-08-22 12:39:45'),
(23, 2, 2, 'Kata Khusus', 10, 1, '<p>(1) Ibu menanam beraneka ragam bunga.</p>\r\n\r\n<p>(2) Perilaku anak itu sangat baik</p>\r\n\r\n<p>(3) Dari pinggir pantai kita dapat melihat keindahan pantai.</p>\r\n\r\n<p>(4) Pemandangan Pantai Senggigi sangat elok.</p>\r\n\r\n<p>Kalimat yang mengandung kata khusus terdapat pada kalimat nomor ....</p>\r\n', NULL, '(1)', '(2)', '(3)', '(4)', 'D', '2020-08-22 12:44:41'),
(24, 2, 2, 'Kata Khusus', 11, 1, '<p>(1) Ibu menanam beraneka ragam bunga.</p>\r\n\r\n<p>(2) Perilaku anak itu sangat baik</p>\r\n\r\n<p>(3) Dari pinggir pantai kita dapat melihat keindahan pantai.</p>\r\n\r\n<p>(4) Pemandangan Pantai Senggigi sangat elok.</p>\r\n\r\n<p>Kalimat yang mengandung kata khusus terdapat pada kalimat nomor ....</p>\r\n', NULL, '(1)', '(2)', '(3)', '(4)', 'D', '2020-08-22 12:44:41'),
(25, 2, 2, 'Kata Khusus', 12, 1, '<p>(1) Ibu menanam beraneka ragam bunga.</p>\r\n\r\n<p>(2) Perilaku anak itu sangat baik</p>\r\n\r\n<p>(3) Dari pinggir pantai kita dapat melihat keindahan pantai.</p>\r\n\r\n<p>(4) Pemandangan Pantai Senggigi sangat elok.</p>\r\n\r\n<p>Kalimat yang mengandung kata khusus terdapat pada kalimat nomor ....</p>\r\n', NULL, '(1)', '(2)', '(3)', '(4)', 'D', '2020-08-22 12:44:41'),
(26, 2, 2, 'Serapan indra seolah dirasa', 10, 1, '<p>(1) Angin laut yang lembut terasa mengelus kulit.</p>\r\n\r\n<p>(2) Pemandangan bawah laut Senggigi sangat memesona.</p>\r\n\r\n<p>(3) Ibuku sangat suka membantu orang lain.</p>\r\n\r\n<p>(4) Dia menunjukkan perasaannya lewat gerakan bermakna di wajahnya.</p>\r\n\r\n<p>Kalimat yang menggunakan serapan indra seolah dirasa terdapat pada kalimat nomor ....</p>\r\n', NULL, '(1)', '(2)', '(3)', '(4)', 'A', '2020-08-22 12:46:58'),
(27, 2, 2, 'Serapan indra seolah dirasa', 11, 1, '<p>(1) Angin laut yang lembut terasa mengelus kulit.</p>\r\n\r\n<p>(2) Pemandangan bawah laut Senggigi sangat memesona.</p>\r\n\r\n<p>(3) Ibuku sangat suka membantu orang lain.</p>\r\n\r\n<p>(4) Dia menunjukkan perasaannya lewat gerakan bermakna di wajahnya.</p>\r\n\r\n<p>Kalimat yang menggunakan serapan indra seolah dirasa terdapat pada kalimat nomor ....</p>\r\n', NULL, '(1)', '(2)', '(3)', '(4)', 'A', '2020-08-22 12:46:58'),
(28, 2, 2, 'Serapan indra seolah dirasa', 12, 1, '<p>(1) Angin laut yang lembut terasa mengelus kulit.</p>\r\n\r\n<p>(2) Pemandangan bawah laut Senggigi sangat memesona.</p>\r\n\r\n<p>(3) Ibuku sangat suka membantu orang lain.</p>\r\n\r\n<p>(4) Dia menunjukkan perasaannya lewat gerakan bermakna di wajahnya.</p>\r\n\r\n<p>Kalimat yang menggunakan serapan indra seolah dirasa terdapat pada kalimat nomor ....</p>\r\n', NULL, '(1)', '(2)', '(3)', '(4)', 'A', '2020-08-22 12:46:58'),
(29, 2, 2, 'Ciri Cerita Fantasi', 10, 1, '<p>Yang bukan merupakan ciri teks cerita fantasi pada kedua teks di atas&nbsp;adalah .....</p>\r\n', 'Soal11.JPG', 'bersifat nyata', 'terdapat keajaiban/kemisteriusan', 'latar lintas ruang dan waktu', 'tokoh memiliki keajaiban/keunikan', 'A', '2020-08-26 06:38:07'),
(30, 2, 2, 'Ciri Cerita Fantasi', 11, 1, '<p>Yang bukan merupakan ciri teks cerita fantasi pada kedua teks di bawah&nbsp;adalah .....</p>\r\n', 'soal12.JPG', 'bersifat nyata', 'terdapat keajaiban/kemisteriusan', 'latar lintas ruang dan waktu', 'tokoh memiliki keajaiban/keunikan', 'A', '2020-08-22 14:31:28'),
(31, 2, 2, 'Ciri Cerita Fantasi', 12, 1, '<p>Yang bukan merupakan ciri teks cerita fantasi pada kedua teks di bawah&nbsp;adalah .....</p>\r\n', 'soal13.JPG', 'bersifat nyata', 'terdapat keajaiban/kemisteriusan', 'latar lintas ruang dan waktu', 'tokoh memiliki keajaiban/keunikan', 'A', '2020-08-22 14:31:28'),
(33, 2, 2, 'Unsur Cerita Fantasi', 10, 1, '<p>Persamaan unsur cerita yang terdapat pada kedua teks tersebut adalah ...</p>\r\n', 'Soal12.JPG', 'latar waktu dan tokoh', 'latar tempat dan tokoh', 'latar tempat, latar waktu, dan tokoh', 'latar tempat dan latar waktu', 'B', '2020-08-26 06:39:23'),
(34, 2, 2, 'Unsur Cerita Fantasi', 11, 1, '<p>Persamaan unsur cerita yang terdapat pada kedua teks tersebut adalah ...</p>\r\n', 'Soal14.JPG', 'latar waktu dan tokoh', 'latar tempat dan tokoh', 'latar tempat, latar waktu, dan tokoh', 'latar tempat dan latar waktu', 'B', '2020-08-26 06:41:20'),
(35, 2, 2, 'Unsur Cerita Fantasi', 12, 1, '<p>Persamaan unsur cerita yang terdapat pada kedua teks tersebut adalah ...</p>\r\n', 'Soal16.JPG', 'latar waktu dan tokoh', 'latar tempat dan tokoh', 'latar tempat, latar waktu, dan tokoh', 'latar tempat dan latar waktu', 'B', '2020-08-26 06:43:43'),
(36, 2, 2, 'Watak pada Cerita Fantasi', 10, 1, '<p>Watak Nataga pada kutipan teks 1 adalah....</p>\r\n', 'Soal13.JPG', 'penakut', 'pemberani', 'pemalas', 'periang', 'B', '2020-08-26 06:40:05'),
(37, 2, 2, 'Watak pada Cerita Fantasi', 11, 1, '<p>Watak Nataga pada kutipan teks 1 adalah....</p>\r\n', 'Soal15.JPG', 'penakut', 'pemberani', 'pemalas', 'periang', 'B', '2020-08-26 06:42:13'),
(38, 2, 2, 'Watak pada Cerita Fantasi', 12, 1, '<p>Watak Nataga pada kutipan teks 1 adalah....</p>\r\n', 'Soal17.JPG', 'penakut', 'pemberani', 'pemalas', 'periang', 'B', '2020-08-26 06:44:22'),
(39, 2, 3, 'Latar Suasana', 10, 1, '<p>&ldquo;Kau harus membawanya kembali!&rdquo; Erza berteriak kalang kabut. Aku gugup. Bingung. Tak tahu apa yang harus kuperbuat, sedangkan manusia dengan wajah setengah kera itu memandang sekeliling. Manusia purba itu menemukanku ketika aku memasuki dimensi Alpha.</p>\r\n\r\n<p>Latar suasana yang tergambar pada kutipan teks cerita tersebut adalah ...</p>\r\n', NULL, 'menegangkan', 'menggembirakan', 'mengharukan', 'menyedihkan', 'A', '2020-08-26 10:43:21'),
(40, 2, 3, 'Latar Suasana', 11, 1, '<p>&ldquo;Kau harus membawanya kembali!&rdquo; Erza berteriak kalang kabut. Aku gugup. Bingung. Tak tahu apa yang harus kuperbuat, sedangkan manusia dengan wajah setengah kera itu memandang sekeliling. Manusia purba itu menemukanku ketika aku memasuki dimensi Alpha.</p>\r\n\r\n<p>Latar suasana yang tergambar pada kutipan teks cerita tersebut adalah ...</p>\r\n', NULL, 'menegangkan', 'menggembirakan', 'mengharukan', 'menyedihkan', 'A', '2020-08-26 10:43:21'),
(41, 2, 3, 'Latar Suasana', 12, 1, '<p>&ldquo;Kau harus membawanya kembali!&rdquo; Erza berteriak kalang kabut. Aku gugup. Bingung. Tak tahu apa yang harus kuperbuat, sedangkan manusia dengan wajah setengah kera itu memandang sekeliling. Manusia purba itu menemukanku ketika aku memasuki dimensi Alpha.</p>\r\n\r\n<p>Latar suasana yang tergambar pada kutipan teks cerita tersebut adalah ...</p>\r\n', NULL, 'menegangkan', 'menggembirakan', 'mengharukan', 'menyedihkan', 'A', '2020-08-26 10:43:21'),
(42, 2, 3, 'Kutipan Teks Cerita', 10, 1, '<p>Setetes air mata pun jatuh dari wajah sang ratu. Tak sepatah kata pun terdengar dari bibirnya, kamar megah terasa sunyi.&nbsp;</p>\r\n\r\n<p>Kutipan teks cerita tersebut, menunjukkan adanya&hellip;</p>\r\n', NULL, 'latar kosong', 'latar waktu', 'latar tempat', 'latar suasana', 'D', '2020-08-26 10:44:55'),
(43, 2, 3, 'Kutipan Teks Cerita', 11, 1, '<p>Setetes air mata pun jatuh dari wajah sang ratu. Tak sepatah kata pun terdengar dari bibirnya, kamar megah terasa sunyi.&nbsp;</p>\r\n\r\n<p>Kutipan teks cerita tersebut, menunjukkan adanya&hellip;</p>\r\n', NULL, 'latar kosong', 'latar waktu', 'latar tempat', 'latar suasana', 'D', '2020-08-26 10:44:55'),
(44, 2, 3, 'Kutipan Teks Cerita', 12, 1, '<p>Setetes air mata pun jatuh dari wajah sang ratu. Tak sepatah kata pun terdengar dari bibirnya, kamar megah terasa sunyi.&nbsp;</p>\r\n\r\n<p>Kutipan teks cerita tersebut, menunjukkan adanya&hellip;</p>\r\n', NULL, 'latar kosong', 'latar waktu', 'latar tempat', 'latar suasana', 'D', '2020-08-26 10:44:55'),
(45, 2, 3, 'Paragraf Cerita Fantasi', 10, 1, '<p>Alien itu berhidung mancung. Dengan hidungnya yang menjulang, ia mengendus sekeliling. Sepertinya ia bingung dan mencoba mengenali tempat baru. Matanya yang sebesar biji kemiri berkedip-kedip memamerkan matanya yang kehijauan. Aku tahu dia bukan manusia sepertiku. Tapi ia datang bukan untuk mengganggu.</p>\r\n\r\n<p>Paragraf tersebut merupakan teks cerita fantasi bagian orientasi yang dikembangkan melalui ...</p>\r\n', NULL, 'Deskripsi latar', 'Pengenalan tokoh ', 'Pengenalan konflik', 'Menghadirkan tokoh lain.', 'D', '2020-08-26 10:51:56'),
(46, 2, 3, 'Paragraf Cerita Fantasi', 11, 1, '<p>Alien itu berhidung mancung. Dengan hidungnya yang menjulang, ia mengendus sekeliling. Sepertinya ia bingung dan mencoba mengenali tempat baru. Matanya yang sebesar biji kemiri berkedip-kedip memamerkan matanya yang kehijauan. Aku tahu dia bukan manusia sepertiku. Tapi ia datang bukan untuk mengganggu.</p>\r\n\r\n<p>Paragraf tersebut merupakan teks cerita fantasi bagian orientasi yang dikembangkan melalui ...</p>\r\n', NULL, 'Deskripsi latar', 'Pengenalan tokoh ', 'Pengenalan konflik', 'Menghadirkan tokoh lain.', 'D', '2020-08-26 10:51:56'),
(47, 2, 3, 'Paragraf Cerita Fantasi', 12, 1, '<p>Alien itu berhidung mancung. Dengan hidungnya yang menjulang, ia mengendus sekeliling. Sepertinya ia bingung dan mencoba mengenali tempat baru. Matanya yang sebesar biji kemiri berkedip-kedip memamerkan matanya yang kehijauan. Aku tahu dia bukan manusia sepertiku. Tapi ia datang bukan untuk mengganggu.</p>\r\n\r\n<p>Paragraf tersebut merupakan teks cerita fantasi bagian orientasi yang dikembangkan melalui ...</p>\r\n', NULL, 'Deskripsi latar', 'Pengenalan tokoh ', 'Pengenalan konflik', 'Menghadirkan tokoh lain.', 'D', '2020-08-26 10:51:56'),
(48, 2, 3, 'Kutipan Cerita', 10, 1, '<p>Peri Hujan dan Peri Bulan terkejut dengan kehadiran raksasa di depan mereka. Rupanya raksasa inilah yang menyebabkan hutan rusak dan binatang-binatang lain melarikan diri. Mereka kemudian berusaha mengusir raksasa itu dengan kekuatan yang mereka miliki.</p>\r\n\r\n<p>Kutipan cerita tersebut memuat bagian ...</p>\r\n', NULL, 'orientasi', 'resolusi', 'evaluasi', 'komplikasi', 'D', '2020-08-26 10:53:13'),
(49, 2, 3, 'Kutipan Cerita', 11, 1, '<p>Peri Hujan dan Peri Bulan terkejut dengan kehadiran raksasa di depan mereka. Rupanya raksasa inilah yang menyebabkan hutan rusak dan binatang-binatang lain melarikan diri. Mereka kemudian berusaha mengusir raksasa itu dengan kekuatan yang mereka miliki.</p>\r\n\r\n<p>Kutipan cerita tersebut memuat bagian ...</p>\r\n', NULL, 'orientasi', 'resolusi', 'evaluasi', 'komplikasi', 'D', '2020-08-26 10:53:13'),
(50, 2, 3, 'Kutipan Cerita', 12, 1, '<p>Peri Hujan dan Peri Bulan terkejut dengan kehadiran raksasa di depan mereka. Rupanya raksasa inilah yang menyebabkan hutan rusak dan binatang-binatang lain melarikan diri. Mereka kemudian berusaha mengusir raksasa itu dengan kekuatan yang mereka miliki.</p>\r\n\r\n<p>Kutipan cerita tersebut memuat bagian ...</p>\r\n', NULL, 'orientasi', 'resolusi', 'evaluasi', 'komplikasi', 'D', '2020-08-26 10:53:13'),
(51, 2, 3, 'Kutipan Cerita', 10, 1, '<p>Minggu pagi yang cerah Ardi, Handi, dan Dani berada di Candi Trowulan. Mereka merupakan siswa pilihan dari sebuah SMP yang sedang melakukan tugas pengamatan untuk karya ilmiah remaja. Di tengah keramaian orang yang sedang berwisata, mereka sibuk menyelesaikan laporannya.</p>\r\n\r\n<p>Kutipan cerita tersebut memuat bagian ...</p>\r\n', NULL, 'Orientasi', 'resolusi', 'evaluasi', 'komplikasi', 'A', '2020-08-26 10:54:15'),
(52, 2, 3, 'Kutipan Cerita', 11, 1, '<p>Minggu pagi yang cerah Ardi, Handi, dan Dani berada di Candi Trowulan. Mereka merupakan siswa pilihan dari sebuah SMP yang sedang melakukan tugas pengamatan untuk karya ilmiah remaja. Di tengah keramaian orang yang sedang berwisata, mereka sibuk menyelesaikan laporannya.</p>\r\n\r\n<p>Kutipan cerita tersebut memuat bagian ...</p>\r\n', NULL, 'Orientasi', 'resolusi', 'evaluasi', 'komplikasi', 'A', '2020-08-26 10:54:15'),
(53, 2, 3, 'Kutipan Cerita', 12, 1, '<p>Minggu pagi yang cerah Ardi, Handi, dan Dani berada di Candi Trowulan. Mereka merupakan siswa pilihan dari sebuah SMP yang sedang melakukan tugas pengamatan untuk karya ilmiah remaja. Di tengah keramaian orang yang sedang berwisata, mereka sibuk menyelesaikan laporannya.</p>\r\n\r\n<p>Kutipan cerita tersebut memuat bagian ...</p>\r\n', NULL, 'Orientasi', 'resolusi', 'evaluasi', 'komplikasi', 'A', '2020-08-26 10:54:15'),
(54, 3, 1, 'Conversation', 10, 2, '<p>Siti : This park is shady and the flower are colourful. I like this park.<br />\r\nLina : I do, too. This is a wonderful park<br />\r\nEdo : look! There are butterflies. Dayu : they&rsquo;re pretty.<br />\r\nBeni : there are garbage cans, too. We can keep this park clean.<br />\r\nUdin : I like studiying here the weather is nice. The park is beautiful. And, it&rsquo;s a beautiful day!</p>\r\n\r\n<p>What do they say about the park?</p>\r\n', NULL, 'Siti says that this park is shady and the flower are colourful.', 'Lina says that this is not good.', 'Edo says that there are garbage cans, too. We can’t keep this park', 'Udin says that there are butterflies.', 'A', '2020-08-26 11:03:59'),
(55, 3, 1, 'Conversation', 11, 2, '<p>Siti : This park is shady and the flower are colourful. I like this park.<br />\r\nLina : I do, too. This is a wonderful park<br />\r\nEdo : look! There are butterflies. Dayu : they&rsquo;re pretty.<br />\r\nBeni : there are garbage cans, too. We can keep this park clean.<br />\r\nUdin : I like studiying here the weather is nice. The park is beautiful. And, it&rsquo;s a beautiful day!</p>\r\n\r\n<p>What do they say about the park?</p>\r\n', NULL, 'Siti says that this park is shady and the flower are colourful.', 'Lina says that this is not good.', 'Edo says that there are garbage cans, too. We can’t keep this park', 'Udin says that there are butterflies.', 'A', '2020-08-26 11:03:59'),
(56, 3, 1, 'Conversation', 12, 2, '<p>Siti : This park is shady and the flower are colourful. I like this park.<br />\r\nLina : I do, too. This is a wonderful park<br />\r\nEdo : look! There are butterflies. Dayu : they&rsquo;re pretty.<br />\r\nBeni : there are garbage cans, too. We can keep this park clean.<br />\r\nUdin : I like studiying here the weather is nice. The park is beautiful. And, it&rsquo;s a beautiful day!</p>\r\n\r\n<p>What do they say about the park?</p>\r\n', NULL, 'Siti says that this park is shady and the flower are colourful.', 'Lina says that this is not good.', 'Edo says that there are garbage cans, too. We can’t keep this park', 'Udin says that there are butterflies.', 'A', '2020-08-26 11:03:59'),
(57, 3, 1, 'Synonim', 10, 2, '<p>Siti : This park is shady and the flower are colourful. I like this park.<br />\r\nLina : I do, too. This is a wonderful park<br />\r\nEdo : look! There are butterflies. Dayu : they&rsquo;re pretty.<br />\r\nBeni : there are garbage cans, too. We can keep this park clean.<br />\r\nUdin : I like studiying here the weather is nice. The park is beautiful. And, it&rsquo;s a beautiful day!</p>\r\n\r\n<p>&ldquo;this is a&nbsp;wonderful&nbsp;park&rdquo;<br />\r\nWhat is the synonym of the underlined word?</p>\r\n', NULL, 'Poor', 'Awful', 'Awesome', 'Despicable', 'C', '2020-08-26 11:05:21'),
(58, 3, 1, 'Synonim', 11, 2, '<p>Siti : This park is shady and the flower are colourful. I like this park.<br />\r\nLina : I do, too. This is a wonderful park<br />\r\nEdo : look! There are butterflies. Dayu : they&rsquo;re pretty.<br />\r\nBeni : there are garbage cans, too. We can keep this park clean.<br />\r\nUdin : I like studiying here the weather is nice. The park is beautiful. And, it&rsquo;s a beautiful day!</p>\r\n\r\n<p>&ldquo;this is a&nbsp;wonderful&nbsp;park&rdquo;<br />\r\nWhat is the synonym of the underlined word?</p>\r\n', NULL, 'Poor', 'Awful', 'Awesome', 'Despicable', 'C', '2020-08-26 11:05:21'),
(59, 3, 1, 'Synonim', 12, 2, '<p>Siti : This park is shady and the flower are colourful. I like this park.<br />\r\nLina : I do, too. This is a wonderful park<br />\r\nEdo : look! There are butterflies. Dayu : they&rsquo;re pretty.<br />\r\nBeni : there are garbage cans, too. We can keep this park clean.<br />\r\nUdin : I like studiying here the weather is nice. The park is beautiful. And, it&rsquo;s a beautiful day!</p>\r\n\r\n<p>&ldquo;this is a&nbsp;wonderful&nbsp;park&rdquo;<br />\r\nWhat is the synonym of the underlined word?</p>\r\n', NULL, 'Poor', 'Awful', 'Awesome', 'Despicable', 'C', '2020-08-26 11:05:21'),
(60, 3, 1, 'Class Introduction', 10, 2, '<p>My Classroom<br />\r\nMy classroom is very large. There are twenty tables and forty chairs for the students, but only 39 of them are occupied. There is a desk and chair for the teacher in the front and a cupboard to store the cleaning equipment at the back of the room. The tables, desk, chairs, and cupboard are wooden.<br />\r\n<br />\r\nBeside the teacher&rsquo;s desk, there are a whiteboard and blackboard. The photographs of the president and vice president of Indonesia are above the boards. The shape of the boards and the photo frames are rectangular. A garuda is put between the two photographs. At the back of the room, a round wall clock is hanging on the wall. My classroom is clean and tidy. Every morning and afternoon, the students on duty clean the room and arrange the tables and chairs. Cleaning the room by ourselves is a good practice for us to be diligent and responsible beings.</p>\r\n\r\n<p>How many chairs are there?</p>\r\n', NULL, 'There are forty chairs', 'There is twenty chairs', 'There is one blackboard', 'There are two photographs', 'A', '2020-08-26 11:08:30'),
(61, 3, 1, 'Class Introduction', 11, 2, '<p>My Classroom<br />\r\nMy classroom is very large. There are twenty tables and forty chairs for the students, but only 39 of them are occupied. There is a desk and chair for the teacher in the front and a cupboard to store the cleaning equipment at the back of the room. The tables, desk, chairs, and cupboard are wooden.<br />\r\n<br />\r\nBeside the teacher&rsquo;s desk, there are a whiteboard and blackboard. The photographs of the president and vice president of Indonesia are above the boards. The shape of the boards and the photo frames are rectangular. A garuda is put between the two photographs. At the back of the room, a round wall clock is hanging on the wall. My classroom is clean and tidy. Every morning and afternoon, the students on duty clean the room and arrange the tables and chairs. Cleaning the room by ourselves is a good practice for us to be diligent and responsible beings.</p>\r\n\r\n<p>How many chairs are there?</p>\r\n', NULL, 'There are forty chairs', 'There is twenty chairs', 'There is one blackboard', 'There are two photographs', 'A', '2020-08-26 11:08:30'),
(62, 3, 1, 'Class Introduction', 12, 2, '<p>My Classroom<br />\r\nMy classroom is very large. There are twenty tables and forty chairs for the students, but only 39 of them are occupied. There is a desk and chair for the teacher in the front and a cupboard to store the cleaning equipment at the back of the room. The tables, desk, chairs, and cupboard are wooden.<br />\r\n<br />\r\nBeside the teacher&rsquo;s desk, there are a whiteboard and blackboard. The photographs of the president and vice president of Indonesia are above the boards. The shape of the boards and the photo frames are rectangular. A garuda is put between the two photographs. At the back of the room, a round wall clock is hanging on the wall. My classroom is clean and tidy. Every morning and afternoon, the students on duty clean the room and arrange the tables and chairs. Cleaning the room by ourselves is a good practice for us to be diligent and responsible beings.</p>\r\n\r\n<p>How many chairs are there?</p>\r\n', NULL, 'There are forty chairs', 'There is twenty chairs', 'There is one blackboard', 'There are two photographs', 'A', '2020-08-26 11:08:30'),
(63, 3, 1, 'Class Introduction', 10, 2, '<p>My Classroom<br />\r\nMy classroom is very large. There are twenty tables and forty chairs for the students, but only 39 of them are occupied. There is a desk and chair for the teacher in the front and a cupboard to store the cleaning equipment at the back of the room. The tables, desk, chairs, and cupboard are wooden.<br />\r\n<br />\r\nBeside the teacher&rsquo;s desk, there are a whiteboard and blackboard. The photographs of the president and vice president of Indonesia are above the boards. The shape of the boards and the photo frames are rectangular. A garuda is put between the two photographs. At the back of the room, a round wall clock is hanging on the wall. My classroom is clean and tidy. Every morning and afternoon, the students on duty clean the room and arrange the tables and chairs. Cleaning the room by ourselves is a good practice for us to be diligent and responsible beings.</p>\r\n\r\n<p>Where is the photographs?</p>\r\n', NULL, 'It’s hanging on the wall', 'It’s in the cupboard', 'It’s above the boards', 'It’s on the table', 'C', '2020-08-26 11:10:03'),
(64, 3, 1, 'Class Introduction', 11, 2, '<p>My Classroom<br />\r\nMy classroom is very large. There are twenty tables and forty chairs for the students, but only 39 of them are occupied. There is a desk and chair for the teacher in the front and a cupboard to store the cleaning equipment at the back of the room. The tables, desk, chairs, and cupboard are wooden.<br />\r\n<br />\r\nBeside the teacher&rsquo;s desk, there are a whiteboard and blackboard. The photographs of the president and vice president of Indonesia are above the boards. The shape of the boards and the photo frames are rectangular. A garuda is put between the two photographs. At the back of the room, a round wall clock is hanging on the wall. My classroom is clean and tidy. Every morning and afternoon, the students on duty clean the room and arrange the tables and chairs. Cleaning the room by ourselves is a good practice for us to be diligent and responsible beings.</p>\r\n\r\n<p>Where is the photographs?</p>\r\n', NULL, 'It’s hanging on the wall', 'It’s in the cupboard', 'It’s above the boards', 'It’s on the table', 'C', '2020-08-26 11:10:03'),
(65, 3, 1, 'Class Introduction', 12, 2, '<p>My Classroom<br />\r\nMy classroom is very large. There are twenty tables and forty chairs for the students, but only 39 of them are occupied. There is a desk and chair for the teacher in the front and a cupboard to store the cleaning equipment at the back of the room. The tables, desk, chairs, and cupboard are wooden.<br />\r\n<br />\r\nBeside the teacher&rsquo;s desk, there are a whiteboard and blackboard. The photographs of the president and vice president of Indonesia are above the boards. The shape of the boards and the photo frames are rectangular. A garuda is put between the two photographs. At the back of the room, a round wall clock is hanging on the wall. My classroom is clean and tidy. Every morning and afternoon, the students on duty clean the room and arrange the tables and chairs. Cleaning the room by ourselves is a good practice for us to be diligent and responsible beings.</p>\r\n\r\n<p>Where is the photographs?</p>\r\n', NULL, 'It’s hanging on the wall', 'It’s in the cupboard', 'It’s above the boards', 'It’s on the table', 'C', '2020-08-26 11:10:03'),
(66, 3, 1, 'Class Introduction', 10, 2, '<p>My Classroom<br />\r\nMy classroom is very large. There are twenty tables and forty chairs for the students, but only 39 of them are occupied. There is a desk and chair for the teacher in the front and a cupboard to store the cleaning equipment at the back of the room. The tables, desk, chairs, and cupboard are wooden.<br />\r\n<br />\r\nBeside the teacher&rsquo;s desk, there are a whiteboard and blackboard. The photographs of the president and vice president of Indonesia are above the boards. The shape of the boards and the photo frames are rectangular. A garuda is put between the two photographs. At the back of the room, a round wall clock is hanging on the wall. My classroom is clean and tidy. Every morning and afternoon, the students on duty clean the room and arrange the tables and chairs. Cleaning the room by ourselves is a good practice for us to be diligent and responsible beings.</p>\r\n\r\n<p>What is the shape of the clock?</p>\r\n', NULL, 'It is around', 'It’s rectangular', 'It’s oval', 'It’s triangle', 'A', '2020-08-26 11:11:55'),
(67, 3, 1, 'Class Introduction', 11, 2, '<p>My Classroom<br />\r\nMy classroom is very large. There are twenty tables and forty chairs for the students, but only 39 of them are occupied. There is a desk and chair for the teacher in the front and a cupboard to store the cleaning equipment at the back of the room. The tables, desk, chairs, and cupboard are wooden.<br />\r\n<br />\r\nBeside the teacher&rsquo;s desk, there are a whiteboard and blackboard. The photographs of the president and vice president of Indonesia are above the boards. The shape of the boards and the photo frames are rectangular. A garuda is put between the two photographs. At the back of the room, a round wall clock is hanging on the wall. My classroom is clean and tidy. Every morning and afternoon, the students on duty clean the room and arrange the tables and chairs. Cleaning the room by ourselves is a good practice for us to be diligent and responsible beings.</p>\r\n\r\n<p>What is the shape of the clock?</p>\r\n', NULL, 'It is around', 'It’s rectangular', 'It’s oval', 'It’s triangle', 'A', '2020-08-26 11:11:55'),
(68, 3, 1, 'Class Introduction', 12, 2, '<p>My Classroom<br />\r\nMy classroom is very large. There are twenty tables and forty chairs for the students, but only 39 of them are occupied. There is a desk and chair for the teacher in the front and a cupboard to store the cleaning equipment at the back of the room. The tables, desk, chairs, and cupboard are wooden.<br />\r\n<br />\r\nBeside the teacher&rsquo;s desk, there are a whiteboard and blackboard. The photographs of the president and vice president of Indonesia are above the boards. The shape of the boards and the photo frames are rectangular. A garuda is put between the two photographs. At the back of the room, a round wall clock is hanging on the wall. My classroom is clean and tidy. Every morning and afternoon, the students on duty clean the room and arrange the tables and chairs. Cleaning the room by ourselves is a good practice for us to be diligent and responsible beings.</p>\r\n\r\n<p>What is the shape of the clock?</p>\r\n', NULL, 'It is around', 'It’s rectangular', 'It’s oval', 'It’s triangle', 'A', '2020-08-26 11:11:55'),
(69, 3, 1, 'Class Introduction', 10, 2, '<p>My Classroom<br />\r\nMy classroom is very large. There are twenty tables and forty chairs for the students, but only 39 of them are occupied. There is a desk and chair for the teacher in the front and a cupboard to store the cleaning equipment at the back of the room. The tables, desk, chairs, and cupboard are wooden.<br />\r\n<br />\r\nBeside the teacher&rsquo;s desk, there are a whiteboard and blackboard. The photographs of the president and vice president of Indonesia are above the boards. The shape of the boards and the photo frames are rectangular. A garuda is put between the two photographs. At the back of the room, a round wall clock is hanging on the wall. My classroom is clean and tidy. Every morning and afternoon, the students on duty clean the room and arrange the tables and chairs. Cleaning the room by ourselves is a good practice for us to be diligent and responsible beings.</p>\r\n\r\n<p>&ldquo;to be diligent and responsible beings.&rdquo; (last paragraph) What does the underlined word mean?</p>\r\n', NULL, 'Making students more hard working.', 'To be student make to more relaxed', 'Making somebody feel relaxed.', 'Not knowing what to do.', 'A', '2020-08-26 11:13:26'),
(70, 3, 1, 'Class Introduction', 11, 2, '<p>My Classroom<br />\r\nMy classroom is very large. There are twenty tables and forty chairs for the students, but only 39 of them are occupied. There is a desk and chair for the teacher in the front and a cupboard to store the cleaning equipment at the back of the room. The tables, desk, chairs, and cupboard are wooden.<br />\r\n<br />\r\nBeside the teacher&rsquo;s desk, there are a whiteboard and blackboard. The photographs of the president and vice president of Indonesia are above the boards. The shape of the boards and the photo frames are rectangular. A garuda is put between the two photographs. At the back of the room, a round wall clock is hanging on the wall. My classroom is clean and tidy. Every morning and afternoon, the students on duty clean the room and arrange the tables and chairs. Cleaning the room by ourselves is a good practice for us to be diligent and responsible beings.</p>\r\n\r\n<p>&ldquo;to be diligent and responsible beings.&rdquo; (last paragraph) What does the underlined word mean?</p>\r\n', NULL, 'Making students more hard working.', 'To be student make to more relaxed', 'Making somebody feel relaxed.', 'Not knowing what to do.', 'A', '2020-08-26 11:13:26'),
(71, 3, 1, 'Class Introduction', 12, 2, '<p>My Classroom<br />\r\nMy classroom is very large. There are twenty tables and forty chairs for the students, but only 39 of them are occupied. There is a desk and chair for the teacher in the front and a cupboard to store the cleaning equipment at the back of the room. The tables, desk, chairs, and cupboard are wooden.<br />\r\n<br />\r\nBeside the teacher&rsquo;s desk, there are a whiteboard and blackboard. The photographs of the president and vice president of Indonesia are above the boards. The shape of the boards and the photo frames are rectangular. A garuda is put between the two photographs. At the back of the room, a round wall clock is hanging on the wall. My classroom is clean and tidy. Every morning and afternoon, the students on duty clean the room and arrange the tables and chairs. Cleaning the room by ourselves is a good practice for us to be diligent and responsible beings.</p>\r\n\r\n<p>&ldquo;to be diligent and responsible beings.&rdquo; (last paragraph) What does the underlined word mean?</p>\r\n', NULL, 'Making students more hard working.', 'To be student make to more relaxed', 'Making somebody feel relaxed.', 'Not knowing what to do.', 'A', '2020-08-26 11:13:26'),
(72, 3, 2, 'Class Stories', 10, 2, '<p>The students of VII A are in the classroom. It is the second period. They are sitting quietly at their desks. The teacher is in front of the class. He is writing some new words on the board. The teacher asks the students to write down the new words and find the meaning in their dictionaries. The students have to translate it. After that the students answer the questions and write the answers on their exercise books. They do it seriously.</p>\r\n\r\n<p>What are the students studying? They are studying &hellip;.</p>\r\n', NULL, 'Mathematics', 'Biology', 'History', 'Englsih', 'D', '2020-08-26 15:04:23'),
(73, 3, 2, 'Class Stories', 11, 2, '<p>The students of VII A are in the classroom. It is the second period. They are sitting quietly at their desks. The teacher is in front of the class. He is writing some new words on the board. The teacher asks the students to write down the new words and find the meaning in their dictionaries. The students have to translate it. After that the students answer the questions and write the answers on their exercise books. They do it seriously.</p>\r\n\r\n<p>What are the students studying? They are studying &hellip;.</p>\r\n', NULL, 'Mathematics', 'Biology', 'History', 'Englsih', 'D', '2020-08-26 15:04:23'),
(74, 3, 2, 'Class Stories', 12, 2, '<p>The students of VII A are in the classroom. It is the second period. They are sitting quietly at their desks. The teacher is in front of the class. He is writing some new words on the board. The teacher asks the students to write down the new words and find the meaning in their dictionaries. The students have to translate it. After that the students answer the questions and write the answers on their exercise books. They do it seriously.</p>\r\n\r\n<p>What are the students studying? They are studying &hellip;.</p>\r\n', NULL, 'Mathematics', 'Biology', 'History', 'Englsih', 'D', '2020-08-26 15:04:23'),
(75, 3, 2, 'Class Stories', 10, 2, '<p>The students of VII A are in the classroom. It is the second period. They are sitting quietly at their desks. The teacher is in front of the class. He is writing some new words on the board. The teacher asks the students to write down the new words and find the meaning in their dictionaries. The students have to translate it. After that the students answer the questions and write the answers on their exercise books. They do it seriously.</p>\r\n\r\n<p>Where do the students write the answers?</p>\r\n', NULL, 'On the paper', 'On their exercise books', 'On their notebooks.', 'On the board', 'B', '2020-08-26 15:05:34'),
(76, 3, 2, 'Class Stories', 11, 2, '<p>The students of VII A are in the classroom. It is the second period. They are sitting quietly at their desks. The teacher is in front of the class. He is writing some new words on the board. The teacher asks the students to write down the new words and find the meaning in their dictionaries. The students have to translate it. After that the students answer the questions and write the answers on their exercise books. They do it seriously.</p>\r\n\r\n<p>Where do the students write the answers?</p>\r\n', NULL, 'On the paper', 'On their exercise books', 'On their notebooks.', 'On the board', 'B', '2020-08-26 15:05:34'),
(77, 3, 2, 'Class Stories', 12, 2, '<p>The students of VII A are in the classroom. It is the second period. They are sitting quietly at their desks. The teacher is in front of the class. He is writing some new words on the board. The teacher asks the students to write down the new words and find the meaning in their dictionaries. The students have to translate it. After that the students answer the questions and write the answers on their exercise books. They do it seriously.</p>\r\n\r\n<p>Where do the students write the answers?</p>\r\n', NULL, 'On the paper', 'On their exercise books', 'On their notebooks.', 'On the board', 'B', '2020-08-26 15:05:34'),
(78, 3, 2, 'Class Stories', 10, 2, '<p>The students of VII A are in the classroom. It is the second period. They are sitting quietly at their desks. The teacher is in front of the class. He is writing some new words on the board. The teacher asks the students to write down the new words and find the meaning in their dictionaries. The students have to translate it. After that the students answer the questions and write the answers on their exercise books. They do it seriously.</p>\r\n\r\n<p>What is the main idea of the paragraph?</p>\r\n', NULL, 'It is the second period', 'They do it seriously.', 'They are writing some new words on the board.', 'The students of VII A are in the classroom.', 'D', '2020-08-26 15:06:51'),
(79, 3, 2, 'Class Stories', 11, 2, '<p>The students of VII A are in the classroom. It is the second period. They are sitting quietly at their desks. The teacher is in front of the class. He is writing some new words on the board. The teacher asks the students to write down the new words and find the meaning in their dictionaries. The students have to translate it. After that the students answer the questions and write the answers on their exercise books. They do it seriously.</p>\r\n\r\n<p>What is the main idea of the paragraph?</p>\r\n', NULL, 'It is the second period', 'They do it seriously.', 'They are writing some new words on the board.', 'The students of VII A are in the classroom.', 'D', '2020-08-26 15:06:51'),
(80, 3, 2, 'Class Stories', 12, 2, '<p>The students of VII A are in the classroom. It is the second period. They are sitting quietly at their desks. The teacher is in front of the class. He is writing some new words on the board. The teacher asks the students to write down the new words and find the meaning in their dictionaries. The students have to translate it. After that the students answer the questions and write the answers on their exercise books. They do it seriously.</p>\r\n\r\n<p>What is the main idea of the paragraph?</p>\r\n', NULL, 'It is the second period', 'They do it seriously.', 'They are writing some new words on the board.', 'The students of VII A are in the classroom.', 'D', '2020-08-26 15:06:51'),
(81, 3, 2, 'Situation', 10, 2, '<p>You can use the umbrella at the time&hellip;..</p>\r\n', NULL, 'cloud', 'rain', 'night', 'afternoon', 'B', '2020-08-26 15:07:57'),
(82, 3, 2, 'Situation', 11, 2, '<p>You can use the umbrella at the time&hellip;..</p>\r\n', NULL, 'cloud', 'rain', 'night', 'afternoon', 'B', '2020-08-26 15:07:57'),
(83, 3, 2, 'Situation', 12, 2, '<p>You can use the umbrella at the time&hellip;..</p>\r\n', NULL, 'cloud', 'rain', 'night', 'afternoon', 'B', '2020-08-26 15:07:57'),
(84, 3, 2, 'Personality', 10, 2, '<p>My classmate always smiles and has many friends. She is . . . . .</p>\r\n', NULL, 'Clumsy', 'Healthy', 'Friendly ', 'Lazy', 'C', '2020-08-26 15:10:31'),
(85, 3, 2, 'Personality', 11, 2, '<p>My classmate always smiles and has many friends. She is . . . . .</p>\r\n', NULL, 'Clumsy', 'Healthy', 'Friendly ', 'Lazy', 'C', '2020-08-26 15:10:31'),
(86, 3, 2, 'Personality', 12, 2, '<p>My classmate always smiles and has many friends. She is . . . . .</p>\r\n', NULL, 'Clumsy', 'Healthy', 'Friendly ', 'Lazy', 'C', '2020-08-26 15:10:31'),
(87, 3, 3, 'Transportation', 10, 2, '<p>A place where aircraft regularly take off and land, with buildings for passengers to wait in.</p>\r\n\r\n<p>&nbsp;</p>\r\n', NULL, 'Gas Station', 'Train Station', 'Airport', 'Parking Area', 'C', '2020-08-26 15:18:04'),
(88, 3, 3, 'Transportation', 11, 2, '<p>A place where aircraft regularly take off and land, with buildings for passengers to wait in.</p>\r\n\r\n<p>&nbsp;</p>\r\n', NULL, 'Gas Station', 'Train Station', 'Airport', 'Parking Area', 'C', '2020-08-26 15:18:04');
INSERT INTO `soal` (`id_soal`, `mapel`, `id_kategori`, `nama_soal`, `kelas`, `guru`, `soal`, `media`, `opsi_a`, `opsi_b`, `opsi_c`, `opsi_d`, `jawaban`, `created_at`) VALUES
(89, 3, 3, 'Transportation', 12, 2, '<p>A place where aircraft regularly take off and land, with buildings for passengers to wait in.</p>\r\n\r\n<p>&nbsp;</p>\r\n', NULL, 'Gas Station', 'Train Station', 'Airport', 'Parking Area', 'C', '2020-08-26 15:18:04'),
(90, 3, 3, 'Complete The Sentence', 10, 2, '<p>A : What do we use &hellip;&hellip; for?<br />\r\nB : We use it for drinking.</p>\r\n', NULL, 'a table', 'a glass', 'a chair', 'a wardrobe', 'B', '2020-08-26 15:19:02'),
(91, 3, 3, 'Complete The Sentence', 11, 2, '<p>A : What do we use &hellip;&hellip; for?<br />\r\nB : We use it for drinking.</p>\r\n', NULL, 'a table', 'a glass', 'a chair', 'a wardrobe', 'B', '2020-08-26 15:19:02'),
(92, 3, 3, 'Complete The Sentence', 12, 2, '<p>A : What do we use &hellip;&hellip; for?<br />\r\nB : We use it for drinking.</p>\r\n', NULL, 'a table', 'a glass', 'a chair', 'a wardrobe', 'B', '2020-08-26 15:19:02'),
(93, 3, 3, 'Utensil', 10, 2, '<p>We use this thing to cook our meals. It is a&hellip;.</p>\r\n', NULL, 'Basin', 'Frying pan', 'Knife', 'Rack', 'B', '2020-08-26 15:22:10'),
(94, 3, 3, 'Utensil', 11, 2, '<p>We use this thing to cook our meals. It is a&hellip;.</p>\r\n', NULL, 'Basin', 'Frying pan', 'Knife', 'Rack', 'B', '2020-08-26 15:22:10'),
(95, 3, 3, 'Utensil', 12, 2, '<p>We use this thing to cook our meals. It is a&hellip;.</p>\r\n', NULL, 'Basin', 'Frying pan', 'Knife', 'Rack', 'B', '2020-08-26 15:22:10'),
(96, 3, 3, 'Complete The Sentence', 10, 2, '<p>This is a.... , the color is pretty, it is flies.<br />\r\nWhat is that?</p>\r\n', NULL, 'It’s ant', 'It’s butterfly', 'It’s tiger', 'It’s snake', 'B', '2020-08-26 15:23:29'),
(97, 3, 3, 'Complete The Sentence', 11, 2, '<p>This is a.... , the color is pretty, it is flies.<br />\r\nWhat is that?</p>\r\n', NULL, 'It’s ant', 'It’s butterfly', 'It’s tiger', 'It’s snake', 'B', '2020-08-26 15:23:29'),
(98, 3, 3, 'Complete The Sentence', 12, 2, '<p>This is a.... , the color is pretty, it is flies.<br />\r\nWhat is that?</p>\r\n', NULL, 'It’s ant', 'It’s butterfly', 'It’s tiger', 'It’s snake', 'B', '2020-08-26 15:23:29'),
(99, 3, 3, 'Function of', 10, 2, '<p>A : What is the function of ?<br />\r\nB : The function of chair is for sitting down.</p>\r\n', NULL, 'A laptop', 'a book', 'a star', 'a chair', 'D', '2020-08-26 15:24:43'),
(100, 3, 3, 'Function of', 11, 2, '<p>A : What is the function of ?<br />\r\nB : The function of chair is for sitting down.</p>\r\n', NULL, 'A laptop', 'a book', 'a star', 'a chair', 'D', '2020-08-26 15:24:43'),
(101, 3, 3, 'Function of', 12, 2, '<p>A : What is the function of ?<br />\r\nB : The function of chair is for sitting down.</p>\r\n', NULL, 'A laptop', 'a book', 'a star', 'a chair', 'D', '2020-08-26 15:24:43');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ujian`
--

CREATE TABLE `ujian` (
  `id_ujian` int(11) NOT NULL,
  `nama_ujian` varchar(100) NOT NULL,
  `id_kelas` int(11) DEFAULT NULL,
  `id_mapel` int(11) DEFAULT NULL,
  `id_guru` int(11) DEFAULT NULL,
  `waktu` int(11) DEFAULT NULL,
  `tanggal_mulai` datetime DEFAULT NULL,
  `tanggal_selesai` datetime NOT NULL,
  `jumlah_soal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `ujian`
--

INSERT INTO `ujian` (`id_ujian`, `nama_ujian`, `id_kelas`, `id_mapel`, `id_guru`, `waktu`, `tanggal_mulai`, `tanggal_selesai`, `jumlah_soal`) VALUES
(1, 'Ulangan-2', 10, 2, 1, 20, '2020-08-22 22:34:00', '2020-08-22 22:54:00', 5),
(2, 'Ulangan-1', 10, 2, 5, 15, '2020-08-27 09:37:00', '2020-08-27 09:52:00', 5);

--
-- Trigger `ujian`
--
DELIMITER $$
CREATE TRIGGER `hapus_ujian` BEFORE DELETE ON `ujian` FOR EACH ROW BEGIN
	DELETE FROM ikut_ujian WHERE ikut_ujian.id_ujian=OLD.id_ujian;
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indeks untuk tabel `guru`
--
ALTER TABLE `guru`
  ADD PRIMARY KEY (`id_guru`),
  ADD KEY `mapel` (`mapel`);

--
-- Indeks untuk tabel `ikut_ujian`
--
ALTER TABLE `ikut_ujian`
  ADD PRIMARY KEY (`id_tes`),
  ADD KEY `id_ujian` (`id_ujian`),
  ADD KEY `siswa` (`id_siswa`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id_kelas`);

--
-- Indeks untuk tabel `mapel`
--
ALTER TABLE `mapel`
  ADD PRIMARY KEY (`id_mapel`);

--
-- Indeks untuk tabel `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`id_siswa`),
  ADD KEY `kelas` (`kelas`);

--
-- Indeks untuk tabel `soal`
--
ALTER TABLE `soal`
  ADD PRIMARY KEY (`id_soal`),
  ADD KEY `mapel` (`mapel`),
  ADD KEY `kelas` (`kelas`),
  ADD KEY `guru` (`guru`);

--
-- Indeks untuk tabel `ujian`
--
ALTER TABLE `ujian`
  ADD PRIMARY KEY (`id_ujian`),
  ADD KEY `nama_ujian` (`nama_ujian`),
  ADD KEY `FK1_kelas` (`id_kelas`),
  ADD KEY `id_mapel` (`id_mapel`),
  ADD KEY `id_guru` (`id_guru`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `guru`
--
ALTER TABLE `guru`
  MODIFY `id_guru` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `ikut_ujian`
--
ALTER TABLE `ikut_ujian`
  MODIFY `id_tes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id_kelas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `mapel`
--
ALTER TABLE `mapel`
  MODIFY `id_mapel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `siswa`
--
ALTER TABLE `siswa`
  MODIFY `id_siswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT untuk tabel `soal`
--
ALTER TABLE `soal`
  MODIFY `id_soal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT untuk tabel `ujian`
--
ALTER TABLE `ujian`
  MODIFY `id_ujian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `guru`
--
ALTER TABLE `guru`
  ADD CONSTRAINT `guru_ibfk_1` FOREIGN KEY (`mapel`) REFERENCES `mapel` (`id_mapel`);

--
-- Ketidakleluasaan untuk tabel `ikut_ujian`
--
ALTER TABLE `ikut_ujian`
  ADD CONSTRAINT `FK1_ujian` FOREIGN KEY (`id_ujian`) REFERENCES `ujian` (`id_ujian`),
  ADD CONSTRAINT `FK2_siswa` FOREIGN KEY (`id_siswa`) REFERENCES `siswa` (`id_siswa`);

--
-- Ketidakleluasaan untuk tabel `siswa`
--
ALTER TABLE `siswa`
  ADD CONSTRAINT `siswa_ibfk_1` FOREIGN KEY (`kelas`) REFERENCES `kelas` (`id_kelas`);

--
-- Ketidakleluasaan untuk tabel `soal`
--
ALTER TABLE `soal`
  ADD CONSTRAINT `soal_guruFK3` FOREIGN KEY (`guru`) REFERENCES `guru` (`id_guru`),
  ADD CONSTRAINT `soal_kelasFK2` FOREIGN KEY (`kelas`) REFERENCES `kelas` (`id_kelas`),
  ADD CONSTRAINT `soal_mapelFK1` FOREIGN KEY (`mapel`) REFERENCES `mapel` (`id_mapel`);

--
-- Ketidakleluasaan untuk tabel `ujian`
--
ALTER TABLE `ujian`
  ADD CONSTRAINT `FK1_kelas` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id_kelas`),
  ADD CONSTRAINT `FK2_mapel` FOREIGN KEY (`id_mapel`) REFERENCES `mapel` (`id_mapel`),
  ADD CONSTRAINT `FK3_guru` FOREIGN KEY (`id_guru`) REFERENCES `guru` (`id_guru`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
