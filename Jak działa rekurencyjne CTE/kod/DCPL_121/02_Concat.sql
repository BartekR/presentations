USE tempdb;
GO

SELECT id, nazwa, zbior_id FROM dbo.Zbior1
UNION ALL
SELECT id, nazwa, zbior_id FROM dbo.Zbior2
;

SELECT id, nazwa, zbior_id FROM dbo.Zbior1
UNION ALL
SELECT id, nazwa, zbior_id FROM dbo.Zbior2
UNION ALL
SELECT id, nazwa, zbior_id FROM dbo.Zbior3
;

SELECT id, nazwa, zbior_id FROM dbo.Zbior1
UNION ALL
SELECT id, nazwa, zbior_id FROM dbo.Zbior2
UNION ALL
SELECT id, nazwa, zbior_id FROM dbo.Zbior3
UNION ALL
SELECT id, nazwa, zbior_id FROM dbo.Zbior4
;

SELECT id, nazwa, zbior_id FROM dbo.Zbior1
UNION
SELECT id, nazwa, zbior_id FROM dbo.Zbior2
;
