/*
SQLyog Ultimate v8.61 
MySQL - 5.5.5-10.1.38-MariaDB : Database - penjualan
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `barang` */

DROP TABLE IF EXISTS `barang`;

CREATE TABLE `barang` (
  `kd_brg` char(6) NOT NULL,
  `nm_brg` varchar(30) DEFAULT NULL,
  `satuan` varchar(10) DEFAULT NULL,
  `harga` double DEFAULT NULL,
  `harga_beli` double DEFAULT NULL,
  `stok` int(4) DEFAULT NULL,
  `stok_min` int(4) DEFAULT NULL,
  PRIMARY KEY (`kd_brg`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `barang` */

insert  into `barang`(`kd_brg`,`nm_brg`,`satuan`,`harga`,`harga_beli`,`stok`,`stok_min`) values ('B-0001','buku tulis putih item','Buah',1000,900,193,5),('B-0002','Gethuk magelang enak tenan','Box',1500,2000,211,10),('B-0003','Pensil Lancip tenan','Buah',3000,2500,93,5),('B-0004','Gethuk Lindri','Buah',5000,4000,100,5),('B-0005','Mangga','Buah',10000,9000,0,10),('B-0006','Wingko','Buah',10000,9000,100,10),('B-0007','Mangga','Buah',10000,9000,100,10),('B-0008','HP','Buah',2000000,1800000,10,2),('B-0009','Jam Tangan','Buah',250000,230000,10,2),('B-9999','Bumbu','Box',11,11,11,11),('FD0001','Flash Disk','Buah',100000,900000,1,1),('xxxx','xxxx 3','Buah',1000,900,5,1);

/*Table structure for table `berita` */

DROP TABLE IF EXISTS `berita`;

CREATE TABLE `berita` (
  `id_berita` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `id_kategori` int(3) unsigned NOT NULL DEFAULT '0',
  `judul` varchar(100) NOT NULL DEFAULT '',
  `headline` text NOT NULL,
  `isi` text NOT NULL,
  `pengirim` varchar(15) NOT NULL DEFAULT '',
  `tanggal` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id_berita`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `berita` */

insert  into `berita`(`id_berita`,`id_kategori`,`judul`,`headline`,`isi`,`pengirim`,`tanggal`) values (1,1,'Arsenal 1  vs Everton 1','Arsenal 1  vs Everton 1','Arsenal 1  vs Everton 1, yoooooooooooooooo','admin','2013-12-09 15:38:22'),(2,3,'IT Joss','IT trend 2014','IT trend 2014IT trend 2014IT trend 2014IT trend 2014 IT trend 2014IT trend 2014IT trend 2014IT trend 2014IT trend 2014 IT trend 2014IT trend 2014IT trend 2014 yoyoyoyoyo yoyoyyoo','paijo','2013-12-09 16:16:06'),(3,2,'ZOO','Sidang MKD kayak kebun binatang','Sidang MKD kayak kebun binatang, hiii gilani\r\n','paijo','2015-12-08 11:00:50');

/*Table structure for table `bukutamu` */

DROP TABLE IF EXISTS `bukutamu`;

CREATE TABLE `bukutamu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(15) NOT NULL,
  `situs` varchar(50) NOT NULL,
  `email` varchar(30) NOT NULL,
  `pesan` text NOT NULL,
  `waktu` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `id_2` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `bukutamu` */

insert  into `bukutamu`(`id`,`nama`,`situs`,`email`,`pesan`,`waktu`) values (2,'ajib','http://ajibsusanto.blogspot.com','ajibsusanto@gmail.com','josss gandosssss','2013-12-23 15:55:47'),(3,'AHMAD AULIA WIG','http://ok.com','aulia@gmail.com','ok brooo','2013-12-23 17:07:56'),(4,'Ajib Susanto','http://ajibsusanto.net','ajibsusanto@gmail.com','mohon info lebih lanjut bro','2018-12-17 07:32:32');

/*Table structure for table `kategori` */

DROP TABLE IF EXISTS `kategori`;

CREATE TABLE `kategori` (
  `id_kategori` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `nm_kategori` varchar(30) NOT NULL DEFAULT '',
  `deskripsi` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_kategori`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `kategori` */

insert  into `kategori`(`id_kategori`,`nm_kategori`,`deskripsi`) values (1,'Olah Raga','Olah Raga'),(2,'Politik','Politik'),(3,'IT','IT');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(10) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `hak_akses` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id_idx` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`user_id`,`name`,`password`,`hak_akses`) values (1,'admin','a71b','827ccb0eea8a706c4c34a16891f84e7b',0),(2,'ghiyatsi','ghiyatsi','827ccb0eea8a706c4c34a16891f84e7b',1),(6,'me','me','ab86a1e1ef70dff97959067b723c5c24',2),(7,'admin1','Me','827ccb0eea8a706c4c34a16891f84e7b',0),(8,'paijo','paijo','44529fdc8afb86d58c6c02cd00c02e43',0),(9,'panjul','panjul','827ccb0eea8a706c4c34a16891f84e7b',2),(10,'najwa','najwa','827ccb0eea8a706c4c34a16891f84e7b',0),(11,'aulia','aulia','827ccb0eea8a706c4c34a16891f84e7b',2),(12,'anis','anis','827ccb0eea8a706c4c34a16891f84e7b',0),(13,'punjul','punjul','2f029d48f3ed3f0d5f3c9a4853c192cf',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
