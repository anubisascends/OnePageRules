CREATE PROCEDURE [dbo].[sp_merge_UnitEquipment]
AS
BEGIN
	DECLARE @AlienHivesGF INT

	SELECT @AlienHivesGF = F.Id FROM dbo.Factions F JOIN dbo.Games G ON F.GameId = G.Id where G.Short = 'GF' and F.Label = 'Alien Hives'

	DECLARE @DataTable TABLE (Id INT, Unit NVARCHAR(75), FactionID INT, Qty TINYINT, EquipmentId INT)

	INSERT INTO @DataTable
		(ID, Unit, FactionID, Qty, EquipmentId)
	VALUES
		(1, 'Hive Lord', @AlienHivesGF, 2, 1)
		,(2, 'Hive Lord', @AlienHivesGF, 1, 2)
		,(3, 'Snatcher Lord', @AlienHivesGF, 1, 3)
		,(4, 'Prime Warrior', @AlienHivesGF, 2, 4)
		,(6, 'Assault Grunts', @AlienHivesGF, 1, 6)
		,(7, 'Shooter Grunts', @AlienHivesGF, 1, 7)
		,(8, 'Shooter Grunts', @AlienHivesGF, 1, 8)
		,(9, 'Winged Grunts', @AlienHivesGF, 1, 9)
		,(10, 'Winged Grunts', @AlienHivesGF, 1,10)
		,(11, 'Soul-Snatchers', @AlienHivesGF, 1,11)
		,(12, 'Hive Warriors', @AlienHivesGF, 2, 12)
		,(13, 'Hive Guardians', @AlienHivesGF, 2,13)
		,(14, 'Hive Swarm', @AlienHivesGF, 1, 14)
		,(15, 'Ravenous Beasts', @AlienHivesGF, 2, 15)
		,(16, 'Synapse Floaters', @AlienHivesGF, 1,16)
		,(17, 'Synapse Floaters', @AlienHivesGF, 1,17)
		,(18, 'Venom Floaters', @AlienHivesGF, 1,18)
		,(19, 'Shadow Hunter', @AlienHivesGF, 2, 19)
		,(20, 'Carnivo-Rex', @AlienHivesGF, 2,20)
		,(21, 'Carnivo-Rex', @AlienHivesGF, 1,21)
		,(22, 'Carnivo-Rex', @AlienHivesGF, 1,22)
		,(23, 'Toxico-Rex', @AlienHivesGF, 1, 23)
		,(24, 'Toxico-Rex', @AlienHivesGF, 1, 24)
		,(25, 'Toxico-Rex', @AlienHivesGF, 1, 25)
		,(26, 'Psycho-Rex', @AlienHivesGF, 1, 26)
		,(27, 'Psycho-Rex', @AlienHivesGF, 1, 27)
		,(28, 'Psycho-Rex', @AlienHivesGF, 2, 28)
		,(29, 'Devourer Beast', @AlienHivesGF, 1, 29)
		,(30, 'Devourer Beast', @AlienHivesGF, 3, 30)
		,(31, 'Devourer Beast', @AlienHivesGF, 1, 31)
		,(32, 'Tyrant Beast', @AlienHivesGF, 1, 32)
		,(33, 'Tyrant Beast', @AlienHivesGF, 2, 33)
		,(34, 'Tyrant Beast', @AlienHivesGF, 1, 34)
		,(35, 'Spawning Beast', @AlienHivesGF, 1, 35)
		,(36, 'Spawning Beast', @AlienHivesGF, 2, 36)
		,(37, 'Spawning Beast', @AlienHivesGF, 1, 37)
		,(38, 'Artillery Beast', @AlienHivesGF, 1, 38)
		,(39, 'Artillery Beast', @AlienHivesGF, 2, 39)
		,(40, 'Artillery Beast', @AlienHivesGF, 1, 40)
		,(41, 'Burrower', @AlienHivesGF, 4, 41)
		,(42, 'Burrower', @AlienHivesGF, 1, 42)
		,(43, 'Flamer Beast', @AlienHivesGF, 1, 43)
		,(44, 'Flamer Beast', @AlienHivesGF, 1, 44)
		,(45, 'Flamer Beast', @AlienHivesGF, 1, 45)
		,(46, 'Mortar Beast', @AlienHivesGF, 1, 46)
		,(47, 'Mortar Beast', @AlienHivesGF, 1, 47)
		,(48, 'Mortar Beast', @AlienHivesGF, 1, 48)
		,(49, 'Invasion Carrier', @AlienHivesGF, 1, 49)
		,(50, 'Invasion Artillery', @AlienHivesGF, 1,50)
		,(51, 'Invasion Artillery', @AlienHivesGF, 1,51)
		,(52, 'Rapacious Beast', @AlienHivesGF, 1, 52)
		,(53, 'Rapacious Beast', @AlienHivesGF, 1, 53)
		,(54, 'Rapacious Beast', @AlienHivesGF, 1, 54)
		,(55, 'Hive Titan', @AlienHivesGF, 1, 55)
		,(56, 'Hive Titan', @AlienHivesGF, 1, 56)

	SET IDENTITY_INSERT dbo.UnitEquipment ON

	merge dbo.unitequipment as target
	using @datatable as source on target.id = source.id
	when matched then
		update set
			target.unitid = (SELECT [Id] from dbo.Units where label = source.unit and factionid = source.factionid),
			target.quantity = source.qty,
			target.EquipmentProfileId = source.equipmentid
	when not matched by source then
		delete
	when not matched by target then
		insert
			(id, unitid, quantity, equipmentprofileid)
		values
			(
				source.id,
				(SELECT [Id] from dbo.Units where label = source.unit and factionid = source.factionid),
				source.qty,
				source.equipmentid
			);

	set identity_insert dbo.unitequipment off

	DECLARE @MaxID INT
	SELECT @MaxID = MAX(ID) from dbo.UnitEquipment

	DBCC CHECKIDENT ('UnitEquipment', RESEED, @MaxID)	
END
