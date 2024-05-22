

CREATE PROCEDURE USP_LISTA_AUTORES
AS
BEGIN
	DECLARE @author_name VARCHAR(50);
	DECLARE author_cursor CURSOR FOR
		SELECT au_lname + ', ' + au_fname
		FROM authors;

	OPEN author_cursor;
	FETCH NEXT FROM author_cursor INTO @author_name; -- Lee la primera fila
	WHILE @@FETCH_STATUS = 0
	BEGIN
		PRINT @author_name;
		FETCH NEXT FROM author_cursor INTO @author_name; -- Lee la siguiente fila
	END;

	CLOSE author_cursor;
	DEALLOCATE author_cursor;
END;
GO

EXEC USP_LISTA_AUTORES;
GO



CREATE PROCEDURE USP_EJERCICIO_2
AS
BEGIN
	DECLARE @author_name VARCHAR(50);
	DECLARE author_cursor CURSOR FOR
		SELECT a.au_lname + ', ' + a.au_fname
		FROM authors a
		JOIN (
			select au_id, count(1) publicaciones
			from titleauthor
			group by au_id 
			having count(1) > 1) t
		ON a.au_id = t.au_id;
	OPEN author_cursor;
	FETCH NEXT FROM author_cursor INTO @author_name; -- Lee la primera fila
	WHILE @@FETCH_STATUS = 0
	BEGIN
		PRINT @author_name;
		FETCH NEXT FROM author_cursor INTO @author_name; -- Lee la siguiente fila
	END;

	CLOSE author_cursor;
	DEALLOCATE author_cursor;
END;
GO


EXEC USP_EJERCICIO_2;
GO



CREATE PROCEDURE USP_EJERCICIO_3
AS
BEGIN
	DECLARE @total_price MONEY;
	DECLARE @price MONEY;

	SET @total_price = 0;

	DECLARE price_cursor CURSOR FOR
	SELECT price FROM titles;

	OPEN price_cursor;
	-- Lee el precio de la primera fila
	FETCH NEXT FROM price_cursor INTO @price;
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @total_price = @total_price + ISNULL(@price,0.0);
		-- Lee el precio de la siguiente fila
		FETCH NEXT FROM price_cursor INTO @price;
	END;

	CLOSE price_cursor;
	DEALLOCATE price_cursor;

	SELECT @total_price AS TotalPrice;
END;
GO


EXEC USP_EJERCICIO_3;
GO



