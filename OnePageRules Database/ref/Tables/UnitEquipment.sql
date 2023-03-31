CREATE TABLE [dbo].[UnitEquipment]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY,
	UnitId INT NOT NULL,
	Quantity TINYINT NOT NULL DEFAULT 1,
	EquipmentId INT NOT NULL,
	Attacks TINYINT NOT NULL DEFAULT 1,
	[Range] NVARCHAR(5) NOT NULL DEFAULT 'melee', 
    CONSTRAINT FK_UnitEquipment_Unit FOREIGN KEY (UnitId) REFERENCES dbo.Units(Id),
	CONSTRAINT FK_UnitEquipment_Equipment FOREIGN KEY (EquipmentId) REFERENCES dbo.Equipment(Id)
)
