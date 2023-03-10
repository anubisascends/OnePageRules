CREATE TABLE [dbo].[Factions]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [GameId] INT NOT NULL, 
    [Label] NVARCHAR(50) NOT NULL, 
    [ParentId] INT NOT NULL DEFAULT 0,
    CONSTRAINT [FK_Factions_Games] FOREIGN KEY ([GameId]) REFERENCES [Games]([Id])
)

GO

CREATE INDEX [IX_Factions_Column] ON [dbo].[Factions] ([Id])
