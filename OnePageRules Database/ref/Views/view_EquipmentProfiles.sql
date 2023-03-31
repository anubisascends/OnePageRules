CREATE VIEW [dbo].[view_EquipmentProfiles]
	AS 

SELECT 
	EP.ID,
	P.Label as Equipment,
	Concat('A', EP.Attacks) as Attacks,
	EP.Range,
	C.SpecialRules
FROM
	dbo.EquipmentProfiles EP
		JOIN dbo.Equipment P on EP.EquipmentId = P.Id
		LEFT JOIN dbo.view_EquipmentProfileSpecialRules_Concat C ON c.EquipmentProfileId = EP.Id