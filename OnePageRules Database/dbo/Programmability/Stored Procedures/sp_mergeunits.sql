CREATE PROCEDURE [dbo].[sp_mergeunits]
AS
BEGIN
    DECLARE @DataTable TABLE
    (
        ID INT,
        FactionId INT,
        Label varchar(75),
        Qty TINYINT,
        Quality TINYINT,
        Defense TINYINT,
        Cost SMALLINT
    )
    
    INSERT INTO @DataTable
        (ID, FactionId, Label, Qty, Quality, Defense, Cost)
    VALUES
        (1,1,'Hive Lord',1,3,2,325),
        (2,1,'Snatcher Lord',1,3,4,120),
        (3,1,'Prime Warrior',1,4,4,95),
        (4,1,'Assault Grunts',10,5,5,130),
        (5,1,'Shooter Grunts',10,5,5,130),
        (6,1,'Winged Grunts',10,5,5,160),
        (7,1,'Soul-Snatchers',5,3,4,195),
        (8,1,'Hive Warriors',3,4,4,145),
        (9,1,'Hive Guardians',3,3,3,180),
        (10,1,'Hive Swarm',3,6,6,70),
        (11,1,'Ravenous Beasts',3,4,4,175),
        (12,1,'Synapse Floaters',3,4,4,205),
        (13,1,'Venom Floaters',3,4,4,215),
        (14,1,'Shadow Hunter',1,3,4,195),
        (15,1,'Carnivo-Rex',1,4,2,275),
        (16,1,'Toxico-Rex',1,4,2,395),
        (17,1,'Psycho-Rex',1,4,2,355),
        (18,1,'Devourer Beast',1,3,2,525),
        (19,1,'Tyrant Beast',1,3,2,535),
        (20,1,'Artillery Beast',1,3,2,570),
        (21,1,'Spawning Beast',1,3,2,645),
        (22,1,'Burrower',1,3,2,540),
        (23,1,'Flamer Beast',1,4,2,175),
        (24,1,'Mortar Beast',1,4,2,220),
        (25,1,'Invasion Carrier',1,4,2,190),
        (26,1,'Invasion Artillery',1,4,2,225),
        (27,1,'Rapacious Beast',1,4,2,170),
        (28,1,'Hive Titan',1,3,2,735),
        (29,1,'Spores',3,6,6,45),
        (30,1,'Massive Spore',1,6,6,45)  

    SET IDENTITY_INSERT dbo.Units ON

    MERGE dbo.Units AS TARGET
    USING @DataTable as SOURCE ON TARGET.ID = Source.ID
    WHEN MATCHED THEN
        UPDATE SET
            TARGET.FactionId = Source.FactionId,
            TARGET.Label = Source.Label,
            TARGET.Qty = Source.Qty,
            TARGET.Quality = Source.Quality,
            TARGET.Defense = Source.Defense,
            TARGET.Cost = Source.Cost
    WHEN NOT MATCHED BY SOURCE THEN
        DELETE
    WHEN NOT MATCHED BY TARGET THEN
        INSERT 
            (ID, FactionId, Label, Qty, Quality, Defense, Cost)
        VALUES
            (SOURCE.ID, SOURCE.FactionId, SOURCE.Label, SOURCE.Qty, SOURCE.Quality, SOURCE.Defense, SOURCE.Cost);

    SET IDENTITY_INSERT dbo.Units OFF

    DECLARE @MaxID INT
    SELECT @MaxID = MAX(Id) FROM dbo.Units

    DBCC CHECKIDENT ('Units', RESEED, @MaxID)
END
