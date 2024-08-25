CREATE PROC PROC154
	@DEPNUM INT,
	@MAXSALARY INT OUTPUT
	AS
	BEGIN
		SELECT @MAXSALARY = MAX(empSalary)
		FROM dbo.tblEmployee
		WHERE depNum = @DEPNUM
	END
	--Test
DECLARE @X INT
EXEC PROC154 5, @X OUTPUT --Sửa số theo ý muốn, thay vào 5
SELECT @X



