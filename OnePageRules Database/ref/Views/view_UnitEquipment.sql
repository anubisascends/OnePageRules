CREATE VIEW [dbo].[view_UnitEquipment]
	AS 

SELECT 
	UE.Id,
	UE.UnitId,
	IIF(UE.Quantity > 1, CONCAT(UE.Quantity, 'x '), '') + 
		E.Label + 
		' (' + 
		iif(UE.Range <> 'melee', UE.Range + ', ', '') +  
		CONCAT('A', UE.Attacks) + 
		')' as Label
from 
	dbo.UnitEquipment UE
		INNER JOIN dbo.Equipment E on E.Id = UE.EquipmentId
