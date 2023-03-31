CREATE PROCEDURE [dbo].[sp_merge_EquipmentProfileSpecialRules]
AS
BEGIN
	SET IDENTITY_INSERT dbo.EquipmentProfileSpecialRules ON

	DECLARE @DataTable TABLE (Id INT, EquipmentProfileId INT, SpecialRule NVARCHAR(25), Value INT)

	INSERT INTO @DataTable
		(id, EquipmentProfileId, SpecialRule, value)
	VALUES
		(1, 1, 'AP', 1)
		,(2, 2, 'AP', 1)
		,(3, 3, 'AP', 1)
		,(4, 3, 'Rending', 0)
		,(5, 4, 'AP', 1)
		,(6, 11, 'AP', 1)
		,(7, 11, 'Rending', 0)
		,(8, 14, 'Poison', 0)
		,(9, 16, 'Blast', 3)
		,(10, 18, 'Poison', 0)
		,(11, 19, 'AP', 1)
		,(12, 20, 'AP', 1)
		,(13, 21, 'AP', 1)
		,(14, 22, 'AP', 4)
		,(15, 23, 'Blast', 3)
		,(16, 23, 'Poison', 0)
		,(17, 24, 'AP', 1)
		,(18, 25, 'Poison', 0)
		-- stopped at psycho-rex


	merge dbo.EquipmentProfileSpecialRules as target
	using @datatable as source
	ON target.id = source.id
	WHEN MATCHED THEN
		UPDATE SET
			target.equipmentprofileid = source.equipmentprofileid,
			target.specialruleid = (SELECT Id FROM dbo.specialrules where label = source.specialrule),
			target.value = source.value
	WHEN NOT MATCHED BY SOURCE THEN
		DELETE
	WHEN NOT MATCHED BY target then
		INSERT 
			(Id, equipmentprofileid, specialruleid, value)
		VALUES
			(
				source.id, 
				source.equipmentprofileid, 
				(SELECT Id FROM dbo.specialrules where label = source.specialrule), 
				source.value);

	SET IDENTITY_INSERT dbo.EquipmentProfileSpecialRules OFF
END