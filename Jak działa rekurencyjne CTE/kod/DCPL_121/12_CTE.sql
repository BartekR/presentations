USE tempdb;
GO

WITH Struktura AS (
	SELECT
		poziom			= 1,
		sciezka			= CAST(' / ' + p.nazwa AS VARCHAR(MAX)),
		PracownikId     = p.Id,
		Nazwa			= p.Nazwa,
		PrzelozonyId	= p.PrzelozonyId
	FROM dbo.Pracownik p
	WHERE
		p.PrzelozonyId IS NULL
        --p.PrzelozonyId = 1

	UNION ALL

	SELECT
		poziom			= s.poziom + 1,
		sciezka			= s.sciezka + '/' + p.nazwa,
		pracownik_id	= p.Id,
		nazwa			= p.Nazwa,
		przelozony_id	= p.PrzelozonyId
	FROM dbo.Pracownik p

		INNER JOIN Struktura s
			ON s.PracownikId = p.PrzelozonyId
)

SELECT *
FROM Struktura
--OPTION (MAXRECURSION 2)
;
