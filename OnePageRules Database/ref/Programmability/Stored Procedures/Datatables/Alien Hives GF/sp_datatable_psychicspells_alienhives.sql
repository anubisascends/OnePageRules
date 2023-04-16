CREATE PROCEDURE ref.[sp_datatable_psychicspells_alienhives]
AS
BEGIN
	declare @result table (label nvarchar(75), roll tinyint, description nvarchar(max))

	insert into @result
		(label, roll, description)
	values
		('Psychic Blast', 4, 'Target enemy unit within 6” takes 1 hit with AP(2) and Deadly(3).')
		,('Terror', 4, 'Target 2 enemy units within 12” get -2 to their next morale test.')
		,('Animate Flora', 5, 'Target 2 friendly units within 6” get Flying next time they activate.')
		,('Shriek', 5, 'Target 2 enemy units within 6” take 4 hits with AP(1) each.')
		,('Infuse Life', 6, 'Target friendly unit within 12” gets Regeneration next time it takes wounds.')
		,('Overwhelm', 6, 'Target enemy model within 12” takes 3 hits with AP(4).')

	declare @factionId int

	select 
		@factionId = f.Id 
	from 
		ref.Factions f 
			inner join ref.Games g on f.GameId = g.Id
	where
		f.Label = 'Alien Hives'
		and g.Short = 'gf'


	select
		@factionId as factionid,
		*
	from
		@result
		
END