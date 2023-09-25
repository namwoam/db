SELECT P.Pnumber
FROM PROJECT P
    JOIN WORKS_ON WO ON WO.Pno = P.Pnumber
    JOIN EMPLOYEE E ON E.Ssn = WO.Essn
WHERE E.Lname = "Smith"