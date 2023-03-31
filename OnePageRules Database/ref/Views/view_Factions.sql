CREATE VIEW [dbo].[view_Factions]
	AS 
	
	SELECT 
		F1.Id,
		G.Label as GameLabel,
		F1.Label as FactionLabel,
		F2.Label as ParentLabel
	FROM 
		dbo.Factions F1
			INNER JOIN dbo.Games G ON F1.GameId = G.Id
			LEFT JOIN dbo.Factions F2 ON F1.ParentId = F2.Id
