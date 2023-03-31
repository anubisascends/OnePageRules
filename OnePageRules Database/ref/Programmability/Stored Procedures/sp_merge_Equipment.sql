CREATE PROCEDURE [dbo].[sp_merge_Equipment]
AS
BEGIN
	DECLARE @DataTable TABLE (ID INT, Label NVARCHAR(75))

	INSERT INTO @DataTable
		(ID, Label)
	VALUES
		(1, 'Razor Claw')
		,(2, 'Stomp')
		,(3, 'Heavy Piercing Claws')
		,(4, 'Bio-Borer')
		,(5, 'Piercing Claw')
		,(6, 'Swarm Attack')
		,(7, 'Psy-Blast')
		,(8, 'Psy-Shock')
		,(9, 'Whip Limb')
		,(10, 'Razor Whip')
		,(11, 'Sword Claw')
		,(12, 'Smashing Claw')
		,(13, 'Spitter Cannon')
		,(14, 'Shredder Cannon')
		,(15, 'Heavy Ravager Cannon')
		,(16, 'Barb Cannon')
		,(17, 'Acid Cannon')
		,(18, 'Hive Conduit')
		,(19, 'Bio-Recovery')
		,(20, 'Wings')
		,(21, 'Hive Protector')
		,(22, 'Brood Leader')
		,(23, 'Spitter Gun')
		,(24, 'Twin Spine Gun')
		,(25, 'Shredder Gun')
		,(26, 'Heavy Ravager Gun')
		,(27, 'Barb Gun')
		,(28, 'Serrated Claw')
		,(29, 'Heavy Bite')
		,(30, 'Adrenaline')
		,(31, 'Toxic Cysts')
		,(32, 'Bio-Spiner')
		,(33, 'Bio-Ravager')
		,(34, 'Bio-Flamer')
		,(35, 'Bio-Fuser')
		,(36, 'Bio-Plasma')
		,(37, 'Bio-Shredder')
		,(38, 'Bio-Spiker')
		,(39, 'Mind Snatcher')
		,(40, 'Ravager Gun')
		,(41, 'Acid Launcher')
		,(42, 'Shock Harpoon')
		,(43, 'Skewer Cannon')
		,(44, 'Burrow Attack')
		,(45, 'Spine Shooters')
		,(46, 'Rapid Strike')
		,(47, 'Tunnel Attack')
		,(48, 'Takedown')
		,(49, 'Battering Tusks')
		,(50, 'Bio-Pods')
		,(51, 'Stinger Cannon')
		,(52, 'Fracture Cannon')
		,(53, 'Spitter Bio-Artillery')
		,(54, 'Acid Bio-Artillery')
		,(55, 'Plasma Bio-Artillery')
		,(56, 'Spitter Gun Array')
		,(57, 'Shredder Gun Array')
		,(58, 'Barb Cannon Array')
		,(59, 'Acid Cannon Array')
		,(60, 'Twin Barb Cannon')
		,(61, 'Twin Acid Cannon')
		,(62, 'Missle Bugs')
		,(63, 'Toxic Breath')
		,(64, 'Explosive Spit')
		,(65, 'Acid Blood')
		,(66, 'Hive Carrier')
		,(67, 'Vicious Jaws')
		,(68, 'Acid Spurt')
		,(69, 'Heavy Psy-Blast')
		,(70, 'Tongue')
		,(71, 'Toxic Spray')
		,(72, 'Rapid Stinger Cannon')
		,(73, 'Shredder Bio-Artillery')
		,(74, 'Spit Flames')
		,(75, 'Spore Gun')
		,(76, 'Razor Tendrils')
		,(77, 'Stinger Spitter')
		,(78, 'Caustic Cannon')
		,(79, 'Spore Bombs')
		,(80, 'Titanic Jaws')
		,(81, 'Titanic Stomp')

	SET IDENTITY_INSERT dbo.Equipment ON

	MERGE dbo.Equipment AS Target
	USING @DataTable as Source ON Target.Id = Source.Id
	WHEN MATCHED THEN
		UPDATE SET
			Target.Label = Source.Label
	WHEN NOT MATCHED BY SOURCE THEN
		DELETE
	WHEN NOT MATCHED BY TARGET THEN
		INSERT
			(ID, Label)
		VALUES
			(Source.Id, Source.Label);

	SET IDENTITY_INSERT dbo.Equipment OFF

	DECLARE @MaxID INT
	SELECT @MaxID = MAX(ID) from dbo.Equipment

	DBCC CHECKIDENT ('Equipment', RESEED, @MaxID)
END