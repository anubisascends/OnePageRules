CREATE TABLE [dbo].[Games] (
    [ID]   INT           IDENTITY (1, 1) NOT NULL,
    [Label] NVARCHAR (30) NOT NULL,
    [ShortLabel] NVARCHAR(5) NOT NULL,
    CONSTRAINT [PK_Games] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IDX_Games_ID]
    ON [dbo].[Games]([ID] ASC);

