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

EXEC dbo.sp_mergegames
GO

EXEC dbo.sp_mergefactions
GO

EXEC dbo.sp_mergeunits
GO

EXEC dbo.sp_mergeequipment
GO

EXEC dbo.sp_mergespecialrules
GO

EXEC dbo.sp_mergeequipment_alienhives
GO