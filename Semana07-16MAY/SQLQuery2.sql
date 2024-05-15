
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


alter table productos 
add constraint pk_productos
primary key(productid);
go


select * from productos
where ProductID=1000000;
go


select * 
from Customers c
join Orders o on c.CustomerID = o.CustomerID;
go


select * 
from Orders o
join Customers c on o.CustomerID = c.CustomerID;
go

-- subconsulta tipo tabla

select top 1 ProductID, sum(Quantity) cant
from [Order Details] d
group by ProductID
order by 2 desc


select * 
from productos p
join (select top 1 ProductID, sum(Quantity) cant
	from [Order Details] d
	group by ProductID
	order by 2 desc
) t on p.ProductID = t.ProductID;
go


-- subconsulta recursiva

select x.ProductID 
from (select top 1 d.ProductID, sum(Quantity) cant
from [Order Details] d
join Products p on d.ProductID = p.ProductID
where p.CategoryID = 1
group by d.ProductID
order by 2 desc
) x



select * 
from Products pr
where pr.ProductID = (
	select x.ProductID 
	from (select top 1 d.ProductID, sum(Quantity) cant
	from [Order Details] d
	join Products p on d.ProductID = p.ProductID
	where p.CategoryID = pr.CategoryID
	group by d.ProductID
	order by 2 desc
	) x
);
go














