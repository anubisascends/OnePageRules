CREATE TABLE ref.[FactionUpgrades]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	[FactionId] INT NOT NULL,
	[Code] NCHAR(1) NOT NULL,
	[Page] TINYINT NOT NULL DEFAULT 1,
	CONSTRAINT FK_FactionUpgrades_Faction FOREIGN KEY (FactionId) REFERENCES ref.Factions(Id)
)
