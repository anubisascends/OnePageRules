CREATE TABLE [dbo].[EquipmentProfiles]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY,
	FactionId INT NOT NULL,
	EquipmentId INT NOT NULL,
	Attacks TINYINT NOT NULL DEFAULT 1,
	[Range] NVARCHAR(25) NOT NULL DEFAULT 'melee', 
    CONSTRAINT [FK_EquipmentProfiles_Faction] FOREIGN KEY ([FactionId]) REFERENCES [Factions]([Id]),
	CONSTRAINT [FK_EquipmentProfiles_Equipment] FOREIGN KEY ([EquipmentId]) REFERENCES [Equipment]([Id])
)

GO

CREATE INDEX [IDX_EquipmentProfiles_Id] ON [dbo].[EquipmentProfiles] ([Id])
