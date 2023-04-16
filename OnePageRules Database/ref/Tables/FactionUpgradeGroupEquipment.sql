CREATE TABLE ref.[FactionUpgradeGroupEquipment]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	[FactionUpgradeGroupId] INT NOT NULL,
	[EquipmentId] INT NOT NULL,
	[Range] NVARCHAR(5) NULL,
	[Attacks] TINYINT NOT NULL DEFAULT 1,
	Cost SMALLINT NOT NULL,
	CONSTRAINT FK_FactionUpgradeGroupEquipment_FactionUpgradeGroup FOREIGN KEY (FactionUpgradeGroupid) REFERENCES ref.FactionUpgradeGroups(Id),
	CONSTRAINT FK_FactionUpgradeGroupEquipment_Equipment FOREIGN KEY (EquipmentId) REFERENCES ref.Equipment(Id)
)
