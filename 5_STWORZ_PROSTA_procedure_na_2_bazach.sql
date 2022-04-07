Create PROCEDURE [dbo].[SelectAllCustomers]  @miasto varchar(30)
AS
SELECT * FROM faktury a inner join kontrahenci b on a.id_kontrahenta = b.id_kontrahenta
where b.miasto= @miasto ;
GO
