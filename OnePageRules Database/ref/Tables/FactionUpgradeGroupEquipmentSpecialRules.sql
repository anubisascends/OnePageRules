CREATE TABLE ref.[FactionUpgradeGroupEquipmentSpecialRules]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	[FactionUpgradeGroupEquipmentId] INT NOT NULL,
	[SpecialRuleId] INT NOT NULL,
	[Value] TINYINT NOT NULL DEFAULT 0,
	CONSTRAINT FK_FactionUpgradeGroupEquipmentSpecialRules_FactionUpgradeGroupEquipment FOREIGN KEY (FactionUpgradeGroupEquipmentId) REFERENCES ref.FactionUpgradeGroupEquipment(Id),
	CONSTRAINT FK_FactionUpgradeGroupEquipmentSpecialRules_SpecialRule FOREIGN KEY (SpecialRuleId) REFERENCES ref.SpecialRules(Id)
)
