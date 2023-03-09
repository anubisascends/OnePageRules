CREATE PROCEDURE [dbo].[sp_mergeequipment_alienhives]
AS
BEGIN
    DECLARE @ProfileTable TABLE
    (
        ID INT,
        EquipmentName NVARCHAR(75),
        Attacks tinyint,
        [Range] nvarchar(20)
    )

    DECLARE @SpecialRuleTable TABLE
    (
        ID INT,
        ProfileID INT,
        SpecialRulesName varchar(50),
        Value INT
    )
    
    INSERT INTO @ProfileTable
        (ID, EquipmentName, Attacks, [Range])
    VALUES
        (1, 'Razor Claw', 4, 'melee'),
        (2, 'Stomp', 2, 'melee'),
        (3, 'Razor Claw', 4, 'melee'),
        (4, 'Bio-Carbine', 3, '18"'),
        (5, 'Razor Claw', 4, 'melee'),
        (6, 'Piercing Claw', 3, 'melee'),
        (7, 'Piercing Claw', 3, 'melee'),
        (8, 'Bio-Gun', 1, '12"'),
        (9, 'Razor Claw', 2, 'melee'),
        (10, 'Razor Claw', 3, 'melee'),
        (11, 'Bio-Gun', 1, '12"'),
        (12, 'Razor Claw', 2, 'melee'),
        (13, 'Piercing Claw', 3, 'melee'),
        (14, 'Swarm Attack', 3, 'melee'),
        (15, 'Bio-Carbine', 3, '18"'),
        (16, 'Razor Claw', 4, 'melee'),
        (17, 'Razor Claw', 4, 'melee'),
        (18, 'Whip Limbs', 8, 'melee'),
        (19, 'Psychic Blast', 1, '18"'),
        (20, 'Psychic Shock', 1, 'melee'),
        (21, 'Razor Claw', 4, 'melee'),
        (22, 'Razor Claw', 4, 'melee'),
        (23, 'Vicious Jaws', 4, 'melee'),
        (24, 'Razor Claw', 4, 'melee'),
        (25, 'Stomp', 2, 'melee'),
        (26, 'Acid Spurt', 1, '12"'),
        (27, 'Whip Limbs', 16, 'melee'),
        (28, 'Stomp', 2, 'melee'),
        (29, 'Psychic Blast', 2, '18"'),
        (30, 'Razor Claw', 4, 'melee'),
        (31, 'Stomp', 2, 'melee')

    INSERT INTO @SpecialRuleTable
        (ID, ProfileID, SpecialRulesName, [Value])
    VALUES
        (1, 1, 'AP', 2),
        (2, 2, 'AP', 1),
        (3, 3, 'AP', 2),
        (4, 5, 'AP', 1),
        (5, 6, 'AP', 2),
        (6, 6, 'Rending', 0),
        (7, 7, 'Rending', 0),
        (8, 13, 'Rending', 0),
        (9, 14, 'Poison', 0),
        (10, 16, 'AP', 1),
        (11, 17, 'AP', 1),
        (12, 18, 'Poison', 0),
        (13, 19, 'AP', 1),
        (14, 19, 'Blast', 3),
        (15, 21, 'AP', 2),
        (16, 22, 'AP', 2),
        (17, 23, 'AP', 3),
        (18, 24, 'AP', 2),
        (19, 25, 'AP', 1),
        (20, 26, 'Blast', 6),
        (21, 26, 'Poison', 0),
        (22, 27, 'Poison', 0),
        (23, 28, 'AP', 1),
        (24, 29, 'AP', 1),
        (25, 29, 'Blast', 3)

    SET IDENTITY_INSERT dbo.EquipmentProfiles ON

    MERGE dbo.EquipmentProfiles AS TARGET
    USING @ProfileTable as SOURCE ON TARGET.ID = Source.ID
    WHEN MATCHED THEN
        UPDATE SET
            TARGET.FactionId = 1,
            TARGET.EquipmentID = (SELECT TOP 1 ID FROM Equipment WHERE Label = SOURCE.EquipmentName),
            TARGET.Attacks = SOURCE.Attacks,
            TARGET.[Range] = SOURCE.[Range]
    WHEN NOT MATCHED BY SOURCE THEN
        DELETE
    WHEN NOT MATCHED BY TARGET THEN
        INSERT 
            (ID, FactionId, EquipmentID, Attacks, [Range])
        VALUES
            (SOURCE.ID,
            1, 
            (SELECT TOP 1 ID FROM Equipment WHERE Label = SOURCE.EquipmentName), 
            SOURCE.Attacks, SOURCE.[Range]);

    SET IDENTITY_INSERT dbo.EquipmentProfiles OFF

    SET IDENTITY_INSERT dbo.EquipmentProfileSpecialRules ON

    MERGE dbo.EquipmentProfileSpecialRules AS TARGET
    USING @SpecialRuleTable as SOURCE ON TARGET.ID = Source.ID
    WHEN MATCHED THEN
        UPDATE SET
            TARGET.ProfileID = SOURCE.ProfileID,
            TARGET.SpecialRuleID = (SELECT TOP 1 ID FROM dbo.SpecialRules WHERE Label = SOURCE.SpecialRulesName),
            TARGET.[Value] = SOURCE.[Value]
    WHEN NOT MATCHED BY SOURCE THEN
        DELETE
    WHEN NOT MATCHED BY TARGET THEN
        INSERT 
            (ID, ProfileID, SpecialRuleID, [Value])
        VALUES
            (SOURCE.ID,
            SOURCE.ProfileID, 
            (SELECT TOP 1 ID FROM SpecialRules where Label = SOURCE.SpecialRulesName), 
            SOURCE.[Value]);

    SET IDENTITY_INSERT dbo.EquipmentProfileSpecialRules OFF
END
