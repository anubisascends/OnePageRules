CREATE PROCEDURE ref.[sp_merge_equipment]
AS
BEGIN

	-- grab all of the equipment found across the rules
	-------------------------------
	declare @premix table (label nvarchar(75))

	insert into @premix
		(label)
	exec ref.sp_datatable_equipment_alienhives

	insert into @premix
		(label)
	exec ref.sp_datatable_equipment_battlebrothers
	-------------------------------

	-- this is the actual datatable that will contain all of the id and information
	-------------------------------
	declare @datatable table (id int identity(1,1), label nvarchar(75))

	insert into @datatable
		(label)
	select distinct * from @premix order by label
	-------------------------------

	-- begin the merge into the table

	SET IDENTITY_INSERT ref.Equipment ON

	MERGE ref.Equipment AS Target
	USING @DataTable as Source ON Target.Id = Source.Id
	WHEN MATCHED THEN
		UPDATE SET
			Target.Label = Source.Label
	WHEN NOT MATCHED BY SOURCE THEN
		DELETE
	WHEN NOT MATCHED BY TARGET THEN
		INSERT
			(ID, Label)
		VALUES
			(Source.Id, Source.Label);

	SET IDENTITY_INSERT ref.Equipment OFF

	DECLARE @MaxID INT
	SELECT @MaxID = MAX(ID) from ref.Equipment

	DBCC CHECKIDENT ('ref.Equipment', RESEED, @MaxID)
END