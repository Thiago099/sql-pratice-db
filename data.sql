INSERT INTO `action` (`id`, `name`) VALUES
	(1, 'hold'),
	(2, 'consume'),
	(3, 'pour');

INSERT INTO `action_entities` (`action`, `entity`) VALUES
	(2, 7),
	(1, 8),
	(3, 9);

INSERT INTO `action_parameters` (`action`, `entity`, `name`) VALUES
	(3, 6, 'origin'),
	(3, 6, 'recipient');

INSERT INTO `entity` (`id`, `name`) VALUES
	(1, 'glass'),
	(2, 'milk'),
	(6, 'container'),
	(7, 'food'),
	(8, 'solid'),
	(9, 'fluid'),
	(10, 'milk jug');
    
INSERT INTO `generalisation` (`parent`, `child`) VALUES
	(6, 1),
	(9, 2),
	(8, 6),
	(7, 2),
	(6, 10);