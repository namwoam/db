SELECT
    E.SSN,
    E.Sex,
    E.Dno,
    D.Dname
FROM
    EMPLOYEE E
JOIN
    DEPARTMENT D ON E.Dno = D.Dnumber
WHERE
    E.Salary <= 30000;