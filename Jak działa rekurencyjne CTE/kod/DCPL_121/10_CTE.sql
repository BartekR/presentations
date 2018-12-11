USE tempdb;
GO

WITH Struktura AS (
	SELECT
		PracownikId     = p.Id,
		Nazwa			= p.Nazwa,
		PrzelozonyId	= p.PrzelozonyId
	FROM dbo.Pracownik p
	WHERE
		p.PrzelozonyId IS NULL
        --p.PrzelozonyId = 1

	UNION ALL

	SELECT
		PracownikId     = p.Id,
		Nazwa			= p.Nazwa,
		PrzelozonyId	= p.PrzelozonyId
	FROM dbo.Pracownik p

		INNER JOIN Struktura s
			ON s.PracownikId = p.PrzelozonyId
)

SELECT
    s.PracownikId,
    s.Nazwa,
    s.PrzelozonyId
FROM Struktura s
--OPTION (MAXRECURSION 2)
;
