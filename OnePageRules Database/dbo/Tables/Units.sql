﻿CREATE TABLE [dbo].[Units]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY,
	[FactionId] INT NOT NULL,
	[Label] NVARCHAR(50) NOT NULL,
	[Qty] TINYINT NOT NULL DEFAULT 1,
	[Quality] TINYINT NOT NULL DEFAULT 3,
	[Defense] TINYINT NOT NULL DEFAULT 3,
	[Cost] SMALLINT NOT NULL DEFAULT 100
	CONSTRAINT FK_Units_Faction FOREIGN KEY ([FactionId]) REFERENCES [Factions]([Id]),
)

GO

CREATE INDEX IDX_Units_Id ON [dbo].[Units] ([Id])