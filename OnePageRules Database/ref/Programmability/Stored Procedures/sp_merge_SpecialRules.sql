CREATE PROCEDURE [dbo].[sp_merge_SpecialRules]
AS
BEGIN
	DECLARE @DataTable as TABLE
		( [ID] INT, [Label] NVARCHAR(75), [Description] NVARCHAR(MAX), FACTIONID INT NULL, HasValue BIT)

	DECLARE @AlienHivesGF INT,
			@BattleBrothersGF INT

	SELECT @AlienHivesGF = F.Id FROM dbo.Factions F JOIN dbo.Games G ON F.GameId = G.Id WHERE F.[Label] = 'Alien Hives' and G.Short = 'GF'
	SELECT @BattleBrothersGF = F.Id FROM dbo.Factions F JOIN dbo.Games G ON F.GameId = G.Id WHERE F.[Label] = 'Battle Brothers' and G.Short = 'GF'


	INSERT INTO @DataTable
		(ID, Label, Description, FACTIONID, HasValue)
	VALUES
		-- standard rules
		--(1, '', '', NULL, 0)
		(1, 'Aircraft', 'This model doesn''t physically interact with other models and terrain,can''t seize objectives, and can''t be moved into contact with. Units targeting aircraft get -12” range and -1 to hit rolls. When activated, this model must always move 18”-36” in a straight line (without turning), and if it goes off-table, then its activation ends, and it must be placed on any table edge again', NULL, 0)
		,(2, 'Ambush', 'This model may be kept in reserve instead of deploying. At the start of any round after the first, you may place the model anywhere, over 9” away from enemy units. If both player have Ambush, they roll-off to see who deploys first, and then alternate in placing them.', NULL, 0)
		,(3, 'AP', 'Targets get -X to Defense rolls when blocking hits.', NULL, 1)
		,(4, 'Blast', 'Ignores cover and multiplies hits by X, but can''t deal more than one hit per model in the target unit.', NULL, 1)
		,(5, 'Deadly', 'Assign each wound to one model, and multiply it by X. Note that these wounds don''t carry over to other models if the target is killed.', NULL, 1)
		,(6, 'Fast', 'Moves +2” when using Advance,and +4” when using Rush/Charge.', NULL, 0)
		,(7, 'Fear', 'Always counts as having dealt +D3 wounds when checking who won melee.', NULL, 0)
		,(8, 'Fearless', 'Gets +1 to morale tests.', NULL, 0)
		,(9, 'Flying', 'May move through all obstacles, and may ignore terrain effects.', NULL, 0)
		,(10, 'Furious', 'Gets +1 attack with a weapon of your choice when charging', NULL, 0)
		,(11, 'Hero', ': May be deployed as part of one friendly unit, which may use its Quality value for morale tests. When taking hits, you must use the unit''s Defense value,until all non-hero models are killed.', NULL, 0)
		,(12, 'Immobile', 'May only use Hold actions.', NULL, 0)
		,(13, 'Impact', 'Deals X melee hits when charging (must be in striking range).', NULL, 1)
		,(14, 'Indirect', 'May target enemies that are not in line of sight, and ignores cover from sight obstructions, but gets -1 to hit rolls when shooting after moving', NULL, 0)
		,(15, 'Lock-On', 'Ignores all negative modifiers to hit rolls and range.', NULL, 0)
		,(16, 'Poison', 'Unmodified results of 6 to hit are multiplied by 3.', NULL, 0)
		,(17, 'Psychic', ': May cast one spell during its activation, at any point before attacking. Pick a spell and a target in line of sight,and roll D6+X. If the result is equal or higher than the number in brackets, you may resolve the effects. Enemy psychics within 18” and line of sight of the caster may roll D6+X at the same time, and if the result is higher the spell is blocked. Psychics may only either try to cast or try to block a spell each round.', NULL, 1)
		,(18, 'Regeneration', ': When taking a wound, roll one die. On a 5+ it is ignored.', NULL, 0)
		,(19, 'Relentless', 'For each unmodified roll of 6 to hit when shooting, this model may roll1 extra attack. This rule doesn''t apply to newly generated attacks.', NULL, 0)
		,(20, 'Rending', 'Unmodified results of 6 to hit count as having AP(4), and ignore the regeneration rule.', NULL, 0)
		,(21, 'Scout', 'This model may be deployed after all other units, and may then move by up to 12”, ignoring terrain. If both of the players have Scout, they roll-off to see who deploys first, and then alternate in placing and moving them. ', NULL, 0)
		,(22, 'Slow', ' Moves -2” when using Advance, and -4” when using Rush/Charge.', NULL, 0)
		,(23, 'Sniper', 'Shoots at Quality 2+, and may pick one model in a unit as its target, which is resolved as if it''s a unit of 1.', NULL, 0)
		,(24, 'Stealth', 'Enemies get -1 to hit rolls when shooting at this unit.', NULL, 0)
		,(25, 'Strider', 'This model may ignore the effects of difficult terrain', NULL, 0)
		,(26, 'Tough', 'This model must take X wounds before being killed. If a model with tough joins a unit without it, then it is removed last when the unit takes wounds. Note that you must continue to put wounds on the tough model with most wounds in the unit until it is killed, before starting to put them on the next tough model (heroes must be assigned wounds last).', NULL, 1)
		,(27, 'Transport', 'May transport up to X other models. Units embark by moving into contact, and may use any action to disembark, but only move by up to 6”. Units may also be deployed inside of a transport. If a unit is inside a transport when it is destroyed, then it takes a dangerous terrain test, is immediately Pinned, and surviving models must be placed within 6” of the transport before it is removed', NULL, 1)
		-- Alien Hives
		--(1, '', '', @AlienHivesGF, 0)
		,(28, 'No Retreat', 'Whenever this unit fails a moraletest, you must kill one of its models, and themorale test counts as passed instead.', @AlienHivesGF, 0)
		,(29, 'Pheromones', ': Once per activation, before attacking, pick one other friendly unit within 12” of this model, which may move by up to 6".', @AlienHivesGF, 0)
		,(30, 'Psy-Barrier', ': Counts as having Regeneration on rolls of 4+ against spell attacks, and on rolls of 6+ against non-spell attacks (this stacks with Regeneration).', @AlienHivesGF, 0)
		,(31, 'Psychic Synapse', 'Models with this rule count as having Psychic(1), however only one of them in the unit may cast or block spells each round. When casting or blocking spells, roll as many dice as models with this rule in the unit, and pick the highest result.', @AlienHivesGF, 0)
		,(32, 'Shrouding Mist', 'Once per activation, pick 2 friendly units within 6”, which get the Stealth rule next time they are shot at.', @AlienHivesGF, 0)
		,(33, 'Takedown', 'When this model attacks in melee, you may pick one model in the unit as its target, and make 1 attack at Quality 2+ with AP(1) and Deadly(3), which is resolved as if it''s a unit of 1.', @AlienHivesGF, 0)
		,(34, 'Corrosive', 'Whenever this model takes a wound in melee, the attacker takes 1 hit.', @AlienHivesGF, 0)
		,(35, 'Explode', 'If this model is ever 1" away from an enemy unit, it is immediately killed, and the enemy takes X*Blast(3) hits. This model automatically passes all morale tests.', @AlienHivesGF, 1)
		,(36, 'Spawn Brood', 'Once per game, when this model is activated, you may place a new unit of 5 Assault Grunts, 5 Shooter Grunts, or 3 Hive Swarms fully within 6” of it.', @AlienHivesGF, 0)
		,(37, 'Spores', ': For each missed attack you may place a new unit of 3 Spores or 1 Massive Spore 12” away from the target, but the position is decided by your opponent. Note that this new unit can’t be activated on the round in which it is placed. ', @AlienHivesGF, 0)
		,(38, 'Surprise Attack', 'This model counts as having the Ambush rule, and may be deployed up to 1” away from enemy units. Once deployed roll 2 dice, for each 2+ it deals 3 hits with AP(1) to one enemy unit within 3” (this may target multiple units).', @AlienHivesGF, 0)
		-- Battle Brothers
		--,(1, '', '', @BattleBrothersGF, 0)
		,(39, 'Advanced Tactics', 'Once per activation, before attacking, pick one other friendly unit within 12” of this model, which may move by up to 6".', @BattleBrothersGF, 0)
		,(40, 'Medical Training', 'This model and its unit get the Regeneration rule.', @BattleBrothersGF, 0)
		,(41, 'Repair', 'Once per activation, if within 2” of a unit with Tough, roll one die. On a 2+ you may repair D3 wounds from the target.', @BattleBrothersGF, 0)
		,(42, 'Shield Wall', ' Attacks targeting units where all models have this rule count as having AP(-1), to a min. of AP(0).', @BattleBrothersGF, 0)
		,(43, 'Veteran Infantry', 'This model gets +1 to hit rolls in melee and shooting.', @BattleBrothersGF, 0)
		,(44, 'War Chant', 'For each unmodified result of 6 to hit when attacking in melee, the hero and its unit may roll 2 extra attacks. This rule doesn''t apply to newly generated attacks.', @BattleBrothersGF, 0)
		,(45, 'Veteran Walker', 'This model gets +1 to its attack rolls for melee and shooting.', @BattleBrothersGF, 0)
		

	SET IDENTITY_INSERT dbo.SpecialRules ON

    MERGE dbo.SpecialRules TARGET
    USING @DataTable SOURCE ON TARGET.ID = SOURCE.ID 
    WHEN MATCHED THEN
        UPDATE SET TARGET.Label = SOURCE.LABEL, TARGET.Description = SOURCE.Description, TARGET.HasValue = SOURCE.HasValue, TARGET.FactionId = SOURCE.FactionId
    WHEN NOT MATCHED BY TARGET THEN
        INSERT (ID, Label, [Description], FactionID, HasValue) VALUES (SOURCE.ID, SOURCE.LABEL, SOURCE.Description, Source.FactionId, SOURCE.HasValue)
    WHEN NOT MATCHED BY SOURCE THEN
        DELETE;

    SET IDENTITY_INSERT dbo.SpecialRules OFF

    DECLARE @MaxID INT
    SELECT @MaxID = MAX(Id) FROM dbo.SpecialRules

    DBCC CHECKIDENT ('SpecialRules', RESEED, @MaxID)
END
