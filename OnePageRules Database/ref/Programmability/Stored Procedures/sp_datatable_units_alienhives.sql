CREATE PROCEDURE ref.[sp_datatable_units_alienhives]
as
begin
	declare @result table (label nvarchar(75), qty tinyint, quality tinyint, defense tinyint, cost smallint)

	insert into @result
		(label, qty, quality, defense, cost)
	values
		('Hive Lord',1,3,2,325)
        ,('Snatcher Lord',1,3,4,120)
        ,('Prime Warrior',1,4,4,95)
        ,('Assault Grunts',10,5,5,130)
        ,('Shooter Grunts',10,5,5,130)
        ,('Winged Grunts',10,5,5,160)
        ,('Soul-Snatchers',5,3,4,195)
        ,('Hive Warriors',3,4,4,145)
        ,('Hive Guardians',3,3,3,180)
        ,('Hive Swarm',3,6,6,70)
        ,('Ravenous Beasts',3,4,4,175)
        ,('Synapse Floaters',3,4,4,215)
        ,('Venom Floaters',3,4,4,225)
        ,('Shadow Hunter',1,3,4,205)
        ,('Carnivo-Rex',1,4,2,275)
        ,('Toxico-Rex',1,4,2,430)
        ,('Psycho-Rex',1,4,2,395)
        ,('Devourer Beast',1,3,2,525)
        ,('Tyrant Beast',1,3,2,535)
        ,('Artillery Beast',1,3,2,570)
        ,('Spawning Beast',1,3,2,645)
        ,('Burrower',1,3,2,540)
        ,('Flamer Beast',1,4,2,195)
        ,('Mortar Beast',1,4,2,220)
        ,('Invasion Carrier',1,4,2,190)
        ,('Invasion Artillery',1,4,2,225)
        ,('Rapacious Beast',1,4,2,265)
        ,('Hive Titan',1,3,2,805)
        ,('Spores',3,6,6,45)
        ,('Massive Spore',1,6,6,45) 
	select
		f.Id as factionid,
		r.*
	from
		@result r
			inner join ref.Factions f on f.Label = 'Alien Hives'
			inner join ref.Games g on f.GameId = g.Id
	where
		g.Short = 'gf'
end