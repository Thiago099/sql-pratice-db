-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.21-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para entity
DROP DATABASE IF EXISTS `entity`;
CREATE DATABASE IF NOT EXISTS `entity` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `entity`;

-- Copiando estrutura para tabela entity.containing
CREATE TABLE IF NOT EXISTS `containing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_entity_container` int(11) DEFAULT NULL,
  `id_entity_content` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_parameter_entity` (`id_entity_container`),
  KEY `FK_parameter_entity_2` (`id_entity_content`) USING BTREE,
  CONSTRAINT `FK_parameter_entity` FOREIGN KEY (`id_entity_container`) REFERENCES `entity` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_parameter_entity_2` FOREIGN KEY (`id_entity_content`) REFERENCES `entity` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela entity.containing: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `containing` DISABLE KEYS */;
INSERT INTO `containing` (`id`, `id_entity_container`, `id_entity_content`) VALUES
	(1, 3, 4);
INSERT INTO `containing` (`id`, `id_entity_container`, `id_entity_content`) VALUES
	(3, 3, 5);
INSERT INTO `containing` (`id`, `id_entity_container`, `id_entity_content`) VALUES
	(5, 4, 1);
INSERT INTO `containing` (`id`, `id_entity_container`, `id_entity_content`) VALUES
	(6, 5, 1);
INSERT INTO `containing` (`id`, `id_entity_container`, `id_entity_content`) VALUES
	(12, 4, 22);
INSERT INTO `containing` (`id`, `id_entity_container`, `id_entity_content`) VALUES
	(13, 3, 25);
INSERT INTO `containing` (`id`, `id_entity_container`, `id_entity_content`) VALUES
	(14, 25, 1);
INSERT INTO `containing` (`id`, `id_entity_container`, `id_entity_content`) VALUES
	(15, 3, 27);
INSERT INTO `containing` (`id`, `id_entity_container`, `id_entity_content`) VALUES
	(19, NULL, 31);
INSERT INTO `containing` (`id`, `id_entity_container`, `id_entity_content`) VALUES
	(24, 40, 41);
INSERT INTO `containing` (`id`, `id_entity_container`, `id_entity_content`) VALUES
	(25, 41, 38);
INSERT INTO `containing` (`id`, `id_entity_container`, `id_entity_content`) VALUES
	(26, 41, 42);
INSERT INTO `containing` (`id`, `id_entity_container`, `id_entity_content`) VALUES
	(27, 40, 45);
INSERT INTO `containing` (`id`, `id_entity_container`, `id_entity_content`) VALUES
	(28, 45, 39);
INSERT INTO `containing` (`id`, `id_entity_container`, `id_entity_content`) VALUES
	(29, 40, 46);
INSERT INTO `containing` (`id`, `id_entity_container`, `id_entity_content`) VALUES
	(30, 46, 38);
INSERT INTO `containing` (`id`, `id_entity_container`, `id_entity_content`) VALUES
	(31, 40, 28);
/*!40000 ALTER TABLE `containing` ENABLE KEYS */;

-- Copiando estrutura para tabela entity.entity
CREATE TABLE IF NOT EXISTS `entity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela entity.entity: ~16 rows (aproximadamente)
/*!40000 ALTER TABLE `entity` DISABLE KEYS */;
INSERT INTO `entity` (`id`, `name`) VALUES
	(1, 'color');
INSERT INTO `entity` (`id`, `name`) VALUES
	(3, 'person');
INSERT INTO `entity` (`id`, `name`) VALUES
	(4, 'hair');
INSERT INTO `entity` (`id`, `name`) VALUES
	(5, 'skin');
INSERT INTO `entity` (`id`, `name`) VALUES
	(12, 'red');
INSERT INTO `entity` (`id`, `name`) VALUES
	(14, 'green');
INSERT INTO `entity` (`id`, `name`) VALUES
	(15, 'blue');
INSERT INTO `entity` (`id`, `name`) VALUES
	(22, 'length');
INSERT INTO `entity` (`id`, `name`) VALUES
	(25, 'eye');
INSERT INTO `entity` (`id`, `name`) VALUES
	(27, 'sex');
INSERT INTO `entity` (`id`, `name`) VALUES
	(28, 'male');
INSERT INTO `entity` (`id`, `name`) VALUES
	(29, 'female');
INSERT INTO `entity` (`id`, `name`) VALUES
	(30, 'yellow');
INSERT INTO `entity` (`id`, `name`) VALUES
	(31, 'brown');
INSERT INTO `entity` (`id`, `name`) VALUES
	(38, 'black');
INSERT INTO `entity` (`id`, `name`) VALUES
	(39, 'white');
INSERT INTO `entity` (`id`, `name`) VALUES
	(40, 'thiago');
INSERT INTO `entity` (`id`, `name`) VALUES
	(41, 'black short hair');
INSERT INTO `entity` (`id`, `name`) VALUES
	(42, 'short');
INSERT INTO `entity` (`id`, `name`) VALUES
	(43, 'medium');
INSERT INTO `entity` (`id`, `name`) VALUES
	(44, 'long');
INSERT INTO `entity` (`id`, `name`) VALUES
	(45, 'white skin');
INSERT INTO `entity` (`id`, `name`) VALUES
	(46, 'black eye');
/*!40000 ALTER TABLE `entity` ENABLE KEYS */;

-- Copiando estrutura para tabela entity.generalization
CREATE TABLE IF NOT EXISTS `generalization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_entity_generic` int(11) DEFAULT NULL,
  `id_entity_specific` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_generalization_entity` (`id_entity_generic`) USING BTREE,
  KEY `FK_generalization_entity_2` (`id_entity_specific`) USING BTREE,
  CONSTRAINT `FK_generalization_entity` FOREIGN KEY (`id_entity_generic`) REFERENCES `entity` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_generalization_entity_2` FOREIGN KEY (`id_entity_specific`) REFERENCES `entity` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela entity.generalization: ~9 rows (aproximadamente)
/*!40000 ALTER TABLE `generalization` DISABLE KEYS */;
INSERT INTO `generalization` (`id`, `id_entity_generic`, `id_entity_specific`) VALUES
	(11, 1, 12);
INSERT INTO `generalization` (`id`, `id_entity_generic`, `id_entity_specific`) VALUES
	(13, 1, 14);
INSERT INTO `generalization` (`id`, `id_entity_generic`, `id_entity_specific`) VALUES
	(14, 1, 15);
INSERT INTO `generalization` (`id`, `id_entity_generic`, `id_entity_specific`) VALUES
	(18, 27, 28);
INSERT INTO `generalization` (`id`, `id_entity_generic`, `id_entity_specific`) VALUES
	(19, 27, 29);
INSERT INTO `generalization` (`id`, `id_entity_generic`, `id_entity_specific`) VALUES
	(20, 1, 30);
INSERT INTO `generalization` (`id`, `id_entity_generic`, `id_entity_specific`) VALUES
	(21, 1, 31);
INSERT INTO `generalization` (`id`, `id_entity_generic`, `id_entity_specific`) VALUES
	(28, 1, 38);
INSERT INTO `generalization` (`id`, `id_entity_generic`, `id_entity_specific`) VALUES
	(29, 1, 39);
INSERT INTO `generalization` (`id`, `id_entity_generic`, `id_entity_specific`) VALUES
	(30, 3, 40);
INSERT INTO `generalization` (`id`, `id_entity_generic`, `id_entity_specific`) VALUES
	(31, 4, 41);
INSERT INTO `generalization` (`id`, `id_entity_generic`, `id_entity_specific`) VALUES
	(32, 22, 42);
INSERT INTO `generalization` (`id`, `id_entity_generic`, `id_entity_specific`) VALUES
	(33, 22, 43);
INSERT INTO `generalization` (`id`, `id_entity_generic`, `id_entity_specific`) VALUES
	(34, 22, 44);
INSERT INTO `generalization` (`id`, `id_entity_generic`, `id_entity_specific`) VALUES
	(35, 5, 45);
INSERT INTO `generalization` (`id`, `id_entity_generic`, `id_entity_specific`) VALUES
	(36, 25, 46);
/*!40000 ALTER TABLE `generalization` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
