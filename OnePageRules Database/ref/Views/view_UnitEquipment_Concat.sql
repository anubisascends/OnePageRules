CREATE VIEW [dbo].[view_UnitEquipment_Concat]
AS
SELECT
	Result.Id,
	LEFT(Result.Rules, len(Result.Rules) - 1) as "Equipment"
FROM
(
	SELECT DISTINCT T2.Id, 
		(
			SELECT
				T1.Result + '; ' as [text()]
			FROM
				dbo.view_UnitEquipment T1
			WHERE T1.Id = T2.Id
			ORDER BY T1.Id
			FOR XML PATH(''), TYPE
		).value('text()[1]', 'nvarchar(max)') [Rules]
	FROM
		dbo.view_UnitEquipment T2
) [Result]