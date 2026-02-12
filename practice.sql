--WAQ to display employee details whose name contains 3 characters.
SELECT * FROM Employee WHERE Name LIKE '___'

--WAQ to display employee details whose name contains ‘A’ character.
SELECT  * FROM Employee WHERE Name LIKE'%A%'

--WAQ to display employee details whose name starts with ‘P’ character and ends with ‘A’ character.
SELECT * FROM Employee WHERE Name LIKE 'P%A'

--WAQ to display employee details whose name starts with J, H, K, U characters.
SELECT * FROM Employee WHERE Name LIKE'[J, H, K, U]%'

--WAQ to display employee details whose names start with A to Z characters.
SELECT * FROM Employee WHERE Name LIKE'[A-Z]%'

--WAQ to display employee details whose name not start with A to Z characters.
SELECT * FROM Employee WHERE Name NOT LIKE '[A-Z]%'


CREATE TABLE #TEMP_TABLE (ID INT)
 
INSERT INTO #TEMP_TABLE VALUES(1)
INSERT INTO #TEMP_TABLE VALUES(2)
INSERT INTO #TEMP_TABLE VALUES(3)


IF 4 > ALL (SELECT ID FROM #TEMP_TABLE)
      PRINT 'Returned True'
ELSE
      PRINT 'Returned False'


IF 3 > ALL (SELECT ID FROM #TEMP_TABLE)
      PRINT 'Returned True'
ELSE
      PRINT 'Returned False'