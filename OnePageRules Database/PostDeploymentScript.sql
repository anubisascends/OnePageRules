/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

EXEC dbo.sp_merge_Games
GO

EXEC dbo.sp_merge_Factions
GO

EXEC dbo.sp_merge_SpecialRules
GO

EXEC dbo.sp_merge_Units
GO

EXEC dbo.sp_merge_UnitSpecialRules
GO

EXEC dbo.sp_merge_Equipment
GO

EXEC dbo.sp_merge_UnitEquipment
GO