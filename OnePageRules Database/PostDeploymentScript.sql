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

EXEC ref.sp_merge_Games
GO

EXEC ref.sp_merge_Factions
GO

exec ref.sp_merge_factionupgrades
go

exec ref.sp_merge_factionupgradegroups
go

EXEC ref.sp_merge_equipment
GO

exec ref.sp_merge_units
go

exec ref.sp_merge_unitequipment
go

exec ref.sp_merge_unitspecialrules
go