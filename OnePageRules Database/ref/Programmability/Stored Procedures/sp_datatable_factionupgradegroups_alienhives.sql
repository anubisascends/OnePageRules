CREATE PROCEDURE ref.[sp_datatable_factionupgradegroups_alienhives]
as
begin
	declare @result table (tbl nchar(1), page tinyint, label nvarchar(75))

	insert into @result
		(tbl, page, label)
	values
		('A', 1, 'Replace any Razor Claws:')
		,('A', 1, 'Replace any Razor Claws:')
		,('A', 1, 'Upgrade with any:')
		,('B', 1, 'Upgrade with any:')
		,('C', 1, 'Replace any Razor Claws:')
		,('C', 1, 'Upgrade with any:')
		,('D', 1, 'Replace any Razor Claws:')
		,('E', 1, 'Upgrade all models with any:')
		,('F', 1, 'Replace up to two Razor Claws:')
		,('G', 1, 'Replace all Bio-Borers:')
		,('G', 1, 'Replace up to two Bio-Borers:')
		,('H', 1, 'Upgrade one model with:')
		,('I', 1, 'Replace any Razor Claws:')
		,('J', 1, 'Any model may replace one Razor Claws:')
		,('J', 1, 'Replace one Ravager Gun:')
		,('J', 1, 'Upgrade all models with:')
		,('K', 1, 'Any model may replace one Razor Claws:')
		,('L', 1, 'Upgrade all models with any:')
		,('M', 1, 'Upgrade all models with one:')
		,('N', 1, 'Upgrade all models with:')
		,('O', 1, 'Upgrade with:')
		,('A', 2, 'Replace any Razor Claws:')
		,('B', 2, 'Upgrade with any:')
		,('C', 2, 'Replace any Razor Claws::')
		,('D', 2, 'Upgrade with any:')
		,('E', 2, 'Upgrade with any:')
		,('F', 2, 'Replace Toxic Spray:')
		,('F', 2, 'Upgrade with:')
		,('G', 2, 'Replace Shredder Bio-Artillery')
		,('H', 2, 'Upgrade with:')
		,('I', 2, 'Upgrade with one:')
		,('J', 2, 'Replace Caustic Cannon:')
		,('J', 2, 'Replace Spore Bombs:')
		,('K', 2, 'Upgrade with:')
		,('K', 2, 'Upgrade with one:')

	select
		(select fu.id from ref.FactionUpgrades fu inner join ref.Factions f on f.Id = fu.FactionId inner join ref.Games g on f.GameId = g.Id where g.Short = 'GF' and f.Label = 'Alien Hives' and fu.Code = tbl and fu.Page = page) as factionupgradeid,
		r.label
	from
		@result r

end