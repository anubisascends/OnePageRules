CREATE VIEW [dbo].[view_EquipmentProfileSpecialRules]
	AS
SELECT
	EPSR.Id,
	EPSR.EquipmentProfileId,
	SR.Label + iif(SR.HasValue = 1, '[' + CAST(EPSR.Value as NVARCHAR(MAX)) + ']', '') as SpecialRule
FROM
	dbo.EquipmentProfileSpecialRules EPSR
		JOIN dbo.SpecialRules SR ON EPSR.SpecialRuleId = SR.Id