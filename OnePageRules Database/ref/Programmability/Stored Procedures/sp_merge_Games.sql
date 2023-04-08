CREATE PROCEDURE [ref].[sp_merge_games]
AS
BEGIN

    DECLARE @datatable table (id int identity(1,1), label nvarchar(50), short nvarchar(5))
    
    insert into @datatable
        (label, short)
    values
        ('Grimdark Future', 'GF'),
        ('Grimdark Future: Firefight', 'GFF'),
        ('Age of Fantasy', 'AoF'),
        ('Age of Fantasy: Skirmish', 'AoFS'),
        ('Age of Fantasy: Regiments', 'AoFR'),
        ('Wrafleets: FLT', 'FTL')

    SET IDENTITY_INSERT ref.Games ON

	MERGE ref.Games TARGET
    USING @datatable AS SOURCE
    ON TARGET.Id = SOURCE.id 
    WHEN MATCHED THEN
        UPDATE SET TARGET.Label = SOURCE.LABEL, TARGET.Short = SOURCE.short
    WHEN NOT MATCHED BY TARGET THEN
        INSERT (ID, Label, Short) VALUES (SOURCE.id, SOURCE.label, SOURCE.short)
    WHEN NOT MATCHED BY SOURCE THEN
        DELETE;

    SET IDENTITY_INSERT ref.Games OFF

    DECLARE @MaxID INT
    SELECT @MaxID = MAX(Id) FROM ref.Games

    DBCC CHECKIDENT ('ref.Games', RESEED, @MaxID)
END