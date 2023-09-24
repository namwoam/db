SELECT 
    DP.Dependent_name,
    DATE(DP.Bdate , "auto"),
    E.Ssn,
    E.Address,
    P.Pnumber,
    P.Pname
FROM PROJECT P
    JOIN WORKS_ON WO ON WO.Pno = P.Pnumber
    JOIN EMPLOYEE E ON WO.Essn = E.Ssn
    JOIN DEPENDENT DP ON DP.Essn = E.Ssn
WHERE
    P.Plocation = "Stafford"
    AND DP.Bdate >= UNIXEPOCH("1980-01-01") 