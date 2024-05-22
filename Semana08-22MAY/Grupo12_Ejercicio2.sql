-- Ejercicio 2
/*
Desarrollar un procedimiento para consultar el precio de
un producto.
Debe tener 2 parametros, uno de entrada para el
codigo y otro de salida para el precio.
Si el codigo no existe debe retornar -1 en el precio.
*/

Use Northwind
go



alter Procedure consultar_precio_producto(
@codigoProducto INT,
@precio DECIMAL (10,2) OUTPUT
)
AS
BEGIN
DECLARE @precioTemporal DECIMAL (10,2);
Select @precioTemporal=UnitPrice FROM Products 
where ProductID=@codigoProducto;
set @precio=-1;
IF @precioTemporal  IS  NOT NULL
 set @precio=@precioTemporal;
 END;
 GO




 DECLARE @CodigoProducto INT;
 DECLARE @Precio DECIMAL (10,2);
 SET @CodigoProducto = 5;
 EXECUTE consultar_precio_producto @CodigoProducto,@Precio OUT;
 SELECT @Precio AS 'Precio del Producto';
 go


 SELECT*FROM Products