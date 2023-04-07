﻿CREATE PROCEDURE ref.[sp_datatable_equipment_blessedsisters]
AS
	begin
	declare @datatable table (label nvarchar(75))

	insert into @datatable
		(label)
	values
		('Stomp')
		,('Great Energy Sword')
		,('Heavy Rifle')
		,('Heavy Chainsaw Swords')
		,('CCW')
		,('Rifles')
		,('Shotguns')
		,('Heavy Pistols')
		,('Twin Heavy Pistols')
		,('Energy Swords')
		,('Heavy Flamethrowers')
		,('Dual Energy Claws')
		,('Heavy Flamethrower')
		,('Heavy Machinegun')
		,('Heavy Fusion Rifle')
		,('GL-Mod')
		,('Backpack Missles')
		,('Heavy Pistols')
		,('Heavy Chainsaw Sword')
		,('Holy Spear')
		,('Procession Banner')
		,('Procession Sword')
		,('Combat Shield')
		,('Plasma Pistol')
		,('Flamethrower Pistol')
		,('Fusion Pistol')
		,('Shotgun')
		,('Plasma Rifle')
		,('Storm Rifle')
		,('Dual Arc-Flails')
		,('Superior Dual Shock Whips')
		,('Superior Chainsaw Sword')
		,('Dual Plasma Whips')
		,('Dual Force Whips')
		,('Flagellants')
		,('Paired CCWs')
		,('Great Weapon')
		,('Pistol')
		,('Fusion Rifle')
		,('Canticle Megaphone')
		,('Sacred Banner')
		,('Medical Training')
		,('Celestial Infantry')
		,('Vanguard')
		,('Jetpack')
		,('Destroyer ARmor')
		,('Cannones')
		,('Witch')
		,('Priestess')
		,('Superior')
		,('Combat Bike')
		,('Shred Rifle')
		,('Plasma Rifle')
		,('Heavy Flamethrower')
		,('Spears')
		,('Maces')
		,('Sacred Spear')
		,('Energy Hammers')
		,('Combat Shields')

	SELECT DISTINCT * from @datatable ORDER by label
END