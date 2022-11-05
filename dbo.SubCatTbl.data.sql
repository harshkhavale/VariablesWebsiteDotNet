SET IDENTITY_INSERT [dbo].[SubCatTbl] ON
INSERT INTO [dbo].[SubCatTbl] ([SubCatId], [CatId], [SubCategory]) VALUES (1, 2, N'C-Type')
INSERT INTO [dbo].[SubCatTbl] ([SubCatId], [CatId], [SubCategory]) VALUES (2, 3, N'Wireless')
SET IDENTITY_INSERT [dbo].[SubCatTbl] OFF
Truncate table SubCatTbl;