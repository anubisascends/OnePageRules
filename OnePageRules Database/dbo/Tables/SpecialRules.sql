CREATE TABLE [dbo].[SpecialRules]
(
	[Id] [int] NOT NULL PRIMARY KEY IDENTITY,
	[Label] NVARCHAR(50) NOT NULL,
	[Description] NVARCHAR(2000) NULL,
	[HasValue] BIT NOT NULL
 )
 GO

 CREATE INDEX IDX_SpecialRules_Id ON dbo.SpecialRules ([Id])
 GO