CREATE TABLE [dbo].[UnitEquipment]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY,
	UnitId INT NOT NULL,
	Quantity TINYINT NOT NULL DEFAULT 1,
	EquipmentProfileId INT NOT NULL,
    CONSTRAINT FK_UnitEquipment_Unit FOREIGN KEY (UnitId) REFERENCES dbo.Units(Id),
	CONSTRAINT FK_UnitEquipment_Equipment FOREIGN KEY (EquipmentProfileId) REFERENCES dbo.EquipmentProfiles(Id)
)
