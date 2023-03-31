CREATE TABLE [dbo].[EquipmentProfiles]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY,
	[EquipmentId] INT NOT NULL,
	[Attacks] TINYINT NOT NULL DEFAULT 1,
	[Range] NVARCHAR(5) NOT NULL DEFAULT 'melee',
	CONSTRAINT FK_EquipmentProfiles_Equipment FOREIGN KEY (EquipmentId) REFERENCES dbo.Equipment(Id)
)
