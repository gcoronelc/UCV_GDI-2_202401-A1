
delete from clientes;
go


select count(1) from clientes;
go

select * 
into clientes
from Customers;
go

create NONCLUSTERED  index idx_clientes_contacto
on clientes(ContactName)
go

select * from clientes
where ContactName='Pedro Afonso';
go

select * from clientes
where ContactName like 'Pedro Afonso';
go

while (1=1)
begin
	insert into clientes 
	select * from Customers;
end
go





