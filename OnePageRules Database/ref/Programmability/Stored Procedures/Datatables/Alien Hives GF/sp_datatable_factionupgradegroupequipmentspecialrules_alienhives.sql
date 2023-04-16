﻿CREATE PROCEDURE ref.[sp_datatable_factionupgradegroupequipmentspecialrules_alienhives]
as
begin
	declare @result table (tbl nchar(1), page tinyint, groupname nvarchar(75), equipment nvarchar(75), specialrule nvarchar(75), value tinyint )

	insert into @result
		(tbl, page, groupname, equipment, specialrule, value)
	values
		('a', 1, 'replace any razor claws:', 'serrated claws', 'blast', 3)
		,('a', 1, 'replace any razor claws:', 'piercing claws', 'ap', 1)
		,('a', 1, 'replace any razor claws:', 'piercing claws', 'rending', 0)
		,('a', 1, 'replace any razor claws:', 'razor whip', 'rending', 0)
		,('a', 1, 'replace any razor claws:', 'razor whip', 'deadly', 3)
		,('a', 1, 'replace any razor claws:', 'sword claws', 'ap', 2)
		,('a', 1, 'replace any razor claws:', 'sword claws', 'deadly', 0)
		,('a', 1, 'replace any razor claws:', 'smashing claws', 'ap', 4)
		,('a', 1, 'replace one razor claws:', 'spitter cannon', 'blast', 3)
		,('a', 1, 'replace one razor claws:', 'shredder cannon', 'rending', 0)
		,('a', 1, 'replace one razor claws:', 'heavy ravager cannon', 'ap', 2)
		,('a', 1, 'replace one razor claws:', 'barb cannon', 'blast', 6)
		,('a', 1, 'replace one razor claws:', 'barb cannon', 'ap', 1)
		,('a', 1, 'replace one razor claws:', 'acid cannon', 'ap', 3)
		,('a', 1, 'replace one razor claws:', 'acid cannon', 'deadly', 6)
		,('a', 1, 'replace one razor claws:', 'acid cannon', 'lock-on', 0)
		,('a', 1, 'upgrade with any:', 'hive conduit', 'psychic', 1)
		,('a', 1, 'upgrade with any:', 'bio-recovery', 'regeneration', 0)
		,('a', 1, 'upgrade with any:', 'wings', 'ambush', 0)
		,('a', 1, 'upgrade with any:', 'wings', 'fly', 0)
		,('b', 1, 'upgrade with any:', 'hive protector', 'psy-barrier', 0)
		,('b', 1, 'upgrade with any:', 'brood leader', 'pheromones', 0)
		,('c', 1, 'replace one razor claws:', 'spitter gun', 'blast', 3)
		,('c', 1, 'replace one razor claws:', 'twin spine guns', 'ap', 1)
		,('c', 1, 'replace one razor claws:', 'shredder gun', 'rending', 0)
		,('c', 1, 'replace one razor claws:', 'heavy ravager gun', 'ap',2)
		,('c', 1, 'replace one razor claws:', 'barb gun', 'blast',3)
		,('c', 1, 'replace one razor claws:', 'barb gun', 'ap',1)
		,('c', 1, 'replace one razor claws:', 'acid launcher', 'ap', 3)
		,('c', 1, 'replace one razor claws:', 'acid launcher', 'deadly', 3)
		,('c', 1, 'replace one razor claws:', 'acid launcher', 'lock-on', 0)
		,('c', 1, 'upgrade with any:', 'bio-recovery', 'regeneration', 0)
		,('c', 1, 'upgrade with any:', 'wings', 'ambush', 0)
		,('c', 1, 'upgrade with any:', 'wings', 'flying', 0)
		,('d', 1, 'replace any razor claws:', 'serrated claws', 'blast',3)
		,('d', 1, 'replace any razor claws:', 'piercing claws', 'ap', 1)
		,('d', 1, 'replace any razor claws:', 'piercing claws', 'rending', 0)
		,('d', 1, 'replace any razor claws:', 'razor whip', 'rending', 0 )
		,('d', 1, 'replace any razor claws:', 'razor whip', 'deadly', 3 )
		,('d', 1, 'replace any razor claws:', 'sword claws', 'ap', 2)
		,('d', 1, 'replace any razor claws:', 'sword claws', 'deadly', 3 )
		,('d', 1, 'replace any razor claws:', 'smashing claws', 'ap', 4)
		,('e', 1, 'upgrade all models with any:', 'heavy bite', 'furious', 0)
		,('e', 1, 'upgrade all models with any:', 'adrenaline', 'no retreat', 0)
		,('e', 1, 'upgrade all models with any:', 'toxic cysts', 'poison', 0)
		,('f', 1, 'replace up to two razor claws:', 'serrated claws','blast',3)
		,('f', 1, 'replace up to two razor claws:', 'piercing claws', 'ap', 1)
		,('f', 1, 'replace up to two razor claws:', 'piercing claws', 'render', 0)
		,('f', 1, 'replace up to two razor claws:', 'sword claws', 'ap',2)
		,('f', 1, 'replace up to two razor claws:', 'sword claws', 'deadly', 3)
		,('f', 1, 'replace up to two razor claws:', 'smashing claws', 'ap', 4)
		,('g', 1, 'replace all bio-borers:', 'bio-spiner', 'ap', 1)
		,('g', 1, 'replace up to two bio-borers:', 'bio-fuser', 'ap', 4)
		,('g', 1, 'replace up to two bio-borers:', 'bio-fuser', 'deadly', 3)
		,('g', 1, 'replace up to two bio-borers:', 'bio-plasma', 'ap', 4)
		,('g', 1, 'replace up to two bio-borers:', 'bio-shredder', 'rending',0)
		,('g', 1, 'replace up to two bio-borers:', 'bio-spiker', 'ap', 1)
		,('g', 1, 'replace up to two bio-borers:', 'bio-spiker', 'sniper',0)
		,('h', 1, 'upgrade one model with:', 'mind snatcher', 'psychic', 1)
		,('i', 1, 'replace any razor claws:', 'piercing claws', 'ap', 1)
		,('i', 1, 'replace any razor claws:', 'piercing claws', 'rending', 0)
		,('i', 1, 'replace any razor claws:', 'smashing claws', 'ap', 4)
		,('i', 1, 'replace any razor claws:', 'serrated claws', 'blast', 3)
		,('i', 1, 'replace any razor claws:', 'razor whip', 'rending',0)
		,('i', 1, 'replace any razor claws:', 'razor whip', 'deadly',3)
		,('i', 1, 'replace any razor claws:', 'sword claws', 'ap', 2)
		,('i', 1, 'replace any razor claws:', 'sword claws', 'deadly', 3)
		,('j', 1, 'any model may replace one razor claws:', 'twin spine guns', 'ap',1)
		,('j', 1, 'any model may replace one razor claws:', 'spitter gun', 'blast', 3)
		,('j', 1, 'replace one ravager gun:', 'shredder gun', 'rending',1)
		,('j', 1, 'replace one ravager gun:', 'heavy ravager gun', 'ap',2)
		,('j', 1, 'replace one ravager gun:', 'barb gun', 'blast',3)
		,('j', 1, 'replace one ravager gun:', 'barb gun', 'ap',1)
		,('j', 1, 'replace one ravager gun:', 'acid launcher', 'ap', 3)
		,('j', 1, 'replace one ravager gun:', 'acid launcher', 'deadly', 3)
		,('j', 1, 'replace one ravager gun:', 'acid launcher', 'lock-on', 0)
		,('j', 1, 'upgrade all models with:', 'wings', 'ambush', 0)
		,('j', 1, 'upgrade all models with:', 'wings', 'flying', 0)
		,('k', 1, 'any model may replace one razor claws:', 'heavy ravager gun', 'ap', 2)
		,('k', 1, 'any model may replace one razor claws:', 'shock harpoon', 'ap', 2)
		,('k', 1, 'any model may replace one razor claws:', 'shock harpoon', 'deadly', 3)
		,('k', 1, 'any model may replace one razor claws:', 'skewer cannon', 'ap', 4)
		,('k', 1, 'any model may replace one razor claws:', 'skewer cannon', 'lock-on', 0)
		,('l', 1, 'upgrade all models with any:', 'burrow attack', 'ambush', 0)
		,('l', 1, 'upgrade all models with any:', 'spine shooters', 'ap', 1)
		,('m', 1, 'upgrade all models with one:', 'rapid strike', 'scout', 0)
		,('m', 1, 'upgrade all models with one:', 'tunnel attack', 'ambush', 0)
		,('n', 1, 'upgrade all models with:', 'bio-recovery', 'regeneration', 0)


	select
		fuge.id
		,sr.Id,
		r.value
	from
		@result r
			inner join ref.FactionUpgrades fu on fu.Code = r.tbl and fu.Page = r.page
			inner join ref.FactionUpgradeGroups fug on fug.FactionUpgradeId = fu.Id and fug.Label = r.groupname
			inner join ref.Equipment e on e.Label = r.equipment
			inner join [ref].[FactionUpgradeGroupEquipment] fuge on fuge.equipmentid = e.Id
			inner join ref.SpecialRules sr on sr.Label = r.specialrule
end