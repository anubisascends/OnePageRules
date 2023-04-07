CREATE PROCEDURE ref.[sp_datatable_unitequipment_alienhives]
as
begin
	declare @result table (unit nvarchar(75), equipment nvarchar(75), quantity tinyint, range nvarchar(5) NULL, attacks tinyint)

	insert into @result
		(unit, equipment, quantity, range, attacks)
	values
		('Hive Lord', 'Razor Claws', 2, null, 6)
		,('Hive Lord', 'Stomp', 1, null, 4)
		,('Snatcher Lord', 'Heavy Piercing Claws', 1, null, 6)
		,('Prime Warrior', 'Razor Claws', 2, null, 4)
		,('Assault Grunts', 'Razor Claws', 1, null, 4)
		,('Shooter Grunts', 'Bio-Borers', 1, '12"', 2)
		,('Shooter Grunts', 'Razor Claws', 1, null, 1)
		,('Winged Grunts', 'Bio-Borers', 1, '12"', 2)
		,('Winged Grunts', 'Razor Claws', 1, null, 1)
		,('Soul-Snatchers', 'Piercing Claws', 1, null, 3)
		,('Hive Warriors', 'Razor Claws', 2, null, 3)
		,('Hive Guardians', 'Razor Claws', 2, null, 3)
		,('Hive Swarm', 'Swarm Attacks', 1, null, 3)
		,('Ravenous Beasts', 'Razor Claws', 2, null, 3)
		,('Synapse Floaters', 'Psy-Blasts', 1, '18"', 1)
		,('Synapse Floaters', 'Psy-Shocks', 1, null, 1)
		,('Venom Floaters', 'Whip Limbs', 1, null, 3)
		,('Shadow Hunter', 'Razor Claws', 2, null, 4)
		,('Carnivo-Rex', 'Razor Claws', 2, null, 3)
		,('Carnivo-Rex', 'Stomp', 1, null, 4)
		,('Carnivo-Rex', 'Vicious Jaws', 1, null, 3)
		,('Toxico-Rex', 'Acid Spurt', 1, '12"', 2)
		,('Toxico-Rex', 'Stomp', 1, null, 4)
		,('Toxico-Rex', 'Whip Limbs', 1, null, 9)
		,('Psycho-Rex', 'Heavy Psy-Blast', 1, '18"', 2)
		,('Psycho-Rex', 'Razor Claws', 2, null, 3)
		,('Psycho-Rex', 'Stomp', 1, null, 4)
		,('Devourer Beast', 'Tongue', 1, '12"', 3)
		,('Devourer Beast', 'Razor Claws', 3, null, 3)
		,('Devourer Beast', 'Stomp', 1, null, 6)
		,('Tyrant Beast', 'Toxic Spray', 1, '18"', 18)
		,('Tyrant Beast', 'Razor Claws', 2, null, 3)
		,('Tyrant Beast', 'Stomp', 1, null, 6)
		,('Spawning Beast', 'Rapid Stinger Cannon', 1, '18"', 18)
		,('Spawning Beast', 'Razor Claws', 2, null, 3)
		,('Spawning Beast', 'Stomp', 1, null, 6)
		,('Artillery Beast', 'Shredder Bio-Artillery', 1, '36"', 3)
		,('Artillery Beast', 'Razor Claws', 2, null, 3)
		,('Artillery Beast', 'Stomp', 1, null, 6)
		,('Burrower', 'Razor Claws', 4, null, 3)
		,('Burrower', 'Stomp', 1, null, 6)
		,('Flamer Beast', 'Spit Flames', 1, '18"', 9)
		,('Flamer Beast', 'Razor Claws', 1, null, 3)
		,('Flamer Beast', 'Stomp', 1, null, 2)
		,('Mortar Beast', 'Spore Gun', 1, '24"', 1)
		,('Mortar Beast', 'Razor Claws', 1, null, 3)
		,('Mortar Beast', 'Stomp', 1, null, 2)
		,('Invasion Carrier', 'Razor Tendrils', 1, null, 6)
		,('Invasion Artillery', 'Spore Gun', 1, '24"', 1)
		,('Invasion Artillery', 'Razor Tendrils', 1, null, 6)
		,('Rapacious Beast', 'Stinger Spitter', 1, '18"', 3)
		,('Rapacious Beast', 'Caustic Cannon', 1, '12"', 6)
		,('Rapacious Beast', 'Spore Bombs', 1, '6"', 1)
		,('Hive Titan', 'Titanic Jaws', 1, null, 3)
		,('Hive Titan', 'Titanic Stomp', 1, null, 12)

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
