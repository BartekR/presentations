-- https://stackoverflow.com/questions/50157079/sql-server-cte-loop-insert-all-record-together

DROP TABLE IF EXISTS #t1;
DROP TABLE IF EXISTS #t2;

SELECT * 
INTO #t1
FROM
    (SELECT 'va1' c1,'vb1' c2,'vc1' c3 UNION ALL
     SELECT 'va2' c1,'vb2' c2,'vc2' c3 UNION ALL
     SELECT 'va3' c1,'vb3' c2,'vc3' c3 UNION ALL
     SELECT 'va1' c1,'vb1' c2,'vc1' c3 UNION ALL
     SELECT 'va2' c1,'vb2' c2,'vc2' c3 UNION ALL
     SELECT 'va3' c1,'vb3' c2,'vc3' c3 UNION ALL
     SELECT 'va1' c1,'vb1' c2,'vc1' c3 UNION ALL
     SELECT 'va2' c1,'vb2' c2,'vc2' c3 UNION ALL
     SELECT 'va3' c1,'vb3' c2,'vc3' c3 UNION ALL
     SELECT 'va1' c1,'vb1' c2,'vc1' c3 UNION ALL
     SELECT 'va2' c1,'vb2' c2,'vc2' c3 UNION ALL
     SELECT 'va3' c1,'vb3' c2,'vc3' c3 UNION ALL
     SELECT 'va4' c1,'vb4' c2,'vc4' c3) t

SELECT *
INTO #t2
FROM #t1
WHERE 0 = 1
;

WITH tmp1 AS (
SELECT 
    t1.*,
    ROW_NUMBER() OVER (PARTITION BY t1.c1 ORDER BY (SELECT NULL)) r
FROM #t1 t1

    LEFT JOIN #t2 t2
        ON t1.c1 = t2.c1
WHERE 
    t2.c1 IS NULL   
), tmp2 AS
(
SELECT 
    0 n,
    *
FROM tmp1
UNION ALL
SELECT 
    n+1 n,
    t1.c1,
    t1.c2,
    t1.c3,
    t1.r
from tmp2 t1

    JOIN tmp1 t2
        ON t1.c1 = t2.c1
        AND t2.r = t1.r + 1
WHERE 
    n < 10
)
INSERT #t2
SELECT c1, c2, c3  --,r
FROM tmp2