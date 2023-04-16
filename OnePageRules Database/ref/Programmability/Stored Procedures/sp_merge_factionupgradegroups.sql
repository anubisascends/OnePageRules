CREATE PROCEDURE ref.[sp_merge_factionupgradegroups]
as
begin
	declare @datatable table (id int identity(1,1), factionupgradeid int, label nvarchar(75))

	insert into @datatable
		(factionupgradeid, label)
	exec ref.sp_datatable_factionupgradegroups_alienhives

	set identity_insert ref.factionupgradegroups on

	merge ref.factionupgradegroups target
	using @datatable as source
	on target.id = source.id
	when matched then
		update set
			target.factionupgradeid = source.factionupgradeid,
			target.label = source.label
	when not matched by target then
		insert 
			(id, factionupgradeid, label)
		values
			(source.id, source.factionupgradeid, source.label)
	when not matched by source then
		delete;

	set identity_insert ref.factionupgradegroups off

	DECLARE @MaxID INT
    SELECT @MaxID = MAX(Id) FROM ref.FactionUpgradeGroups

    DBCC CHECKIDENT ('ref.FactionUpgradeGroups', RESEED, @MaxID)

end