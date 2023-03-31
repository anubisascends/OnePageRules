CREATE VIEW [dbo].[view_SpecialRules]
	AS 
	SELECT
		SR.Id,
	    CASE WHEN SR.HasValue = 1 THEN SR.Label  + '[X]' ELSE SR.Label END as Label,
		SR.Description,
		F.Label as FactionName
	FROM
		dbo.SpecialRules SR
			LEFT JOIN dbo.Factions F on SR.FactionId = F.Id