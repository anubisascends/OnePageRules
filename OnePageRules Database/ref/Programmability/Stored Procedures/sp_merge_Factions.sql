CREATE PROCEDURE [dbo].[sp_merge_Factions]
AS
BEGIN
    SET IDENTITY_INSERT dbo.Factions ON

    MERGE dbo.Factions AS TARGET
    USING 
    (
        VALUES
        (1,1,'Alien Hives',0, 2.5)
        ,(2,1,'Battle Brothers',0,2.5)
        ,(3,1,'Blood Brothers',2,1)
        ,(4,1,'Dark Brothers',2,1)
        ,(5,1,'Knight Brothers',2,1)
        ,(6,1,'Watch Brothers',2,1)
        ,(7,1,'Wolf Brothers',2,1)
        ,(8,1,'Battle Sisters',0,1)
        ,(9,1,'Custodian Brothers',0,1)
        ,(10,1,'Dark Elf Raiders',0,1)
        ,(11,1,'Dwarf Guilds',0,1)
        ,(12,1,'Elven Jesters',0,1)
        ,(13,1,'Eternal Dynasty',0,1)
        ,(14,1,'Feudal Guard',0,1)
        ,(15,1,'Havoc Brothers',0,1)
        ,(16,1,'Change Disciples',15,1)
        ,(17,1,'Lust Disciples',15,1)
        ,(18,1,'Plague Disciples',15,1)
        ,(19,1,'War Disciples',15,1)
        ,(20,1,'High Elf Fleets',0,1)
        ,(21,1,'Human Defense Force',0,1)
        ,(22,1,'Human Inquisition',0,1)
        ,(23,1,'Infected Colonies',0,1)
        ,(24,1,'Jackals',0,1)
        ,(25,1,'Machine Cult',0,1)
        ,(26,1,'Ork Marauders',0,1)
        ,(27,1,'Prime Brothers',0,1)
        ,(28,1,'Blood Prime Brothers',27,1)
        ,(29,1,'Dark Prime Brothers',27,1)
        ,(30,1,'Knight Prime Brothers',27,1)
        ,(31,1,'Watch Prime Brothers',27,1)
        ,(32,1,'Wolf Prime Brothers',27,1)
        ,(33,1,'Saurian Starhost',0,1)
        ,(34,1,'Soul-Snatcher Cults',0,1)
        ,(35,1,'TAO Coalition',0,1)
        ,(36,1,'Titan Lords',0,1)
        ,(37,1,'Wormhole Daemons',0,1)
        ,(38,2,'Alien Hives',0,1)
        ,(39,2,'Battle Brothers',0,1)
        ,(40,2,'Blood Brothers',39,1)
        ,(41,2,'Dark Brothers',39,1)
        ,(42,2,'Knight Brothers',39,1)
        ,(43,2,'Watch Brothers',39,1)
        ,(44,2,'Wolf Brothers',39,1)
        ,(45,2,'Battle Sisters',0,1)
        ,(46,2,'Custodian Brothers',0,1)
        ,(47,2,'Dark Elf Raiders',0,1)
        ,(48,2,'Dwarf Guilds',0,1)
        ,(49,2,'Elven Jesters',0,1)
        ,(50,2,'Eternal Dynasty',0,1)
        ,(51,2,'Feudal Guard',0,1)
        ,(52,2,'Havoc Brothers',0,1)
        ,(53,2,'Change Disciples',52,1)
        ,(54,2,'Lust Disciples',52,1)
        ,(55,2,'Plague Disciples',52,1)
        ,(56,2,'War Disciples',52,1)
        ,(57,2,'High Elf Fleets',0,1)
        ,(58,2,'Human Defense Force',0,1)
        ,(59,2,'Human Inquisition',0,1)
        ,(60,2,'Infected Colonies',0,1)
        ,(61,2,'Jackals',0,1)
        ,(62,2,'Machine Cult',0,1)
        ,(63,2,'Ork Marauders',0,1)
        ,(64,2,'Prime Brothers',0,1)
        ,(65,2,'Blood Prime Brothers',64,1)
        ,(66,2,'Dark Prime Brothers',64,1)
        ,(67,2,'Knight Prime Brothers',64,1)
        ,(68,2,'Watch Prime Brothers',64,1)
        ,(69,2,'Wolf Prime Brothers',64,1)
        ,(70,2,'Saurian Starhost',0,1)
        ,(71,2,'Soul-Snatcher Cults',0,1)
        ,(72,2,'TAO Coalition',0,1)
        ,(73,2,'Titan Lords',0,1)
        ,(74,2,'Wormhole Daemons',0,1)
        ,(75,3,'Beastmen',0,1)
        ,(76,3,'Chvalrous Kingdoms',0,1)
        ,(77,3,'Dark Elves',0,1)
        ,(78,3,'Deep Sea Elves',0,1)
        ,(79,3,'Duchies of Vinci',0,1)
        ,(80,3,'Dwarves',0,1)
        ,(81,3,'Eternal Wardens',0,1)
        ,(82,3,'Ghostly Undead',0,1)
        ,(83,3,'Giant Tribes',0,1)
        ,(84,3,'Goblins',0,1)
        ,(85,3,'Halflings',0,1)
        ,(86,3,'Havoc Dwarves',0,1)
        ,(87,3,'Havoc Warriors',0,1)
        ,(88,3,'Change Disciples',84,1)
        ,(89,3,'Lust Disciples',84,1)
        ,(90,3,'Plague Disciples',84,1)
        ,(91,3,'War Disciples',84,1)
        ,(92,3,'High Elves',0,1)
        ,(93,3,'Humans',0,1)
        ,(94,3,'Kingdom of Angels',0,1)
        ,(95,3,'Mummified Undead',0,1)
        ,(96,3,'Ogres',0,1)
        ,(97,3,'Orcs',0,1)
        ,(98,3,'Ossified Undead',0,1)
        ,(99,3,'Ratmen',0,1)
        ,(100,3,'Rift Daemons',0,1)
        ,(101,3,'Rift Daemons of Change',100,1)
        ,(102,3,'Rift Daemons of Lust',100,1)
        ,(103,3,'Rift Daemons of Plague',100,1)
        ,(104,3,'Rift Daemons of War',100,1)
        ,(105,3,'Saurians',0,1)
        ,(106,3,'Shadow Stalkers',0,1)
        ,(107,3,'Sky-City Dwarves',0,1)
        ,(108,3,'Vampiric Undead',0,1)
        ,(109,3,'Volcanic Dwarves',0,1)
        ,(110,3,'Wood Elves',0,1)
        ,(111,1,'Ratmen Clans',0,1)
        ,(112,1,'Robel Geurrillas',0,1)
        ,(113,1,'Robot Legions',0,1)
        ,(114,2,'Ratmen Clans',0,1)
        ,(115,2,'Rebel Geurillas',0,1)
        ,(116,2,'Robot Legions',0,1)
    ) AS SOURCE
    (
        [Id],
        [GameId],
        [Label],
        [ParentId],
        [Version]
    )ON TARGET.ID = SOURCE.ID
    WHEN MATCHED THEN
        UPDATE SET 
            TARGET.GameID = SOURCE.GameID, 
            TARGET.Label = Source.Label, 
            TARGET.ParentID = SOURCE.ParentID,
            TARGET.Version = SOURCE.Version
    WHEN NOT MATCHED BY TARGET THEN
        INSERT 
            (ID, GameID, Label, ParentID, Version) 
        VALUES 
            (SOURCE.ID, SOURCE.GameID, SOURCE.Label, SOURCE.ParentID, SOURCE.Version)
    WHEN NOT MATCHED BY SOURCE THEN
        DELETE;

    SET IDENTITY_INSERT dbo.Factions OFF

    DECLARE @MaxID INT
    SELECT @MaxID = MAX(Id) FROM dbo.Factions

    DBCC CHECKIDENT ('Factions', RESEED, @MaxID)
END
GO
