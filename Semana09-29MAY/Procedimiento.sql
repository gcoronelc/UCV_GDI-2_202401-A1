
alter procedure usp_ins_art
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
		-- Inicio de Tx
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
		set @codigo = concat('00000',@CONTADOR);
		set @codigo = @PREFIJO + RIGHT(@codigo,5)
		-- Insertar el articulo
		insert into Articulo(IdArticulo,IdCategoria,NomArticulo,PreArticulo)
		values(@codigo,@catego,@nombre,@precio);
		-- Confirmar Tx
		COMMIT TRANSACTION;
		set @estado = 1;
		set @mensaje = 'El proceso se ejecuto correctamente.';
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION;
	END CATCH
END;
go

declare @estado int, @mensaje varchar(200), @codigo varchar(8)
exec usp_ins_art 11, 'Prueba', 80.0, @codigo output, @estado output, @mensaje output
select @codigo, @estado, @mensaje;
go





SELECT * FROM Categoria;
select * from Articulo;
GO

select RIGHT('123456789',3);
go







