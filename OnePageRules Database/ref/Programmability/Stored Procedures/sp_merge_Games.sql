CREATE PROCEDURE [dbo].[sp_merge_Games]
AS
BEGIN

    SET IDENTITY_INSERT dbo.Games ON

	MERGE dbo.Games TARGET
    USING 
    (
      VALUES
        (1, 'Grimdark Future', 'GF'),
        (2, 'Grimdark Future: Firefight', 'GFF'),
        (3, 'Age of Fantasy', 'AoF'),
        (4, 'Age of Fantasy: Skirmish', 'AoFS'),
        (5, 'Age of Fantasy: Regiments', 'AoFR'),
        (6, 'Wrafleets: FLT', 'FTL')
    )AS SOURCE
    (
        [Id],
        [Label],
        [Short]
    )ON TARGET.Id = SOURCE.Id 
    WHEN MATCHED THEN
        UPDATE SET TARGET.Label = SOURCE.LABEL, TARGET.Short = SOURCE.Short
    WHEN NOT MATCHED BY TARGET THEN
        INSERT (ID, Label, Short) VALUES (SOURCE.ID, SOURCE.LABEL, SOURCE.Short)
    WHEN NOT MATCHED BY SOURCE THEN
        DELETE;

    SET IDENTITY_INSERT dbo.Games OFF

    DECLARE @MaxID INT
    SELECT @MaxID = MAX(Id) FROM dbo.Games

    DBCC CHECKIDENT ('Games', RESEED, @MaxID)
END