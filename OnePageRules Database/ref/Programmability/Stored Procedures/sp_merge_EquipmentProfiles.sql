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
		-- Battle Brothers Unit Default
		,(57, 'Heavy Rifle', 1, '24"')
		,(58, 'CCW', 1, 'melee')
		,(59, 'Heavy Rifle', 1, '24"')
		,(60, 'CCW', 1, 'melee')
		,(61, 'Heavy Rifles', 1, '24"')
		,(62, 'CCW', 1, 'melee')
		,(63, 'Heavy Pistols', 1, '12"')
		,(64, 'CCW', 2, 'melee')
		,(65, 'Heavy Rifle', 1, '24"')
		,(66, 'CCW', 1, 'melee')
		,(67, 'Heavy Flamethrower', 6, '12"')
		,(68, 'CCW', 1, 'melee')
		,(69, 'Dual Energy Claws', 6, 'melee')
		,(70, 'Grenade Launchers', 1, '24"')
		,(71, 'CCW', 1, 'melee')
		,(72, 'Heavy Pistols', 1, '12"')
		,(73, 'Twin Heavy Rifles', 2, '24"')
		,(74, 'CCW', 2, 'melee')
		,(75, 'Twin Heavy Rifles', 2, '24"')
		,(76, 'Heavy Flamethrower', 6, '12"')
		,(77, 'Heavy Pistol', 1, '12"')
		,(78, 'CCW', 2, 'melee')
		,(79, 'Storm Rifle', 3, '24"')
		,(80, 'Twin Heavy Flamethrower', 12, '12"')
		,(81, 'Death Launcher', 1, '18"')
		,(82, 'Twin Heavy Machineguns',61, '30"')
		,(83, 'Demolition Cannon', 1, '24"')
		,(84, 'Twin Heavy Machinegun', 6, '30"')
		,(85, 'Twin Flamethrower Cannons', 12, '18"')
		,(86, 'Heavy Flak Cannon', 2, '30"')
		,(87, 'Engineer Crew', 3, 'melee')
		,(88, 'Heavy Flamethrowers', 6, '12"')
		,(89, 'Twin Fusion Rifle', 2, '12"')
		,(90, 'Stomp', 2, 'melee')
		,(91, 'Stomp', 2, 'melee')
		,(92, 'Walker Fists', 4, 'melee')
		,(93, 'Twin Typhoon Missles', 4, '24"')
		,(94, 'Miniguns', 4, '24"')
		,(95, 'Storm Missles', 1, '36"')
		,(96, 'Twin Minigun', 8, '24"')
		,(97, 'Typhoon Missles', 2, '24"')
		


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