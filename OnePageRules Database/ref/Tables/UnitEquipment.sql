CREATE TABLE [ref].[UnitEquipment]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY,
	[UnitId] INT NOT NULL,
	[EquipmentId] INT NOT NULL,
	[Quantity] TINYINT NOT NULL DEFAULT 1,
	[Range] NVARCHAR(5) NULL,
	[Attacks] TINYINT NOT NULL DEFAULT 1,
	CONSTRAINT FK_UnitEquipment_Unit FOREIGN KEY (UnitId) REFERENCES ref.Units(ID),
	CONSTRAINT FK_UnitEquipment_Equipment FOREIGN KEY (EquipmentId) REFERENCES ref.Equipment(Id)
)
