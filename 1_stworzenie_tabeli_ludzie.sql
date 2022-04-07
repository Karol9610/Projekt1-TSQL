begin
 drop table if exists ludzie
end
create table Ludzie (id_pracownika int primary key,[name] varchar(50) not null, occupation varchar(50), posiada_samochod tinyint)

declare @intcounter int = 1 
declare @MAXintcounter int = 50000 
declare @a varchar(15)
declare @b varchar(15)
declare @c tinyint

while @intcounter <= @MAXintcounter
begin

SET @a = (SELECT TOP 1 imie 
    FROM (SELECT 'Kasia' AS imie 
    UNION SELECT 'Tosia' AS imie 
    UNION SELECT 'Jan' AS imie
    UNION SELECT 'Marek' AS imie
	UNION SELECT 'Maciek' AS imie
	UNION SELECT 'Bartek' AS imie
	UNION SELECT 'Ewa' AS imie
	UNION SELECT 'Krzysiek' AS imie
	UNION SELECT 'Ryszard' AS imie
	UNION SELECT 'Monika' AS imie
	UNION SELECT 'Zofia' AS imie
	UNION SELECT 'Paweł' AS imie
	 UNION SELECT 'Adam' AS imie 
    UNION SELECT 'John' AS imie
    UNION SELECT 'Wladimir' AS imie
	UNION SELECT 'Lech' AS imie
	UNION SELECT 'Donald' AS imie
	UNION SELECT 'Janusz' AS imie
	UNION SELECT 'Mieczysłąw' AS imie
	UNION SELECT 'Stefan' AS imie
	UNION SELECT 'Marian' AS imie
	UNION SELECT 'Hubert' AS imie
	UNION SELECT 'Marzena' AS imie
    UNION SELECT 'Sara' AS imie) AS imiona ORDER BY NEWID())

SET @b =
    (SELECT TOP 1 zawod 
    FROM (SELECT 'inzynier' AS zawod 
    UNION SELECT 'kierownik ' AS zawod 
    UNION SELECT 'hr' AS zawod
    UNION SELECT 'inz energetyk' AS zawod
	UNION SELECT 'inz elektryk' AS zawod 
    UNION SELECT 'handlowiec' AS zawod
    UNION SELECT 'starszy handlowiec' AS zawod
	UNION SELECT 'programista' AS zawod 
    UNION SELECT 'hr' AS zawod
    UNION SELECT 'inz energetyk' AS zawod
	UNION SELECT 'kierownik' AS zawod 
    UNION SELECT null AS zawod
    UNION SELECT 'inz energetyk' AS zawod
    UNION SELECT 'starszy inz' AS zawod) AS zawody ORDER BY NEWID())

	set @c=
	(SELECT TOP 1 zawod 
    FROM (SELECT 1 AS zawod 
    UNION SELECT 0 AS zawod 
    UNION SELECT null AS zawod) AS zawody ORDER BY NEWID())


    insert into Ludzie values (@intcounter,@a, @b,@c)

    set @intcounter = @intcounter + 1
end

select  * from Ludzie
