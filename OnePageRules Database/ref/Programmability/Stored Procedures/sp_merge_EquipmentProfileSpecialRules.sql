CREATE PROCEDURE [dbo].[sp_merge_EquipmentProfileSpecialRules]
AS
BEGIN
	SET IDENTITY_INSERT dbo.EquipmentProfileSpecialRules ON

	DECLARE @DataTable TABLE (Id INT, EquipmentProfileId INT, SpecialRule NVARCHAR(25), Value INT)

	INSERT INTO @DataTable
		(id, EquipmentProfileId, SpecialRule, value)
	VALUES
		-- Alien Hives Unit Default
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
		,(19, 26, 'Blast', 3)
		,(20, 26, 'AP', 1)
		,(21, 27, 'AP', 1)
		,(22, 28, 'AP', 1)
		,(23, 29, 'AP', 2)
		,(24, 29, 'Deadly', 3)
		,(25, 29, 'Sniper', 0)
		,(26, 30, 'AP', 1)
		,(27, 31, 'AP', 2)
		,(28, 32, 'AP', 1)
		,(29, 33, 'AP', 1)
		,(30, 34, 'AP', 2)
		,(31, 35, 'Rending', 0)
		,(32, 36, 'AP', 1)
		,(33, 37, 'AP', 2)
		,(34, 38, 'Blast', 3)
		,(35, 38, 'Rending', 0)
		,(36, 38, 'Indirect', 0)
		,(37, 39, 'AP', 1)
		,(38, 40, 'AP', 2)
		,(39, 41, 'AP', 1)
		,(40, 42, 'AP', 2)
		,(41, 43, 'AP', 1)
		,(42, 44, 'AP', 1)
		,(43, 45, 'AP', 1)
		,(44, 46, 'Blast', 9)
		,(45, 46, 'Indirect', 0)
		,(46, 46, 'Spores', 0)
		,(47, 47, 'AP', 1)
		,(48, 48, 'AP', 1)
		,(49, 49, 'AP', 1)
		,(50, 50, 'Blast', 9)
		,(51, 50, 'Indirect', 0)
		,(52, 50, 'Spores', 0)
		,(53, 51, 'AP', 1)
		,(54, 52, 'Rending', 0)
		,(55, 54, 'Blast', 9)
		,(56, 54, 'Spores', 0)
		,(57, 55, 'AP', 4)
		,(58, 55, 'Deadly', 6)
		,(59, 49, 'AP', 2)
		-- Alien Hives Upgrades

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