CREATE PROCEDURE ref.[sp_datatable_unitequipment_battlebrothers]
as
begin
	declare @result table (unit nvarchar(75), equipment nvarchar(75), quantity tinyint, range nvarchar(5) NULL, attacks tinyint)

	insert into @result
		(unit, equipment, quantity, range, attacks)
	values
		('Master Brother', 'Heavy Rifle', 1, '24"', 1)
		,('Master Brother', 'CCW', 1, null, 1)
		,('Elite Pathfinders', 'Heavy Rifle', 1, '24"', 1)
		,('Elite Pathfinders', 'CCW', 1, null, 1)
		,('Pathfinders', 'Heavy Rifles', 1, '24"', 1)
		,('Pathfinders', 'CCWs', 1, null, 1)
		,('Assault Brothers', 'Heavy Pistols', 1, '12"', 1)
		,('Assault Brothers', 'CCWs', 1, null, 1)
		,('Battle Brothers', 'Heavy Rifles', 1, '24"', 1)
		,('Battle Brothers', 'CCWs', 1, null, 1)
		,('Support Brothers', 'Heavy Flamethrowers', 1, '12"', 6)
		,('Support Brothers', 'CCWs', 1, null, 1)
		,('Destroyers', 'Dual Energy Claws', 1, null, 6)
		,('Pathfinder Bikers', 'Grenade Launchers', 1, '24"', 1)
		,('Pathfinder Bikers', 'Heavy Pistols', 1, '12"', 1)
		,('Pathfinder Bikers', 'CCWs', 1, null, 1)
		,('Brother Bikers', 'Twin Heavy Rifles', 1, '24"', 2)
		,('Brother Bikers', 'Heavy Pistols', 1, '12"', 1)
		,('Brother Bikers', 'CCWs', 1, null, 1)
		,('Support Bike', 'Twin Heavy Rifle', 1, '24"', 2)
		,('Support Bike', 'Heavy Flamethrower', 1, '12"', 6)
		,('Support Bike', 'Heavy Pistol', 1, '12"', 1)
		,('Support Bike', 'CCW', 1, null, 1)
		,('APC', 'Storm Rifle', 1, '24"', 3)
		,('Attack APC', 'Twin Heavy Flamethrower', 1, '12"', 12)
		,('Drop Pod', 'Death Launcher', 1, '18"', 1)
		,('Battle Tank', 'Twin Heavy Machineguns', 1, '30"', 6)
		,('Battle Tank', 'Demolition Cannon', 1, '24"', 1)
		,('Heavy Tank', 'Twin Heavy Machineguns', 1, '30"', 6)
		,('Heavy Tank', 'Twin Flamethrower Cannons', 1, '18"', 12)
		,('Artillery Gun', 'Heavy Flak Cannon', 1, '30"', 2)
		,('Artillery Gun', 'Engineer Crew', 1, null, 3)
		,('Attack Speeder', 'Heavy Flamethrowers', 2, null, 6)
		,('Heavy Exo-Suit', 'Twin Fusion Rifle', 1, '12"', 2)
		,('Heavy Exo-Suit', 'Stomp', 1, null, 2)
		,('Attack Walker', 'Stomp', 1, null, 4)
		,('Attack Walker', 'Walker Fists', 2, null, 4)
		,('Light Gunship', 'Twin Typhoon Missles', 1, '24"', 4)
		,('Light Gunship', 'Miniguns', 1, '24"', 4)
		,('Heavy Gunship', 'Storm Missles', 1, '36"', 1)
		,('Heavy Gunship', 'Twin Minigun', 1, '24"', 8)
		,('Heavy Gunship', 'Typhoon Missles', 1, '24"', 2)

	select 
		u.Id as unitid,
		e.Id as equipmentid,
		r.quantity,
		r.range,
		r.attacks
	from
		@result r
			inner join ref.Units u on u.Label = r.unit
			inner join ref.Equipment e on e.Label = equipment
			inner join ref.factions f on u.FactionId = f.Id
			inner join ref.Games g on f.GameId = g.Id
	where
		g.Short = 'GF'
end