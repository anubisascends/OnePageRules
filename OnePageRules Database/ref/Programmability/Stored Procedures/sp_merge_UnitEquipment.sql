CREATE PROCEDURE ref.[sp_merge_unitequipment]
as
begin
	-- grab all of the equipment found across the rules
	-------------------------------
	declare @premix table (unitid int, equipmentid int, qty tinyint, range nvarchar(5), attacks tinyint)

	insert into @premix
		(unitid, equipmentid, qty, range, attacks)
	exec ref.sp_datatable_unitequipment_alienhives

	insert into @premix
		(unitid, equipmentid, qty, range, attacks)
	exec ref.sp_datatable_unitequipment_battlebrothers
	-------------------------------

	-- this is the actual datatable that will contain all of the id and information
	-------------------------------
	declare @datatable table (id int identity(1,1), unitid int, equipmentid int, qty tinyint, range nvarchar(5), attacks tinyint)

	insert into @datatable
		(unitid, equipmentid, qty, range, attacks)
	select distinct * from @premix order by unitid, equipmentid, qty
	-------------------------------

	SET IDENTITY_INSERT ref.UnitEquipment ON

	MERGE ref.unitequipment TARGET
    USING @datatable AS SOURCE
    ON TARGET.Id = SOURCE.id 
    WHEN MATCHED THEN
        UPDATE SET 
			target.unitid = source.unitid,
			target.equipmentid = source.equipmentid,
			target.quantity = source.qty,
			target.range = source.range,
			target.attacks = source.attacks
    WHEN NOT MATCHED BY TARGET THEN
        INSERT 
			(id,unitid,equipmentid, quantity,range,attacks) 
		VALUES 
			(
				source.id,
				source.unitid,
				source.equipmentid,
				source.qty,
				source.range,
				source.attacks
			)
    WHEN NOT MATCHED BY SOURCE THEN
        DELETE;

    SET IDENTITY_INSERT ref.unitequipment OFF

    DECLARE @MaxID INT
    SELECT @MaxID = MAX(Id) FROM ref.unitequipment

    DBCC CHECKIDENT ('ref.unitequipment', RESEED, @MaxID)
end