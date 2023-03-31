CREATE PROCEDURE [dbo].[sp_merge_Units]
AS
BEGIN
	DECLARE @DataTable TABLE ([Id] INT, [FactionId] INT, [Label] NVARCHAR(75), [Quantity] TINYINT, Quality tinyint, Defense tinyint, Cost smallint)

	DECLARE @AlienHivesGF INT,
            @BattleBrothersGF INT

	SELECT @AlienHivesGF= F.Id FROM dbo.Factions F JOIN dbo.Games G ON F.GameId = G.Id where G.Short = 'GF' and F.Label = 'Alien Hives'
    SELECT @BattleBrothersGF = F.Id FROM dbo.Factions F JOIN dbo.Games G ON F.GameId = G.Id where G.Short = 'GF' and F.Label = 'Battle Brothers'

	INSERT INTO @DataTable
		([Id], [FactionId], [Label], [Quantity], Quality, Defense, Cost)
	VALUES
        -- Alien Hives (GF)
		(1,@AlienHivesGF,'Hive Lord',1,3,2,325)
        ,(2,@AlienHivesGF,'Snatcher Lord',1,3,4,120)
        ,(3,@AlienHivesGF,'Prime Warrior',1,4,4,95)
        ,(4,@AlienHivesGF,'Assault Grunts',10,5,5,130)
        ,(5,@AlienHivesGF,'Shooter Grunts',10,5,5,130)
        ,(6,@AlienHivesGF,'Winged Grunts',10,5,5,160)
        ,(7,@AlienHivesGF,'Soul-Snatchers',5,3,4,195)
        ,(8,@AlienHivesGF,'Hive Warriors',3,4,4,145)
        ,(9,@AlienHivesGF,'Hive Guardians',3,3,3,180)
        ,(10,@AlienHivesGF,'Hive Swarm',3,6,6,70)
        ,(11,@AlienHivesGF,'Ravenous Beasts',3,4,4,175)
        ,(12,@AlienHivesGF,'Synapse Floaters',3,4,4,215)
        ,(13,@AlienHivesGF,'Venom Floaters',3,4,4,225)
        ,(14,@AlienHivesGF,'Shadow Hunter',1,3,4,205)
        ,(15,@AlienHivesGF,'Carnivo-Rex',1,4,2,275)
        ,(16,@AlienHivesGF,'Toxico-Rex',1,4,2,430)
        ,(17,@AlienHivesGF,'Psycho-Rex',1,4,2,395)
        ,(18,@AlienHivesGF,'Devourer Beast',1,3,2,525)
        ,(19,@AlienHivesGF,'Tyrant Beast',1,3,2,535)
        ,(20,@AlienHivesGF,'Artillery Beast',1,3,2,570)
        ,(21,@AlienHivesGF,'Spawning Beast',1,3,2,645)
        ,(22,@AlienHivesGF,'Burrower',1,3,2,540)
        ,(23,@AlienHivesGF,'Flamer Beast',1,4,2,195)
        ,(24,@AlienHivesGF,'Mortar Beast',1,4,2,220)
        ,(25,@AlienHivesGF,'Invasion Carrier',1,4,2,190)
        ,(26,@AlienHivesGF,'Invasion Artillery',1,4,2,225)
        ,(27,@AlienHivesGF,'Rapacious Beast',1,4,2,265)
        ,(28,@AlienHivesGF,'Hive Titan',1,3,2,805)
        ,(29,@AlienHivesGF,'Spores',3,6,6,45)
        ,(30,@AlienHivesGF,'Massive Spore',1,6,6,45) 

        -- Battle Brothers (GF)
        ,(31, @BattleBrothersGF, 'Master Brother',  1, 3, 3, 55)
        ,(32, @BattleBrothersGF, 'Elite Pathfinder', 1, 4, 4, 45)
        ,(33, @BattleBrothersGF, 'Pathfinders', 5, 4, 4, 115)
        ,(34, @BattleBrothersGF, 'Assault Brothers', 5, 3, 3, 140)
        ,(35, @BattleBrothersGF, 'Battle Brothers', 5, 3, 3, 145)
        ,(36, @BattleBrothersGF, 'Support Brothers', 3, 3, 3, 165)
        ,(37, @BattleBrothersGF, 'Destroyers', 3, 3, 3, 255)
        ,(38, @BattleBrothersGF, 'Pathfinder Bikers', 3, 4, 4, 220)
        ,(39, @BattleBrothersGF, 'Brother Bikers', 3, 3, 3, 270)
        ,(40, @BattleBrothersGF, 'Support Bike', 1, 3, 3, 180)
        ,(41, @BattleBrothersGF, 'APC', 1, 3, 2, 225)
        ,(42, @BattleBrothersGF, 'Attack APC', 1, 3, 2, 240)
        ,(43, @BattleBrothersGF, 'Drop Pod', 1, 3, 2, 145)
        ,(44, @BattleBrothersGF, 'Battle Tank', 1, 3, 2, 490)
        ,(45, @BattleBrothersGF, 'Heavy Tank', 1, 3, 2, 640)
        ,(46, @BattleBrothersGF, 'Artillery Gun', 1, 3, 2, 260)
        ,(47, @BattleBrothersGF, 'Attack Speeder', 1, 3, 2, 260)
        ,(48, @BattleBrothersGF, 'Heavy Exo-Suit', 1, 3, 2, 185)
        ,(49, @BattleBrothersGF, 'Attack Walker', 1, 3, 2, 330)
        ,(50, @BattleBrothersGF, 'Light Gunship', 1, 3, 2, 335)
        ,(51, @BattleBrothersGF, 'Heavy Gunship', 1, 3, 2, 545)
		

	SET IDENTITY_INSERT dbo.Units ON

    MERGE dbo.Units AS TARGET
    USING @DataTable as SOURCE ON TARGET.Id = Source.ID
    WHEN MATCHED THEN
        UPDATE SET
            TARGET.FactionId = Source.FactionId,
            TARGET.Label = Source.Label,
            TARGET.Quantity = Source.Quantity,
            TARGET.Quality = Source.Quality,
            TARGET.Defense = Source.Defense,
            TARGET.Cost = Source.Cost
    WHEN NOT MATCHED BY SOURCE THEN
        DELETE
    WHEN NOT MATCHED BY TARGET THEN
        INSERT 
            (ID, FactionId, Label, Quantity, Quality, Defense, Cost)
        VALUES
            (SOURCE.ID, SOURCE.FactionId, SOURCE.Label, SOURCE.Quantity, SOURCE.Quality, SOURCE.Defense, SOURCE.Cost);

    SET IDENTITY_INSERT dbo.Units OFF

    DECLARE @MaxID INT
    SELECT @MaxID = MAX(Id) FROM dbo.Units

    DBCC CHECKIDENT ('Units', RESEED, @MaxID)

END
