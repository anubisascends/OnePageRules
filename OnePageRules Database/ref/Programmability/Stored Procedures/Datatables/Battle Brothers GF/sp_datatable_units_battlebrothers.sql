CREATE PROCEDURE ref.[sp_datatable_units_battlebrothers]
as
begin
	declare @result table (label nvarchar(75), qty tinyint, quality tinyint, defense tinyint, cost smallint)

	insert into @result
		(label, qty, quality, defense, cost)
	values
		('Master Brother',  1, 3, 3, 55)
        ,('Elite Pathfinder', 1, 4, 4, 45)
        ,('Pathfinders', 5, 4, 4, 115)
        ,('Assault Brothers', 5, 3, 3, 140)
        ,('Battle Brothers', 5, 3, 3, 145)
        ,('Support Brothers', 3, 3, 3, 165)
        ,('Destroyers', 3, 3, 3, 255)
        ,('Pathfinder Bikers', 3, 4, 4, 220)
        ,('Brother Bikers', 3, 3, 3, 270)
        ,('Support Bike', 1, 3, 3, 180)
        ,('APC', 1, 3, 2, 225)
        ,('Attack APC', 1, 3, 2, 240)
        ,('Drop Pod', 1, 3, 2, 145)
        ,('Battle Tank', 1, 3, 2, 490)
        ,('Heavy Tank', 1, 3, 2, 640)
        ,('Artillery Gun', 1, 3, 2, 260)
        ,('Attack Speeder', 1, 3, 2, 260)
        ,('Heavy Exo-Suit', 1, 3, 2, 185)
        ,('Attack Walker', 1, 3, 2, 330)
        ,('Light Gunship', 1, 3, 2, 335)
        ,('Heavy Gunship', 1, 3, 2, 545)
	select
		f.Id as factionid,
		r.*
	from
		@result r
			inner join ref.Factions f on f.Label = 'Battle Brothers'
			inner join ref.Games g on f.GameId = g.Id
	where
		g.Short = 'gf'
end