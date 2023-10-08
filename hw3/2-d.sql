WITH cnt_rnk AS (
    SELECT *,
        DENSE_RANK() OVER (
            ORDER BY cnt Desc
        ) AS rnk
    FROM (
            SELECT Pnumber,
                COUNT(*) as cnt
            FROM PROJECT AS P
                JOIN WORKS_ON AS WO ON WO.Pno = P.Pnumber
            GROUP BY P.Pnumber
        )
),
dependent_check AS (
    SELECT E.Ssn,
        CASE
            WHEN D.Essn IS NULL THEN "false"
            ELSE "true"
        END AS flag
    FROM EMPLOYEE AS E
        LEFT JOIN DEPENDENT AS D ON E.Ssn = D.Essn
    GROUP BY E.Ssn
)
SELECT E.Ssn,
    E.Fname,
    E.Lname,
    D.Mgr_ssn,
    DC.flag as have_dependent
FROM EMPLOYEE AS E
    JOIN DEPARTMENT AS D
    JOIN WORKS_ON AS WO ON WO.Essn = E.Ssn
    JOIN cnt_rnk AS CR ON WO.Pno == CR.Pnumber
    AND CR.rnk = 2
    JOIN dependent_check AS DC ON DC.Ssn == E.Ssn
WHERE D.Dnumber = E.Dno