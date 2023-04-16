CREATE PROCEDURE ref.[sp_merge_factionupgradegroupequipmentspecialrules]
as
begin
	declare @datatable table (id int identity(1,1), fugeid int, srid int, value tinyint)

	insert into @datatable
		(fugeid, srid, value)
	exec ref.sp_datatable_factionupgradegroupequipmentspecialrules_alienhives

	set identity_insert ref.factionupgradegroupequipmentspecialrules on

	merge ref.factionupgradegroupequipmentspecialrules target
	using @datatable as source
	on target.id = source.id
	when matched then
		update set
			target.factionupgradegroupequipmentid = source.fugeid,
			target.specialruleid = source.srid,
			target.value = source.value
	when not matched by target then
		insert 
			(id, factionupgradegroupequipmentid, specialruleid, value)
		values
			(
				source.id,
				source.fugeid,
				source.srid,
				source.value
			)
	when not matched by source then
		delete;

	set identity_insert ref.factionupgradegroupequipmentspecialrules off

	DECLARE @MaxID INT
    SELECT @MaxID = MAX(Id) FROM ref.FactionUpgradeGroupEquipmentSpecialRules

    DBCC CHECKIDENT ('ref.FactionUpgradeGroupEquipmentSpecialRules', RESEED, @MaxID)
end