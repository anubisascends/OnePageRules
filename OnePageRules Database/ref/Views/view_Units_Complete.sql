CREATE VIEW [dbo].[view_Units_Complete]
	AS 
SELECT
	U.Id,
	F.Label as Faction,
	U.Quantity,
	U.Label as Unit,
	u.Quality,
	U.Defense,
	UE.Label as Equipment
FROM
	dbo.Units U
		JOIN dbo.view_UnitEquipment UE ON U.id = UE.UnitId
		JOIN dbo.Factions F on F.Id = U.FactionId