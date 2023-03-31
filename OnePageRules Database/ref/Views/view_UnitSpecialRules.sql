CREATE VIEW [dbo].[view_UnitSpecialRules]
	AS
SELECT
	U.UnitId as UnitId,
	SR.Label +
		IIF(SR.HasValue = 1, '(' + Cast(U.Value as NVARCHAR(max)) + ')', '') as SpecialRule
FROM
	dbo.UnitSpecialRules U
		JOIN dbo.SpecialRules SR ON SR.Id = U.SpecialRuleID
