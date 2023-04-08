CREATE PROCEDURE ref.[sp_datatable_specialrules_battlebrothers]
as
begin
	declare @result table (label nvarchar(75), description nvarchar(1024), hasvalue bit)

	insert into @result
		(label, description, hasvalue)
	values
		('Advanced Tactics', 'Once per activation, before attacking, pick one other friendly unit within 12” of this model, which may move by up to 6".', 0)
		,('Medical Training', 'This model and its unit get the Regeneration rule.', 0)
		,('Repair', 'Once per activation, if within 2” of a unit with Tough, roll one die. On a 2+ you may repair D3 wounds from the target.', 0)
		,('Shield Wall', ' Attacks targeting units where all models have this rule count as having AP(-1), to a min. of AP(0).', 0)
		,('Veteran Infantry', 'This model gets +1 to hit rolls in melee and shooting.', 0)
		,('War Chant', 'For each unmodified result of 6 to hit when attacking in melee, the hero and its unit may roll 2 extra attacks. This rule doesn''t apply to newly generated attacks.', 0)
		,('Veteran Walker', 'This model gets +1 to its attack rolls for melee and shooting.', 0)

	select
		r.label,
		r.description,
		(select f.id from ref.factions f inner join ref.Games g on f.GameId = g.Id where f.Label = 'Battle Brothers' and g.short = 'GF') as factionid,
		r.hasvalue
	from
		@result r
end