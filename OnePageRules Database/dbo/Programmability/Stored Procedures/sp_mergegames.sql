CREATE PROCEDURE [dbo].[sp_mergegames]
AS
BEGIN

    DECLARE @DataTable TABLE 
    (ID int,
     LABEL varchar(50),
     ShortLabel VARCHAR(5)
    )

    INSERT INTO @DataTable
        (ID, LABEL, ShortLabel)
    VALUES
        (1, 'Grimdark Future', 'GF'),
        (2, 'Grimdark Future: Firefight', 'GFF'),
        (3, 'Age of Fantasy', 'AoF'),
        (4, 'Age of Fantasy: Skirmish', 'AoFS'),
        (5, 'Age of Fantasy: Regiments', 'AoFR'),
        (6, 'Warfleets: FTL', 'FTL')

    SET IDENTITY_INSERT dbo.Games ON

    MERGE dbo.Games TARGET
    USING @DataTable SOURCE ON TARGET.ID = SOURCE.ID 
    WHEN MATCHED THEN
        UPDATE SET TARGET.Label = SOURCE.LABEL, TARGET.ShortLabel = SOURCE.ShortLabel
    WHEN NOT MATCHED BY TARGET THEN
        INSERT (ID, Label, ShortLabel) VALUES (SOURCE.ID, SOURCE.LABEL, SOURCE.ShortLabel)
    WHEN NOT MATCHED BY SOURCE THEN
        DELETE;

    SET IDENTITY_INSERT dbo.Games OFF

    DECLARE @MaxID INT
    SELECT @MaxID = MAX(Id) FROM dbo.Games

    DBCC CHECKIDENT ('Games', RESEED, @MaxID)
END
GO
