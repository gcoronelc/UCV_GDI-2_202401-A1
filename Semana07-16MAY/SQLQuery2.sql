
select  count(1) from Productos;
go

select  * from Products;
go

select * 
into productos
from Products;
go


select * from productos;
go

drop index productos.IX_productos_01;
go

CREATE NONCLUSTERED INDEX IX_productos_01
ON productos (ProductName);
GO

select * from productos
where ProductName='Carnarvon Tigers';
go

select * from productos
where ProductName like 'Carnarvon Tigers';
go


while(1=1)
begin
	insert into productos
	select 
		p.ProductName, p.SupplierID, p.CategoryID,
		p.QuantityPerUnit, p.UnitPrice, p.UnitsInStock,
		p.UnitsOnOrder, ReorderLevel, p.Discontinued
	from Products p;
end;
go









