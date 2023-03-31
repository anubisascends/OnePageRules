CREATE PROCEDURE [dbo].[sp_merge_Units]
AS
BEGIN
	DECLARE @DataTable TABLE ([Id] INT, [FactionId] INT, [Label] NVARCHAR(75), [Quantity] TINYINT, Quality tinyint, Defense tinyint, Cost smallint)

	DECLARE @AlienHives INT

	SELECT @AlienHives = F.Id FROM dbo.Factions F JOIN dbo.Games G ON F.GameId = G.Id where G.Short = 'GF' and F.Label = 'Alien Hives'

	INSERT INTO @DataTable
		([Id], [FactionId], [Label], [Quantity], Quality, Defense, Cost)
	VALUES
        -- Alien Hives (GF)
		(1,@AlienHives,'Hive Lord',1,3,2,325),
        (2,@AlienHives,'Snatcher Lord',1,3,4,120),
        (3,@AlienHives,'Prime Warrior',1,4,4,95),
        (4,@AlienHives,'Assault Grunts',10,5,5,130),
        (5,@AlienHives,'Shooter Grunts',10,5,5,130),
        (6,@AlienHives,'Winged Grunts',10,5,5,160),
        (7,@AlienHives,'Soul-Snatchers',5,3,4,195),
        (8,@AlienHives,'Hive Warriors',3,4,4,145),
        (9,@AlienHives,'Hive Guardians',3,3,3,180),
        (10,@AlienHives,'Hive Swarm',3,6,6,70),
        (11,@AlienHives,'Ravenous Beasts',3,4,4,175),
        (12,@AlienHives,'Synapse Floaters',3,4,4,205),
        (13,@AlienHives,'Venom Floaters',3,4,4,215),
        (14,@AlienHives,'Shadow Hunter',1,3,4,195),
        (15,@AlienHives,'Carnivo-Rex',1,4,2,275),
        (16,@AlienHives,'Toxico-Rex',1,4,2,395),
        (17,@AlienHives,'Psycho-Rex',1,4,2,355),
        (18,@AlienHives,'Devourer Beast',1,3,2,525),
        (19,@AlienHives,'Tyrant Beast',1,3,2,535),
        (20,@AlienHives,'Artillery Beast',1,3,2,570),
        (21,@AlienHives,'Spawning Beast',1,3,2,645),
        (22,@AlienHives,'Burrower',1,3,2,540),
        (23,@AlienHives,'Flamer Beast',1,4,2,175),
        (24,@AlienHives,'Mortar Beast',1,4,2,220),
        (25,@AlienHives,'Invasion Carrier',1,4,2,190),
        (26,@AlienHives,'Invasion Artillery',1,4,2,225),
        (27,@AlienHives,'Rapacious Beast',1,4,2,170),
        (28,@AlienHives,'Hive Titan',1,3,2,735),
        (29,@AlienHives,'Spores',3,6,6,45),
        (30,@AlienHives,'Massive Spore',1,6,6,45) 
		

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
