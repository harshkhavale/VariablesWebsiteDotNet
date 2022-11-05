SET IDENTITY_INSERT [dbo].[CatTbl] ON
INSERT INTO [dbo].[CatTbl] ([CategoryId], [CategoryName]) VALUES (1, N'Smartphones')
INSERT INTO [dbo].[CatTbl] ([CategoryId], [CategoryName]) VALUES (2, N'Chargers')
INSERT INTO [dbo].[CatTbl] ([CategoryId], [CategoryName]) VALUES (3, N'Chargers')
SET IDENTITY_INSERT [dbo].[CatTbl] OFF
UPDATE CatTbl Set CategoryName = 'Earphones' where CategoryId = 3