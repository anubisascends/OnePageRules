CREATE PROCEDURE ref.[sp_merge_factions]
AS
BEGIN

    declare @datatable table (id int identity(1,1), gameid nvarchar(5), label nvarchar(50), parent nvarchar(50), version nvarchar(5))

    insert into @datatable
        (gameid, label, parent, version)
    VALUES
        ('GF','Alien Hives',null, 2.5)
        ,('GF','Battle Brothers',null,2.5)
        ,('GF','Blood Brothers','Battle Brothers',1)
        ,('GF','Dark Brothers','Battle Brothers',1)
        ,('GF','Knight Brothers','Battle Brothers',1)
        ,('GF','Watch Brothers','Battle Brothers',1)
        ,('GF','Wolf Brothers','Battle Brothers',1)
        ,('GF','Battle Sisters',null,1)
        ,('GF','Custodian Brothers',null,1)
        ,('GF','Dark Elf Raiders',null,1)
        ,('GF','Dwarf Guilds',null,1)
        ,('GF','Elven Jesters',null,1)
        ,('GF','Eternal Dynasty',null,1)
        ,('GF','Feudal Guard',null,1)
        ,('GF','Havoc Brothers',null,1)
        ,('GF','Change Disciples','Havoc Brothers',1)
        ,('GF','Lust Disciples','Havoc Brothers',1)
        ,('GF','Plague Disciples','Havoc Brothers',1)
        ,('GF','War Disciples','Havoc Brothers',1)
        ,('GF','High Elf Fleets',null,1)
        ,('GF','Human Defense Force',null,1)
        ,('GF','Human Inquisition',null,1)
        ,('GF','Infected Colonies',null,1)
        ,('GF','Jackals',null,1)
        ,('GF','Machine Cult',null,1)
        ,('GF','Ork Marauders',null,1)
        ,('GF','Prime Brothers',null,1)
        ,('GF','Blood Prime Brothers','Prime Brothers',1)
        ,('GF','Dark Prime Brothers','Prime Brothers',1)
        ,('GF','Knight Prime Brothers','Prime Brothers',1)
        ,('GF','Watch Prime Brothers','Prime Brothers',1)
        ,('GF','Wolf Prime Brothers','Prime Brothers',1)
        ,('GF','Saurian Starhost',null,1)
        ,('GF','Soul-Snatcher Cults',null,1)
        ,('GF','TAO Coalition',null,1)
        ,('GF','Titan Lords',null,1)
        ,('GF','Wormhole Daemons',null,1)
        ,('GFF','Alien Hives',null,1)
        ,('GFF','Battle Brothers',null,1)
        ,('GFF','Blood Brothers','Battle Brothers',1)
        ,('GFF','Dark Brothers','Battle Brothers',1)
        ,('GFF','Knight Brothers','Battle Brothers',1)
        ,('GFF','Watch Brothers','Battle Brothers',1)
        ,('GFF','Wolf Brothers','Battle Brothers',1)
        ,('GFF','Battle Sisters',null,1)
        ,('GFF','Custodian Brothers',null,1)
        ,('GFF','Dark Elf Raiders',null,1)
        ,('GFF','Dwarf Guilds',null,1)
        ,('GFF','Elven Jesters',null,1)
        ,('GFF','Eternal Dynasty',null,1)
        ,('GFF','Feudal Guard',null,1)
        ,('GFF','Havoc Brothers',null,1)
        ,('GFF','Change Disciples','Havoc Brothers',1)
        ,('GFF','Lust Disciples','Havoc Brothers',1)
        ,('GFF','Plague Disciples','Havoc Brothers',1)
        ,('GFF','War Disciples','Havoc Brothers',1)
        ,('GFF','High Elf Fleets',null,1)
        ,('GFF','Human Defense Force',null,1)
        ,('GFF','Human Inquisition',null,1)
        ,('GFF','Infected Colonies',null,1)
        ,('GFF','Jackals',null,1)
        ,('GFF','Machine Cult',null,1)
        ,('GFF','Ork Marauders',null,1)
        ,('GFF','Prime Brothers',null,1)
        ,('GFF','Blood Prime Brothers','Prime Brothers',1)
        ,('GFF','Dark Prime Brothers','Prime Brothers',1)
        ,('GFF','Knight Prime Brothers','Prime Brothers',1)
        ,('GFF','Watch Prime Brothers','Prime Brothers',1)
        ,('GFF','Wolf Prime Brothers','Prime Brothers',1)
        ,('GFF','Saurian Starhost',null,1)
        ,('GFF','Soul-Snatcher Cults',null,1)
        ,('GFF','TAO Coalition',null,1)
        ,('GFF','Titan Lords',null,1)
        ,('GFF','Wormhole Daemons',null,1)
        ,('AoF','Beastmen',null,1)
        ,('AoF','Chvalrous Kingdoms',null,1)
        ,('AoF','Dark Elves',null,1)
        ,('AoF','Deep Sea Elves',null,1)
        ,('AoF','Duchies of Vinci',null,1)
        ,('AoF','Dwarves',null,1)
        ,('AoF','Eternal Wardens',null,1)
        ,('AoF','Ghostly Undead',null,1)
        ,('AoF','Giant Tribes',null,1)
        ,('AoF','Goblins',null,1)
        ,('AoF','Halflings',null,1)
        ,('AoF','Havoc Dwarves',null,1)
        ,('AoF','Havoc Warriors',null,1)
        ,('AoF','Change Disciples','Havoc Warriors',1)
        ,('AoF','Lust Disciples','Havoc Warriors',1)
        ,('AoF','Plague Disciples','Havoc Warriors',1)
        ,('AoF','War Disciples','Havoc Warriors',1)
        ,('AoF','High Elves',null,1)
        ,('AoF','Humans',null,1)
        ,('AoF','Kingdom of Angels',null,1)
        ,('AoF','Mummified Undead',null,1)
        ,('AoF','Ogres',null,1)
        ,('AoF','Orcs',null,1)
        ,('AoF','Ossified Undead',null,1)
        ,('AoF','Ratmen',null,1)
        ,('AoF','Rift Daemons',null,1)
        ,('AoF','Rift Daemons of Change','Rift Daemons',1)
        ,('AoF','Rift Daemons of Lust','Rift Daemons',1)
        ,('AoF','Rift Daemons of Plague','Rift Daemons',1)
        ,('AoF','Rift Daemons of War','Rift Daemons',1)
        ,('AoF','Saurians',null,1)
        ,('AoF','Shadow Stalkers',null,1)
        ,('AoF','Sky-City Dwarves',null,1)
        ,('AoF','Vampiric Undead',null,1)
        ,('AoF','Volcanic Dwarves',null,1)
        ,('AoF','Wood Elves',null,1)
        ,('GF','Ratmen Clans',null,1)
        ,('GF','Robel Geurrillas',null,1)
        ,('GF','Robot Legions',null,1)
        ,('GFF','Ratmen Clans',null,1)
        ,('GFF','Rebel Geurillas',null,1)
        ,('GFF','Robot Legions',null,1)

    SET IDENTITY_INSERT ref.Factions ON

    MERGE ref.Factions AS TARGET
    USING @datatable AS SOURCE
    ON TARGET.ID = SOURCE.id
    WHEN MATCHED THEN
        UPDATE SET 
            TARGET.GameID = (select id from ref.games where short = source.gameid), 
            TARGET.Label = Source.Label, 
            TARGET.ParentID = (select id from @datatable where label = source.parent and gameid = source.gameid),
            TARGET.Version = SOURCE.Version
    WHEN NOT MATCHED BY TARGET THEN
        INSERT 
            (ID, GameID, Label, ParentID, Version) 
        VALUES 
            (
                SOURCE.ID, 
                (select id from ref.games where short = source.gameid), 
                SOURCE.Label, 
                (select id from @datatable where label = source.parent and gameid = source.gameid),
                SOURCE.Version
            )
    WHEN NOT MATCHED BY SOURCE THEN
        DELETE;

    SET IDENTITY_INSERT ref.Factions OFF

    DECLARE @MaxID INT
    SELECT @MaxID = MAX(Id) FROM ref.Factions

    DBCC CHECKIDENT ('ref.Factions', RESEED, @MaxID)
END