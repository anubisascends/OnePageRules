CREATE VIEW [dbo].[view_Units]
AS
SELECT
	U.Id,
	F.Label as Faction,
	U.Label +
		' [' +
		Cast(U.Quantity as nvarchar(max)) +
		']' as Unit,
	U.Quality,
	U.Defense,
	UE.Equipment,
	USR.SpecialRules,
	U.Cost
FROM
	dbo.Units U
		JOIN dbo.Factions F on F.Id = U.FactionId
		LEFT JOIN dbo.view_UnitSpecialRules_Concat USR ON USR.UnitId = U.Id
		LEFT JOIN [dbo].[view_UnitEquipment_Concat] UE ON UE.Id = U.Id