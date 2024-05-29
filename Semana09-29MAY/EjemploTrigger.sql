
USE Northwind;
GO

CREATE TABLE PriceChangeLog (
    LogID INT PRIMARY KEY IDENTITY(1,1),
    ProductID INT,
    OldPrice MONEY,
    NewPrice MONEY,
    ChangeDate DATETIME
);
GO



CREATE TRIGGER trg_PriceChange
ON Products
FOR UPDATE
AS
BEGIN
    IF UPDATE(UnitPrice)
    BEGIN
        DECLARE @ProductID int;
        DECLARE @OldPrice money;
        DECLARE @NewPrice money;

        SELECT @ProductID = ProductID, @OldPrice = UnitPrice
        FROM deleted;

        SELECT @NewPrice = UnitPrice
        FROM inserted;

        INSERT INTO PriceChangeLog (ProductID, OldPrice, NewPrice, ChangeDate)
        VALUES (@ProductID, @OldPrice, @NewPrice, GETDATE());
    END
END;
GO


select * from PriceChangeLog;
go

select * from Products;
go


update Products
set UnitPrice = 23
where ProductID = 2;
go





