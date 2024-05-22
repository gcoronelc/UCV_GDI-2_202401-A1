-- Oportunidad 1
/*
Desarrollar un procedimiento para calcular
la suma de 2 numeros.
Debe tener 2 parametros de entrada y 1 de salida.
*/

-- Solucion del grupo 11

ALTER procedure db_suma(
   @num1 int,
   @num2 int
)
as
begin
declare @rest int;
set @rest = @num1 + @num2;
PRINT(@rest);
end
go

exec db_suma 8,4;
GO



