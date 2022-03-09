CREATE TABLE IF NOT EXISTS `entity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `verb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `generalization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_parent` int(11) DEFAULT NULL,
  `id_child` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__entity` (`id_parent`) USING BTREE,
  KEY `FK__entity_2` (`id_child`) USING BTREE,
  CONSTRAINT `FK__entity` FOREIGN KEY (`id_parent`) REFERENCES `entity` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK__entity_2` FOREIGN KEY (`id_child`) REFERENCES `entity` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `verb_entities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_verb` int(11) DEFAULT NULL,
  `id_entity` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_power_entity` (`id_entity`) USING BTREE,
  KEY `FK__verb` (`id_verb`) USING BTREE,
  CONSTRAINT `FK__verb` FOREIGN KEY (`id_verb`) REFERENCES `verb` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_power_entity` FOREIGN KEY (`id_entity`) REFERENCES `entity` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;