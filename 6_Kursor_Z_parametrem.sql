use master
--Deklaracja zmiennych
DECLARE @Nazwa_Bazy_Danych  varchar(max)
DECLARE @Nazwa_procedury  varchar(max) = 'dbo.SelectAllCustomers' --wpiujemy nazwę procedury
Declare @parametr varchar(50) = 'Kraków'
DECLARE Cursor_name CURSOR FOR  --Deklaracja kursora, wybór baz danych
SELECT name
FROM sys.databases
WHERE [name] like 'rekrutacja%'   -- wpisujemy nazwe baz albo id > 4 jeśli nie ma innych baz, bazy: master, model, msdb, tempdb

OPEN cursor_name --otwieramy kursor
FETCH NEXT 
FROM cursor_name
INTO @Nazwa_Bazy_Danych

WHILE @@FETCH_STATUS = 0
BEGIN
  DECLARE @baza AS nvarchar(max);

  SET @baza = QUOTENAME('' + @Nazwa_Bazy_Danych + ''); --N - oznacza, że string będzie nvarcharem nie varcharem [@nazwa_bazy_danych] + odstępy
 
 
 ---------------------------------------------------Dynamiczny SQL---------------------------------------------------
  EXEC ('USE ' + @baza + '; EXEC(''' + @Nazwa_procedury +' '+ @parametr+ ''+''')')            --liczymy pazurki !!! wpisujemy parametr
  
  FETCH NEXT
  FROM cursor_name
  INTO @Nazwa_Bazy_Danych
END
---------------------------------------------------------ZAMYKAMY KURSOR--------------------------------------------------------
CLOSE cursor_name

DEALLOCATE cursor_name
