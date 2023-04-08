CREATE PROCEDURE ref.[sp_datatable_factionupgradegroupequipment_alienhives]
as
begin
	declare @result table (tbl nchar(1), page tinyint, groupname nvarchar(75), equipment nvarchar(75), range nvarchar(5) null, attacks tinyint, cost smallint)

	insert into @result
		(tbl, page, groupname, equipment, range, attacks, cost)
	values
		('a', 1, 'replace any razor claws:', 'serrated claws', null, 3, -5)
		,('a', 1, 'replace any razor claws:', 'piercing claws', null, 6, 5)
		,('a', 1, 'replace any razor claws:', 'razor whip', null, 3, 5)
		,('a', 1, 'replace any razor claws:', 'sword claws', null, 3, 20)
		,('a', 1, 'replace any razor claws:', 'smashing claws', null, 6, 20)
		,('a', 1, 'replace one razor claws:', 'spitter cannon', '24"', 2, 5)
		,('a', 1, 'replace one razor claws:', 'shredder cannon', '18"', 6, 15)
		,('a', 1, 'replace one razor claws:', 'heavy ravager cannon', '15"', 6, 30)
		,('a', 1, 'replace one razor claws:', 'barb cannon', '36"', 1, 45)
		,('a', 1, 'replace one razor claws:', 'acid cannon', '36"', 1, 110)
		,('a', 1, 'upgrade with any:', 'hive conduit', null, 0, 25)
		,('a', 1, 'upgrade with any:', 'bio-recovery', null, 0, 110)
		,('a', 1, 'upgrade with any:', 'wings', null, 0, 95)
		,('b', 1, 'upgrade with any:', 'hive protector', null, 0, 70)
		,('b', 1, 'upgrade with any:', 'brood leader', null, 0, 65)
		,('c', 1, 'replace one razor claws:', 'spitter gun', '24"', 1, -5)
		,('c', 1, 'replace one razor claws:', 'twin spine guns', '12"', 4, 0)
		,('c', 1, 'replace one razor claws:', 'shredder gun', '18"', 3, 5)
		,('c', 1, 'replace one razor claws:', 'heavy ravager gun', '18"', 3, 5)
		,('c', 1, 'replace one razor claws:', 'barb gun', '30"', 1, 10)
		,('c', 1, 'replace one razor claws:', 'acid launcher', '30"', 1, 30)
		,('c', 1, 'upgrade with any:', 'bio-recovery', null, 0, 30)
		,('c', 1, 'upgrade with any:', 'wings', null, 0, 35)
		,('d', 1, 'replace any razor claws:', 'serrated claws', null, 2, -5)
		,('d', 1, 'replace any razor claws:', 'piercing claws', null, 3, 5)
		,('d', 1, 'replace any razor claws:', 'razor whip', null, 2, 5)
		,('d', 1, 'replace any razor claws:', 'sword claws', null, 2, 15)
		,('d', 1, 'replace any razor claws:', 'smashing claws', null, 4, 15)
		,('e', 1, 'upgrade all models with any:', 'heavy bite', null, 0, 15)
		,('e', 1, 'upgrade all models with any:', 'adrenaline', null, 0, 20)
		,('e', 1, 'upgrade all models with any:', 'toxic cysts', null, 0, 40)
		,('f', 1, 'replace up to two razor claws:', 'serrated claws', null, 1, 5)
		,('f', 1, 'replace up to two razor claws:', 'piercing claws', null, 2, 5)
		,('f', 1, 'replace up to two razor claws:', 'sword claws', null, 1, 5)
		,('f', 1, 'replace up to two razor claws:', 'smashing claws', null, 2, 5)
		,('g', 1, 'replace all bio-borers:', 'bio-spiner', '6"', 2, -10)
		,('g', 1, 'replace all bio-borers:', 'bio-ravager', '18"', 2, 20)
		,('g', 1, 'replace up to two bio-borers:', 'bio-flamer', '6"', 6, 5)
		,('g', 1, 'replace up to two bio-borers:', 'bio-fuser', '6"', 1, 5)
		,('g', 1, 'replace up to two bio-borers:', 'bio-plasma', '12"', 1, 5)
		,('g', 1, 'replace up to two bio-borers:', 'bio-shredder', '9"', 3, 5)
		,('g', 1, 'replace up to two bio-borers:', 'bio-spiker', '18"', 1, 15)
		,('h', 1, 'upgrade one model with:', 'mind snatcher', null, 0, 25)
		,('i', 1, 'replace any razor claws:', 'piercing claws', null, 3, 5)
		,('i', 1, 'replace any razor claws:', 'smashing claws', null, 3, 15)
		,('i', 1, 'replace any razor claws:', 'serrated claws', null, 2, 10)
		,('i', 1, 'replace any razor claws:', 'razor whip', null, 2, 15)
		,('i', 1, 'replace any razor claws:', 'sword claws', null, 2, 25)
		,('j', 1, 'any model may replace one razor claws:', 'twin spine guns', '12"', 4, 5)
		,('j', 1, 'any model may replace one razor claws:', 'ravager gun', '18"', 3, 5)
		,('j', 1, 'any model may replace one razor claws:', 'spitter gun', '24"', 1, 5)
		,('j', 1, 'replace one ravager gun:', 'shredder gun', '18"', 3, 5)
		,('j', 1, 'replace one ravager gun:', 'heavy ravager gun', '18"', 3, 10)
		,('j', 1, 'replace one ravager gun:', 'barb gun', '30"', 1, 10)
		,('j', 1, 'replace one ravager gun:', 'acid launcher', '30"', 1, 35)
		,('j', 1, 'upgrade all models with:', 'wings', null, 0, 55)
		,('k', 1, 'any model may replace one razor claws:', 'heavy ravager gun', '18"', 3, 25)
		,('k', 1, 'any model may replace one razor claws:', 'shock harpoon', '24"', 1, 30)
		,('k', 1, 'any model may replace one razor claws:', 'skewer cannon', '30"', 2, 55)
		,('l', 1, 'upgrade all models with any:', 'burrow attack', null, 0, 5)
		,('l', 1, 'upgrade all models with any:', 'spine shooters', '12"', 4, 15)
		,('m', 1, 'upgrade all models with one:', 'rapid strike', null, 0, 30)
		,('m', 1, 'upgrade all models with one:', 'tunnel attack', null, 0, 30)
		,('n', 1, 'upgrade all models with:', 'bio-recovery', null, 0, 40)
		,('o', 1, 'upgrade with:', 'takedown', null, 0, 30)
	select
		fug.Id as FactionUpgradeGroupid,
		e.Id as equipmentid,
		r.range,
		r.attacks,
		r.cost
	from
		@result r
			inner join ref.FactionUpgrades fu on r.page = fu.Page and r.tbl = fu.Code
			inner join ref.Factions f on fu.FactionId = f.Id and f.Label = 'alien hives'
			inner join ref.games g on f.GameId = g.Id and g.Short = 'gf'
			inner join ref.FactionUpgradeGroups fug on fug.FactionUpgradeId = fu.Id and fug.Label = r.groupname
			inner join ref.Equipment e on e.Label = r.equipment
end
