CREATE PROCEDURE ref.[sp_datatable_factionupgrades_battlebrothers]
as
begin
	declare @result table (letter nchar(1), page tinyint)

	insert into @result
		(letter, page)
	values
		('A', 1)
		,('B', 1)
		,('C', 1)
		,('D', 1)
		,('E', 1)
		,('F', 1)
		,('G', 1)
		,('H', 1)
		,('I', 1)
		,('J', 1)
		,('K', 1)
		,('L', 1)
		,('A', 2)
		,('B', 2)
		,('C', 2)
		,('D', 2)
		,('E', 2)
		,('F', 2)
		,('G', 2)
		,('H', 2)
		,('I', 2)
		,('J', 2)
		,('K', 2)

	select 
		(select f.id from ref.Factions f inner join ref.Games g on f.GameId = g.Id where f.Label = 'Battle Brothers' and g.Short = 'GF') as factionid,
		*
	from
		@result
end