CREATE TABLE [ref].[UnitSpecialRules]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY,
	[UnitId] INT NOT NULL,
	[SpecialRuleID] INT NOT NULL,
	[Value] INT NOT NULL DEFAULT 0,
	CONSTRAINT FK_UnitSpecialRules_Units FOREIGN KEY ([UnitId]) REFERENCES [ref].Units([Id]),
	CONSTRAINT FK_UnitSpecialRules_SpecialRule FOREIGN KEY (SpecialRuleId) REFERENCES [ref].SpecialRules(Id)
)
