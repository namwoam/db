WITH T AS (
    SELECT *,
        DENSE_RANK() OVER (
            ORDER BY cnt Desc
        ) AS rnk
    FROM (
            SELECT Pnumber,
                Pname,
                COUNT(*) as cnt
            FROM PROJECT AS P
                JOIN WORKS_ON AS WO ON WO.Pno = P.Pnumber
            GROUP BY P.Pnumber
        )
)
SELECT Pnumber,
    Pname,
    cnt
FROM T
WHERE rnk = 2