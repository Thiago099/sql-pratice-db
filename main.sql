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


-- Copiando estrutura do banco de dados para main
DROP DATABASE IF EXISTS `main`;
CREATE DATABASE IF NOT EXISTS `main` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `main`;

-- Copiando estrutura para tabela main.action
CREATE TABLE IF NOT EXISTS `action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_verb` int(11) DEFAULT 0,
  `id_entity` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `FK_action_verb` (`id_verb`),
  KEY `FK_action_entity` (`id_entity`),
  CONSTRAINT `FK_action_entity` FOREIGN KEY (`id_entity`) REFERENCES `entity` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_action_verb` FOREIGN KEY (`id_verb`) REFERENCES `verb` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela main.action: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `action` DISABLE KEYS */;
INSERT INTO `action` (`id`, `id_verb`, `id_entity`) VALUES
	(47, 13, 1);
INSERT INTO `action` (`id`, `id_verb`, `id_entity`) VALUES
	(48, 13, 10);
INSERT INTO `action` (`id`, `id_verb`, `id_entity`) VALUES
	(49, 13, 2);
INSERT INTO `action` (`id`, `id_verb`, `id_entity`) VALUES
	(50, 3, 1);
INSERT INTO `action` (`id`, `id_verb`, `id_entity`) VALUES
	(51, 3, 2);
INSERT INTO `action` (`id`, `id_verb`, `id_entity`) VALUES
	(56, 3, 10);
INSERT INTO `action` (`id`, `id_verb`, `id_entity`) VALUES
	(57, 2, 2);
INSERT INTO `action` (`id`, `id_verb`, `id_entity`) VALUES
	(58, 3, 1);
/*!40000 ALTER TABLE `action` ENABLE KEYS */;

-- Copiando estrutura para tabela main.action_parameter
CREATE TABLE IF NOT EXISTS `action_parameter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_action` int(11) DEFAULT NULL,
  `id_entity` int(11) DEFAULT NULL,
  `id_verb_parameter` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_action_parameter_action` (`id_action`),
  KEY `FK_action_parameter_entity` (`id_entity`),
  KEY `FK_action_parameter_verb_parameters` (`id_verb_parameter`),
  CONSTRAINT `FK_action_parameter_action` FOREIGN KEY (`id_action`) REFERENCES `action` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_action_parameter_entity` FOREIGN KEY (`id_entity`) REFERENCES `entity` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_action_parameter_verb_parameters` FOREIGN KEY (`id_verb_parameter`) REFERENCES `verb_parameter` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela main.action_parameter: ~12 rows (aproximadamente)
/*!40000 ALTER TABLE `action_parameter` DISABLE KEYS */;
INSERT INTO `action_parameter` (`id`, `id_action`, `id_entity`, `id_verb_parameter`) VALUES
	(57, 47, 20, 11);
INSERT INTO `action_parameter` (`id`, `id_action`, `id_entity`, `id_verb_parameter`) VALUES
	(58, 48, 17, 11);
INSERT INTO `action_parameter` (`id`, `id_action`, `id_entity`, `id_verb_parameter`) VALUES
	(59, 49, 10, 11);
INSERT INTO `action_parameter` (`id`, `id_action`, `id_entity`, `id_verb_parameter`) VALUES
	(60, 50, 19, 6);
INSERT INTO `action_parameter` (`id`, `id_action`, `id_entity`, `id_verb_parameter`) VALUES
	(61, 50, 20, 5);
INSERT INTO `action_parameter` (`id`, `id_action`, `id_entity`, `id_verb_parameter`) VALUES
	(62, 51, 10, 5);
INSERT INTO `action_parameter` (`id`, `id_action`, `id_entity`, `id_verb_parameter`) VALUES
	(63, 51, 1, 6);
INSERT INTO `action_parameter` (`id`, `id_action`, `id_entity`, `id_verb_parameter`) VALUES
	(70, 56, 19, 11);
INSERT INTO `action_parameter` (`id`, `id_action`, `id_entity`, `id_verb_parameter`) VALUES
	(71, 56, 19, 5);
INSERT INTO `action_parameter` (`id`, `id_action`, `id_entity`, `id_verb_parameter`) VALUES
	(72, 56, 17, 6);
INSERT INTO `action_parameter` (`id`, `id_action`, `id_entity`, `id_verb_parameter`) VALUES
	(74, 58, 19, 5);
INSERT INTO `action_parameter` (`id`, `id_action`, `id_entity`, `id_verb_parameter`) VALUES
	(75, 58, 21, 6);
/*!40000 ALTER TABLE `action_parameter` ENABLE KEYS */;

-- Copiando estrutura para tabela main.entity
CREATE TABLE IF NOT EXISTS `entity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT '0',
  `id_group` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_entity_group` (`id_group`),
  CONSTRAINT `FK_entity_group` FOREIGN KEY (`id_group`) REFERENCES `group` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela main.entity: ~12 rows (aproximadamente)
/*!40000 ALTER TABLE `entity` DISABLE KEYS */;
INSERT INTO `entity` (`id`, `name`, `id_group`) VALUES
	(1, 'glass', 2);
INSERT INTO `entity` (`id`, `name`, `id_group`) VALUES
	(2, 'milk', 2);
INSERT INTO `entity` (`id`, `name`, `id_group`) VALUES
	(7, 'food', 3);
INSERT INTO `entity` (`id`, `name`, `id_group`) VALUES
	(9, 'fluid', 1);
INSERT INTO `entity` (`id`, `name`, `id_group`) VALUES
	(10, 'jug', 2);
INSERT INTO `entity` (`id`, `name`, `id_group`) VALUES
	(15, 'solid', 1);
INSERT INTO `entity` (`id`, `name`, `id_group`) VALUES
	(16, 'object', 1);
INSERT INTO `entity` (`id`, `name`, `id_group`) VALUES
	(17, 'fridge', 2);
INSERT INTO `entity` (`id`, `name`, `id_group`) VALUES
	(18, 'table', 2);
INSERT INTO `entity` (`id`, `name`, `id_group`) VALUES
	(19, 'context', 3);
INSERT INTO `entity` (`id`, `name`, `id_group`) VALUES
	(20, 'drawer', 2);
INSERT INTO `entity` (`id`, `name`, `id_group`) VALUES
	(21, 'sink', 2);
/*!40000 ALTER TABLE `entity` ENABLE KEYS */;

-- Copiando estrutura para tabela main.generalization
CREATE TABLE IF NOT EXISTS `generalization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_parent` int(11) DEFAULT NULL,
  `id_child` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__entity` (`id_parent`) USING BTREE,
  KEY `FK__entity_2` (`id_child`) USING BTREE,
  CONSTRAINT `FK__entity` FOREIGN KEY (`id_parent`) REFERENCES `entity` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK__entity_2` FOREIGN KEY (`id_child`) REFERENCES `entity` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela main.generalization: ~11 rows (aproximadamente)
/*!40000 ALTER TABLE `generalization` DISABLE KEYS */;
INSERT INTO `generalization` (`id`, `id_parent`, `id_child`) VALUES
	(10, 7, 2);
INSERT INTO `generalization` (`id`, `id_parent`, `id_child`) VALUES
	(16, 16, 15);
INSERT INTO `generalization` (`id`, `id_parent`, `id_child`) VALUES
	(18, 16, 9);
INSERT INTO `generalization` (`id`, `id_parent`, `id_child`) VALUES
	(19, 15, 17);
INSERT INTO `generalization` (`id`, `id_parent`, `id_child`) VALUES
	(20, 15, 18);
INSERT INTO `generalization` (`id`, `id_parent`, `id_child`) VALUES
	(21, 15, 19);
INSERT INTO `generalization` (`id`, `id_parent`, `id_child`) VALUES
	(22, 15, 20);
INSERT INTO `generalization` (`id`, `id_parent`, `id_child`) VALUES
	(23, 15, 21);
INSERT INTO `generalization` (`id`, `id_parent`, `id_child`) VALUES
	(24, 15, 10);
INSERT INTO `generalization` (`id`, `id_parent`, `id_child`) VALUES
	(25, 15, 1);
INSERT INTO `generalization` (`id`, `id_parent`, `id_child`) VALUES
	(26, 9, 2);
/*!40000 ALTER TABLE `generalization` ENABLE KEYS */;

-- Copiando estrutura para tabela main.group
CREATE TABLE IF NOT EXISTS `group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela main.group: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `group` DISABLE KEYS */;
INSERT INTO `group` (`id`, `name`) VALUES
	(1, 'phisical');
INSERT INTO `group` (`id`, `name`) VALUES
	(2, 'instance');
INSERT INTO `group` (`id`, `name`) VALUES
	(3, 'basic');
/*!40000 ALTER TABLE `group` ENABLE KEYS */;

-- Copiando estrutura para tabela main.verb
CREATE TABLE IF NOT EXISTS `verb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT '0',
  `id_group` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_verb_group` (`id_group`),
  CONSTRAINT `FK_verb_group` FOREIGN KEY (`id_group`) REFERENCES `group` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela main.verb: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `verb` DISABLE KEYS */;
INSERT INTO `verb` (`id`, `name`, `id_group`) VALUES
	(2, 'consumed', 3);
INSERT INTO `verb` (`id`, `name`, `id_group`) VALUES
	(3, 'moved', 1);
INSERT INTO `verb` (`id`, `name`, `id_group`) VALUES
	(13, 'contained', 1);
/*!40000 ALTER TABLE `verb` ENABLE KEYS */;

-- Copiando estrutura para tabela main.verb_entity
CREATE TABLE IF NOT EXISTS `verb_entity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_verb` int(11) DEFAULT NULL,
  `id_entity` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_power_entity` (`id_entity`) USING BTREE,
  KEY `FK__verb` (`id_verb`) USING BTREE,
  CONSTRAINT `FK__verb` FOREIGN KEY (`id_verb`) REFERENCES `verb` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_power_entity` FOREIGN KEY (`id_entity`) REFERENCES `entity` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela main.verb_entity: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `verb_entity` DISABLE KEYS */;
INSERT INTO `verb_entity` (`id`, `id_verb`, `id_entity`) VALUES
	(6, 2, 7);
INSERT INTO `verb_entity` (`id`, `id_verb`, `id_entity`) VALUES
	(8, 3, 16);
INSERT INTO `verb_entity` (`id`, `id_verb`, `id_entity`) VALUES
	(19, 13, 16);
/*!40000 ALTER TABLE `verb_entity` ENABLE KEYS */;

-- Copiando estrutura para tabela main.verb_group
CREATE TABLE IF NOT EXISTS `verb_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela main.verb_group: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `verb_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `verb_group` ENABLE KEYS */;

-- Copiando estrutura para tabela main.verb_parameter
CREATE TABLE IF NOT EXISTS `verb_parameter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_verb` int(11) DEFAULT NULL,
  `id_entity` int(11) DEFAULT NULL,
  `name` varchar(64) DEFAULT 'subject',
  PRIMARY KEY (`id`),
  KEY `FK_verb_parameters_verb` (`id_verb`) USING BTREE,
  KEY `FK_verb_parameters_entity` (`id_entity`) USING BTREE,
  CONSTRAINT `FK_verb_parameters_entity` FOREIGN KEY (`id_entity`) REFERENCES `entity` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_verb_parameters_verb` FOREIGN KEY (`id_verb`) REFERENCES `verb` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela main.verb_parameter: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `verb_parameter` DISABLE KEYS */;
INSERT INTO `verb_parameter` (`id`, `id_verb`, `id_entity`, `name`) VALUES
	(5, 3, 15, 'origin');
INSERT INTO `verb_parameter` (`id`, `id_verb`, `id_entity`, `name`) VALUES
	(6, 3, 15, 'destination');
INSERT INTO `verb_parameter` (`id`, `id_verb`, `id_entity`, `name`) VALUES
	(11, 13, 15, 'container');
/*!40000 ALTER TABLE `verb_parameter` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
