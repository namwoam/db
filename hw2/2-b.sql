SELECT D.Dname,
    E.Lname,
    E.Fname,
    P.Pname
FROM DEPARTMENT D
    JOIN EMPLOYEE E ON E.Dno = D.Dnumber
    JOIN WORKS_ON WO ON WO.Essn = E.Ssn
    JOIN PROJECT P ON P.Pnumber = WO.Pno
ORDER BY D.Dname,
    E.Lname,
    E.Fname