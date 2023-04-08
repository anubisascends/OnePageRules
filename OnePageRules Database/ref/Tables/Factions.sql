CREATE TABLE [ref].[Factions]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY,
	[GameId] INT NOT NULL,
	[Label] NVARCHAR(50) NOT NULL, 
    [ParentId] INT NULL , 
	[Version] NVARCHAR(15) NOT NULL DEFAULT '1',
    CONSTRAINT [FK_Factions_Games] FOREIGN KEY (GameId) REFERENCES [ref].Games([Id])
)
