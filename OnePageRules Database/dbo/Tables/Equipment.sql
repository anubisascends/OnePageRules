CREATE TABLE [dbo].[Equipment]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY,
	[Label] NVARCHAR(75) NOT NULL
)
GO

CREATE INDEX IDX_Equipment_Id ON dbo.Equipment (Id)
