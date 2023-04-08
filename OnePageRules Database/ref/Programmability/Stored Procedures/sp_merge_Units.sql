CREATE PROCEDURE ref.[sp_merge_units]
as
begin
	-- grab all of the units found across the rules
	-------------------------------
	declare @premix table (factionid int,label nvarchar(75), qty tinyint, quality tinyint, defense tinyint, cost smallint)

	insert into @premix
		(factionid, label, qty, quality, defense, cost)
	exec ref.sp_datatable_units_alienhives

	insert into @premix
		(factionid, label, qty, quality, defense, cost)
	exec ref.sp_datatable_units_battlebrothers
	-------------------------------

	-- this is the actual datatable that will contain all of the id and information
	-------------------------------
	declare @datatable table (id int identity(1,1), factionid int,label nvarchar(75), qty tinyint, quality tinyint, defense tinyint, cost smallint)

	insert into @datatable
		(factionid ,label , qty , quality , defense , cost )
	select * from @premix order by factionid, label
	-------------------------------

	SET IDENTITY_INSERT ref.Units ON

	MERGE ref.units TARGET
    USING @datatable AS SOURCE
    ON TARGET.Id = SOURCE.id 
    WHEN MATCHED THEN
        UPDATE SET 
			target.factionid = source.factionid,
			TARGET.Label = SOURCE.LABEL, 
			target.quantity = source.qty,
			target.quality = source.quality,
			target.defense = source.defense,
			target.cost = source.cost
    WHEN NOT MATCHED BY TARGET THEN
        INSERT 
			(id, factionid, label, quantity, quality, defense, cost) 
		VALUES 
			(
				source.id,
				source.factionid,
				source.label,
				source.qty,
				source.quality,
				source.defense,
				source.cost
			)
    WHEN NOT MATCHED BY SOURCE THEN
        DELETE;

    SET IDENTITY_INSERT ref.Units OFF

    DECLARE @MaxID INT
    SELECT @MaxID = MAX(Id) FROM ref.Units

    DBCC CHECKIDENT ('ref.Units', RESEED, @MaxID)
end
