begin
 drop table if exists faktury
end

create table faktury (id_faktury int  primary key, 
kwota bigint not null, 
typ_faktury varchar(max),
data_wystawienia date,
id_produktu int FOREIGN KEY REFERENCES dbo.produkty(prod_id) ,
id_kontrahenta int FOREIGN KEY REFERENCES dbo.kontrahenci(id_kontrahenta))

declare @intcounter int = 1 
declare @MAXintcounter int = 50
declare @a bigint
declare @c varchar(max)
declare @d date
declare @e int
declare @f int


while @intcounter <= @MAXintcounter  -- w przyszlosci trzeba napisac kursor lub inne rozwiazanie
begin

SET @a =( SELECT FLOOR(RAND()*(1000000000-5)+5)); --Zwroc dowolny numer  >= 5 and <=1mld, floor zeby byly inty zamiast floatow

--SET @b =
--    (SELECT TOP 1 x 
--    FROM (SELECT 'Kraków' AS x 
--    UNION SELECT 'Masłomiąca' AS x) AS xyz ORDER BY NEWID())

SET @c =
    (SELECT TOP 1 x 
    FROM (SELECT 'Faktura_sprzedazy' AS x 
    UNION SELECT 'Faktura_kupna' AS x) AS xyz ORDER BY NEWID())

SET @d =  /*można stworzyc datę w int jako różniće od 1800-12-28( tzw data 0 */
    (SELECT(DATEADD(DAY, ABS(CHECKSUM(NEWID()) % 3650), '1996-10-29')))

SET @e =( SELECT FLOOR(RAND()*(19-1)+1)) -- na potrzeby rekrutacji mozna kupic i sprzedac produkt tak samo jak i grupe produktu itd
set @f =( SELECT FLOOR(RAND()*(27-1)+1))


    insert into faktury values (@intcounter,@a,@c,@d,@e,@f )

    set @intcounter = @intcounter + 1
end

select  * from faktury
