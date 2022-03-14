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
  `id_process` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_action_verb` (`id_verb`),
  KEY `FK_action_entity` (`id_entity`),
  KEY `FK_action_process` (`id_process`),
  CONSTRAINT `FK_action_entity` FOREIGN KEY (`id_entity`) REFERENCES `entity` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_action_process` FOREIGN KEY (`id_process`) REFERENCES `process` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_action_verb` FOREIGN KEY (`id_verb`) REFERENCES `verb` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela main.action: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `action` DISABLE KEYS */;
INSERT INTO `action` (`id`, `id_verb`, `id_entity`, `id_process`) VALUES
	(84, 55, 177, 8);
INSERT INTO `action` (`id`, `id_verb`, `id_entity`, `id_process`) VALUES
	(85, 53, 136, 8);
INSERT INTO `action` (`id`, `id_verb`, `id_entity`, `id_process`) VALUES
	(87, NULL, NULL, 9);
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
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela main.action_parameter: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `action_parameter` DISABLE KEYS */;
INSERT INTO `action_parameter` (`id`, `id_action`, `id_entity`, `id_verb_parameter`) VALUES
	(106, 84, 176, 64);
INSERT INTO `action_parameter` (`id`, `id_action`, `id_entity`, `id_verb_parameter`) VALUES
	(107, 84, 158, 65);
INSERT INTO `action_parameter` (`id`, `id_action`, `id_entity`, `id_verb_parameter`) VALUES
	(108, 84, 148, 63);
INSERT INTO `action_parameter` (`id`, `id_action`, `id_entity`, `id_verb_parameter`) VALUES
	(112, 85, 177, 59);
/*!40000 ALTER TABLE `action_parameter` ENABLE KEYS */;

-- Copiando estrutura para tabela main.entity
CREATE TABLE IF NOT EXISTS `entity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT '0',
  `id_group` int(11) DEFAULT NULL,
  `instance` tinyint(1) DEFAULT 0,
  `id_process` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_entity_group` (`id_group`),
  KEY `FK_entity_process` (`id_process`),
  CONSTRAINT `FK_entity_group` FOREIGN KEY (`id_group`) REFERENCES `group` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_entity_process` FOREIGN KEY (`id_process`) REFERENCES `process` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela main.entity: ~27 rows (aproximadamente)
/*!40000 ALTER TABLE `entity` DISABLE KEYS */;
INSERT INTO `entity` (`id`, `name`, `id_group`, `instance`, `id_process`) VALUES
	(127, 'parameter container', 27, 0, NULL);
INSERT INTO `entity` (`id`, `name`, `id_group`, `instance`, `id_process`) VALUES
	(128, 'expression', 27, 0, NULL);
INSERT INTO `entity` (`id`, `name`, `id_group`, `instance`, `id_process`) VALUES
	(129, 'block container', 27, 0, NULL);
INSERT INTO `entity` (`id`, `name`, `id_group`, `instance`, `id_process`) VALUES
	(130, 'block item', 27, 0, NULL);
INSERT INTO `entity` (`id`, `name`, `id_group`, `instance`, `id_process`) VALUES
	(131, 'operator', 27, 0, NULL);
INSERT INTO `entity` (`id`, `name`, `id_group`, `instance`, `id_process`) VALUES
	(133, 'parameter and block container', 27, 0, NULL);
INSERT INTO `entity` (`id`, `name`, `id_group`, `instance`, `id_process`) VALUES
	(136, 'if', 30, 0, NULL);
INSERT INTO `entity` (`id`, `name`, `id_group`, `instance`, `id_process`) VALUES
	(137, 'for', 30, 0, NULL);
INSERT INTO `entity` (`id`, `name`, `id_group`, `instance`, `id_process`) VALUES
	(138, 'foreach', 30, 0, NULL);
INSERT INTO `entity` (`id`, `name`, `id_group`, `instance`, `id_process`) VALUES
	(139, 'while', 30, 0, NULL);
INSERT INTO `entity` (`id`, `name`, `id_group`, `instance`, `id_process`) VALUES
	(142, 'array', 31, 0, NULL);
INSERT INTO `entity` (`id`, `name`, `id_group`, `instance`, `id_process`) VALUES
	(143, 'object', 31, 0, NULL);
INSERT INTO `entity` (`id`, `name`, `id_group`, `instance`, `id_process`) VALUES
	(144, 'boolean', 31, 0, NULL);
INSERT INTO `entity` (`id`, `name`, `id_group`, `instance`, `id_process`) VALUES
	(145, 'number', 31, 0, NULL);
INSERT INTO `entity` (`id`, `name`, `id_group`, `instance`, `id_process`) VALUES
	(146, 'string', 31, 0, NULL);
INSERT INTO `entity` (`id`, `name`, `id_group`, `instance`, `id_process`) VALUES
	(147, 'function', 31, 0, NULL);
INSERT INTO `entity` (`id`, `name`, `id_group`, `instance`, `id_process`) VALUES
	(148, 'sum', 32, 0, NULL);
INSERT INTO `entity` (`id`, `name`, `id_group`, `instance`, `id_process`) VALUES
	(149, 'subtract', 32, 0, NULL);
INSERT INTO `entity` (`id`, `name`, `id_group`, `instance`, `id_process`) VALUES
	(150, 'multiply', 32, 0, NULL);
INSERT INTO `entity` (`id`, `name`, `id_group`, `instance`, `id_process`) VALUES
	(151, 'divide', 32, 0, NULL);
INSERT INTO `entity` (`id`, `name`, `id_group`, `instance`, `id_process`) VALUES
	(152, 'equal', 32, 0, NULL);
INSERT INTO `entity` (`id`, `name`, `id_group`, `instance`, `id_process`) VALUES
	(153, 'diferent', 32, 0, NULL);
INSERT INTO `entity` (`id`, `name`, `id_group`, `instance`, `id_process`) VALUES
	(154, 'not', 32, 0, NULL);
INSERT INTO `entity` (`id`, `name`, `id_group`, `instance`, `id_process`) VALUES
	(155, 'and', 32, 0, NULL);
INSERT INTO `entity` (`id`, `name`, `id_group`, `instance`, `id_process`) VALUES
	(156, 'or', 32, 0, NULL);
INSERT INTO `entity` (`id`, `name`, `id_group`, `instance`, `id_process`) VALUES
	(157, 'concat', 32, 0, NULL);
INSERT INTO `entity` (`id`, `name`, `id_group`, `instance`, `id_process`) VALUES
	(158, 'A', 31, 1, 8);
INSERT INTO `entity` (`id`, `name`, `id_group`, `instance`, `id_process`) VALUES
	(176, 'B', 31, 1, 8);
INSERT INTO `entity` (`id`, `name`, `id_group`, `instance`, `id_process`) VALUES
	(177, 'C', 31, 1, 8);
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
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela main.generalization: ~25 rows (aproximadamente)
/*!40000 ALTER TABLE `generalization` DISABLE KEYS */;
INSERT INTO `generalization` (`id`, `id_parent`, `id_child`) VALUES
	(128, 127, 133);
INSERT INTO `generalization` (`id`, `id_parent`, `id_child`) VALUES
	(129, 129, 133);
INSERT INTO `generalization` (`id`, `id_parent`, `id_child`) VALUES
	(132, 133, 136);
INSERT INTO `generalization` (`id`, `id_parent`, `id_child`) VALUES
	(133, 133, 137);
INSERT INTO `generalization` (`id`, `id_parent`, `id_child`) VALUES
	(134, 133, 138);
INSERT INTO `generalization` (`id`, `id_parent`, `id_child`) VALUES
	(135, 133, 139);
INSERT INTO `generalization` (`id`, `id_parent`, `id_child`) VALUES
	(138, 128, 142);
INSERT INTO `generalization` (`id`, `id_parent`, `id_child`) VALUES
	(139, 128, 143);
INSERT INTO `generalization` (`id`, `id_parent`, `id_child`) VALUES
	(140, 128, 144);
INSERT INTO `generalization` (`id`, `id_parent`, `id_child`) VALUES
	(141, 128, 145);
INSERT INTO `generalization` (`id`, `id_parent`, `id_child`) VALUES
	(142, 128, 146);
INSERT INTO `generalization` (`id`, `id_parent`, `id_child`) VALUES
	(143, 128, 147);
INSERT INTO `generalization` (`id`, `id_parent`, `id_child`) VALUES
	(144, 133, 147);
INSERT INTO `generalization` (`id`, `id_parent`, `id_child`) VALUES
	(145, 131, 152);
INSERT INTO `generalization` (`id`, `id_parent`, `id_child`) VALUES
	(146, 131, 153);
INSERT INTO `generalization` (`id`, `id_parent`, `id_child`) VALUES
	(147, 131, 154);
INSERT INTO `generalization` (`id`, `id_parent`, `id_child`) VALUES
	(148, 131, 155);
INSERT INTO `generalization` (`id`, `id_parent`, `id_child`) VALUES
	(149, 131, 156);
INSERT INTO `generalization` (`id`, `id_parent`, `id_child`) VALUES
	(150, 131, 148);
INSERT INTO `generalization` (`id`, `id_parent`, `id_child`) VALUES
	(151, 131, 149);
INSERT INTO `generalization` (`id`, `id_parent`, `id_child`) VALUES
	(152, 131, 150);
INSERT INTO `generalization` (`id`, `id_parent`, `id_child`) VALUES
	(153, 131, 151);
INSERT INTO `generalization` (`id`, `id_parent`, `id_child`) VALUES
	(154, 131, 157);
INSERT INTO `generalization` (`id`, `id_parent`, `id_child`) VALUES
	(155, 130, 133);
INSERT INTO `generalization` (`id`, `id_parent`, `id_child`) VALUES
	(156, 145, 158);
INSERT INTO `generalization` (`id`, `id_parent`, `id_child`) VALUES
	(167, 145, 176);
INSERT INTO `generalization` (`id`, `id_parent`, `id_child`) VALUES
	(168, 145, 177);
/*!40000 ALTER TABLE `generalization` ENABLE KEYS */;

-- Copiando estrutura para tabela main.group
CREATE TABLE IF NOT EXISTS `group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela main.group: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `group` DISABLE KEYS */;
INSERT INTO `group` (`id`, `name`) VALUES
	(27, 'baisic');
INSERT INTO `group` (`id`, `name`) VALUES
	(30, 'instructions');
INSERT INTO `group` (`id`, `name`) VALUES
	(31, 'data');
INSERT INTO `group` (`id`, `name`) VALUES
	(32, 'operations');
/*!40000 ALTER TABLE `group` ENABLE KEYS */;

-- Copiando estrutura para tabela main.process
CREATE TABLE IF NOT EXISTS `process` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela main.process: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `process` DISABLE KEYS */;
INSERT INTO `process` (`id`, `name`) VALUES
	(8, 'test');
INSERT INTO `process` (`id`, `name`) VALUES
	(9, 'test2');
/*!40000 ALTER TABLE `process` ENABLE KEYS */;

-- Copiando estrutura para tabela main.verb
CREATE TABLE IF NOT EXISTS `verb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT '0',
  `id_group` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_verb_group` (`id_group`),
  CONSTRAINT `FK_verb_group` FOREIGN KEY (`id_group`) REFERENCES `group` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela main.verb: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `verb` DISABLE KEYS */;
INSERT INTO `verb` (`id`, `name`, `id_group`) VALUES
	(53, 'append parameter', 27);
INSERT INTO `verb` (`id`, `name`, `id_group`) VALUES
	(54, 'append block item', 27);
INSERT INTO `verb` (`id`, `name`, `id_group`) VALUES
	(55, 'operate', 27);
INSERT INTO `verb` (`id`, `name`, `id_group`) VALUES
	(56, 'call', 27);
INSERT INTO `verb` (`id`, `name`, `id_group`) VALUES
	(57, 'set name', 27);
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
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela main.verb_entity: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `verb_entity` DISABLE KEYS */;
INSERT INTO `verb_entity` (`id`, `id_verb`, `id_entity`) VALUES
	(49, 53, 127);
INSERT INTO `verb_entity` (`id`, `id_verb`, `id_entity`) VALUES
	(50, 54, 129);
INSERT INTO `verb_entity` (`id`, `id_verb`, `id_entity`) VALUES
	(51, 55, 128);
INSERT INTO `verb_entity` (`id`, `id_verb`, `id_entity`) VALUES
	(52, 56, 128);
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
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela main.verb_parameter: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `verb_parameter` DISABLE KEYS */;
INSERT INTO `verb_parameter` (`id`, `id_verb`, `id_entity`, `name`) VALUES
	(59, 53, 128, 'parameter');
INSERT INTO `verb_parameter` (`id`, `id_verb`, `id_entity`, `name`) VALUES
	(60, 54, 130, 'block item');
INSERT INTO `verb_parameter` (`id`, `id_verb`, `id_entity`, `name`) VALUES
	(63, 55, 131, 'operation');
INSERT INTO `verb_parameter` (`id`, `id_verb`, `id_entity`, `name`) VALUES
	(64, 55, 128, 'a');
INSERT INTO `verb_parameter` (`id`, `id_verb`, `id_entity`, `name`) VALUES
	(65, 55, 128, 'b');
INSERT INTO `verb_parameter` (`id`, `id_verb`, `id_entity`, `name`) VALUES
	(66, 57, NULL, 'name');
/*!40000 ALTER TABLE `verb_parameter` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
