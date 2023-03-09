CREATE PROCEDURE [dbo].[sp_mergeequipment]
AS
BEGIN
    DECLARE @DataTable TABLE
    (
        ID INT,
        Label varchar(75)
    )
    
    INSERT INTO @DataTable
        (ID, Label)
    VALUES
        (1, 'Razor Claw'),
        (2, 'Stomp'),
        (3, 'Bio-Carbine'),
        (4, 'Piercing Claw'),
        (5, 'Bio-Gun'),
        (6, 'Shredder Cannon'),
        (7, 'Swarm Attack'),
        (8, 'Whip Limbs'),
        (9, 'Psychic Blast'),
        (10, 'Psychic Shock'),
        (11, 'Smashing Claws'),
        (12, 'Serrated Claws'),
        (13, 'Whip Limb and Sword Claw'),
        (14, 'Twin Bio-Pistols'),
        (15, 'Bio Spitter'),
        (16, 'Heavy Bio-Carbine'),
        (17, 'Barb Cannon'),
        (18, 'Acid Cannon'),
        (19, 'Heavy Bio-Spitter'),
        (20, 'Heavy Barb Cannon'),
        (21, 'Heavy Acid Cannon'),
        (22, 'Sword Claws'),
        (23, 'Shock-Gun'),
        (24, 'Wings'),
        (25, 'Bio-Spike'),
        (26, 'Bio-Shredder'),
        (27, 'Bio-Flamer'),
        (28, 'Acid-Gun'),
        (29, 'Bio-Rifle'),
        (30, 'Adrenaline'),
        (31, 'Toxic Bite'),
        (32, 'Psychic'),
        (33, 'Psychic Barrier'),
        (34, 'Poison Hooks'),
        (35, 'Shredding Hooks'),
        (36, 'Shock Hooks'),
        (37, 'Acid Hooks'),
        (38, 'Pheromones'),
        (39, 'Burrow Attack'),
        (40, 'Holy Energy Sword'),
        (41, 'Flames of Retribution'),
        (42, 'Assault Rifle'),
        (43, 'Heavy Chainsaw Sword'),
        (44, 'Pistol'),
        (45, 'Sacred Maces'),
        (46, 'Energy Sword'),
        (47, 'Heavy Flamethrower'),
        (48, 'Storm Rifle'),
        (49, 'Flail'),
        (50, 'Shotgun'),
        (51, 'Plasma Pistol'),
        (52, 'Fusion Pistol'),
        (53, 'Energy Fist'),
        (54, 'Plasma Rifle'),
        (55, 'Flamethrower'),
        (56, 'Jetpack'),
        (57, 'Combat Bike'),
        (58, 'Twin Assault Rifle'),
        (59, 'Destroyer Armor'),
        (60, 'Holy Anti-Grav Pulpit'),
        (61, 'Celestial Infantry'),
        (62, 'Blind Faith'),
        (63, 'Canticle Megaphone'),
        (64, 'Sacred Banner'),
        (65, 'Medical Training'),
        (66, 'Shred Rifle'),
        (67, 'Heavy Machinegun'),
        (68, 'Heavy Fusion Rifle'),
        (69, 'Flamethrower Sniper Rifle'),
        (70, 'Shock Whips'),
        (71, 'Plasma Whips'),
        (72, 'Force Whips'),
        (73, 'Sacred Halberd'),
        (74, 'Sacred Spear'),
        (75, 'CCW'),
        (76, 'Energy Mace'),
        (77, 'Twin Storm Rifle'),
        (78, 'Twin Grenade Pod'),
        (79, 'Organ Mortar'),
        (80, 'Walker Fists'),
        (81, 'Hunter Missles'),
        (82, 'Twin Heavy Fusion Rifle'),
        (83, 'Twin Heavy Machinegun'),
        (84, 'Organ Missles'),
        (85, 'Walker Sawblade'),
        (86, 'Walker Flail'),
        (87, 'Gravity Pistol'),
        (88, 'Gravity Rifle'),
        (89, 'Holy Chalice'),
        (90, 'Energy Hammer'),
        (91, 'Frag-Blaster'),
        (92, 'Blood Fist'),
        (93, 'Heavy Mace'),
        (94, 'Plasma Burst-Cannon'),
        (95, 'Rift Beam'),
        (96, 'Dark Bombs'),
        (97, 'Sword Missles'),
        (98, 'Avenger Minigun'),
        (99, 'Twin Laser Cannon'),
        (100, 'Energy Claws'),
        (101, 'Minigun'),
        (102, 'Heavy Flail'),
        (103, 'Chainsaw Fist'),
        (104, 'Cyclone Missles'),
        (105, 'Twin Plasma Carbine'),
        (106, 'Dark Shroud'),
        (107, 'Grenade Launcher'),
        (108, 'Knight Fists'),
        (109, 'Incinerator'),
        (110, 'Psychic Silencer'),
        (111, 'Vicious Jaws'),
        (112, 'Acid Spurt')

    SET IDENTITY_INSERT dbo.Equipment ON

    MERGE dbo.Equipment AS TARGET
    USING @DataTable as SOURCE ON TARGET.ID = Source.ID
    WHEN MATCHED THEN
        UPDATE SET
            TARGET.Label = Source.Label
    WHEN NOT MATCHED BY SOURCE THEN
        DELETE
    WHEN NOT MATCHED BY TARGET THEN
        INSERT 
            (ID, Label)
        VALUES
            (SOURCE.ID, SOURCE.Label);

    SET IDENTITY_INSERT dbo.Equipment OFF

    DECLARE @MaxID INT
    SELECT @MaxID = MAX(Id) FROM dbo.Equipment

    DBCC CHECKIDENT ('Equipment', RESEED, @MaxID)
END
