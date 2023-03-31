CREATE VIEW [dbo].[view_UnitSpecialRules_Concat]
	AS 
SELECT
	Result.UnitId,
	LEFT(Result.Rules, len(Result.Rules) - 1) as "SpecialRules"
FROM
(
	SELECT DISTINCT T2.UnitId, 
		(
			SELECT
				T1.SpecialRule + ', ' as [text()]
			FROM
				dbo.view_UnitSpecialRules T1
			WHERE T1.UnitId = T2.UnitId
			ORDER BY T1.UnitId
			FOR XML PATH(''), TYPE
		).value('text()[1]', 'nvarchar(max)') [Rules]
	FROM
		dbo.UnitSpecialRules T2
) [Result]