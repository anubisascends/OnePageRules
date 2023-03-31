CREATE VIEW [dbo].[view_EquipmentProfiles_Concat]
	AS 
SELECT 
	EP.Id,
	EP.Equipment + 
		' ( ' + 
		iif(EP.Range <> 'melee', EP.Range + ', ', '') + 
		EP.Attacks + 
		iif(ISNULL(EP.SpecialRules, '') <> '', ', ' + EP.specialRules , '' ) +
		' )' as Result
FROM 
	[dbo].[view_EquipmentProfiles] EP