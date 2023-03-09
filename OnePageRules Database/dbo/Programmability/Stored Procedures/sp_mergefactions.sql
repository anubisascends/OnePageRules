CREATE PROCEDURE [dbo].[sp_mergefactions]
AS
BEGIN
    -- table structure

    DECLARE @DataTable as TABLE
    (
        ID INT,
        GameID INT,
        Label varchar(50),
        ParentID INT
    )

    INSERT INTO @DataTable
        (ID, GameID, Label, ParentID)
    VALUES
        (1,1,'Alien Hives',0),
        (2,1,'Battle Brothers',0),
        (3,1,'Blood Brothers',2),
        (4,1,'Dark Brothers',2),
        (5,1,'Knight Brothers',2),
        (6,1,'Watch Brothers',2),
        (7,1,'Wolf Brothers',2),
        (8,1,'Battle Sisters',0),
        (9,1,'Custodian Brothers',0),
        (10,1,'Dark Elf Raiders',0),
        (11,1,'Dwarf Guilds',0),
        (12,1,'Elven Jesters',0),
        (13,1,'Eternal Dynasty',0),
        (14,1,'Feudal Guard',0),
        (15,1,'Havoc Brothers',0),
        (16,1,'Change Disciples',15),
        (17,1,'Lust Disciples',15),
        (18,1,'Plague Disciples',15),
        (19,1,'War Disciples',15),
        (20,1,'High Elf Fleets',0),
        (21,1,'Human Defense Force',0),
        (22,1,'Human Inquisition',0),
        (23,1,'Infected Colonies',0),
        (24,1,'Jackals',0),
        (25,1,'Machine Cult',0),
        (26,1,'Ork Marauders',0),
        (27,1,'Prime Brothers',0),
        (28,1,'Blood Prime Brothers',27),
        (29,1,'Dark Prime Brothers',27),
        (30,1,'Knight Prime Brothers',27),
        (31,1,'Watch Prime Brothers',27),
        (32,1,'Wolf Prime Brothers',27),
        (33,1,'Saurian Starhost',0),
        (34,1,'Soul-Snatcher Cults',0),
        (35,1,'TAO Coalition',0),
        (36,1,'Titan Lords',0),
        (37,1,'Wormhole Daemons',0),
        (38,2,'Alien Hives',0),
        (39,2,'Battle Brothers',0),
        (40,2,'Blood Brothers',39),
        (41,2,'Dark Brothers',39),
        (42,2,'Knight Brothers',39),
        (43,2,'Watch Brothers',39),
        (44,2,'Wolf Brothers',39),
        (45,2,'Battle Sisters',0),
        (46,2,'Custodian Brothers',0),
        (47,2,'Dark Elf Raiders',0),
        (48,2,'Dwarf Guilds',0),
        (49,2,'Elven Jesters',0),
        (50,2,'Eternal Dynasty',0),
        (51,2,'Feudal Guard',0),
        (52,2,'Havoc Brothers',0),
        (53,2,'Change Disciples',52),
        (54,2,'Lust Disciples',52),
        (55,2,'Plague Disciples',52),
        (56,2,'War Disciples',52),
        (57,2,'High Elf Fleets',0),
        (58,2,'Human Defense Force',0),
        (59,2,'Human Inquisition',0),
        (60,2,'Infected Colonies',0),
        (61,2,'Jackals',0),
        (62,2,'Machine Cult',0),
        (63,2,'Ork Marauders',0),
        (64,2,'Prime Brothers',0),
        (65,2,'Blood Prime Brothers',64),
        (66,2,'Dark Prime Brothers',64),
        (67,2,'Knight Prime Brothers',64),
        (68,2,'Watch Prime Brothers',64),
        (69,2,'Wolf Prime Brothers',64),
        (70,2,'Saurian Starhost',0),
        (71,2,'Soul-Snatcher Cults',0),
        (72,2,'TAO Coalition',0),
        (73,2,'Titan Lords',0),
        (74,2,'Wormhole Daemons',0),
        (75,3,'Beastmen',0),
        (76,3,'Chvalrous Kingdoms',0),
        (77,3,'Dark Elves',0),
        (78,3,'Deep Sea Elves',0),
        (79,3,'Duchies of Vinci',0),
        (80,3,'Dwarves',0),
        (81,3,'Eternal Wardens',0),
        (82,3,'Ghostly Undead',0),
        (83,3,'Giant Tribes',0),
        (84,3,'Goblins',0),
        (85,3,'Halflings',0),
        (86,3,'Havoc Dwarves',0),
        (87,3,'Havoc Warriors',0),
        (88,3,'Change Disciples',84),
        (89,3,'Lust Disciples',84),
        (90,3,'Plague Disciples',84),
        (91,3,'War Disciples',84),
        (92,3,'High Elves',0),
        (93,3,'Humans',0),
        (94,3,'Kingdom of Angels',0),
        (95,3,'Mummified Undead',0),
        (96,3,'Ogres',0),
        (97,3,'Orcs',0),
        (98,3,'Ossified Undead',0),
        (99,3,'Ratmen',0),
        (100,3,'Rift Daemons',0),
        (101,3,'Rift Daemons of Change',100),
        (102,3,'Rift Daemons of Lust',100),
        (103,3,'Rift Daemons of Plague',100),
        (104,3,'Rift Daemons of War',100),
        (105,3,'Saurians',0),
        (106,3,'Shadow Stalkers',0),
        (107,3,'Sky-City Dwarves',0),
        (108,3,'Vampiric Undead',0),
        (109,3,'Volcanic Dwarves',0),
        (110,3,'Wood Elves',0),
        (111,1,'Ratmen Clans',0),
        (112,1,'Robel Geurrillas',0),
        (113,1,'Robot Legions',0),
        (114,2,'Ratmen Clans',0),
        (115,2,'Rebel Geurillas',0),
        (116,2,'Robot Legions',0)

        SET IDENTITY_INSERT dbo.Factions ON

        MERGE dbo.Factions AS TARGET
        USING @DataTable AS SOURCE ON TARGET.ID = SOURCE.ID
        WHEN MATCHED THEN
            UPDATE SET TARGET.GameID = SOURCE.GameID, TARGET.Label = Source.Label, TARGET.ParentID = SOURCE.ParentID
        WHEN NOT MATCHED BY TARGET THEN
            INSERT (ID, GameID, Label, ParentID) VALUES (SOURCE.ID, SOURCE.GameID, SOURCE.Label, SOURCE.ParentID)
        WHEN NOT MATCHED BY SOURCE THEN
            DELETE;

        SET IDENTITY_INSERT dbo.Factions OFF

        DECLARE @MaxID INT
        SELECT @MaxID = MAX(Id) FROM dbo.Factions

        DBCC CHECKIDENT ('Factions', RESEED, @MaxID)
END
GO
