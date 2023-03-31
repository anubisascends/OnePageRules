CREATE TABLE [dbo].[EquipmentProfileSpecialRules]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY,
	[EquipmentProfileId] INT NOT NULL,
	[SpecialRuleId] INT NOT NULL,
	[Value] INT,
	CONSTRAINT FK_EquipmentProfileSecialRules_EquipmentProfile FOREIGN KEY (EquipmentProfileId) REFERENCES dbo.EquipmentProfiles(Id),
	CONSTRAINT FK_EquipmentProfileSecialRules_SpecialRule FOREIGN KEY (SpecialRuleId) REFERENCES dbo.SpecialRules(Id)
)
