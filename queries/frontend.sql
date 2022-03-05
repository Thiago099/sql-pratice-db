
-- shallow generalisation name
SELECT 		parent.name parent, 
				child.name child 
FROM 			generalisation
INNER JOIN 	entity parent ON parent.id = generalisation.parent
INNER JOIN 	entity child ON child.id = generalisation.child;

-- shallow action entities display
SELECT 		action.name action, 
				entity.name entity,
				(
					SELECT 		GROUP_CONCAT(CONCAT(entity.name,':',action_parameters.name) SEPARATOR ', ')
					FROM 			action_parameters 
					INNER JOIN 	entity ON entity.id = action_parameters.entity 
					WHERE 		action_parameters.action = action.id
				) parameters
FROM 			action_entities 
INNER JOIN 	action ON action.id = action_entities.action
INNER JOIN 	entity ON entity.id = action_entities.entity


-- generalisation expansion with name

WITH generalisation AS
(
	WITH RECURSIVE gen AS (
	SELECT generalisation.parent, generalisation.child FROM generalisation
	UNION ALL
	SELECT generalisation.parent, gen.child FROM gen
	INNER JOIN generalisation ON gen.parent = generalisation.child 
	)
	SELECT * FROM gen
),
text_gen AS
(
	SELECT 		parent.name parent, 
					child.name child 
	FROM 			generalisation
	INNER JOIN 	entity parent ON parent.id = generalisation.parent
	INNER JOIN 	entity child ON child.id = generalisation.child
)
SELECT child, parent FROM text_gen ORDER BY child

