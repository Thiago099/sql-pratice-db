
-- shallow generalization name
SELECT 			parent.name parent, 
				child.name child 
FROM 			generalization
INNER JOIN 		entity parent ON parent.id = generalization.id_parent
INNER JOIN 		entity child ON child.id = generalization.id_child;

-- shallow verb entities display
SELECT 			entity.name entity,
				verb.name verb 
FROM 			verb_entities 
INNER JOIN 		verb ON verb.id = verb_entities.id_verb
INNER JOIN 		entity ON entity.id = verb_entities.id_entity
ORDER BY 		entity.name;


-- generalization expansion with name

WITH generalization AS (
	WITH RECURSIVE gen AS 
	(
		SELECT 		generalization.id_parent, 
					generalization.id_child 
		FROM 		generalization
		UNION ALL
		SELECT 		generalization.id_parent, 
					gen.id_child 
		FROM 		gen
		INNER JOIN 	generalization ON gen.id_parent = generalization.id_child 
	)
	SELECT 	* 
	FROM 	gen
)
SELECT 			parent.name parent, 
				child.name child 
FROM 			generalization
INNER JOIN 		entity parent ON parent.id = generalization.id_parent
INNER JOIN 		entity child ON child.id = generalization.id_child
ORDER BY child;

-- verbs applied to entities

WITH verb_entities AS
(
	WITH generalization AS (
		WITH RECURSIVE gen AS 
		(
		    SELECT 		generalization.id_parent, 
		                generalization.id_child 
		    FROM 		generalization
		    UNION ALL
		    SELECT 		generalization.id_parent, 
		                gen.id_child 
		    FROM 		gen
		    INNER JOIN 	generalization ON gen.id_parent = generalization.id_child 
		)
		SELECT      * 
		FROM        gen
		ORDER BY    id_child
	)
	SELECT       id_verb, 
                id_child id_entity 
    FROM        verb_entities
	INNER JOIN  generalization ON generalization.id_parent = verb_entities.id_entity
	UNION ALL 
	SELECT      * 
    FROM        verb_entities
)
SELECT 			entity.name entity, 
				verb.name verb
FROM 			verb_entities 
INNER JOIN 		verb ON verb.id = verb_entities.id_verb
INNER JOIN 		entity ON entity.id = verb_entities.id_entity
ORDER BY 		entity.name

-- verb parameters

WITH verb_parameters AS 
(
	WITH RECURSIVE gen AS 
	(
	    SELECT 			generalization.id_parent, 
	                	generalization.id_child 
	    FROM 			generalization
	    UNION ALL
	    SELECT 			generalization.id_parent, 
	               	gen.id_child 
	    FROM 			gen
	    INNER JOIN 	generalization ON gen.id_parent = generalization.id_child 
	)
	SELECT 		verb_parameters.id_verb, 
					verb_parameters.name, 
					gen.id_child id_entity
	FROM 			verb_parameters
	INNER JOIN 	gen ON verb_parameters.id_entity = gen.id_parent
	UNION ALL
	SELECT 		verb_parameters.id_verb, 
					verb_parameters.name, 
					verb_parameters.id_entity
	FROM 			verb_parameters
)
SELECT 		verb.name verb, 
			entity.name entity, 
			verb_parameters.name role 
FROM 		verb_parameters
INNER JOIN 	verb ON verb_parameters.id_verb = verb.id
INNER JOIN 	entity ON verb_parameters.id_entity = entity.id
ORDER BY 	verb.name, 
			verb_parameters.name, 
			entity.name