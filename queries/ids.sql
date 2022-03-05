
-- generalization expansion

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
ORDER BY    id_child;

-- verb entities applied to generalization

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
                id_child entity 
    FROM        verb_entities
	INNER JOIN  generalization ON generalization.id_parent = verb_entities.id_entity
	UNION ALL 
	SELECT      * 
    FROM        verb_entities
)
SELECT      * 
FROM        verb_entities 
ORDER BY    id_verb,
			id_entity;


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
SELECT      * 
FROM        verb_parameters 
ORDER BY    id_verb,
			`name`,
			id_entity