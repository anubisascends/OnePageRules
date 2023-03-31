CREATE TABLE [dbo].[Equipment]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY,
	[Label] NVARCHAR(75) NOT NULL, 
    CONSTRAINT [AK_Euquipment_Label] UNIQUE ([Label]) 
)
