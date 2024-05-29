
create procedure usp_ins_art
(
	@catego int,
	@nombre varchar(35),
	@precio money,
	@codigo varchar(8) output,
	@estado int output,
	@mensaje varchar(200) output
)
as
DECLARE 
	@CONTADOR INT, @PREFIJO CHAR(3);
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION;
		--VERIFICAR SI CATEGORIA EXISTE
		SELECT @CONTADOR = COUNT(1)
		FROM Categoria WHERE IdCategoria = @catego;
		IF(@CONTADOR <>1)
		BEGIN
			SET @estado = -1;
			SET @mensaje = 'CATEGORIA NO EXISTE';
			RAISERROR('CATEGORIA NO EXISTE.',16,1);
		END;
		--ACTUALIZAR CATEGORIA
		UPDATE Categoria SET ConCategoria = ConCategoria +1
		WHERE IdCategoria = @catego;
		IF(@@ROWCOUNT <> 1)
		BEGIN
			SET @estado = -1;
			SET @mensaje = 'ERROR AL GENERAR EL CODIGO';
			RAISERROR('ERROR AL GENERAR EL CODIGO',16,1);
		END;
		-- Generar codigo del articulo
		select @PREFIJO = Prefijo, @CONTADOR = ConCategoria
		from Categoria where IdCategoria = @catego;
		set @codigo = '00000' + @CONTADOR;
		set @codigo = @PREFIJO + RIGHT(@codigo,5)
		-- Insertar el articulo


		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION;

	END CATCH
END;
go

SELECT * FROM Categoria;
select * from Articulo;
GO

select RIGHT('123456789',3);
go







