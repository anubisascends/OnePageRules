CREATE PROCEDURE ref.[sp_merge_unitspecialrules]
as
begin
	declare @datatable table (id int identity(1,1), unitid int, specialruleid int, value tinyint)

	-- insert the various special rules into this table
	----------------------------------------
	insert into @datatable
		(unitid, specialruleid, value)
	exec ref.sp_datatable_unitspecialrules_alienhives

	insert into @datatable
		(unitid, specialruleid, value)
	exec ref.sp_datatable_unitspecialrules_battlebrothers
	----------------------------------------

	SET IDENTITY_INSERT ref.UnitSpecialRules on

	MERGE ref.UnitSpecialRules AS TARGET
	USING @DataTable AS SOURCE ON TARGET.Id = SOURCE.Id
	WHEN MATCHED then
		UPDATE SET
			TARGET.UnitId = source.unitid,
			TARGET.SpecialRuleId = source.specialruleid,
			TARGET.Value = Source.Value
	WHEN NOT MATCHED BY SOURCE THEN
		DELETE
	WHEN NOT MATCHED BY TARGET THEN
		INSERT
			(ID, UnitID, SpecialRuleID, Value)
		VALUES
			(
				SOURCE.ID,
				source.unitid,
				source.specialruleid,
				SOURCE.Value
			);

	SET IDENTITY_INSERT ref.UnitSpecialRules OFF

	DECLARE @MaxID INT
    SELECT @MaxID = MAX(Id) FROM ref.UnitSpecialRules

    DBCC CHECKIDENT ('ref.UnitSpecialRules', RESEED, @MaxID)
end