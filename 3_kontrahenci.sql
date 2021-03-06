begin
 drop table if exists kontrahenci
end
create table kontrahenci (id_kontrahenta int primary key,knt_nazwa varchar(max) not null, miasto varchar(max),id_opiekuna int FOREIGN KEY REFERENCES dbo.ludzie(id_pracownika))

declare @intcounter int = 1 
declare @MAXintcounter int = 27 
declare @a varchar(max)
declare @b varchar(max)
declare @c varchar(max)


while @intcounter <= @MAXintcounter  -- w przyszlosci trzeba napisac kursor lub inne rozwiazanie
begin

SET @a = (SELECT TOP 1 imie 
    FROM (SELECT 'Inter' AS imie 
    UNION SELECT 'Real' AS imie 
    UNION SELECT 'Ey' AS imie
    UNION SELECT 'Pega' AS imie
	UNION SELECT 'Maciek_corp' AS imie
	UNION SELECT 'Bartek_SA' AS imie
	UNION SELECT 'Ewa_krawiec' AS imie
	UNION SELECT 'Krzysiek_spzoo' AS imie
	UNION SELECT 'GassPromm' AS imie
	UNION SELECT 'Sibirnieffft' AS imie
	UNION SELECT 'Microsowtware' AS imie
	UNION SELECT 'Uniwersytet' AS imie
	UNION SELECT 'Szkoła' AS imie 
    UNION SELECT 'Policja' AS imie
    UNION SELECT 'Klub sportowy' AS imie
	UNION SELECT 'Warsztat' AS imie
	UNION SELECT 'Donald_wykonczenia' AS imie
	UNION SELECT 'Huta' AS imie
	UNION SELECT 'Apteka' AS imie
	UNION SELECT 'Szpital' AS imie
	UNION SELECT 'Gminny osrodek kultury' AS imie
	UNION SELECT 'Gokaring' AS imie
	UNION SELECT 'Paczkomaty_corp' AS imie
    UNION SELECT 'Sklep_rowerowy' AS imie)
	AS imiona 
	ORDER BY NEWID())

SET @b =
    (SELECT TOP 1 zawod 
    FROM (SELECT 'Kraków' AS zawod 
    UNION SELECT 'Masłomiąca' AS zawod) AS zawody ORDER BY NEWID())

SET @c  =( SELECT FLOOR(RAND()*(10000-1)+1))



    insert into kontrahenci values (@intcounter,@a, @b,@c)

    set @intcounter = @intcounter + 1
end

select  * from kontrahenci
