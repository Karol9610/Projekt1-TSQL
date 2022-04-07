begin
 drop table if exists Produkty
end
CREATE TABLE Produkty  
(
	Prod_id int IDENTITY(1,1) primary key,  --1,1 opcjonalnie (poczatek, roznica)
    [level] hierarchyid NOT NULL,  
    prod_nazwa varchar(50) unique not NULL ,  
    prod_wezel_nadrzedny varchar(50) NULL  
);
declare
@0   varchar(50) = 'Produkty',
@0c1 varchar(50)= 'Oprawy Awaryjne',
@0c2 varchar(50)= 'Systemy Monitoringu',
@0c3 varchar(50)= 'Systemy Centralne' ,
@0c4 varchar(50)= 'Oprogramowanie',
@0c5 varchar(50)=  'Moduły',
@0c6 varchar(50)=  'Akcesoria',
@1c1 varchar(50)= 'OPRAWY EWAKUACYJNE',
@1c2 varchar(50)= 'OPRAWY KIERUNKOWE',
@2c3 varchar(50)= 'twr_kostka1',
@2c4 varchar(50)= 'twr_Rubic2',
@3c5 varchar(50)= 'twr_SCB T-1000',
@4c6 varchar(50)= ' twr_AI vision',
@5c7 varchar(50)= 'BMUM',
@6c8 varchar(50)= 'Piktogramy',
@111 varchar (50) = 'twr_existsts',
@112 varchar (50) = 'twr_helio',
@121 varchar (50) = 'twr_twins',
@122 varchar (50) = 'twr_arrow'






begin
INSERT into Produkty  
    VALUES 
('/', @0, null),	
('/1/', @0c1, @0), 
('/2/', @0c2, @0), 
('/3/', @0c3, @0), 
('/4/', @0c4, @0), 
('/5/', @0c5, @0), 
('/6/', @0c6, @0), 
('/1/1/', @1c1, @0c1),
('/1/2/', @1c2, @0c1), 
('/2/1/', @2c3, @0c2), 
('/2/2/', @2c4, @0c2),
('/3/1/', @3c5, @0c3),   
('/4/1/', @4c6, @0c4),  
('/5/1/', @5c7, @0c5),  
('/6/1/', @6c8, @0c6), 
('/2/1/1/', @111,@1c1 ),
('/2/1/2/', @112,@1c1 ),
('/2/2/1/', @121,@1c2 ),
('/2/2/2/', @122,@1c2 )


end
select*from Produkty

