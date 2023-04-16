CREATE PROCEDURE ref.[sp_merge_factionupgrades]
as
begin
	declare @datatable table (id int identity(1,1), factionid int, letter nchar(1), page tinyint)

	insert into @datatable
		(factionid, letter, page)
	exec ref.sp_datatable_factionupgrades_alienhives

	insert into @datatable
		(factionid, letter, page)
	exec ref.sp_datatable_factionupgrades_battlebrothers

	set identity_insert ref.factionupgrades on

	merge ref.factionupgrades target
	using @datatable as source
	on target.id = source.id
	when matched then
		update set 
			target.factionid = source.factionid,
			target.code = source.letter,
			target.page = source.page
	when not matched by target then
		insert
			(id, factionid, code, page)
		values
			(source.id, source.factionid, source.letter, source.page)
	when not matched by source then
		delete;

	set identity_insert ref.factionupgrades off

	DECLARE @MaxID INT
    SELECT @MaxID = MAX(Id) FROM ref.FactionUpgrades

    DBCC CHECKIDENT ('ref.FactionUpgrades', RESEED, @MaxID)
end