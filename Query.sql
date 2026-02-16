
use tempdb
Select ASCII('A')


Select ASCII('A') as UpperCase, ASCII('a') as LowerCase

DECLARE @Number int
SET @Number = 65
WHILE(@Number <= 90)
BEGIN
  PRINT CHAR(@Number)
  SET @Number = @Number + 1
END


DECLARE @Number int
SET @Number = 65
WHILE(@Number <= 90)
BEGIN
  PRINT CHAR(@Number)
  SET @Number = @Number + 1
END

DECLARE @Number int
SET @Number = 97
WHILE(@Number <= 122)
BEGIN
  PRINT CHAR(@Number)
  SET @Number = @Number + 1
END



Select LTRIM('   Hello')

Select RTRIM('Hello   ')


Select LTRIM(RTRIM('   Hello   '))


 Select LOWER('CONVERT This String Into Lower Case')

 Select UPPER('CONVERT This String Into upperCase')

 Select REVERSE('ABCDEFGHIJKLMNOPQRSTUVWXYZ')

 Select CHARINDEX('@','hina@aaa.com',1)

 Select SUBSTRING('info@dotnettutorials.net',6, 19)


 Select SUBSTRING('info@dotnettutorials.net',(CHARINDEX('@', 'info@dotnettutorials.net') + 1),

(LEN('info@dotnettutorials.net') - CHARINDEX('@','info@dotnettutorials.net')))

