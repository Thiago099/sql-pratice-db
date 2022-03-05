INSERT INTO `entity` (`id`, `name`) VALUES
	(1, 'glass'),
	(2, 'milk'),
	(6, 'container'),
	(7, 'food'),
	(8, 'solid'),
	(9, 'fluid'),
	(10, 'jug'),
	(12, 'water');

INSERT INTO `verb` (`id`, `name`) VALUES
	(1, 'be held'),
	(2, 'be consumed'),
	(3, 'be poured'),
	(4, 'drink out of'),
	(5, 'contain fluid');

INSERT INTO `generalization` (`id_parent`, `id_child`) VALUES
	(6, 1),
	(9, 2),
	(8, 6),
	(7, 2),
	(6, 10);

INSERT INTO `verb_parameters` (`id_verb`, `id_entity`, `name`) VALUES
	(5, 9, 'subject'),
	(3, 6, 'origin'),
	(3, 6, 'recipient');
	
INSERT INTO `verb_entities` (`id_verb`, `id_entity`) VALUES
	(2, 7),
	(1, 8),
	(3, 9),
	(4, 6),
	(5, 6);