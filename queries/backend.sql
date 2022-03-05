
-- generalisation expansion

WITH RECURSIVE gen AS 
(
	SELECT generalisation.parent, generalisation.child FROM generalisation
	UNION ALL
	SELECT generalisation.parent, gen.child FROM gen
	INNER JOIN generalisation ON gen.parent = generalisation.child 
)
SELECT * FROM gen ORDER BY child


-- action entities applied to generalisation

WITH action_entities AS
(
	WITH generalisation AS (
		WITH RECURSIVE gen AS 
		(
			SELECT generalisation.parent, generalisation.child FROM generalisation
			UNION ALL
			SELECT generalisation.parent, gen.child FROM gen
			INNER JOIN generalisation ON gen.parent = generalisation.child 
		)
		SELECT * FROM gen
	)
	SELECT action, child entity FROM action_entities
	INNER JOIN generalisation ON generalisation.parent = action_entities.entity
	UNION ALL 
	SELECT * FROM action_entities
)
SELECT * FROM action_entities ORDER BY action