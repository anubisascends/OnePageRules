CREATE PROCEDURE [dbo].[sp_merge_EquipmentProfiles]
AS
BEGIN
	DECLARE @DataTable TABLE (Id INT, Equipment NVARCHAR(75), Attacks TINYINT, [Range] NVARCHAR(5))

	INSERT INTO @DataTable
		(ID, Equipment, Attacks, [Range])
	VALUES
		-- Alien Hives Unit Default
		(1,  'Razor Claw', 6, 'melee')
		,(2, 'Stomp', 4, 'melee')
		,(3, 'Heavy Piercing Claws', 6, 'melee')
		,(4, 'Razor Claw', 4, 'melee')
		,(6,  'Razor Claw', 2, 'melee')
		,(7,  'Bio-Borer', 2, '12"')
		,(8,  'Razor Claw', 1, 'melee')
		,(9, 'Bio-Borer', 2, '12"')
		,(10, 'Razor Claw', 1, 'melee')
		,(11,  'Piercing Claw', 3, 'melee')
		,(12, 'Razor Claw', 3, 'melee')
		,(13,  'Razor Claw', 3, 'melee')
		,(14, 'Swarm Attack', 3, 'melee')
		,(15, 'Razor Claw', 3, 'melee')
		,(16,  'Psy-Blast', 1, '18"')
		,(17,  'Psy-Shock', 1, 'melee')
		,(18,  'Whip Limb', 3, 'melee')
		,(19, 'Razor Claw', 4, 'melee')
		,(20, 'Razor Claw', 3, 'melee')
		,(21, 'Stomp', 4, 'melee')
		,(22, 'Vicious Jaws', 3, 'melee')
		,(23, 'Acid Spurt', 2, '12"')
		,(24, 'Stomp', 4, 'melee')
		,(25, 'Whip Limb', 9, 'melee')
		,(26, 'Heavy Psy-Blast', 2, '18"')
		,(27, 'Stomp', 2, 'melee')
		,(28, 'Razor Claw', 3, 'melee')
		,(29, 'Tongue', 3, '12"')
		,(30, 'Razor Claw', 3, 'melee')
		,(31, 'Stomp', 6, 'melee')
		,(32, 'Toxic Spray', 3, '18"')
		,(33, 'Razor Claw', 3, 'melee')
		,(34, 'Stomp', 6, 'melee')
		,(35, 'Rapid Stinger Cannon', 18, '18"')
		,(36, 'Razor Claw', 3, 'melee')
		,(37, 'Stomp', 6, 'melee')
		,(38,  'Shredder Bio-Artillery', 3, '36"')
		,(39,  'Razor Claw', 3, 'melee')
		,(40,  'Stomp', 6, 'melee')
		,(41, 'Razor Claw', 3, 'melee')
		,(42, 'Stomp', 6, 'melee')
		,(43, 'Spit Flames', 9, '18"')
		,(44, 'Razor Claw', 3, 'melee')
		,(45, 'Stomp', 2, 'melee')
		,(46, 'Spore Gun', 1, '24"')
		,(47, 'Razor Claw', 3, 'melee')
		,(48, 'Stomp', 2, 'melee')
		,(49,  'Razor Tendrils', 6, 'melee')
		,(50, 'Spore Gun', 1, '24"')
		,(51, 'Razor Tendrils', 6, 'melee')
		,(52, 'Stinger Spitter', 3, '18"')
		,(53, 'Caustic Cannon', 6, '12"')
		,(54, 'Spore Bombs', 1, '6"')
		,(55, 'Titanic Jaws', 3, 'melee')
		,(56, 'Titanic Stomp', 12, 'melee')
		-- Alien Hives Upgrades

	SET IDENTITY_INSERT dbo.equipmentprofiles ON

	merge dbo.equipmentprofiles as target
	using @datatable as source on target.id = source.id
	when matched then
		update set
			target.equipmentid = (select [id] from dbo.Equipment where label = source.equipment),
			target.attacks = source.attacks,
			target.range = source.range
	when not matched by source then
		delete
	when not matched by target then
		insert
			(id, equipmentid, attacks, [range])
		values
			(
				source.id,
				(select [id] from dbo.Equipment where label = source.equipment),
				source.attacks,
				source.range
			);

	set identity_insert dbo.unitequipment off

	DECLARE @MaxID INT
	SELECT @MaxID = MAX(ID) from dbo.EquipmentProfiles

	DBCC CHECKIDENT ('EquipmentProfiles', RESEED, @MaxID)	
END