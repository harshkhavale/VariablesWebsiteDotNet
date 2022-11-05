CREATE PROCEDURE BindAllProducts
AS
Select A.*,B.*,A.ProductPrice-A.ProductSellingPrice as DiscAmount,B.Name as ImageName,C.BrandName as BrandName from ProductDataTbl A
INNER JOIN BrandNameTbl C ON C.Id = A.ProductBrandId

CROSS APPLY(SELECT TOP 1 * FROM ProductImgTbl B WHERE B.PId = A.ProductId ORDER BY B.PId DESC)B
ORDER BY A.ProductId DESC 
Return 0;