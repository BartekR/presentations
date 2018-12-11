USE tempdb;
GO

CREATE TABLE #t1 (id INT, val1 INT);

INSERT INTO #t1 (id, val1)
SELECT
    id = 1,
    val1 = 1
UNION ALL
SELECT
    id = id + 1,
    val1 = val1 + 1
FROM #t1
;

SELECT * FROM #t1;

DROP TABLE #t1;