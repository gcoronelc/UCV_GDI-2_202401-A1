-- Ejercicio 3
/*
Desarrollar un procedimiento almacenado que permita
consulta la cantidad de productos y el importe respectivo
de las ventas realizadas a un cliente especifico.
*/


ALTER PROCEDURE SP_ConsultarVentasCliente
@ClienteID nchar(5),
@Cantidad INT OUTPUT,
@Importe Decimal (12,2) OUTPUT
AS
BEGIN
SELECT 
@Cantidad = SUM(od.Quantity),
@Importe = SUM(od.Quantity * UnitPrice)
FROM "Order Details" od
JOIN Orders o ON od.OrderID = o.OrderID
WHERE o.CustomerID = @ClienteID;
END;
GO

DECLARE @Cantidad INT, @Importe Decimal(12,2)
EXEC SP_ConsultarVentasCliente 'CACTU', @Cantidad OUTPUT, @Importe OUTPUT
PRINT 'Cantidad: '+ CAST(@Cantidad AS VARCHAR(20))  
PRINT 'Importe: ' + CAST(@Importe AS VARCHAR(20))
GO

SELECT * FROM Customers





