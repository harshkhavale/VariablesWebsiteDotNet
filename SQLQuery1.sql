SELECT ProductName,P.ProductId as ProductId,UC.UserName as UserName,ProductSellingPrice,ProductPrice,B.BrandName,C.CategoryName,S.SubCategory,I.Extention,I.Name as ImageName 
  FROM ProductDataTbl P 
  JOIN BrandNameTbl B ON P.ProductBrandId = B.Id
  JOIN CatTbl C ON P.ProductCategoryId = C.CategoryId
  JOIN SubCatTbl S ON P.ProductSubCategoryId = S.SubCatId
  JOIN UserCartTbl UC ON P.ProductId = UC.PId 

  
Cross apply(
SELECT TOP 1 * FROM ProductImgTbl I WHERE I.PId = P.ProductId ORDER BY I.PId DESC) I
WHERE C.CategoryName = 'Smartwatches' 
  