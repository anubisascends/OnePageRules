CREATE PROCEDURE [dbo].[sp_merge_UnitEquipment]
AS
BEGIN
	DECLARE @AlienHivesGF INT

	SELECT @AlienHivesGF = F.Id FROM dbo.Factions F JOIN dbo.Games G ON F.GameId = G.Id where G.Short = 'GF' and F.Label = 'Alien Hives'

	DECLARE @DataTable TABLE (Id INT, Unit NVARCHAR(75), FactionID INT, Qty TINYINT, Equipment NVARCHAR(75), Attacks TINYINT, [Range] NVARCHAR(5))

	INSERT INTO @DataTable
		(ID, Unit, FactionID, Qty, Equipment, Attacks, [Range])
	VALUES
		(1, 'Hive Lord', @AlienHivesGF, 2, 'Razor Claw', 6, 'melee')
		,(2, 'Hive Lord', @AlienHivesGF, 1, 'Stomp', 4, 'melee')
		,(3, 'Snatcher Lord', @AlienHivesGF, 1, 'Heavy Piercing Claws', 6, 'melee')
		,(4, 'Prime Warrior', @AlienHivesGF, 2, 'Razor Claw', 4, 'melee')
		,(6, 'Assault Grunts', @AlienHivesGF, 1, 'Razor Claw', 2, 'melee')
		,(7, 'Shooter Grunts', @AlienHivesGF, 1, 'Bio-Borer', 2, '12"')
		,(8, 'Shooter Grunts', @AlienHivesGF, 1, 'Razor Claw', 1, 'melee')
		,(9, 'Winged Grunts', @AlienHivesGF, 1, 'Bio-Borer', 2, '12"')
		,(10, 'Winged Grunts', @AlienHivesGF, 1, 'Razor Claw', 1, 'melee')
		,(11, 'Soul-Snatchers', @AlienHivesGF, 1, 'Piercing Claw', 3, 'melee')
		,(12, 'Hive Warriors', @AlienHivesGF, 2, 'Razor Claw', 3, 'melee')
		,(13, 'Hive Guardians', @AlienHivesGF, 2, 'Razor Claw', 3, 'melee')
		,(14, 'Hive Swarm', @AlienHivesGF, 1, 'Swarm Attack', 3, 'melee')
		,(15, 'Ravenous Beasts', @AlienHivesGF, 2, 'Razor Claw', 3, 'melee')
		,(16, 'Synapse Floaters', @AlienHivesGF, 2, 'Psy-Blast', 1, '18"')
		,(17, 'Synapse Floaters', @AlienHivesGF, 1, 'Psy-Shock', 1, 'melee')
		,(18, 'Venom Floaters', @AlienHivesGF, 1, 'Whip Limb', 3, 'melee')
		,(19, 'Shadow Hunter', @AlienHivesGF, 2, 'Razor Claw', 4, 'melee')
		,(20, 'Carnivo-Rex', @AlienHivesGF, 2, 'Razor Claw', 3, 'melee')
		,(21, 'Carnivo-Rex', @AlienHivesGF, 1, 'Stomp', 4, 'melee')
		,(22, 'Carnivo-Rex', @AlienHivesGF, 1, 'Vicious Jaws', 3, 'melee')
		,(23, 'Toxico-Rex', @AlienHivesGF, 1, 'Acid Spurt', 2, '12"')
		,(24, 'Toxico-Rex', @AlienHivesGF, 1, 'Stomp', 4, 'melee')
		,(25, 'Toxico-Rex', @AlienHivesGF, 1, 'Whip Limb', 9, 'melee')
		,(26, 'Psycho-Rex', @AlienHivesGF, 1, 'Heavy Psy-Blast', 2, '18"')
		,(27, 'Psycho-Rex', @AlienHivesGF, 1, 'Stomp', 2, 'melee')
		,(28, 'Psycho-Rex', @AlienHivesGF, 2, 'Razor Claw', 3, 'melee')
		,(29, 'Devourer Beast', @AlienHivesGF, 1, 'Tongue', 3, '12"')
		,(30, 'Devourer Beast', @AlienHivesGF, 3, 'Razor Claw', 3, 'melee')
		,(31, 'Devourer Beast', @AlienHivesGF, 1, 'Stomp', 6, 'melee')
		,(32, 'Tyrant Beast', @AlienHivesGF, 1, 'Toxic Spray', 3, '18"')
		,(33, 'Tyrant Beast', @AlienHivesGF, 2, 'Razor Claw', 3, 'melee')
		,(34, 'Tyrant Beast', @AlienHivesGF, 1, 'Stomp', 6, 'melee')
		,(35, 'Spawning Beast', @AlienHivesGF, 1, 'Rapid Stinger Cannon', 18, '18"')
		,(36, 'Spawning Beast', @AlienHivesGF, 2, 'Razor Claw', 3, 'melee')
		,(37, 'Spawning Beast', @AlienHivesGF, 1, 'Stomp', 6, 'melee')
		,(38, 'Artillery Beast', @AlienHivesGF, 1, 'Shredder Bio-Artillery', 3, '36"')
		,(39, 'Artillery Beast', @AlienHivesGF, 2, 'Razor Claw', 3, 'melee')
		,(40, 'Artillery Beast', @AlienHivesGF, 1, 'Stomp', 6, 'melee')
		,(41, 'Burrower', @AlienHivesGF, 4, 'Razor Claw', 3, 'melee')
		,(42, 'Burrower', @AlienHivesGF, 1, 'Stomp', 6, 'melee')
		,(43, 'Flamer Beast', @AlienHivesGF, 1, 'Spit Flames', 9, '18"')
		,(44, 'Flamer Beast', @AlienHivesGF, 1, 'Razor Claw', 3, 'melee')
		,(45, 'Flamer Beast', @AlienHivesGF, 1, 'Stomp', 2, 'melee')
		,(46, 'Mortar Beast', @AlienHivesGF, 1, 'Spore Gun', 1, '24"')
		,(47, 'Mortar Beast', @AlienHivesGF, 1, 'Razor Claw', 3, 'melee')
		,(48, 'Mortar Beast', @AlienHivesGF, 1, 'Stomp', 2, 'melee')
		,(49, 'Invasion Carrier', @AlienHivesGF, 1, 'Razor Tendrils', 6, 'melee')
		,(50, 'Invasion Artillery', @AlienHivesGF, 1, 'Spore Gun', 1, '24"')
		,(51, 'Invasion Artillery', @AlienHivesGF, 1, 'Razor Tendrils', 6, 'melee')
		,(52, 'Rapacious Beast', @AlienHivesGF, 1, 'Stinger Spitter', 3, '18"')
		,(53, 'Rapacious Beast', @AlienHivesGF, 1, 'Caustic Cannon', 6, '12"')
		,(54, 'Rapacious Beast', @AlienHivesGF, 1, 'Spore Bombs', 1, '6"')
		,(55, 'Hive Titan', @AlienHivesGF, 1, 'Titanic Jaws', 3, 'melee')
		,(56, 'Hive Titan', @AlienHivesGF, 1, 'Titanic Stomp', 12, 'melee')

	SET IDENTITY_INSERT dbo.UnitEquipment ON

	merge dbo.unitequipment as target
	using @datatable as source on target.id = source.id
	when matched then
		update set
			target.unitid = (SELECT [Id] from dbo.Units where label = source.unit and factionid = source.factionid),
			target.quantity = source.qty,
			target.equipmentid = (select [id] from dbo.Equipment where label = source.equipment),
			target.attacks = source.attacks,
			target.range = source.range
	when not matched by source then
		delete
	when not matched by target then
		insert
			(id, unitid, quantity, equipmentid, attacks, [range])
		values
			(
				source.id,
				(SELECT [Id] from dbo.Units where label = source.unit and factionid = source.factionid),
				source.qty,
				(select [id] from dbo.Equipment where label = source.equipment),
				source.attacks,
				source.range
			);

	set identity_insert dbo.unitequipment off

	DECLARE @MaxID INT
	SELECT @MaxID = MAX(ID) from dbo.UnitEquipment

	DBCC CHECKIDENT ('UnitEquipment', RESEED, @MaxID)	
END
