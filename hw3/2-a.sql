SELECT E.Ssn,
    DATE(E.Bdate, 'auto'),
    D.Dname,
    COUNT(DISTINCT L.Dlocation)
FROM EMPLOYEE AS E
    JOIN DEPARTMENT AS D ON D.Dnumber = E.Dno
    JOIN DEPT_LOCATIONS AS L ON L.Dnumber = D.Dnumber
GROUP BY D.Dname,
    E.Ssn
HAVING COUNT(DISTINCT L.Dlocation) > 2