SELECT COUNT(depName)
FROM dbo.tblDependent
WHERE empSSN = 30121050180
--
SELECT COUNT(depName)
FROM dbo.tblDependent DP LEFT JOIN dbo.tblEmployee E
ON E.empSSN = DP.empSSN
WHERE E.empSSN = 30121050180
--
CREATE PROC PROC155(
	@EMPSSN decimal,
	@NUMOFDEPEN int OUTPUT)
AS
BEGIN
SELECT @NUMOFDEPEN = COUNT(depName)
FROM dbo.tblDependent DP LEFT JOIN dbo.tblEmployee E
ON E.empSSN = DP.empSSN
WHERE E.empSSN = @EMPSSN
END
--
DECLARE @X INT,
EXEC PROC155 = 30121050180,
@X OUTPUT SELECT @X


