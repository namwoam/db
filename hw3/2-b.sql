SELECT D.Dnumber,
    D.Dname,
    FLOOR(
        (
            julianday("2022-10-01", "auto") - julianday(S.Bdate, "auto")
        ) / 365
    ) as Age
FROM DEPARTMENT AS D
    JOIN EMPLOYEE S ON S.Ssn = D.Mgr_ssn
WHERE D.Dnumber IN(
        SELECT E.Dno
        FROM EMPLOYEE AS E
        GROUP BY E.Dno
        HAVING COUNT(*) > 1
    )