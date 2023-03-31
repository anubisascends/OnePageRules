CREATE VIEW [dbo].[view_EquipmentProfileSpecialRules_Concat]
	AS 
SELECT
	Result.EquipmentProfileId,
	LEFT(Result.Rules, len(Result.Rules) - 1) as "SpecialRules"
FROM
(
	SELECT DISTINCT T2.EquipmentProfileId, 
		(
			SELECT
				T1.SpecialRule + ',' as [text()]
			FROM
				dbo.view_EquipmentProfileSpecialRules T1
			WHERE T1.EquipmentProfileId = T2.EquipmentProfileId
			ORDER BY T1.EquipmentProfileId
			FOR XML PATH(''), TYPE
		).value('text()[1]', 'nvarchar(max)') [Rules]
	FROM
		dbo.view_EquipmentProfileSpecialRules T2
) [Result]