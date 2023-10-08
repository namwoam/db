SELECT e.Fname,
    e.Lname,
    wo.Pno
FROM EMPLOYEE AS e
    JOIN WORKS_ON AS wo ON e.Ssn = wo.Essn
WHERE EXISTS (
        SELECT p.Pnumber
        FROM PROJECT AS p
        WHERE p.Pnumber = wo.Pno
            AND p.Dnum = 5
    );