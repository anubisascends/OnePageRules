﻿CREATE TABLE ref.[PsychicSpells]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	[FactionId] INT NOT NULL,
	[Label] NVARCHAR(75) NOT NULL,
	[Roll] TINYINT NOT NULL DEFAULT 4,
	[Description] NVARCHAR(Max) NOT NULL,
	CONSTRAINT FK_PsychicSpell_Faction FOREIGN KEY (FactionId) REFERENCES ref.Factions(Id)
)
