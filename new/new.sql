-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.22-MariaDB - mariadb.org binary distribution
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela entity.containing: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `containing` DISABLE KEYS */;
INSERT INTO `containing` (`id`, `id_entity_container`, `id_entity_content`) VALUES
	(1, 3, 4),
	(2, 4, 1),
	(3, 3, 5),
	(4, 5, 1);
/*!40000 ALTER TABLE `containing` ENABLE KEYS */;

-- Copiando estrutura para tabela entity.entity
CREATE TABLE IF NOT EXISTS `entity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela entity.entity: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `entity` DISABLE KEYS */;
INSERT INTO `entity` (`id`, `name`) VALUES
	(1, 'color'),
	(2, 'red'),
	(3, 'person'),
	(4, 'hair'),
	(5, 'skin');
/*!40000 ALTER TABLE `entity` ENABLE KEYS */;

-- Copiando estrutura para tabela entity.generalization
CREATE TABLE IF NOT EXISTS `generalization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_entity_parent` int(11) DEFAULT NULL,
  `id_entity_child` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_generalization_entity` (`id_entity_parent`),
  KEY `FK_generalization_entity_2` (`id_entity_child`),
  CONSTRAINT `FK_generalization_entity` FOREIGN KEY (`id_entity_parent`) REFERENCES `entity` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_generalization_entity_2` FOREIGN KEY (`id_entity_child`) REFERENCES `entity` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela entity.generalization: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `generalization` DISABLE KEYS */;
INSERT INTO `generalization` (`id`, `id_entity_parent`, `id_entity_child`) VALUES
	(1, 1, 2);
/*!40000 ALTER TABLE `generalization` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
