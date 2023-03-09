CREATE TABLE [dbo].[EquipmentProfileSpecialRules]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY,
	[ProfileId] INT NOT NULL,
	[SpecialRuleId] INT NOT NULL,
	[Value] int NOT NULL DEFAULT 0,
	CONSTRAINT FK_EquipmentProfileSpecialRules_ProfileId FOREIGN KEY (ProfileId) REFERENCES EquipmentProfiles (Id),
	CONSTRAINT FK_EquipmentProfileSpecialRules_SpecialRuleId FOREIGN KEY (SpecialRuleId) REFERENCES SpecialRules (Id)
)

GO

CREATE INDEX [IDX_EquipmentProfileSpecialRules_Id] ON dbo.EquipmentProfileSpecialRules (Id)
