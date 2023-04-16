CREATE PROCEDURE ref.[sp_merge_psychicspells]
AS
BEGIN

    DECLARE @datatable table (id int identity(1,1), factionId int, label nvarchar(75), roll tinyint, description nvarchar(max))
    
    insert into @datatable
        (factionId, label, roll, description)
        exec ref.sp_datatable_psychicspells_alienhives

    SET IDENTITY_INSERT ref.PsychicSpells ON

	MERGE ref.psychicspells TARGET
    USING @datatable AS SOURCE
    ON TARGET.Id = SOURCE.id 
    WHEN MATCHED THEN
        UPDATE SET 
            target.factionid = source.factionid,
            TARGET.Label = SOURCE.LABEL, 
            target.roll = source.roll,
            TARGET.Description = SOURCE.description
    WHEN NOT MATCHED BY TARGET THEN
        INSERT (
            ID, 
            FactionId,
            Label, 
            Roll,
            Description
        ) 
        VALUES (
            SOURCE.id,
            Source.FactionId,
            SOURCE.label, 
            source.roll,
            SOURCE.description
        )
    WHEN NOT MATCHED BY SOURCE THEN
        DELETE;

    SET IDENTITY_INSERT ref.PsychicSpells OFF

    DECLARE @MaxID INT
    SELECT @MaxID = MAX(Id) FROM ref.PsychicSpells

    DBCC CHECKIDENT ('ref.PsychicSpells', RESEED, @MaxID)
END