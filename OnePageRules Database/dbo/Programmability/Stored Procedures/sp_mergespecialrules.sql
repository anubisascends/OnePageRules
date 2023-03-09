CREATE PROCEDURE [dbo].[sp_mergespecialrules]
AS
BEGIN
    DECLARE @DataTable TABLE
    (
        ID INT,
        Label varchar(25),
        [Description] VARCHAR (4000),
        HasValue bit
    )

    INSERT INTO @DataTable
        (ID, Label, [Description], HasValue)
    VALUES
        (1,'Aircraft','This model doesn’t physicallyinteract with other models and terrain,can’t seize objectives, and can’t bemoved into contact with. Units targetingaircraft get -12” range and -1 to hit rolls.When activated, this model must alwaysmove 18”-36” in a straight line (withoutturning), and if it goes off-table, then itsactivation ends, and it must be placed onany table edge again.',0),
        (2,'Ambush','This model may be kept inreserve instead of deploying. At the startof any round after the first, you mayplace the model anywhere, over 9” awayfrom enemy units. If both player haveAmbush, they roll-off to see who deploysfirst, and then alternate in placing them.',0),
        (3,'AP','Targets get -X to Defense rollswhen blocking hits.',1),
        (4,'Blast','Ignores cover and multiplieshits by X, but can’t deal more than onehit per model in the target unit.',1),
        (5,'Deadly','Assign each wound to onemodel, and multiply it by X. Note thatthese wounds don''t carry over to othermodels if the target is killed.',1),
        (6,'Fast','Moves +2” when using Advance,and +4” when using Rush/Charge.',0),
        (7,'Fear','Always counts as having dealt +D3wounds when checking who won melee.',0),
        (8,'Fearless','Gets +1 to morale tests.',0),
        (9,'Flying','May move through all obstacles,and may ignore terrain effects.',0),
        (10,'Furious','Gets +1 attack with a weapon ofyour choice when charging.',0),
        (11,'Hero','May be deployed as part of onefriendly unit, which may use its Qualityvalue for morale tests. When taking hits,you must use the unit’s Defense value,until all non-hero models are killed.',0),
        (12,'Immobile','May only use Hold actions.',0),
        (13,'Impact','Deals X melee hits whencharging (must be in striking range).',1),
        (14,'Indirect','May target enemies that arenot in line of sight, and ignores coverfrom sight obstructions, but gets -1 to hitrolls when shooting after moving.',0),
        (15,'Lock-On','Ignores all negative modifiersto hit rolls and range.',0),
        (16,'Poison','Unmodified results of 6 to hit',0),
        (17,'Psychic','May cast one spell during itsactivation, at any point before attacking.Pick a spell and a target in line of sight,and roll D6+X. If the result is equal orhigher than the number in brackets, youmay resolve the effects. Enemy psychicswithin 18” and line of sight of the castermay roll D6+X at the same time, and ifthe result is higher the spell is blocked.Psychics may only either try to cast ortry to block a spell each round.',1),
        (18,'Regeneration','When taking a wound, rollone die. On a 5+ it is ignored.',0),
        (19,'Relentless','For each unmodified roll of 6to hit when shooting, this model may roll1 extra attack. This rule doesn’t apply tonewly generated attacks.',0),
        (20,'Rending','Unmodified results of 6 to hitcount as having AP(4), and ignore theregeneration rule.',0),
        (21,'Scout','This model may be deployed afterall other units, and may then move by upto 12”, ignoring terrain. If both of theplayers have Scout, they roll-off to seewho deploys first, and then alternate inplacing and moving them.',0),
        (22,'Slow','Moves -2” when using Advance,and -4” when using Rush/Charge.',0),
        (23,'Sniper','Shoots at Quality 2+, and maypick one model in a unit as its target,which is resolved as if it’s a unit of 1.',0),
        (24,'Stealth','Enemies get -1 to hit rolls whenshooting at this unit.',0),
        (25,'Strider','This model may ignore theeffects of difficult terrain.',0),
        (26,'Tough','This model must take Xwounds before being killed. If a modelwith tough joins a unit without it, then itis removed last when the unit takeswounds. Note that you must continue toput wounds on the tough model withmost wounds in the unit until it is killed,before starting to put them on the nexttough model (heroes must be assignedwounds last).',1),
        (27,'Transport','May transport up to Xother models. Units embark by movinginto contact, and may use any action todisembark, but only move by up to 6”.Units may also be deployed inside of atransport. If a unit is inside a transportwhen it is destroyed, then it takes adangerous terrain test, is immediatelyPinned, and surviving models must beplaced within 6” of the transport beforeit is removed.',1),
        (28,'No Retreat','Whenever this unit fails a moraletest, you must kill one of its models, and themorale test counts as passed instead.',0),
        (29,'Pheromones','Once per activation, beforeattacking, pick one friendly unit within 12” of thismodel, which may move by up to 6''.',0),
        (30,'Psy-Barrier','This model may block spells as if ithad the Psychic(2) special rule. If it is a Psychicthen it gets +2 to spell block rolls.',0),
        (31,'Psychic Synapse','Models with this rule count ashaving Psychic(1), however only one of them inthe unit may cast or block spells each round.When casting or blocking spells, roll as manydice as models with this rule in the unit, andpick the highest result.',0),
        (32,'Shrouding Mist','Once per activation, pick 2friendly units within 6”, which get the Stealthrule next time they are shot at.',0),
        (33,'Takedown','When this model is in melee, maypick one model from the target and roll one die.On a 2+ it takes 1 hit with AP(1) and Deadly(3).',0)

    SET IDENTITY_INSERT dbo.SpecialRules ON

    MERGE dbo.SpecialRules TARGET
    USING @DataTable SOURCE ON TARGET.ID = SOURCE.ID 
    WHEN MATCHED THEN
        UPDATE SET TARGET.Label = SOURCE.LABEL, TARGET.Description = SOURCE.Description, TARGET.HasValue = SOURCE.HasValue
    WHEN NOT MATCHED BY TARGET THEN
        INSERT (ID, Label, [Description], HasValue) VALUES (SOURCE.ID, SOURCE.LABEL, SOURCE.Description, SOURCE.HasValue)
    WHEN NOT MATCHED BY SOURCE THEN
        DELETE;

    SET IDENTITY_INSERT dbo.SpecialRules OFF

    DECLARE @MaxID INT
    SELECT @MaxID = MAX(Id) FROM dbo.SpecialRules

    DBCC CHECKIDENT ('SpecialRules', RESEED, @MaxID)
END
