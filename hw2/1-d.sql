SELECT 
E.Ssn,
COUNT( DISTINCT WO.Pno ) AS project_Count,
SUM(WO.Hours) AS work_hours
FROM 
EMPLOYEE E
LEFT JOIN
    WORKS_ON WO ON WO.Essn = E.Ssn
GROUP BY
    E.Ssn
HAVING
    COUNT(DISTINCT WO.Pno) > 0