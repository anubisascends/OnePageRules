CREATE VIEW [dbo].[view_UnitEquipment]
AS
SELECT 
	UE.UnitId as Id,
	EP.Result
FROM
	dbo.UnitEquipment UE
		JOIN dbo.view_EquipmentProfiles_Concat EP ON UE.EquipmentProfileId = EP.Id