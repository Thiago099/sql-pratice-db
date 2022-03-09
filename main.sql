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

-- Copiando estrutura para tabela main.action
DROP TABLE IF EXISTS `action`;
CREATE TABLE IF NOT EXISTS `action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_verb` int(11) NOT NULL DEFAULT 0,
  `id_entity` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `FK_action_verb` (`id_verb`),
  KEY `FK_action_entity` (`id_entity`),
  CONSTRAINT `FK_action_entity` FOREIGN KEY (`id_entity`) REFERENCES `entity` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_action_verb` FOREIGN KEY (`id_verb`) REFERENCES `verb` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela main.action: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `action` DISABLE KEYS */;
INSERT INTO `action` (`id`, `id_verb`, `id_entity`) VALUES
	(1, 5, 1);
/*!40000 ALTER TABLE `action` ENABLE KEYS */;

-- Copiando estrutura para tabela main.action_parameter
DROP TABLE IF EXISTS `action_parameter`;
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
  CONSTRAINT `FK_action_parameter_verb_parameters` FOREIGN KEY (`id_verb_parameter`) REFERENCES `verb_parameters` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela main.action_parameter: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `action_parameter` DISABLE KEYS */;
INSERT INTO `action_parameter` (`id`, `id_action`, `id_entity`, `id_verb_parameter`) VALUES
	(1, 1, 2, 4);
/*!40000 ALTER TABLE `action_parameter` ENABLE KEYS */;

-- Copiando estrutura para tabela main.entity
DROP TABLE IF EXISTS `entity`;
CREATE TABLE IF NOT EXISTS `entity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '0',
  `id_group` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_entity_group` (`id_group`),
  CONSTRAINT `FK_entity_group` FOREIGN KEY (`id_group`) REFERENCES `group` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela main.entity: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `entity` DISABLE KEYS */;
INSERT INTO `entity` (`id`, `name`, `id_group`) VALUES
	(1, 'glass', 2);
INSERT INTO `entity` (`id`, `name`, `id_group`) VALUES
	(2, 'milk', 2);
INSERT INTO `entity` (`id`, `name`, `id_group`) VALUES
	(6, 'container', 1);
INSERT INTO `entity` (`id`, `name`, `id_group`) VALUES
	(7, 'food', 3);
INSERT INTO `entity` (`id`, `name`, `id_group`) VALUES
	(8, 'solid', 1);
INSERT INTO `entity` (`id`, `name`, `id_group`) VALUES
	(9, 'fluid', 1);
INSERT INTO `entity` (`id`, `name`, `id_group`) VALUES
	(10, 'jug', 2);
/*!40000 ALTER TABLE `entity` ENABLE KEYS */;

-- Copiando estrutura para tabela main.generalization
DROP TABLE IF EXISTS `generalization`;
CREATE TABLE IF NOT EXISTS `generalization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_parent` int(11) DEFAULT NULL,
  `id_child` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__entity` (`id_parent`) USING BTREE,
  KEY `FK__entity_2` (`id_child`) USING BTREE,
  CONSTRAINT `FK__entity` FOREIGN KEY (`id_parent`) REFERENCES `entity` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK__entity_2` FOREIGN KEY (`id_child`) REFERENCES `entity` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela main.generalization: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `generalization` DISABLE KEYS */;
INSERT INTO `generalization` (`id`, `id_parent`, `id_child`) VALUES
	(7, 6, 1);
INSERT INTO `generalization` (`id`, `id_parent`, `id_child`) VALUES
	(8, 9, 2);
INSERT INTO `generalization` (`id`, `id_parent`, `id_child`) VALUES
	(9, 8, 6);
INSERT INTO `generalization` (`id`, `id_parent`, `id_child`) VALUES
	(10, 7, 2);
INSERT INTO `generalization` (`id`, `id_parent`, `id_child`) VALUES
	(11, 6, 10);
/*!40000 ALTER TABLE `generalization` ENABLE KEYS */;

-- Copiando estrutura para tabela main.group
DROP TABLE IF EXISTS `group`;
CREATE TABLE IF NOT EXISTS `group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela main.group: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `group` DISABLE KEYS */;
INSERT INTO `group` (`id`, `name`) VALUES
	(1, 'generic spatial');
INSERT INTO `group` (`id`, `name`) VALUES
	(2, 'instance');
INSERT INTO `group` (`id`, `name`) VALUES
	(3, 'generic creature');
/*!40000 ALTER TABLE `group` ENABLE KEYS */;

-- Copiando estrutura para tabela main.verb
DROP TABLE IF EXISTS `verb`;
CREATE TABLE IF NOT EXISTS `verb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela main.verb: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `verb` DISABLE KEYS */;
INSERT INTO `verb` (`id`, `name`) VALUES
	(1, 'be held');
INSERT INTO `verb` (`id`, `name`) VALUES
	(2, 'be consumed');
INSERT INTO `verb` (`id`, `name`) VALUES
	(3, 'be poured');
INSERT INTO `verb` (`id`, `name`) VALUES
	(4, 'drink out of');
INSERT INTO `verb` (`id`, `name`) VALUES
	(5, 'contain fluid');
/*!40000 ALTER TABLE `verb` ENABLE KEYS */;

-- Copiando estrutura para tabela main.verb_entities
DROP TABLE IF EXISTS `verb_entities`;
CREATE TABLE IF NOT EXISTS `verb_entities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_verb` int(11) DEFAULT NULL,
  `id_entity` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_power_entity` (`id_entity`) USING BTREE,
  KEY `FK__verb` (`id_verb`) USING BTREE,
  CONSTRAINT `FK__verb` FOREIGN KEY (`id_verb`) REFERENCES `verb` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_power_entity` FOREIGN KEY (`id_entity`) REFERENCES `entity` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela main.verb_entities: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `verb_entities` DISABLE KEYS */;
INSERT INTO `verb_entities` (`id`, `id_verb`, `id_entity`) VALUES
	(6, 2, 7);
INSERT INTO `verb_entities` (`id`, `id_verb`, `id_entity`) VALUES
	(7, 1, 8);
INSERT INTO `verb_entities` (`id`, `id_verb`, `id_entity`) VALUES
	(8, 3, 9);
INSERT INTO `verb_entities` (`id`, `id_verb`, `id_entity`) VALUES
	(9, 4, 6);
INSERT INTO `verb_entities` (`id`, `id_verb`, `id_entity`) VALUES
	(10, 5, 6);
/*!40000 ALTER TABLE `verb_entities` ENABLE KEYS */;

-- Copiando estrutura para tabela main.verb_parameters
DROP TABLE IF EXISTS `verb_parameters`;
CREATE TABLE IF NOT EXISTS `verb_parameters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_verb` int(11) DEFAULT NULL,
  `id_entity` int(11) DEFAULT NULL,
  `name` varchar(64) DEFAULT 'subject',
  PRIMARY KEY (`id`),
  KEY `FK_verb_parameters_verb` (`id_verb`) USING BTREE,
  KEY `FK_verb_parameters_entity` (`id_entity`) USING BTREE,
  CONSTRAINT `FK_verb_parameters_entity` FOREIGN KEY (`id_entity`) REFERENCES `entity` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_verb_parameters_verb` FOREIGN KEY (`id_verb`) REFERENCES `verb` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela main.verb_parameters: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `verb_parameters` DISABLE KEYS */;
INSERT INTO `verb_parameters` (`id`, `id_verb`, `id_entity`, `name`) VALUES
	(4, 5, 9, 'fluid');
INSERT INTO `verb_parameters` (`id`, `id_verb`, `id_entity`, `name`) VALUES
	(5, 3, 6, 'origin');
INSERT INTO `verb_parameters` (`id`, `id_verb`, `id_entity`, `name`) VALUES
	(6, 3, 6, 'recipient');
/*!40000 ALTER TABLE `verb_parameters` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
