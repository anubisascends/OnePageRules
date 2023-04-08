CREATE PROCEDURE ref.[sp_datatable_specialrules_alienhives]
as
begin
	declare @result table (label nvarchar(75), description nvarchar(1024), hasvalue bit)

	insert into @result
		(label, description, hasvalue)
	values
		('No Retreat', 'Whenever this unit fails a moraletest, you must kill one of its models, and themorale test counts as passed instead.', 0)
		,('Pheromones', 'Once per activation, before attacking, pick one other friendly unit within 12” of this model, which may move by up to 6".', 0)
		,('Psy-Barrier', 'Counts as having Regeneration on rolls of 4+ against spell attacks, and on rolls of 6+ against non-spell attacks (this stacks with Regeneration).', 0)
		,('Psychic Synapse', 'Models with this rule count as having Psychic(1), however only one of them in the unit may cast or block spells each round. When casting or blocking spells, roll as many dice as models with this rule in the unit, and pick the highest result.', 0)
		,('Shrouding Mist', 'Once per activation, pick 2 friendly units within 6”, which get the Stealth rule next time they are shot at.', 0)
		,('Takedown', 'When this model attacks in melee, you may pick one model in the unit as its target, and make 1 attack at Quality 2+ with AP(1) and Deadly(3), which is resolved as if it''s a unit of 1.', 0)
		,('Corrosive', 'Whenever this model takes a wound in melee, the attacker takes 1 hit.', 0)
		,('Explode', 'If this model is ever 1" away from an enemy unit, it is immediately killed, and the enemy takes X*Blast(3) hits. This model automatically passes all morale tests.', 1)
		,('Spawn Brood', 'Once per game, when this model is activated, you may place a new unit of 5 Assault Grunts, 5 Shooter Grunts, or 3 Hive Swarms fully within 6” of it.', 0)
		,('Spores', 'For each missed attack you may place a new unit of 3 Spores or 1 Massive Spore 12” away from the target, but the position is decided by your opponent. Note that this new unit can’t be activated on the round in which it is placed. ', 0)
		,('Surprise Attack', 'This model counts as having the Ambush rule, and may be deployed up to 1” away from enemy units. Once deployed roll 2 dice, for each 2+ it deals 3 hits with AP(1) to one enemy unit within 3” (this may target multiple units).', 0)

	select
		r.label,
		r.description,
		(select f.id from ref.factions f inner join ref.Games g on f.GameId = g.Id where f.Label = 'Alien Hives' and g.short = 'GF') as factionid,
		r.hasvalue
	from
		@result r
end