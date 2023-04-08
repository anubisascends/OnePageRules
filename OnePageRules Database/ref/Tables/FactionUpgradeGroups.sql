CREATE TABLE ref.[FactionUpgradeGroups]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	[FactionUpgradeId] INT NOT NULL,
	[Label] NVARCHAR(75) NOT NULL,
	CONSTRAINT FK_FactionUpgradeGroups_FactionUpgrade FOREIGN KEY (FactionUpgradeId) REFERENCES ref.FactionUpgrades(Id)
)
