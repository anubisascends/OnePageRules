CREATE PROCEDURE ref.[sp_merge_specialrules]
as
begin
	declare @datatable table (id int identity(1,1), label nvarchar(75), description nvarchar(1024), factionid int, hasvalue bit)

	-- add the general special rules
	-------------------------------------
	insert into @datatable
		(label, description, factionid, hasvalue)
	values
		('Aircraft', 'This model doesn''t physically interact with other models and terrain,can''t seize objectives, and can''t be moved into contact with. Units targeting aircraft get -12” range and -1 to hit rolls. When activated, this model must always move 18”-36” in a straight line (without turning), and if it goes off-table, then its activation ends, and it must be placed on any table edge again', NULL, 0)
		,('Ambush', 'This model may be kept in reserve instead of deploying. At the start of any round after the first, you may place the model anywhere, over 9” away from enemy units. If both player have Ambush, they roll-off to see who deploys first, and then alternate in placing them.', NULL, 0)
		,('AP', 'Targets get -X to Defense rolls when blocking hits.', NULL, 1)
		,('Blast', 'Ignores cover and multiplies hits by X, but can''t deal more than one hit per model in the target unit.', NULL, 1)
		,('Deadly', 'Assign each wound to one model, and multiply it by X. Note that these wounds don''t carry over to other models if the target is killed.', NULL, 1)
		,('Fast', 'Moves +2” when using Advance,and +4” when using Rush/Charge.', NULL, 0)
		,('Fear', 'Always counts as having dealt +D3 wounds when checking who won melee.', NULL, 0)
		,('Fearless', 'Gets +1 to morale tests.', NULL, 0)
		,('Flying', 'May move through all obstacles, and may ignore terrain effects.', NULL, 0)
		,('Furious', 'Gets +1 attack with a weapon of your choice when charging', NULL, 0)
		,('Hero', ': May be deployed as part of one friendly unit, which may use its Quality value for morale tests. When taking hits, you must use the unit''s Defense value,until all non-hero models are killed.', NULL, 0)
		,('Immobile', 'May only use Hold actions.', NULL, 0)
		,('Impact', 'Deals X melee hits when charging (must be in striking range).', NULL, 1)
		,('Indirect', 'May target enemies that are not in line of sight, and ignores cover from sight obstructions, but gets -1 to hit rolls when shooting after moving', NULL, 0)
		,('Lock-On', 'Ignores all negative modifiers to hit rolls and range.', NULL, 0)
		,('Poison', 'Unmodified results of 6 to hit are multiplied by 3.', NULL, 0)
		,('Psychic', 'May cast one spell during its activation, at any point before attacking. Pick a spell and a target in line of sight,and roll D6+X. If the result is equal or higher than the number in brackets, you may resolve the effects. Enemy psychics within 18” and line of sight of the caster may roll D6+X at the same time, and if the result is higher the spell is blocked. Psychics may only either try to cast or try to block a spell each round.', NULL, 1)
		,('Regeneration', 'When taking a wound, roll one die. On a 5+ it is ignored.', NULL, 0)
		,('Relentless', 'For each unmodified roll of 6 to hit when shooting, this model may roll1 extra attack. This rule doesn''t apply to newly generated attacks.', NULL, 0)
		,('Rending', 'Unmodified results of 6 to hit count as having AP(4), and ignore the regeneration rule.', NULL, 0)
		,('Scout', 'This model may be deployed after all other units, and may then move by up to 12”, ignoring terrain. If both of the players have Scout, they roll-off to see who deploys first, and then alternate in placing and moving them. ', NULL, 0)
		,('Slow', ' Moves -2” when using Advance, and -4” when using Rush/Charge.', NULL, 0)
		,('Sniper', 'Shoots at Quality 2+, and may pick one model in a unit as its target, which is resolved as if it''s a unit of 1.', NULL, 0)
		,('Stealth', 'Enemies get -1 to hit rolls when shooting at this unit.', NULL, 0)
		,('Strider', 'This model may ignore the effects of difficult terrain', NULL, 0)
		,('Tough', 'This model must take X wounds before being killed. If a model with tough joins a unit without it, then it is removed last when the unit takes wounds. Note that you must continue to put wounds on the tough model with most wounds in the unit until it is killed, before starting to put them on the next tough model (heroes must be assigned wounds last).', NULL, 1)
		,('Transport', 'May transport up to X other models. Units embark by moving into contact, and may use any action to disembark, but only move by up to 6”. Units may also be deployed inside of a transport. If a unit is inside a transport when it is destroyed, then it takes a dangerous terrain test, is immediately Pinned, and surviving models must be placed within 6” of the transport before it is removed', NULL, 1)
	-------------------------------------

	-- add the faction specific special rules
	-------------------------------------
	insert into @datatable
		exec ref.sp_datatable_specialrules_alienhives

	insert into @datatable
		exec ref.sp_datatable_specialrules_battlebrothers
	-------------------------------------

	SET IDENTITY_INSERT ref.SpecialRules ON

    MERGE ref.SpecialRules TARGET
    USING @DataTable SOURCE ON TARGET.ID = SOURCE.ID 
    WHEN MATCHED THEN
        UPDATE SET 
			TARGET.Label = SOURCE.LABEL, 
			TARGET.Description = SOURCE.Description, 
			TARGET.FactionId = SOURCE.FactionId,
			TARGET.HasValue = SOURCE.HasValue
    WHEN NOT MATCHED BY TARGET THEN
        INSERT 
			(ID, Label, [Description], FactionID, HasValue) 
		VALUES 
			(SOURCE.ID, SOURCE.LABEL, SOURCE.Description, Source.FactionId, SOURCE.HasValue)
    WHEN NOT MATCHED BY SOURCE THEN
        DELETE;

    SET IDENTITY_INSERT ref.SpecialRules OFF

    DECLARE @MaxID INT
    SELECT @MaxID = MAX(Id) FROM ref.SpecialRules

    DBCC CHECKIDENT ('ref.SpecialRules', RESEED, @MaxID)
end