CREATE PROCEDURE ref.[sp_merge_factionupgradegroupequipment]
as
begin
	declare @datatable table (id int identity(1,1), groupid int, equipmentid int, range nvarchar(5), attacks tinyint, cost smallint)

	insert into @datatable
		(groupid, equipmentid, range, attacks, cost)
	exec ref.sp_datatable_factionupgradegroupequipment_alienhives

	set identity_insert ref.factionupgradegroupequipment on

	merge ref.factionupgradegroupequipment target
	using @datatable as source
	on target.id = source.id
	when matched then
		update set
			target.factionupgradegroupid = source.groupid,
			target.equipmentid = source.equipmentid,
			target.range = source.range,
			target.attacks = source.attacks,
			target.cost = source.cost
	when not matched by target then
		insert (id, factionupgradegroupid, equipmentid, range, attacks, cost)
		values
			(
				source.id,
				source.groupid,
				source.equipmentid,
				source.range,
				source.attacks,
				source.cost
			)
	when not matched by source then
		delete;

	set identity_insert ref.factionupgradegroupequipment off

	DECLARE @MaxID INT
    SELECT @MaxID = MAX(Id) FROM ref.FactionUpgradeGroupEquipment

    DBCC CHECKIDENT ('ref.FactionUpgradeGroupEquipment', RESEED, @MaxID)
end
