CREATE PROCEDURE [dbo].[sp_merge_UnitSpecialRules]
AS
BEGIN
	DECLARE @DataTable TABLE ([Id] INT, Unit NVARCHAR(75), SpecialRule NVARCHAR(75), [Value] int)

	INSERT INTO @DataTable
		(Id, Unit, SpecialRule, Value)
	VALUES
		(1, 'Hive Lord', 'Fear', 0)
		,(2, 'Hive Lord', 'Fearless', 0)
		,(3, 'Hive Lord', 'Hero', 0)
		,(4, 'Hive Lord', 'Tough', 12)
		,(5, 'Snatcher Lord', 'Fast', 0)
		,(6, 'Snatcher Lord', 'Hero', 0)
		,(7, 'Snatcher Lord', 'Psychic', 1)
		,(8, 'Snatcher Lord', 'Scout', 0)
		,(9, 'Snatcher Lord', 'Strider', 0)
		,(10, 'Snatcher Lord', 'Tough', 3)
		,(11, 'Prime Warrior', 'Fearless', 0)
		,(12, 'Prime Warrior', 'Hero', 0)
		,(13, 'Prime Warrior', 'Tough', 6)
		,(14, 'Assault Grunts', 'Fast', 0)
		,(15, 'Assault Grunts', 'Strider', 0)
		,(16, 'Shooter Grunts', 'Strider', 0)
		,(17, 'Winged Grunts', 'Ambush', 0)
		,(18, 'Winged Grunts', 'Flying', 0)
		,(19, 'Soul-Snatchers', 'Fast', 0)
		,(20, 'Soul-Snatchers', 'Scout', 0)
		,(21, 'Soul-Snatchers', 'Strider', 0)
		,(22, 'Hive Warriors', 'Fearless', 0)
		,(23, 'Hive Warriors', 'Tough', 3)
		,(24, 'Hive Guardians', 'Relentless', 0)
		,(25, 'Hive Guardians', 'Tough', 3)
		,(26, 'Hive Swarm', 'Fearless', 0)
		,(27, 'Hive Swarm', 'Strider', 0)
		,(28, 'Hive Swarm', 'Tough', 3)
		,(29, 'Ravenous Beasts', 'Fast', 0)
		,(30, 'Ravenous Beasts', 'Strider', 0)
		,(31, 'Ravenous Beasts', 'Tough', 3)
		,(32, 'Synapse Floaters', 'Psychic Synapse', 0)
		,(33, 'Synapse Floaters', 'Stealth', 0)
		,(34, 'Synapse Floaters', 'Tough', 3)
		,(35, 'Venom Floaters', 'Shrouding Mist', 0)
		,(36, 'Venom Floaters', 'Stealth', 0)
		,(37, 'Venom Floaters', 'Tough', 3)
		,(38, 'Shadow Hunter', 'Ambush', 0)
		,(39, 'Shadow Hunter', 'Fast', 0)
		,(40, 'Shadow Hunter', 'Fear', 0)
		,(41, 'Shadow Hunter', 'Stealth', 0)
		,(42, 'Shadow Hunter', 'Strider', 0)
		,(43, 'Shadow Hunter', 'Tough', 6)
		,(44, 'Carnivo-Rex', 'Fear', 0)
		,(45, 'Carnivo-Rex', 'Fearless', 0)
		,(46, 'Carnivo-Rex', 'Tough', 12)
		,(47, 'Toxico-Rex', 'Fear', 0)
		,(48, 'Toxico-Rex', 'Fearless', 0)
		,(49, 'Toxico-Rex', 'Shrouding Mist', 0)
		,(50, 'Toxico-Rex', 'Stealth', 0)
		,(51, 'Toxico-Rex', 'Tough', 12)
		,(52, 'Psycho-Rex', 'Fear', 0)
		,(53, 'Psycho-Rex', 'Fearless', 0)
		,(54, 'Psycho-Rex', 'Psychic', 2)
		,(55, 'Psycho-Rex', 'Stealth', 0)
		,(56, 'Psycho-Rex', 'Tough', 12)
		,(57, 'Devourer Beast', 'Fear', 0)
		,(58, 'Devourer Beast', 'Tough', 18)
		,(59, 'Tyrant Beast', 'Fear', 0)
		,(60, 'Tyrant Beast', 'Tough', 18)
		,(61, 'Spawning Beast', 'Fear', 0)
		,(62, 'Spawning Beast', 'Spawn Brood', 0)
		,(63, 'Spawning Beast', 'Tough', 18)
		,(64, 'Artillery Beast', 'Fear', 0)
		,(65, 'Artillery Beast', 'Tough', 18)
		,(66, 'Burrower', 'Fear', 0)
		,(67, 'Burrower', 'Surprise Attack', 0)
		,(68, 'Burrower', 'Tough', 18)
		,(69, 'Flamer Beast', 'Fear', 0)
		,(70, 'Flamer Beast', 'Fearless', 0)
		,(71, 'Flamer Beast', 'Tough', 6)
		,(72, 'Mortar Beast', 'Fear', 0)
		,(73, 'Mortar Beast', 'Fearless', 0)
		,(74, 'Mortar Beast', 'Tough', 6)
		,(75, 'Invasion Carrier', 'Ambush', 0)
		,(76, 'Invasion Carrier', 'Fear', 0)
		,(77, 'Invasion Carrier', 'Fearless', 0)
		,(78, 'Invasion Carrier', 'Tough', 6)
		,(79, 'Invasion Carrier', 'Transport', 11)
		,(80, 'Invasion Artillery', 'Ambush', 0)
		,(81, 'Invasion Artillery', 'Fear', 0)
		,(82, 'Invasion Artillery', 'Fearless', 0)
		,(83, 'Invasion Artillery', 'Slow', 0)
		,(84, 'Invasion Artillery', 'Tough', 6)
		,(85, 'Hive Titan', 'Fear', 0)
		,(86, 'Hive Titan', 'Regeneration', 0)
		,(87, 'Hive Titan', 'Tough', 24)
		,(88, 'Spores', 'Explode', 1)
		,(89, 'Massive Spore', 'Explode', 3)
		,(90, 'Massive Spore', 'Tough', 3)
		,(91, 'Rapacious Beast', 'Aircraft', 0)
		,(92, 'Rapacious Beast', 'Fearless', 0)
		,(93, 'Rapacious Beast', 'Tough', 6)

	SET IDENTITY_INSERT dbo.UnitSpecialRules ON

	MERGE dbo.UnitSpecialRules AS TARGET
	USING @DataTable AS SOURCE ON TARGET.Id = SOURCE.Id
	WHEN MATCHED then
		UPDATE SET
			TARGET.UnitId = (SELECT [Id] FROM dbo.Units WHERE [Label] = SOURCE.Unit),
			TARGET.SpecialRuleId = (SELECT [Id] FROM dbo.SpecialRules WHERE [Label] = SOURCE.SpecialRule),
			TARGET.Value = Source.Value
	WHEN NOT MATCHED BY SOURCE THEN
		DELETE
	WHEN NOT MATCHED BY TARGET THEN
		INSERT
			(ID, UnitID, SpecialRuleID, Value)
		VALUES
			(
				SOURCE.ID,
				(SELECT [Id] FROM dbo.Units WHERE [Label] = SOURCE.Unit),
				(SELECT [Id] FROM dbo.SpecialRules WHERE [Label] = SOURCE.SpecialRule),
				SOURCE.Value
			);

	SET IDENTITY_INSERT dbo.UnitSpecialRules OFF

	DECLARE @MaxID INT
    SELECT @MaxID = MAX(Id) FROM dbo.UnitSpecialRules

    DBCC CHECKIDENT ('UnitSpecialRules', RESEED, @MaxID)
END