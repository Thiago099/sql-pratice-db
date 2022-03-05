CREATE TABLE IF NOT EXISTS `action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `action_entities` (
  `action` int(11) DEFAULT NULL,
  `entity` int(11) DEFAULT NULL,
  KEY `FK_power_entity` (`entity`),
  KEY `FK__verb` (`action`) USING BTREE,
  CONSTRAINT `FK__verb` FOREIGN KEY (`action`) REFERENCES `action` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_power_entity` FOREIGN KEY (`entity`) REFERENCES `entity` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `entity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `generalisation` (
  `parent` int(11) DEFAULT NULL,
  `child` int(11) DEFAULT NULL,
  KEY `FK__entity` (`parent`),
  KEY `FK__entity_2` (`child`),
  CONSTRAINT `FK__entity` FOREIGN KEY (`parent`) REFERENCES `entity` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK__entity_2` FOREIGN KEY (`child`) REFERENCES `entity` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



